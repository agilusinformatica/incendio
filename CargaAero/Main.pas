unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, shellapi, shlobj,
  cxDBLookupEdit, cxDBLookupComboBox, cxLabel, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxDBExtLookupComboBox,
  Grids, DBGrids, cxPropertiesStore, dxSkinsForm, cxCalendar, cxButtonEdit,
  Menus, BaseGrid, AdvGrid, StdCtrls, cxButtons, IniFiles, DateUtils,
  dxSkinscxPCPainter, cxProgressBar, cxGridLevel, StrUtils, cxShellBrowserDialog,
  dxSkinsDefaultPainters, cxCheckBox, cxNavigator, ComCtrls, dxCore, cxDateUtils,
  VCL.FlexCel.Core, FlexCel.XlsAdapter;

const COL_STATUS = 2;
const LINHA_INICIAL = 6;

type
  TfrmMain = class(TForm)
    cxLabel1: TcxLabel;
    cbOrgao: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    cbUnidade: TcxLookupComboBox;
    SkinController: TdxSkinController;
    PropertiesStore: TcxPropertiesStore;
    cxLabel3: TcxLabel;
    edMes: TcxDateEdit;
    cxLabel4: TcxLabel;
    beArquivo: TcxButtonEdit;
    cxButton1: TcxButton;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Grid: TcxGridTableView;
    ColumnArquivo: TcxGridColumn;
    ColumnBanco: TcxGridColumn;
    ColumnProgresso: TcxGridColumn;
    cxButton2: TcxButton;
    ProgressBar: TcxProgressBar;
    ColumnQtdeLinhas: TcxGridColumn;
    BrowserDialog: TcxShellBrowserDialog;
    ColumnMarca: TcxGridColumn;
    cbReprocessamento: TcxCheckBox;
    cxLabel5: TcxLabel;
    edLinhaCabecalho: TcxTextEdit;
    cbFilial: TcxLookupComboBox;
    cxLabel6: TcxLabel;
    procedure cxDBLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure beArquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxButton2Click(Sender: TObject);
    procedure ColumnArquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ColumnBancoPropertiesEditValueChanged(Sender: TObject);
  private
    function FormataVlrSQL(Value: Variant; CasasDecimais: byte = 4): string;
    function FormataBooleanSQL(Value: Variant): string;
    function FormataDataSQL(Value: Variant): string;
    function FormataStringSQL(Value: Variant): string;
    function NumLinhasArq(Arqtexto: String): integer;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Dados;

{$R *.dfm}

function TfrmMain.NumLinhasArq(Arqtexto:String): integer;
var
  ExcelApp: TXlsFile;
  cont, linha: integer;
  texto: string;
begin
  cont := 0;
  ExcelApp := TXlsFile.Create;
  ExcelApp.Open(ArqTexto);
  try
    linha := StrToInt(Trim(edLinhaCabecalho.Text))+1;
    texto := ExcelApp.GetStringFromCell(linha,3).ToString;
    while Trim(texto) <> '' do
    begin
      Inc(cont);
      Inc(linha);
      texto := ExcelApp.GetStringFromCell(linha,3).ToString;
    end;
  finally
    ExcelApp.Free;
  end;
  result := cont;
end;

function NomeBanco(NomeArquivo: string): string;
var
  i: integer;
begin
  {NomeArquivo := Trim(ChangeFileExt(NomeArquivo, ''));
  i := Length(NomeArquivo);
  while NomeArquivo[i] in ['0'..'9'] do
  begin
    Delete(NomeArquivo, i, 1);
    Dec(i);
  end;}
  Result := Trim(NomeArquivo);
end;

procedure TfrmMain.beArquivoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  BrowserDialog.Path := beArquivo.Text;
  if BrowserDialog.Execute then
    beArquivo.Text := BrowserDialog.Path;
end;

procedure TfrmMain.ColumnArquivoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Arq: string;
begin
  Arq := IncludeTrailingBackslash(beArquivo.Text)+Grid.DataController.Values[Grid.Controller.SelectedRows[0].Index, ColumnArquivo.Index];
  ShellExecute(Handle, 'open', PWideChar(Arq), '','',SW_SHOWNORMAL);
end;

procedure TfrmMain.ColumnBancoPropertiesEditValueChanged(Sender: TObject);
var
  CodBanco: Variant;
  Nome: string;
begin
  CodBanco := TcxLookupComboBox(Sender).EditValue;
  Nome := NomeBanco(Grid.DataController.Values[Grid.Controller.SelectedRows[0].Index, ColumnArquivo.Index]);
  if CodBanco = null then
  begin
    if dmDados.tbVinculo.Locate('nome', Nome, []) then
      dmDados.tbVinculo.Delete;
  end
  else
  begin
      if dmDados.tbVinculo.Locate('nome', Nome, []) then
        dmDados.tbVinculo.Edit
      else
        dmDados.tbVinculo.Insert;
      dmDados.tbVinculo.FieldByName('nome').AsString := Nome;
      if CodBanco = -1 then
        dmDados.tbVinculo.FieldByName('bcolib_codigo').Value := null
      else
        dmDados.tbVinculo.FieldByName('bcolib_codigo').Value := CodBanco;

      dmDados.tbVinculo.Post;
  end;
end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
var
  i, Ret, LinhaProgressoAtual, QtdeRegistros, Contador: integer;
  SqlInsert: WideString;
  Arqs: TSearchRec;
begin
  if not DirectoryExists(beArquivo.Text) then
    raise Exception.Create('Pasta não encontrada');

  for i := Grid.DataController.RowCount - 1 downto 0 do
    Grid.DataController.DeleteRecord(i);

  Ret := FindFirst(IncludeTrailingBackslash(beArquivo.Text)+'*.xls*', faAnyFile, Arqs);
  try
    LinhaProgressoAtual := 1;
    while Ret = 0 do
    begin
      Grid.DataController.AppendRecord;
      Grid.DataController.Values[Grid.DataController.RowCount-1, ColumnArquivo.Index] := Arqs.Name;
      Grid.DataController.Values[Grid.DataController.RowCount-1, ColumnMarca.Index] := True;
      with dmDados.tbVinculo do
      begin
        if Locate('nome', NomeBanco(Arqs.Name), []) then
        begin
          if FieldByName('bcolib_codigo').IsNull then
            Grid.DataController.Values[Grid.DataController.RowCount-1, ColumnBanco.Index] := -1
          else
            Grid.DataController.Values[Grid.DataController.RowCount-1, ColumnBanco.Index] := FieldByName('bcolib_codigo').AsInteger;
        end;
      end;
      Ret := FindNext(Arqs);
    end;
  finally
    FindClose(Arqs);
  end;
end;

procedure TfrmMain.cxButton2Click(Sender: TObject);
var
  linha, i, cont, QtdeTotal, QtdeProcessado: integer;
  ExcelApp: TXlsFile;
  SqlInsert: string;
  QtdeClientesIncluidos, QtdeClientesAlterados, QtdeContratosIncluidos: integer;

  tipo, cargo, nome, matricula, cpf, upag, subom, parcela, termino: string;

  function NomeArquivo: string;
  begin
    Result := IncludeTrailingBackslash(beArquivo.Text)+Grid.DataController.Values[i, ColumnArquivo.Index];
  end;

begin

  QtdeTotal := 0;
  for i := 0 to Grid.DataController.RowCount - 1 do
  begin
    if Grid.DataController.Values[i, ColumnBanco.Index] = null then
      raise Exception.Create('Antes de processar, todos as linhas devem ter um banco preenchido');

    //ShowMessage(NomeArquivo);
    if (Grid.DataController.Values[i, ColumnBanco.Index] <> -1) and
       (Grid.DataController.Values[i, ColumnMarca.Index] = True) then
    begin
      Grid.DataController.Values[i, ColumnQtdeLinhas.Index] := NumLinhasArq(NomeArquivo);
      QtdeTotal := QtdeTotal + Grid.DataController.Values[i, ColumnQtdeLinhas.Index];
    end;
    Application.ProcessMessages;
  end;

  ProgressBar.Properties.Marquee := False;
  ProgressBar.Properties.Text := '';
  ProgressBar.Properties.ShowTextStyle := cxtsPercent;
  ProgressBar.Properties.Max := QtdeTotal;

  // criando tabela temporaria
  if not cbReprocessamento.Checked then
    dmDados.ConexaoAgilus.Execute(
      ' if object_id(''temp_carga_aero'') > 0' +
      '    drop table temp_carga_aero' +
      ' create table temp_carga_aero('+
      ' banco smallint,' +
      ' tipo varchar(10),' +
      ' cargo varchar(10),' +
      ' nome varchar(100),' +
      ' matricula varchar(12),' +
      ' cpf varchar(11),' +
      ' upag varchar(10),' +
      ' subom varchar(10),' +
      ' parcela varchar(15),' +
      ' termino varchar(10))'
    );

  QtdeProcessado := 0;
  for i := 0 to Grid.DataController.RowCount - 1 do
  begin

    Grid.Controller.FocusedRowIndex := i;

    if (Grid.DataController.Values[i, ColumnBanco.Index] <> -1) and
       (Grid.DataController.Values[i, ColumnMarca.Index] = True) then
    begin
      ExcelApp := TXlsFile.Create;
      ExcelApp.Open(NomeArquivo);
      try
        cont := 0;
        linha := StrToInt(Trim(edLinhaCabecalho.Text))+1;
        SqlInsert := '';
        nome := ExcelApp.GetStringFromCell(linha,3);
        while Trim(nome) <> '' do
        begin
          tipo := ExcelApp.GetStringFromCell(linha,1).ToString;
          cargo := ExcelApp.GetStringFromCell(linha,2).ToString;
          nome := ExcelApp.GetStringFromCell(linha,3).ToString;
          matricula := ExcelApp.GetStringFromCell(linha,4).ToString;
          cpf := ExcelApp.GetStringFromCell(linha,5).ToString;
          upag := ExcelApp.GetStringFromCell(linha,6).ToString;
          subom := ExcelApp.GetStringFromCell(linha,7).ToString;
          parcela := ExcelApp.GetStringFromCell(linha,8).ToString;
          termino := ExcelApp.GetStringFromCell(linha,9).ToString;

          {cpf := ExcelApp.GetStringFromCell(linha,1).ToString;
          nome := ExcelApp.GetStringFromCell(linha,2).ToString;
          tipo := ExcelApp.GetStringFromCell(linha,3).ToString;
          cargo := ExcelApp.GetStringFromCell(linha,4).ToString;
          subom := ExcelApp.GetStringFromCell(linha,5).ToString;
          matricula := ExcelApp.GetStringFromCell(linha,6).ToString;
          parcela := ExcelApp.GetStringFromCell(linha,7).ToString;
          termino := ExcelApp.GetStringFromCell(linha,8).ToString;}

          SqlInsert := SqlInsert +
            'insert into temp_carga_aero values(' +
            FormataVlrSQL(Grid.DataController.Values[i, ColumnBanco.Index])+','+
            FormataStringSQL(Trim(tipo))+','+
            FormataStringSQL(Trim(cargo))+','+
            FormataStringSQL(Trim(nome))+','+
            FormataStringSQL(Trim(matricula))+','+
            FormataStringSQL(Trim(cpf))+','+
            FormataStringSQL(Trim(upag))+','+
            FormataStringSQL(Trim(subom))+','+
            FormataStringSQL(Trim(parcela))+','+
            FormataStringSQL(Trim(termino))+')';
          Inc(cont);
          Inc(QtdeProcessado);
          Inc(Linha);
          if cont mod 1000 = 0 then
          begin
            dmDados.ConexaoAgilus.Execute(SqlInsert);
            Grid.DataController.Values[i, ColumnProgresso.Index] := Trunc(cont / Grid.DataController.Values[i, ColumnQtdeLinhas.Index] * 100 );
            ProgressBar.Position := QtdeProcessado;
            Application.ProcessMessages;
            SqlInsert := '';
          end;
          nome := ExcelApp.GetStringFromCell(linha,3).ToString;
        end;
        if SqlInsert <> '' then
        begin
          dmDados.ConexaoAgilus.Execute(SqlInsert);
          Grid.DataController.Values[i, ColumnProgresso.Index] := Trunc(cont / Grid.DataController.Values[i, ColumnQtdeLinhas.Index] * 100 );
          ProgressBar.Position := QtdeProcessado;
          Application.ProcessMessages;
        end;
      finally
        ExcelApp.Free;
      end;
    end;
  end;

  ProgressBar.Properties.Marquee := True;
  ProgressBar.Properties.Text := 'Atualizando dados no Agilus';
  Application.ProcessMessages;

  dmDados.DropProc.ExecSQL;
  dmDados.ConexaoAgilus.Execute(dmDados.CreateProc.SQL.Text);

  try
    with dmDados.prProcessaCarga do
    begin
      Parameters.ParamByName('@orgav_codigo').Value := cbOrgao.EditValue;
      Parameters.ParamByName('@uni_codigo').Value := cbUnidade.EditValue;
      Parameters.ParamByName('@fil_codigo').Value := cbFilial.EditValue;
      Parameters.ParamByName('@mes').Value := StartOfAMonth( YearOf(edMes.Date), MonthOf(edMes.Date) );
      ExecProc;
      QtdeClientesIncluidos := Parameters.ParamByName('@qtde_clientes_incluidos').Value;
      QtdeClientesAlterados := Parameters.ParamByName('@qtde_clientes_alterados').Value;
      QtdeContratosIncluidos := Parameters.ParamByName('@qtde_contratos_incluidos').Value;
    end;
  finally
    ProgressBar.Properties.Marquee := False;
    ProgressBar.Properties.Text := '';
  end;
  Exit;
  Application.MessageBox(PChar('Processamento concluído'#13#13+
                               'Qtde. clientes incluídos: '+IntToStr(QtdeClientesIncluidos)+#13+
                               'Qtde. clientes alterados: '+IntToStr(QtdeClientesAlterados)+#13+
                               'Qtde. empréstimos incluídos: '+IntToStr(QtdeContratosIncluidos)),
                         'Aviso', MB_ICONINFORMATION+MB_OK);

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

  dmDados.tbOrgao.Open;
  dmDados.tbBanco.Open;
  dmDados.tbFilial.Open;
  dmDados.tbVinculo.Open;

  if dmDados.tbOrgao.Locate('orgav_descricao', 'AERO', [loCaseInsensitive]) or
     dmDados.tbOrgao.Locate('orgav_descricao', 'AERONAUTICA', [loCaseInsensitive]) or
     dmDados.tbOrgao.Locate('orgav_descricao', 'AERONÁUTICA', [loCaseInsensitive]) then
  begin
    cbOrgao.EditValue := dmDados.tbOrgao.FieldByName('orgav_codigo').AsInteger;
    cbOrgao.Enabled := False;
  end;

  PropertiesStore.Active := True;
  PropertiesStore.RestoreFrom;
end;

procedure TfrmMain.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
  if key = VK_DELETE then
    if Grid.Controller.FocusedColumn = ColumnBanco then
      Grid.DataController.Values[Grid.Controller.SelectedRows[0].Index, ColumnBanco.Index] := null;
}
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
