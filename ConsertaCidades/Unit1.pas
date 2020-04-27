unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, StrUtils, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, Menus, ADODB, StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxLabel, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxNavigator;

type
  TForm1 = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    Panel1: TPanel;
    Panel2: TPanel;
    Conexao: TADOConnection;
    tbCidades: TADOQuery;
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    cbOrgao: TcxLookupComboBox;
    tbOrgao: TADOQuery;
    dsOrgao: TDataSource;
    dsCidades: TDataSource;
    cxButton2: TcxButton;
    cxGrid1DBTableView1cidade_origem: TcxGridDBColumn;
    cxGrid1DBTableView1cidade_destino: TcxGridDBColumn;
    tbCidadescidade_origem: TStringField;
    tbCidadescidade_destino: TStringField;
    cxLabel2: TcxLabel;
    edUf: TcxTextEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    procedure Conectar;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Conectar;
var
  ArquivoUDL, NomeUsuario: string;

  function EliminaEstranhos(texto: string): string;
  var
    i: integer;
  begin
    for I := 1 to Length(texto) do
      if texto[i] <> #0 then
        Result := Result + texto[i];
  end;

  function PropriedadeConexao(NomePropriedade: string): string;
  var
    Arq: TextFile;
    linha: string;
    achou: boolean;
    p1, p2, p3: integer;
  begin
    //Result := Conexao.Properties[NomePropriedade].Value; // incrível, isso nao funciona!!! Até traz o valor correto, mas na conexão dá um erro esquisito pelo fato de ter lido uma propriedade
    AssignFile(Arq, ArquivoUDL);
    try
      Reset(Arq);
      Readln(Arq, linha);
      Achou := false;
      while not Eof(Arq) do
      begin
        linha := EliminaEstranhos(linha);
        p1 := Pos(AnsiLowerCase(NomePropriedade), AnsiLowerCase(linha));
        if p1 > 0 then
        begin
          p2 := PosEx('=',linha,p1+1);
          p3 := PosEx(';',linha,p2+1);
          if p3 = 0 then
            p3 := 1000;
          Result := Copy(linha,p2+1,p3-p2-1);
          Achou := true;
          Break;
        end;

        Readln(Arq, linha);
      end;

      if not Achou then
        raise Exception.Create('Propriedade "'+NomePropriedade+'" não existe');
    finally
      CloseFile(Arq);
    end;
  end;

begin
  if Conexao.Connected then
    Conexao.Close;

  ArquivoUDL := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'conexao.udl';

  if not FileExists(ArquivoUDL) then
    raise Exception.Create('Arquivo de conexão com sistema não encontrado');

  Conexao.ConnectionString := 'FILE NAME='+ArquivoUDL;
  Conexao.LoginPrompt := False;

  try
    NomeUsuario := PropriedadeConexao('User ID');

    if Pos('whservidor', PropriedadeConexao('Data Source')) = 0 then
      Conexao.Open(NomeUsuario, 'awrpu07!@$AFAFAsdfqrasfafJMYJYJ&* $%')
    else
      Conexao.Open(NomeUsuario, 'uh123br');
      
  except
    on E: Exception do
    begin
      if Pos('login failed', LowerCase(E.Message)) > 0 then
        raise Exception.Create('Erro de conexão no Banco de Dados'+#13#13+E.Message)
      else
        raise;
    end;
  end;

  // valida se foi utilizado a segurança integrada do SQL Server com Windows
  // na minha opinião, isso é uma brecha enorme, pq bastaria qualquer um instalar
  // o SQL Server e usar segurança integrada, para abrir o Sistema Agilus
  if Pos('integrated security', LowerCase(Conexao.ConnectionString)) <> 0 then
    raise Exception.Create('Não é permitido usar segurança integrada do Windows para acessar o Agilus');

  Conexao.LoginPrompt := True;
end;


procedure TForm1.cxButton1Click(Sender: TObject);
var
  CidadeDestino: string;
begin
  with tbCidades do
  begin

    if not Active then Exit;

    First;
    while not Eof do
    begin
      CidadeDestino := Trim(tbCidadescidade_destino.AsString);
      if CidadeDestino <> '' then
      begin
        if CidadeDestino = '#' then
          Conexao.Execute(
            ' update cliente_televenda' +
            ' set clt_cidade = null' +
            ' where clt_cidade = '+QuotedStr(tbCidadescidade_origem.AsString)+
            IfThen(cbOrgao.EditValue <> null,' and orgav_codigo = '+IntToStr(cbOrgao.EditValue), '')+
            IfThen(Trim(edUf.Text) <> EmptyStr,' and clt_uf = '+QuotedStr(edUf.Text), '')
          )
        else
          Conexao.Execute(
            ' update cliente_televenda' +
            ' set clt_cidade = ' +QuotedStr(CidadeDestino)+
            ' where clt_cidade = '+QuotedStr(tbCidadescidade_origem.AsString)+
            IfThen(cbOrgao.EditValue <> null,' and orgav_codigo = '+IntToStr(cbOrgao.EditValue))+
            IfThen(Trim(edUf.Text) <> EmptyStr,' and clt_uf = '+QuotedStr(edUf.Text))
          )
      end;

      Next;
    end;

    Close;
  end;
end;

procedure TForm1.cxButton2Click(Sender: TObject);
begin
  with tbCidades do
  begin
    if Active then Close;
    Parameters.ParamByName('Orgao').Value := cbOrgao.EditValue;
    if Trim(edUf.Text) <> EmptyStr then
      Parameters.ParamByName('Uf').Value := Trim(edUf.Text);
    Open;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    Conectar;
    tbOrgao.Open;
  except
    on E: Exception do
    begin
      Application.MessageBox( PChar(E.Message), 'Erro', mb_iconerror+mb_ok );
      Application.Terminate;
    end;
  end;
end;

end.
