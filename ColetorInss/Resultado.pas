unit Resultado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxLayoutContainer, cxGridLayoutView, cxGridCustomTableView, StrUtils,
  cxGridCustomLayoutView, cxSplitter, cxGridCustomView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridLevel, cxGrid, IniFiles, cxContainer,
  dxLayoutcxEditAdapters, cxTextEdit, dxLayoutControl, MaskUtils, cxCurrencyEdit;

type
  TfrmResultado = class(TForm)
    cxGrid2: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    edBeneficio: TcxTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    edNasc: TcxTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edEspecie: TcxTextEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edNome: TcxTextEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    edBanco: TcxTextEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    edAgencia: TcxTextEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    edNomeAgencia: TcxTextEdit;
    dxLayoutControl1Item7: TdxLayoutItem;
    edConta: TcxTextEdit;
    dxLayoutControl1Item8: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dxLayoutControl1Group4: TdxLayoutGroup;
    edEndereco: TcxTextEdit;
    dxLayoutControl1Item9: TdxLayoutItem;
    dxLayoutControl1Group2: TdxLayoutGroup;
    edBairro: TcxTextEdit;
    dxLayoutControl1Item10: TdxLayoutItem;
    dxLayoutControl1Group3: TdxLayoutGroup;
    edCidade: TcxTextEdit;
    dxLayoutControl1Item11: TdxLayoutItem;
    edUf: TcxTextEdit;
    dxLayoutControl1Item12: TdxLayoutItem;
    dxLayoutControl1Group5: TdxLayoutGroup;
    edCep: TcxTextEdit;
    dxLayoutControl1Item13: TdxLayoutItem;
    dxLayoutControl1Group7: TdxLayoutGroup;
    edOrgaoPagador: TcxTextEdit;
    dxLayoutControl1Item14: TdxLayoutItem;
    edTipoPagamento: TcxTextEdit;
    dxLayoutControl1Item15: TdxLayoutItem;
    dxLayoutControl1SpaceItem1: TdxLayoutEmptySpaceItem;
    dxLayoutControl1Group6: TdxLayoutGroup;
    dxLayoutControl1SpaceItem2: TdxLayoutEmptySpaceItem;
    dxLayoutControl1Group8: TdxLayoutGroup;
    edCpf: TcxTextEdit;
    dxLayoutControl1Item16: TdxLayoutItem;
    dxLayoutControl1Group9: TdxLayoutGroup;
    edMargem: TcxTextEdit;
    dxLayoutControl1Item17: TdxLayoutItem;
    dxLayoutControl1Group10: TdxLayoutGroup;
    edTelefone: TcxTextEdit;
    dxLayoutControl1Item18: TdxLayoutItem;
    dxLayoutControl1Group12: TdxLayoutGroup;
    dxLayoutControl1SpaceItem3: TdxLayoutEmptySpaceItem;
    View: TcxGridTableView;
    ColumnMR: TcxGridColumn;
    ColumnBanco: TcxGridColumn;
    ColumnValorParcela: TcxGridColumn;
    ColumnPrazo: TcxGridColumn;
    ColumnValorQuitacao: TcxGridColumn;
    ColumnData: TcxGridColumn;
    ColumnTipoOperacao: TcxGridColumn;
    ColumnContrato: TcxGridColumn;
    ColumnQtdePagas: TcxGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FTextoConsulta: string;
    QtdeSecoes: integer;
    procedure SetTextoConsulta(const Value: string);
    function ConverteParaIni(const Value: string): string;
    { Private declarations }
  public
    { Public declarations }
    property TextoConsulta: string read FTextoConsulta write SetTextoConsulta;
  end;

var
  frmResultado: TfrmResultado;

implementation

{$R *.dfm}

{ TfrmResultado }

function GetTempDirectory: string;
begin
  SetLength(Result, MAX_PATH);
  if GetTempPath(MAX_PATH, PChar(Result)) > 0 then
    Result := string(PChar(Result))
  else
    Result := '';
end;

function ConverteData(Value: string): string;
begin
  Result := Copy(Value,7,2)+'/'+Copy(Value,5,2)+'/'+Copy(Value,1,4);
end;

function FormataCpfCnpj(Value: string): string;
begin
  if Length(Value) = 11 then
    Result := FormatMaskText('999.999.999-99;0;_', Value)
  else if Length(Value) = 14 then
    Result := FormatMaskText('99.999.999/9999-99;0;_', Value)
  else
    Result := Value;
end;

function FormataTelefone( Telefone: string ): string;
var
   ddd: string;
begin
  ddd := LeftStr(Telefone,2);
  telefone := RightStr(Telefone,8);
  if trim(telefone) = '' then
    Result := ''
  else
  begin
    ddd := IntToStr(StrToInt(ddd));
    ddd := StringOfChar(' ',2-length(ddd))+ddd;
    telefone := StringReplace(telefone,'-','', []);
    telefone := StringReplace(telefone,' ','', []);
    telefone := StringOfChar(' ',8-length(telefone))+telefone;
    Result := '('+ddd+') '+copy(telefone,1,4)+'-'+copy(telefone,5,4)
  end;
end;


procedure TfrmResultado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmResultado.SetTextoConsulta(const Value: string);
var
  Arq: string;
  Ini: TMemIniFile;
  fs: TStrings;
  i: integer;

begin
  FTextoConsulta := ConverteParaIni(Value);
  Arq := IncludeTrailingPathDelimiter(GetTempDirectory)+'coletor.ini';
  fs := TStringList.Create;
  try
    fs.Text := FTextoConsulta;
    fs.SaveToFile( IncludeTrailingPathDelimiter(GetTempDirectory)+'coletor.ini');
  finally
    fs.Free;
  end;

  Ini := TMemIniFile.Create(Arq);
  try
    for i := 1 to QtdeSecoes do
    begin
      if Ini.ValueExists('Array'+IntToStr(i),'Beneficio') then
      begin
        edBeneficio.Text := Ini.ReadString('Array'+IntToStr(i),'Beneficio','');
        edNome.Text := Ini.ReadString('Array'+IntToStr(i),'Nome','');
        edNasc.Text := ConverteData(Ini.ReadString('Array'+IntToStr(i),'Nascto',''));
        edEspecie.Text := Ini.ReadString('Array'+IntToStr(i),'esp','');
        edBanco.Text := Ini.ReadString('Array'+IntToStr(i),'Banco_Pagto','');
        edAgencia.Text := Ini.ReadString('Array'+IntToStr(i),'Agencia_Pagto','');
        edNomeAgencia.Text := Ini.ReadString('Array'+IntToStr(i),'Nome_AG_Pagto','');
        edConta.Text := Ini.ReadString('Array'+IntToStr(i),'Conta_Pagto','');
        edOrgaoPagador.Text := Ini.ReadString('Array'+IntToStr(i),'ORGAO_Pagador','');
        edTipoPagamento.Text := Ini.ReadString('Array'+IntToStr(i),'TIPO_PAGTO','');

        edEndereco.Text := Ini.ReadString('Array'+IntToStr(i),'endereco','');
        edBairro.Text := Ini.ReadString('Array'+IntToStr(i),'bairro','');
        edCidade.Text := Ini.ReadString('Array'+IntToStr(i),'cidade','');
        edUf.Text := Ini.ReadString('Array'+IntToStr(i),'UF','');
        edCep.Text := Ini.ReadString('Array'+IntToStr(i),'CEP','');

        edCpf.Text := FormataCpfCnpj(ReplaceStr(Ini.ReadString('Array'+IntToStr(i),'CPF',''),' ',''));
        edMargem.Text := Ini.ReadString('Array'+IntToStr(i),'MR','');
      end;

      if Ini.ValueExists('Array'+IntToStr(i),'TELEFONE') then
      begin
        edTelefone.Text := FormataTelefone(Ini.ReadString('Array'+IntToStr(i),'TELEFONE',''));
      end;

      if Ini.ValueExists('Array'+IntToStr(i),'BANCO') then
      begin
        View.DataController.AppendRecord;
        View.DataController.Values[View.DataController.RowCount-1, ColumnMR.Index] := ReplaceStr(Ini.ReadString('Array'+IntToStr(i),'MR','0'),'.', FormatSettings.ThousandSeparator);
        View.DataController.Values[View.DataController.RowCount-1, ColumnBanco.Index] := Ini.ReadString('Array'+IntToStr(i),'BANCO','');
        View.DataController.Values[View.DataController.RowCount-1, ColumnValorParcela.Index] := ReplaceStr(Ini.ReadString('Array'+IntToStr(i),'VALOR_PARCELA','0'),'.', FormatSettings.DecimalSeparator);
        View.DataController.Values[View.DataController.RowCount-1, ColumnPrazo.Index] := Ini.ReadInteger('Array'+IntToStr(i),'PRAZO',0);
        View.DataController.Values[View.DataController.RowCount-1, ColumnQtdePagas.Index] := Ini.ReadInteger('Array'+IntToStr(i),'QTYPAGAS',0);
        View.DataController.Values[View.DataController.RowCount-1, ColumnData.Index] := Ini.ReadString('Array'+IntToStr(i),'MES','')+'/'+Ini.ReadString('Array'+IntToStr(i),'ANO','');
        View.DataController.Values[View.DataController.RowCount-1, ColumnValorQuitacao.Index] := ReplaceStr(Ini.ReadString('Array'+IntToStr(i),'QUITACAO','0'),'.', FormatSettings.DecimalSeparator);
        View.DataController.Values[View.DataController.RowCount-1, ColumnContrato.Index] := Ini.ReadString('Array'+IntToStr(i),'CONTRATO','');
      end;

      if Ini.ValueExists('Array'+IntToStr(i),'TipoOperacao') then
      begin
        View.DataController.Values[View.DataController.RowCount-1, ColumnTipoOperacao.Index] := Ini.ReadString('Array'+IntToStr(i),'TipoOperacao','');
      end;
    end;
  finally
    Ini.Free;
  end;

end;

function TfrmResultado.ConverteParaIni(const Value: string): string;
var
  offset: Integer;
  p: Integer;
begin
  Result := ReplaceStr(Value, '<br />', '');
  Result := ReplaceStr(Result, '<pre>', '');
  Result := ReplaceStr(Result, '</pre>', '');
  Result := ReplaceStr(Result, '(', '');
  Result := ReplaceStr(Result, ')', '');
  Result := ReplaceStr(Result, '[', '');
  Result := ReplaceStr(Result, ']', '');
  Result := ReplaceStr(Result, ' => ', '=');
  QtdeSecoes := 0;
  offset := 1;
  repeat
    p := PosEx('Array', Result, offset);
    if p > 0 then
    begin
      Inc(QtdeSecoes);
      Result := StuffString(Result, p, 5, '[Array' + IntToStr(QtdeSecoes) + ']');
      offset := p + 6;
    end;
  until p = 0;
end;

end.
