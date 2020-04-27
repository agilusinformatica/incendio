unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxLookAndFeels, cxContainer,
  cxLabel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ADODB,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  TForm1 = class(TForm)
    AgilusConnection: TADOConnection;
    tbCliente: TADOQuery;
    dsCliente: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel1: TcxLabel;
    tbOperador: TADOQuery;
    dsOperador: TDataSource;
    cbOperador: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    edCpf: TcxMaskEdit;
    btIncluir: TcxButton;
    btLimpar: TcxButton;
    btProcessar: TcxButton;
    tbClienteclt_codigo: TAutoIncField;
    tbClienteclt_cpf: TStringField;
    tbClienteclt_nome: TStringField;
    tbClientetst_descricao: TStringField;
    tbClientefil_descricao: TWideStringField;
    tbClienteorgav_descricao: TWideStringField;
    tbClienteusu_login: TWideStringField;
    cxGrid1DBTableView1clt_codigo: TcxGridDBColumn;
    cxGrid1DBTableView1clt_cpf: TcxGridDBColumn;
    cxGrid1DBTableView1clt_nome: TcxGridDBColumn;
    cxGrid1DBTableView1tst_descricao: TcxGridDBColumn;
    cxGrid1DBTableView1fil_descricao: TcxGridDBColumn;
    cxGrid1DBTableView1orgav_descricao: TcxGridDBColumn;
    cxGrid1DBTableView1usu_login: TcxGridDBColumn;
    LookAndFeel: TcxLookAndFeelController;
    procedure btIncluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btProcessarClick(Sender: TObject);
    procedure AgilusConnectionBeforeDisconnect(Sender: TObject);
  private
    procedure Conectar;
    procedure AplicaAppRole;
    procedure GravaLoginUsuario;
    procedure GravaDesconexao(MsgErro: string);
    { Private declarations }
  public
    CookieConexao: variant;
    CodLoginUsuario: integer;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function AbreDataSet(InstrucaoSQL: string; Connection: TADOConnection): TADODataSet;
var
  DataSetRetorno: TADODataSet;
  Msg: string;
begin
  try
    DataSetRetorno := TADODataSet.Create(nil);
    DataSetRetorno.Connection := Connection;
    DataSetRetorno.CommandText := InstrucaoSQL;
    DataSetRetorno.Open;

    Result := DataSetRetorno;
  except
    on E: Exception do
    begin
      Msg := 'Erro abrindo Dataset SQL' +#13#13+E.Message+#13#13+InstrucaoSQL;

      if Pos('The DELETE statement conflicted with the REFERENCE constraint', E.Message) <> 0 then
        Msg := 'Não é possível excluir pois há uma dependência em outra tabela'+#13#13+InstrucaoSQL
      else if Pos('The UPDATE statement conflicted with the REFERENCE constraint', E.Message) <> 0 then
        Msg := 'Não é possível alterar a chave pois há uma dependência em outra tabela'+#13#13+InstrucaoSQL
      else if Pos('Violation of PRIMARY KEY', E.Message) <> 0 then
        Msg := 'Não é permitido inserir registros duplicados'+#13#13+InstrucaoSQL
      else
        Msg := E.Message;

      raise Exception.Create(Msg);
    end;
  end;
end;

procedure ExecutaSQL(InstrucaoSQL: string; Connection: TADOConnection;
  Timeout: integer);
var
  Msg: string;
  TimeoutAnterior: integer;
begin
  TimeoutAnterior := Connection.CommandTimeout;
  try
    Connection.CommandTimeout := Timeout;
    try
      Connection.Execute(InstrucaoSQL);
    except
      on E: Exception do
      begin
        Msg := 'Erro executando comando SQL' +#13#13+E.Message+#13#13+InstrucaoSQL;

        if Pos('The DELETE statement conflicted with the REFERENCE constraint', E.Message) <> 0 then
          Msg := 'Não é possível excluir pois há uma dependência em outra tabela'+#13#13+InstrucaoSQL
        else if Pos('The UPDATE statement conflicted with the REFERENCE constraint', E.Message) <> 0 then
          Msg := 'Não é possível alterar a chave pois há uma dependência em outra tabela'+#13#13+InstrucaoSQL
        else if Pos('Violation of PRIMARY KEY', E.Message) <> 0 then
          Msg := 'Não é permitido inserir registros duplicados'+#13#13+InstrucaoSQL
        else
          Msg := E.Message;

        raise Exception.Create(Msg);
      end;
    end;
  finally
    Connection.CommandTimeout := TimeoutAnterior;
  end;
end;

procedure TForm1.Conectar;
var
  ArquivoUDL, NomePrograma: string;
begin
  if AgilusConnection.Connected then
    AgilusConnection.Close;

  NomePrograma := ExtractFileName(Application.ExeName);
  Delete(NomePrograma, Length(NomePrograma)-2, 3);
  ArquivoUDL := ExtractFilePath(Application.ExeName)+'\agilus.udl';
  if not FileExists(ArquivoUDL) then
    raise Exception.Create('Arquivo de conexão com sistema não encontrado');

  AgilusConnection.ConnectionString := 'FILE NAME='+ArquivoUDL;

  AgilusConnection.LoginPrompt := False;
  try
    AgilusConnection.Open('agilus', 'awrpu07!@$AFAFAsdfqrasfafJMYJYJ&* $%');
  except
    on E: Exception do
    begin
      if Pos('login failed', LowerCase(E.Message)) > 0 then
        raise Exception.Create('Erro de conexão no Banco de Dados')
      else
        raise;
    end;
  end;

  // valida se foi utilizado a segurança integrada do SQL Server com Windows
  // na minha opinião, isso é uma brecha enorme, pq bastaria qualquer um instalar
  // o SQL Server e usar segurança integrada, para abrir o Sistema Agilus
  if Pos('integrated security', LowerCase(AgilusConnection.ConnectionString)) <> 0 then
    raise Exception.Create('Não é permitido usar segurança integrada do Windows para acessar o Agilus');

  AplicaAppRole;

  AgilusConnection.LoginPrompt := True;
end;

procedure TForm1.GravaLoginUsuario;
begin
  with AbreDataSet(
    'insert into login_usuario( usu_codigo, lus_login, lus_data_conexao, lus_numero_conexao ) values(' +
    IntToStr(1)+', '+
    QuotedStr('distr.lote')+', '+
    'getdate(), @@spid) '+
    ' select @@identity',
    AgilusConnection
  ) do
  begin
    try
      CodLoginUsuario := Fields[0].AsInteger;
    finally
      Free;
    end;
  end;
end;

procedure TForm1.GravaDesconexao(MsgErro: string);
begin
  try
    if CodLoginUsuario <> 0 then
      ExecutaSQL(' update login_usuario' +
                 ' set lus_data_desconexao = getdate(),' +
                 '     lus_msg_erro = ' + QuotedStr(MsgErro)+
                 ' where lus_codigo = ' + IntToStr(CodLoginUsuario)+
                 ' and lus_data_desconexao is null',
                 AgilusConnection, 0);
  except
    // ignoro qualquer erro que acontecer aqui.
  end;
end;

procedure TForm1.btIncluirClick(Sender: TObject);
var
  CPF: string;
begin
  CPF := copy(edCpf.Text,1,3)+copy(edCpf.Text,5,3)+copy(edCpf.Text,9,3)+copy(edCpf.Text,13,2);

  with AbreDataSet(
    ' select clt_codigo, clt_cpf, clt_nome, tst_descricao, fil_descricao, orgav_descricao, usu_login'+
    ' from cliente_televenda a'+
    ' inner join tipo_status_televenda b on a.tst_codigo = b.tst_codigo'+
    ' inner join filial c on a.fil_codigo = c.fil_codigo'+
    ' inner join orgaoav d on a.orgav_codigo = d.orgav_codigo'+
    ' left join usuario e on a.usu_codigo_operador = e.usu_codigo'+
    ' where clt_cpf = '+QuotedStr(CPF),
    AgilusConnection) do
  begin
    try
      if not IsEmpty then
      begin
        while not Eof do
        begin
          if not tbCliente.Locate('clt_codigo', FieldByName('clt_codigo').Value, []) then
          begin
            tbCliente.Insert;
            tbClienteclt_codigo.Value := FieldByName('clt_codigo').Value;
            tbClienteclt_cpf.Value := FieldByName('clt_cpf').Value;
            tbClienteclt_nome.Value := FieldByName('clt_nome').Value;
            tbClientetst_descricao.Value := FieldByName('tst_descricao').Value;
            tbClientefil_descricao.Value := FieldByName('fil_descricao').Value;
            tbClienteorgav_descricao.Value := FieldByName('orgav_descricao').Value;
            if not FieldByName('usu_login').IsNull then
              tbClienteusu_login.Value := FieldByName('usu_login').Value;
            tbCliente.Post;
          end
          else
          begin
            edCpf.Clear;
            edCpf.SetFocus;
            raise Exception.Create('Cliente já incluído na lista');
          end;
          Next;
        end;
      end
      else
      begin
        edCpf.Clear;
        edCpf.SetFocus;
        raise Exception.Create('Cliente não encontrado');
      end;
    finally
      Free;
    end;
  end;

  edCpf.Clear;
  edCpf.SetFocus;
end;

procedure TForm1.btLimparClick(Sender: TObject);
begin
  tbCliente.Close;
  tbCliente.Open;
  cbOperador.Clear;
  edCpf.Clear;
  edCpf.SetFocus;
end;

procedure TForm1.btProcessarClick(Sender: TObject);
var
  ListaClientes: string;
begin
  if cbOperador.EditValue = null then
    raise Exception.Create('Selecione um operador');

  if tbCliente.IsEmpty then
    raise Exception.Create('Inclua clientes na lista');

  tbCliente.DisableControls;
  try
    tbCliente.First;
    ListaClientes := '';
    while not tbCliente.Eof do
    begin
      ListaClientes := ListaClientes + tbClienteclt_codigo.AsString+',';
      tbCliente.Next;
    end;
    if ListaClientes <> '' then
    begin
      ListaClientes := Copy(ListaClientes,1,Length(ListaClientes)-1);
      ExecutaSQL(
        //'exec pr_distribuicao_televenda null, null, '+IntToStr(cbOperador.EditValue)+', 0, 0, 1, null, null, null, null, null, null, null, ''clt_codigo in ('+ListaClientes+')'', 0, null',
        ' update cliente_televenda' +
        ' set usu_codigo_operador = '+IntToStr(cbOperador.EditValue)+
        ' where clt_codigo in ('+ListaClientes+')',
        AgilusConnection, 0);
    end;
    btLimpar.Click;
  finally
    tbCliente.EnableControls;
  end;
end;

procedure TForm1.AgilusConnectionBeforeDisconnect(Sender: TObject);
begin
  //GravaDesconexao('');
end;

procedure TForm1.AplicaAppRole;
begin
  // como nao é possível fazer grant na extended stored procedure xp_parse
  // para o agilus_application_role (pois ela fica no master), só uso o application
  // role qdo for SQL Server 2005 pra cima (aí eu uso CLR function)
  with AbreDataSet(
    ' if convert(int,ltrim(rtrim(substring(@@version,22,5)))) >= 2005'+
    ' begin'+
    '    declare @cookie varbinary(8000)' +
    '    EXEC sp_setapprole agilus_application_role, 168421, @fCreateCookie = true, @cookie = @cookie output'+
    '    select @cookie' +
    ' end' +
    ' else select null',
    AgilusConnection) do
  begin
    try
      CookieConexao := Fields[0].Value;
    finally
      Free;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    Conectar;
    //GravaLoginUsuario;
    tbCliente.Open;
    tbOperador.Open;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Erro', mb_iconerror+mb_ok);
      Application.Terminate;
    end;
  end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
   begin
      if not (ActiveControl is TCustomMemo) then
      begin
         key := #0;
         Perform(WM_NEXTDLGCTL,0,0);
      end;
   end;
end;

end.
