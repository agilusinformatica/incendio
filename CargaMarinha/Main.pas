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
  dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxNavigator,
  ComCtrls, dxCore, cxDateUtils;

const COL_STATUS = 2;

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
    cxButton3: TcxButton;
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
    procedure cxButton3Click(Sender: TObject);
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

uses Dados;

{$R *.dfm}

function NumLinhasArq(Arqtexto:String): integer;
var
  f: Textfile;
  cont: integer;
  text: string;
begin
  cont := 0;
  AssignFile(f, Arqtexto);
  Reset(f);
  try
    while not eof(f) Do
    begin
      ReadLn(f, text);
      if Length(text) > 0 then
        if text[1] in ['0'..'9'] then
          Inc(Cont);
    end;
  finally
    Closefile(f);
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
  //Arq := 'notepad.exe "'+IncludeTrailingBackslash(beArquivo.Text)+Grid.DataController.Values[Grid.Controller.SelectedRows[0].Index, ColumnArquivo.Index]+'"';
  //WinExec(PAnsiChar(Arq), SW_SHOWMAXIMIZED );
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

  Ret := FindFirst(IncludeTrailingBackslash(beArquivo.Text)+'*.txt', faAnyFile, Arqs);
  try
    LinhaProgressoAtual := 1;
    while Ret = 0 do
    begin
      Grid.DataController.AppendRecord;
      Grid.DataController.Values[Grid.DataController.RowCount-1, ColumnArquivo.Index] := Arqs.Name;
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
  i, cont, QtdeTotal, QtdeProcessado: integer;
  Arq: TextFile;
  linha, SqlInsert: string;
  QtdeClientesIncluidos, QtdeClientesAlterados, QtdeContratosIncluidos: integer;

  function NomeArquivo: string;
  begin
    Result := IncludeTrailingBackslash(beArquivo.Text)+Grid.DataController.Values[i, ColumnArquivo.Index];
  end;

begin
  if dmDados.tbVinculo.State = dsEdit then
    dmDados.tbVinculo.Post;

  QtdeTotal := 0;
  for i := 0 to Grid.DataController.RowCount - 1 do
  begin
    if Grid.DataController.Values[i, ColumnBanco.Index] = null then
      raise Exception.Create('Antes de processar, todos as linhas devem ter um banco preenchido');

    Grid.DataController.Values[i, ColumnQtdeLinhas.Index] := NumLinhasArq(NomeArquivo);
    QtdeTotal := QtdeTotal + Grid.DataController.Values[i, ColumnQtdeLinhas.Index];
  end;

  ProgressBar.Properties.Marquee := False;
  ProgressBar.Properties.Text := '';
  ProgressBar.Properties.ShowTextStyle := cxtsPercent;
  ProgressBar.Properties.Max := QtdeTotal;

  // criando tabela temporaria
  dmDados.ConexaoAgilus.Execute(
    ' if object_id(''temp_carga_marinha'') > 0' +
    '    drop table temp_carga_marinha' +
    ' create table temp_carga_marinha('+
    ' banco smallint,' +
    ' matricula varchar(12),' +
    ' nome varchar(30),' +
    ' cpf varchar(11),' +
    ' sit varchar(1),' +
    ' pt varchar(2),' +
    ' oc varchar(3),' +
    ' om varchar(3),' +
    ' pagamento varchar(15),' +
    ' termino varchar(4))'
  );

  QtdeProcessado := 0;
  for i := 0 to Grid.DataController.RowCount - 1 do
  begin

    Grid.Controller.FocusedRowIndex := i;

    if Grid.DataController.Values[i, ColumnBanco.Index] <> -1 then
    begin
      AssignFile(Arq, NomeArquivo);
      Reset(Arq);
      try
        cont := 0;
        SqlInsert := '';
        while not eof(Arq) Do
        begin
          ReadLn(Arq, linha);
          if (Length(linha) > 0) and (linha[1] in ['0'..'9']) then
          begin
            SqlInsert := SqlInsert +
              'insert into temp_carga_marinha values(' +
              FormataVlrSQL(Grid.DataController.Values[i, ColumnBanco.Index])+','+
              FormataStringSQL(Trim(Copy(linha,1,12)))+','+
              FormataStringSQL(Trim(Copy(linha,14,30)))+','+
              FormataStringSQL(Trim(Copy(linha,45,11)))+','+
              FormataStringSQL(Trim(Copy(linha,57,1)))+','+
              FormataStringSQL(Trim(Copy(linha,60,2)))+','+
              FormataStringSQL(Trim(Copy(linha,63,3)))+','+
              FormataStringSQL(Trim(Copy(linha,69,3)))+','+
              FormataStringSQL(Trim(Copy(linha,73,15)))+','+
              FormataStringSQL(Trim(Copy(linha,122,4)))+')';
            Inc(cont);
            Inc(QtdeProcessado);
            if cont mod 1000 = 0 then
            begin
              dmDados.ConexaoAgilus.Execute(SqlInsert);
              Grid.DataController.Values[i, ColumnProgresso.Index] := Trunc(cont / Grid.DataController.Values[i, ColumnQtdeLinhas.Index] * 100 );
              ProgressBar.Position := QtdeProcessado;
              Application.ProcessMessages;
              SqlInsert := '';
            end;
          end;
        end;
        if SqlInsert <> '' then
        begin
          dmDados.ConexaoAgilus.Execute(SqlInsert);
          Grid.DataController.Values[i, ColumnProgresso.Index] := Trunc(cont / Grid.DataController.Values[i, ColumnQtdeLinhas.Index] * 100 );
          ProgressBar.Position := QtdeProcessado;
          Application.ProcessMessages;
        end;
      finally
        Closefile(Arq);
      end;
    end;
  end;

  ProgressBar.Properties.Marquee := True;
  ProgressBar.Properties.Text := 'Atualizando dados no Agilus';
  Application.ProcessMessages;

  try
    with dmDados.prProcessaCarga do
    begin
      Parameters.ParamByName('@orgav_codigo').Value := cbOrgao.EditValue;
      Parameters.ParamByName('@uni_codigo').Value := cbUnidade.EditValue;
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

  Application.MessageBox(PChar('Processamento concluído'#13#13+
                               'Qtde. clientes incluídos: '+IntToStr(QtdeClientesIncluidos)+#13+
                               'Qtde. clientes alterados: '+IntToStr(QtdeClientesAlterados)+#13+
                               'Qtde. empréstimos incluídos: '+IntToStr(QtdeContratosIncluidos)),
                         'Aviso', MB_ICONINFORMATION+MB_OK);

end;

procedure TfrmMain.cxButton3Click(Sender: TObject);
begin
  dmDados.tbBanco.Refresh;
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
  dmDados.tbBanco.Open;
  dmDados.tbVinculo.Open;

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
