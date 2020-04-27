unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, cxPropertiesStore, Grids, AdvObj, BaseGrid,
  AdvGrid, StdCtrls, cxButtons, cxButtonEdit, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel, DateUtils, cxFormats, DB, ADODB, StrUtils, ComCtrls,
  dxCore, cxDateUtils, cxCheckBox;

const COL_STATUS = 2;

type
  TfrmMain = class(TForm)
    cxLabel1: TcxLabel;
    cbOrgao: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    cbUnidade: TcxLookupComboBox;
    PropertiesStore: TcxPropertiesStore;
    cxLabel3: TcxLabel;
    edMes: TcxDateEdit;
    cxLabel4: TcxLabel;
    beArquivo: TcxButtonEdit;
    OpenDialog: TOpenDialog;
    cxButton1: TcxButton;
    Grid: TAdvStringGrid;
    cbNaoProcessarArquivo: TcxCheckBox;
    cxLabel5: TcxLabel;
    cbFilial: TcxLookupComboBox;
    procedure cxDBLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure beArquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cbNaoProcessarArquivoClick(Sender: TObject);
  private
    function FormataVlrSQL(Value: Variant; CasasDecimais: byte = 4): string;
    function FormataStringSQL(Value: Variant): string;
    function ResolveMoney(Value: string): string;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Dados, SemVinculo;

{$R *.dfm}

function StrZero(st: string; tamanho: integer): string;
begin
  // obtém uma string com Zeros a esquerda
  st := trim(st);
  while tamanho > Length(st) do
    st := '0'+st;

  Result := st;
end;

procedure TfrmMain.beArquivoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  OpenDialog.FileName := beArquivo.Text;
  if OpenDialog.Execute then
    beArquivo.Text := OpenDialog.FileName;
end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
var
  LinhaProgressoAtual, QtdeRegistros, Contador, i, InicioTotalizadores: integer;
  SqlInsert: TStringBuilder;
  NomeProvedor: string;
  CodTotalizador, NomeTotalizador: string;
begin
  LinhaProgressoAtual := 0;
  Grid.ClearCols(COL_STATUS, 1);

  // abrindo arquivos de dados
  Inc(LinhaProgressoAtual);
  Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Abrindo...';

  try
    if not cbNaoProcessarArquivo.Checked then
    begin
      if not FileExists(beArquivo.Text) then
        raise Exception.Create('Arquivo não encontrado');
      if ExtractFileExt(beArquivo.Text) = '.mdb' then
        NomeProvedor := 'Microsoft.Jet.OLEDB.4.0'
      else if ExtractFileExt(beArquivo.Text) = '.accdb' then
        NomeProvedor := 'Microsoft.ACE.OLEDB.12.0'
      else
        raise Exception.Create('Tipo não suportado');

      dmDados.ConexaoExercito.ConnectionString := 'Provider='+NomeProvedor+';Data Source='+beArquivo.Text+';Persist Security Info=False;';
      dmDados.ConexaoExercito.Connected := True;
    end;
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';


    // abrindo tabela de totalizadores
    Inc(LinhaProgressoAtual);

    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // transferindo tabela de totalizadores
    Inc(LinhaProgressoAtual);
    Application.ProcessMessages;
    if not cbNaoProcessarArquivo.Checked then
    begin
      dmDados.ConexaoAgilus.Execute(
        ' if object_id(''temp_totalizador_exercito'') > 0' +
        '    drop table temp_totalizador_exercito' +
        ' create table temp_totalizador_exercito('+
        ' cod varchar(3),'+
        ' discriminacao varchar(16))'
      );

      with dmDados.tbCompleto do
      begin
        Open;

        for i := 0 to Fields.Count-1 do
          if Pos(' - ', Fields[i].FieldName) > 0 then
            break;

        InicioTotalizadores := i;
        while i <= Fields.Count-1  do
        begin
          CodTotalizador := LeftStr(Fields[i].FieldName,3);
          NomeTotalizador := Trim(Copy(Fields[i].FieldName,7, Length(Fields[i].FieldName)-11));
          Inc(i,2);

          dmDados.ConexaoAgilus.Execute(
            'insert into temp_totalizador_exercito values('+
            FormataStringSql(CodTotalizador)+','+
            FormataStringSql(NomeTotalizador)+')');
        end;
      end;
    end;

    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // comparando totalizadores
    Inc(LinhaProgressoAtual);
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Veficando...';
    Application.ProcessMessages;
    dmDados.tbNaoVinculado.Open;
    while dmDados.tbNaoVinculado.RecordCount > 0 do
    begin
      Application.CreateForm(TfrmSemVinculo, frmSemVinculo);
      if frmSemVinculo.ShowModal = mrCancel then
      begin
        Grid.ClearCols(COL_STATUS, 1);
        Exit;
      end;

      dmDados.tbNaoVinculado.Close;
      dmDados.tbNaoVinculado.Open;
    end;
    dmDados.tbNaoVinculado.Close;
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    SqlInsert := TStringBuilder.Create;

    // PARAR AQUI PARA SOMENTE COMPARAR TOTALIZADORES
    //Exit;

    // abrindo tabela de clientes
    Inc(LinhaProgressoAtual);
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Abrindo...';
    Application.ProcessMessages;
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // transferindo tabela de clientes
    Inc(LinhaProgressoAtual);
    if not cbNaoProcessarArquivo.Checked then
    begin
      Grid.AddProgress(COL_STATUS,LinhaProgressoAtual,clBlue,Grid.Color);
      QtdeRegistros := dmDados.tbcompleto.RecordCount;
      Contador := 0;
      Application.ProcessMessages;
      dmDados.ConexaoAgilus.Execute(
        ' if object_id(''temp_cliente_exercito'') > 0' +
        '    drop table temp_cliente_exercito' +
        ' create table temp_cliente_exercito('+
        ' CODOM varchar(255),'+
        ' pg varchar(255),'+
        ' nrpg varchar(255),'+
        ' cat varchar(255),'+
        ' [Prec-cp] varchar(255),'+
        ' Ind varchar(255),'+
        ' SIGLA varchar(255),'+
        ' CPF varchar(255),'+
        ' Idt varchar(255),'+
        ' Nome varchar(255),'+
        ' Dt_Nasc varchar(255),'+
        ' Banco varchar(255),'+
        ' Agencia varchar(255),'+
        ' Conta varchar(255),'+
        ' Bruto money,'+
        ' Desconto money,'+
        ' Líquido money,'+
        ' Endereco varchar(255),'+
        ' Bairro varchar(255),'+
        ' Cidade varchar(255),'+
        ' UF varchar(255),'+
        ' CEP varchar(255),' +
        ' Cidade_OM varchar(255),'+
        ' UF_OM varchar(255))'
      );


      dmDados.tbCompleto.First;

      while not dmDados.tbCompleto.Eof do
      begin
        SqlInsert.Append(
          'insert into temp_cliente_exercito values('+
          FormataStringSql(dmDados.tbCompleto.FieldByName('CODOM').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('pg').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('nrpg').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('cat').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Prec-cp').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Ind').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('SIGLA').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('CPF').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Idt').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Nome').AsString)+','+
          FormataStringSql(
            '19'+Strzero(dmDados.tbCompleto.FieldByName('ano').AsString,2)+
            StrZero(dmDados.tbCompleto.FieldByName('mes').AsString,2)+
            StrZero(dmDados.tbCompleto.FieldByName('dia').AsString,2)
          )+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Banco').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Agencia').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Conta').AsString)+','+
          FormataStringSql(ResolveMoney(dmDados.tbCompleto.FieldByName('Bruto').AsString))+','+
          FormataStringSql(ResolveMoney(dmDados.tbCompleto.FieldByName('Desconto').AsString))+','+
          FormataStringSql(ResolveMoney(dmDados.tbCompleto.FieldByName('Líquido').AsString))+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Endereco').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Bairro').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Cidade').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('UF').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('CEP').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('Cidade_OM').AsString)+','+
          FormataStringSql(dmDados.tbCompleto.FieldByName('UF_OM').AsString)+')'+#13);

        Inc(Contador);

        if Contador mod 2000 = 0 then
        begin
          dmDados.ConexaoAgilus.Execute(SqlInsert.ToString);
          Grid.Ints[COL_STATUS, LinhaProgressoAtual] := Trunc(Contador/QtdeRegistros* 100);
          Application.ProcessMessages;
          SqlInsert.Clear;
        end;
        dmDados.tbCompleto.Next;
      end;
      if SqlInsert.ToString <> '' then
        dmDados.ConexaoAgilus.Execute(SqlInsert.ToString);

      Grid.RemoveProgress(COL_STATUS, LinhaProgressoAtual);

    end;
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Indexando...';
    dmDados.ConexaoAgilus.Execute('if not exists( select 1 from sys.indexes where name = ''i_cpf'' and object_id = object_id(''temp_cliente_exercito'' )) create index i_cpf on temp_cliente_exercito(cpf)');
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // PARAR AQUI PARA SOMENTE CARREGAR CLIENTES.
    //Exit;

    // abrindo tabela de contratos
    Inc(LinhaProgressoAtual);
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Abrindo...';
    Application.ProcessMessages;
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // transferindo tabela de contratos
    Inc(LinhaProgressoAtual);
    if not cbNaoProcessarArquivo.Checked then
    begin
      Grid.AddProgress(COL_STATUS,LinhaProgressoAtual,clBlue,Grid.Color);
      QtdeRegistros := dmDados.tbCompleto.RecordCount;
      Contador := 0;
      Application.ProcessMessages;
      dmDados.ConexaoAgilus.Execute(
        ' if object_id(''temp_contrato_exercito'') > 0' +
        '    drop table temp_contrato_exercito' +
        ' create table temp_contrato_exercito('+
        ' [Prec-cp] varchar(9),'+
        ' valor money,'+
        ' prazo varchar(4),'+
        ' cod varchar(3))'
      );

      dmDados.tbCompleto.First;
      SqlInsert.Clear;
      while not dmDados.tbCompleto.Eof do
      begin
        i := InicioTotalizadores;
        while i <= dmDados.tbCompleto.Fields.Count-1  do
        begin
          CodTotalizador := LeftStr(dmDados.tbCompleto.Fields[i].FieldName,3);

          if dmDados.tbCompleto.Fields[i+1].AsString <> '' then
            SqlInsert.Append(
              'insert into temp_contrato_exercito values('+
              FormataStringSql(dmDados.tbCompleto.FieldByName('Prec-cp').AsString)+','+
              FormataVlrSQL(dmDados.tbCompleto.Fields[i].Value,4)+','+ // valor parcela
              FormataStringSql(dmDados.tbCompleto.Fields[i+1].AsString)+','+ // termino
              FormataStringSql(CodTotalizador)+')'+#13);

          Inc(i,2);
        end;

        Inc(Contador);

        if Contador mod 1000 = 0 then
        begin
          if SqlInsert.ToString <> '' then
            dmDados.ConexaoAgilus.Execute(SqlInsert.ToString);
          Grid.Ints[COL_STATUS, LinhaProgressoAtual] := Trunc(Contador/QtdeRegistros* 100);
          Application.ProcessMessages;
          SqlInsert.Clear;
        end;
        dmDados.tbCompleto.Next;
      end;
      if SqlInsert.ToString <> '' then
        dmDados.ConexaoAgilus.Execute(SqlInsert.ToString);

      Grid.RemoveProgress(COL_STATUS, LinhaProgressoAtual);
    end;

    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Indexando...';
    dmDados.ConexaoAgilus.Execute('if not exists( select 1 from sys.indexes where name = ''i_matricula'' and object_id = object_id(''temp_contrato_exercito'' )) create index i_matricula on temp_contrato_exercito([prec-cp])');

    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // PARAR AQUI PARA SOMENTE CARREGAR TABELAS TEMPORÁRIAS.
    //Exit;

    // Atualizando clientes já cadastrados
    Inc(LinhaProgressoAtual);
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Atualizando...';
    dmDados.DropProc.ExecSQL;
    dmDados.ConexaoAgilus.Execute(dmDados.CreateProcAtualizaCliente.SQL.Text);
    dmDados.ConexaoAgilus.Execute(dmDados.CreateProcIncluiCliente.SQL.Text);
    dmDados.ConexaoAgilus.Execute(dmDados.CreateProcIncluiContrato.SQL.Text);

    Application.ProcessMessages;

    with dmDados.prAtualizaCliente do
    begin
      Parameters.ParamByName('@orgav_codigo').Value := cbOrgao.EditValue;
      Parameters.ParamByName('@uni_codigo').Value := cbUnidade.EditValue;
      Parameters.ParamByName('@mes').Value := StartOfAMonth( YearOf(edMes.Date), MonthOf(edMes.Date) );
      ExecProc;
      QtdeRegistros := Parameters.ParamByName('@qtde_registros').Value;
      Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK ('+IntToStr(QtdeRegistros)+' registros)';
    end;

    // incluindo clientes novos
    Inc(LinhaProgressoAtual);
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Incluindo...';
    Application.ProcessMessages;

    with dmDados.prIncluiCliente do
    begin
      Parameters.ParamByName('@orgav_codigo').Value := cbOrgao.EditValue;
      Parameters.ParamByName('@uni_codigo').Value := cbUnidade.EditValue;
      Parameters.ParamByName('@mes').Value := StartOfAMonth( YearOf(edMes.Date), MonthOf(edMes.Date) );
      Parameters.ParamByName('@fil_codigo').Value := cbFilial.EditValue;
      ExecProc;
      QtdeRegistros := Parameters.ParamByName('@qtde_registros').Value;
      Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK ('+IntToStr(QtdeRegistros)+' registros)';
    end;

    // incluindo contratos novos
    Inc(LinhaProgressoAtual);
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Incluindo...';
    Application.ProcessMessages;

    with dmDados.prIncluiContrato do
    begin
      Parameters.ParamByName('@orgav_codigo').Value := cbOrgao.EditValue;
      Parameters.ParamByName('@uni_codigo').Value := cbUnidade.EditValue;
      ExecProc;
      QtdeRegistros := Parameters.ParamByName('@qtde_registros').Value;
      Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK ('+IntToStr(QtdeRegistros)+' registros)';
    end;
  finally
    // excluindo tabelas temporárias
{
    dmDados.ConexaoAgilus.Execute(
      ' if object_id(''temp_totalizador_exercito'') > 0' +
      '    drop table temp_totalizador_exercito' +
      ' if object_id(''temp_cliente_exercito'') > 0' +
      '    drop table temp_cliente_exercito' +
      ' if object_id(''temp_contrato_exercito'') > 0' +
      '    drop table temp_contrato_exercito'
    );
}
    if dmDados.ConexaoExercito.Connected then
      dmDados.ConexaoExercito.Close;
  end;
end;

procedure TfrmMain.cbNaoProcessarArquivoClick(Sender: TObject);
begin
  beArquivo.Enabled := not cbNaoProcessarArquivo.Checked;
end;

procedure TfrmMain.cxDBLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
begin
  cbUnidade.EditValue := null;
  with dmDados.tbUnidade do
  begin
    if Active then Close;
    Parameters.ParamByName('CodOrgao').Value := cbOrgao.EditValue;
    Open;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  arquivoUDL: string;
begin
  ArquivoUDL := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'conexao.udl';

  if not FileExists(ArquivoUDL) then
    raise Exception.Create('Arquivo de conexão com sistema não encontrado');

  dmDados.ConexaoAgilus.ConnectionString := 'FILE NAME='+ArquivoUDL;
  dmDados.ConexaoAgilus.LoginPrompt := False;
  dmDados.ConexaoAgilus.Open('cargaexercito', 'carga@55216');

  FormatSettings.ShortDateFormat := 'dd/MM/yyyy';
  cxFormatController.UseDelphiDateTimeFormats := True;

  Grid.Cells[1,1] := 'Abrindo arquivos de dados';
  Grid.Cells[1,2] := 'Abrindo tabela de totalizadores';
  Grid.Cells[1,3] := 'Transferindo tabela de totalizadores';
  Grid.Cells[1,4] := 'Comparando totalizadores';
  Grid.Cells[1,5] := 'Abrindo tabela de clientes';
  Grid.Cells[1,6] := 'Transferindo tabela de clientes';
  Grid.Cells[1,7] := 'Abrindo tabela de empréstimos';
  Grid.Cells[1,8] := 'Transferindo tabela de empréstimos';
  Grid.Cells[1,9] := 'Atualizando clientes já cadastrados';
  Grid.Cells[1,10] := 'Incluindo clientes novos';
  Grid.Cells[1,11] := 'Incluindo empréstimos novos';


  dmDados.tbOrgao.Open;
  if dmDados.tbOrgao.Locate('orgav_descricao', 'EXERCITO', [loCaseInsensitive]) or
     dmDados.tbOrgao.Locate('orgav_descricao', 'EXÉRCITO', [loCaseInsensitive]) then
  begin
    cbOrgao.EditValue := dmDados.tbOrgao.FieldByName('orgav_codigo').AsInteger;
    cbOrgao.Enabled := False;
  end;

  dmDados.tbFilial.Open;

  PropertiesStore.Active := True;
  PropertiesStore.RestoreFrom;
end;

function TfrmMain.ResolveMoney(Value: string): string;
begin
  Result := ReplaceStr( ReplaceStr( Value, '.',''), ',','.');
end;

function TfrmMain.FormataVlrSQL(Value: Variant; CasasDecimais: byte): string;
var DecimalSeparatorAnterior: char;
    Valor: extended;
begin
  if Value = null then
    Result := 'null'
  else
  begin
    Valor := Value;
    DecimalSeparatorAnterior := FormatSettings.DecimalSeparator;
    try
      FormatSettings.DecimalSeparator := '.';
      Result := Trim(Format('%18.'+IntToStr(CasasDecimais)+'f', [Valor]));
    finally
      FormatSettings.DecimalSeparator := DecimalSeparatorAnterior;
    end;
  end;
end;

function TfrmMain.FormataStringSQL(Value: Variant): string;
begin
  if Value = null then
    Result := 'null'
  else
    Result := QuotedStr(Value);
end;

end.
