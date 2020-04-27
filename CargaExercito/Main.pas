unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, cxPropertiesStore, Grids, AdvObj, BaseGrid,
  AdvGrid, StdCtrls, cxButtons, cxButtonEdit, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel, DateUtils, IniFiles, cxFormats, ComCtrls, dxCore, cxDateUtils;

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
    procedure cxDBLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure beArquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    function FormataVlrSQL(Value: Variant; CasasDecimais: byte = 4): string;
    function FormataBooleanSQL(Value: Variant): string;
    function FormataDataSQL(Value: Variant): string;
    function FormataStringSQL(Value: Variant): string;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Dados, SemVinculo;

{$R *.dfm}

procedure TfrmMain.beArquivoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  OpenDialog.FileName := beArquivo.Text;
  if OpenDialog.Execute then
    beArquivo.Text := OpenDialog.FileName;
end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
var
  LinhaProgressoAtual, QtdeRegistros, Contador: integer;
  SqlInsert: WideString;
  NomeProvedor: string;
begin
  LinhaProgressoAtual := 0;
  Grid.ClearCols(COL_STATUS, 1);

  // abrindo arquivos de dados
  Inc(LinhaProgressoAtual);
  Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Abrindo...';
  if not FileExists(beArquivo.Text) then
    raise Exception.Create('Arquivo não encontrado');

  try
    if ExtractFileExt(beArquivo.Text) = '.mdb' then
      NomeProvedor := 'Microsoft.Jet.OLEDB.4.0'
    else if ExtractFileExt(beArquivo.Text) = '.accdb' then
      NomeProvedor := 'Microsoft.ACE.OLEDB.12.0'
    else
      raise Exception.Create('Tipo não suportado');

    dmDados.ConexaoExercito.ConnectionString := 'Provider='+NomeProvedor+';Data Source='+beArquivo.Text+';Persist Security Info=False;';
    dmDados.ConexaoExercito.Connected := True;
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // abrindo tabela de totalizadores
    Inc(LinhaProgressoAtual);
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Abrindo...';
    Application.ProcessMessages;
    dmDados.tbTotalizador.Open;
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // transferindo tabela de totalizadores
    Inc(LinhaProgressoAtual);
    Grid.AddProgress(COL_STATUS,LinhaProgressoAtual,clBlue,Grid.Color);
    QtdeRegistros := dmDados.tbTotalizador.RecordCount;
    Contador := 0;
    Application.ProcessMessages;
    dmDados.ConexaoAgilus.Execute(
      ' if object_id(''temp_totalizador_exercito'') > 0' +
      '    drop table temp_totalizador_exercito' +
      ' create table temp_totalizador_exercito('+
      ' cod varchar(3),'+
      ' discriminacao varchar(16))'
    );

    dmDados.tbTotalizador.First;
    SqlInsert := '';
    while not dmDados.tbTotalizador.Eof do
    begin
      SqlInsert := SqlInsert +
        'insert into temp_totalizador_exercito values('+
        FormataStringSql(dmDados.tbTotalizador.FieldByName('cod').AsString)+','+
        FormataStringSql(dmDados.tbTotalizador.FieldByName('discriminacao').AsString)+')'+#13;

      Inc(Contador);

      if Contador mod 10 = 0 then
      begin
        dmDados.ConexaoAgilus.Execute(SqlInsert);
        Grid.Ints[COL_STATUS, LinhaProgressoAtual] := Trunc(Contador/QtdeRegistros* 100);
        Application.ProcessMessages;
        SqlInsert := '';
      end;
      dmDados.tbTotalizador.Next;
    end;
    if SqlInsert <> '' then
      dmDados.ConexaoAgilus.Execute(SqlInsert);

    Grid.RemoveProgress(COL_STATUS, LinhaProgressoAtual);
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
    // PARAR AQUI PARA SOMENTE COMPARAR TOTALIZADORES
    //Exit;

    // abrindo tabela de clientes
    Inc(LinhaProgressoAtual);
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Abrindo...';
    Application.ProcessMessages;
    dmDados.tbCliente.Open;
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // transferindo tabela de clientes
    Inc(LinhaProgressoAtual);
    Grid.AddProgress(COL_STATUS,LinhaProgressoAtual,clBlue,Grid.Color);
    QtdeRegistros := dmDados.tbCliente.RecordCount;
    Contador := 0;
    Application.ProcessMessages;
    dmDados.ConexaoAgilus.Execute(
      ' if object_id(''temp_cliente_exercito'') > 0' +
      '    drop table temp_cliente_exercito' +
      ' create table temp_cliente_exercito('+
      ' CODOM varchar(6),'+
      ' pg varchar(7),'+
      ' nrpg varchar(2),'+
      ' cat varchar(11),'+
      ' Simples varchar(10),'+
      ' [Prec-cp] varchar(9),'+
      ' Ind varchar(1),'+
      ' SIGLA varchar(28),'+
      ' CPF varchar(11),'+
      ' Idt varchar(12),'+
      ' Nome varchar(49),'+
      ' Dt_Nasc varchar(8),'+
      ' Banco varchar(3),'+
      ' Agencia varchar(5),'+
      ' Conta varchar(12),'+
      ' Bruto money,'+
      ' Desconto money,'+
      ' Líquido money,'+
      ' Endereco varchar(48),'+
      ' Bairro varchar(20),'+
      ' Cidade varchar(25),'+
      ' UF varchar(2),'+
      ' CEP varchar(8))'
    );

    dmDados.tbCliente.First;
    SqlInsert := '';
    while not dmDados.tbCliente.Eof do
    begin
      SqlInsert := SqlInsert +
        'insert into temp_cliente_exercito values('+
        FormataStringSql(dmDados.tbCliente.FieldByName('CODOM').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('pg').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('nrpg').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('cat').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Simples').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Prec-cp').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Ind').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('SIGLA').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('CPF').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Idt').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Nome').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Dt_Nasc').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Banco').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Agencia').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Conta').AsString)+','+
        FormataVlrSql(dmDados.tbCliente.FieldByName('Bruto').AsCurrency)+','+
        FormataVlrSql(dmDados.tbCliente.FieldByName('Desconto').AsCurrency)+','+
        FormataVlrSql(dmDados.tbCliente.FieldByName('Líquido').AsCurrency)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Endereco').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Bairro').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('Cidade').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('UF').AsString)+','+
        FormataStringSql(dmDados.tbCliente.FieldByName('CEP').AsString)+')'+#13;

      Inc(Contador);

      if Contador mod 2000 = 0 then
      begin
        dmDados.ConexaoAgilus.Execute(SqlInsert);
        Grid.Ints[COL_STATUS, LinhaProgressoAtual] := Trunc(Contador/QtdeRegistros* 100);
        Application.ProcessMessages;
        SqlInsert := '';
      end;
      dmDados.tbCliente.Next;
    end;
    if SqlInsert <> '' then
      dmDados.ConexaoAgilus.Execute(SqlInsert);

    Grid.RemoveProgress(COL_STATUS, LinhaProgressoAtual);

    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Indexando...';
    dmDados.ConexaoAgilus.Execute('create index i_cpf on temp_cliente_exercito(cpf)');

    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // PARAR AQUI PARA SOMENTE CARREGAR CLIENTES.
    //Exit;

    // abrindo tabela de contratos
    Inc(LinhaProgressoAtual);
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Abrindo...';
    Application.ProcessMessages;
    dmDados.tbContrato.Open;
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // transferindo tabela de contratos
    Inc(LinhaProgressoAtual);
    Grid.AddProgress(COL_STATUS,LinhaProgressoAtual,clBlue,Grid.Color);
    QtdeRegistros := dmDados.tbContrato.RecordCount;
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

    dmDados.tbContrato.First;
    SqlInsert := '';
    while not dmDados.tbContrato.Eof do
    begin
      SqlInsert := SqlInsert +
        'insert into temp_contrato_exercito values('+
        FormataStringSql(dmDados.tbContrato.FieldByName('Prec-cp').AsString)+','+
        FormataVlrSql(dmDados.tbContrato.FieldByName('valor').Value)+','+
        FormataStringSql(dmDados.tbContrato.FieldByName('prazo').AsString)+','+
        FormataStringSql(dmDados.tbContrato.FieldByName('cod').AsString)+')'+#13;

      Inc(Contador);

      if Contador mod 4000 = 0 then
      begin
        dmDados.ConexaoAgilus.Execute(SqlInsert);
        Grid.Ints[COL_STATUS, LinhaProgressoAtual] := Trunc(Contador/QtdeRegistros* 100);
        Application.ProcessMessages;
        SqlInsert := '';
      end;
      dmDados.tbContrato.Next;
    end;
    if SqlInsert <> '' then
      dmDados.ConexaoAgilus.Execute(SqlInsert);

    Grid.RemoveProgress(COL_STATUS, LinhaProgressoAtual);

    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Indexando...';
    dmDados.ConexaoAgilus.Execute('create index i_matricula on temp_contrato_exercito([prec-cp])');

    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'OK';

    // PARAR AQUI PARA SOMENTE CARREGAR TABELAS TEMPORÁRIAS.
    //Exit;

    // Atualizando clientes já cadastrados
    Inc(LinhaProgressoAtual);
    Grid.Cells[COL_STATUS,LinhaProgressoAtual] := 'Atualizando...';
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
    dmDados.ConexaoExercito.Close;
  end;
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
  IniFile: TIniFile;
  server, database: string;
begin
  ShortDateFormat := 'dd/MM/yyyy';
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

  IniFile := TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'config.ini');
  try
    server := IniFile.ReadString('Sql','server', '');
    database := IniFile.ReadString('Sql','database', '');

    dmDados.ConexaoAgilus.ConnectionString := 'Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog='+database+';Data Source='+server;
    dmDados.ConexaoAgilus.Open('cargaexercito','carga@55216');
  finally
    IniFile.Free;
  end;

  dmDados.tbOrgao.Open;

  PropertiesStore.Active := True;
  PropertiesStore.RestoreFrom;
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
    DecimalSeparatorAnterior := DecimalSeparator;
    try
      DecimalSeparator := '.';
      Result := Trim(Format('%18.'+IntToStr(CasasDecimais)+'f', [Valor]));
    finally
      DecimalSeparator := DecimalSeparatorAnterior;
    end;
  end;
end;

function TfrmMain.FormataBooleanSQL(Value: Variant): string;
begin
  if Value = null then
    Result := 'null';
  if Value = True then
    Result := '1';
  if Value = False then
    Result := '0';
end;

function TfrmMain.FormataDataSQL(Value: Variant): string;
begin
  if Value = null then
    Result := 'null'
  else
    Result := QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Value));
end;

function TfrmMain.FormataStringSQL(Value: Variant): string;
begin
  if Value = null then
    Result := 'null'
  else
    Result := QuotedStr(Value);
end;

end.
