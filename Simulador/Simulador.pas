unit Simulador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Padrao, cxGraphics, cxDBLookupComboBox, cxDropDownEdit, 
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, cxCalc, DB, ADODB,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLookAndFeelPainters,
  StdCtrls, cxButtons, dxSkinsCore, dxSkinCaramel, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCalendar;

type
  TfrmSimulador = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edData: TcxDateEdit;
    cbTabela: TcxExtLookupComboBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    edValorParcela: TcxCalcEdit;
    edValorContrato: TcxCalcEdit;
    cbOrgao: TcxExtLookupComboBox;
    cbBanco: TcxExtLookupComboBox;
    tbOrgao: TADOQuery;
    tbBanco: TADOQuery;
    tbOrgaoorgav_codigo: TSmallintField;
    tbOrgaoorgav_descricao: TWideStringField;
    tbBancobcolib_codigo: TSmallintField;
    tbBancobcolib_descricao: TWideStringField;
    dsOrgao: TDataSource;
    dsBanco: TDataSource;
    tbTabela: TADOQuery;
    dsTabela: TDataSource;
    tbTabelatbb_codigo: TIntegerField;
    tbTabelatbb_descricao: TStringField;
    tbTabelatbb_tac: TBCDField;
    tbTabelatbb_percentual_tac: TFloatField;
    tbTabelatbb_piso_tac: TBCDField;
    tbTabelatbb_teto_tac: TBCDField;
    GridValorParcela: TcxGrid;
    GridValorParcelaDBTableView1: TcxGridDBTableView;
    GridValorParcelaLevel1: TcxGridLevel;
    ViewRepository: TcxGridViewRepository;
    TableViewOrgaoAv: TcxGridDBTableView;
    TableViewOrgaoAvOrgav_codigo: TcxGridDBColumn;
    TableViewOrgaoAvOrgav_descricao: TcxGridDBColumn;
    TableViewBanco: TcxGridDBTableView;
    cxGrid1DBTableView1Bcolib_codigo: TcxGridDBColumn;
    cxGrid1DBTableView1Bcolib_descricao: TcxGridDBColumn;
    tbTabelacalc_descricao_tac: TStringField;
    GridValorContrao: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dsValorParcela: TDataSource;
    tbValorParcela: TADOQuery;
    tbValorContrato: TADOQuery;
    dsValorContrato: TDataSource;
    tbValorParcelaitb_qtde_parcelas: TSmallintField;
    tbValorParcelavalor_contrato: TFloatField;
    tbValorContratoitb_qtde_parcelas: TSmallintField;
    tbValorContratovalor_parcela: TFloatField;
    GridValorParcelaDBTableView1itb_qtde_parcelas: TcxGridDBColumn;
    GridValorParcelaDBTableView1valor_contrato: TcxGridDBColumn;
    cxGridDBTableView1itb_qtde_parcelas: TcxGridDBColumn;
    cxGridDBTableView1valor_parcela: TcxGridDBColumn;
    edValorRefin: TcxCalcEdit;
    cxLabel7: TcxLabel;
    tbTabelatbb_tac_variavel: TBooleanField;
    edTac: TcxCalcEdit;
    lbTac: TcxLabel;
    ADOConnection1: TADOConnection;
    procedure edValorContratoPropertiesEditValueChanged(Sender: TObject);
    procedure edValorParcelaPropertiesEditValueChanged(Sender: TObject);
    procedure cbTabelaPropertiesEditValueChanged(Sender: TObject);
    procedure edDataPropertiesEditValueChanged(Sender: TObject);
    procedure cbBancoPropertiesEditValueChanged(Sender: TObject);
    procedure cbOrgaoPropertiesEditValueChanged(Sender: TObject);
    procedure tbTabelaCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure edValorRefinPropertiesEditValueChanged(Sender: TObject);
    procedure tbTabelaAfterScroll(DataSet: TDataSet);
    procedure edTacPropertiesEditValueChanged(Sender: TObject);
  private
  public
    procedure CalculaPlanos;
  end;

var
  frmSimulador: TfrmSimulador;

implementation

{$R *.dfm}

procedure TfrmSimulador.CalculaPlanos;
begin
  tbValorParcela.Close;
  tbValorContrato.Close;

  if cbTabela.Text = '' then
    Exit;

  with tbValorParcela do
  begin
    if Active then Close;
    if edValorParcela.Value <> 0 then
    begin
      Parameters.ParamByName('valor').Value := edValorParcela.Value;
      Parameters.ParamByName('valor_refin').Value := edValorRefin.Value;
      if edTac.Visible then
        Parameters.ParamByName('tac').Value := edTac.Value
      else
        Parameters.ParamByName('tac').Value := null;
      Parameters.ParamByName('orgao').Value := tbOrgao.FieldByName('orgav_codigo').Value;
      Parameters.ParamByName('banco').Value := tbBanco.FieldByName('bcolib_codigo').Value;
      Parameters.ParamByName('tabela').Value := tbTabela.FieldByName('tbb_codigo').Value;
      Open;
    end;
  end;

  with tbValorContrato do
  begin
    if Active then Close;
    if edValorContrato.Value <> 0 then
    begin
      Parameters.ParamByName('valor').Value := edValorContrato.Value;
      Parameters.ParamByName('valor_refin').Value := edValorRefin.Value;
      if edTac.Visible then
        Parameters.ParamByName('tac').Value := edTac.Value
      else
        Parameters.ParamByName('tac').Value := null;
      Parameters.ParamByName('orgao').Value := tbOrgao.FieldByName('orgav_codigo').Value;
      Parameters.ParamByName('banco').Value := tbBanco.FieldByName('bcolib_codigo').Value;
      Parameters.ParamByName('tabela').Value := tbTabela.FieldByName('tbb_codigo').Value;
      Open;
    end;
  end;

end;

procedure TfrmSimulador.cbBancoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;

  if tbTabela.Active then
    tbTabela.Close;
  if tbValorParcela.Active then
    tbValorParcela.Close;
  if tbValorContrato.Active then
    tbValorContrato.Close;

  cbTabela.Enabled := False;
  edValorParcela.Enabled := False;
  edValorContrato.Enabled := False;
  if (cbOrgao.Text <> '') and
     (cbBanco.Text <> '') and
     (edData.Text <> '') then
  begin
    with tbTabela do
    begin
      if Active then Close;
      Parameters.ParamByName('data').Value := edData.Date;
      Parameters.ParamByName('orgao').Value := tbOrgao.FieldByName('orgav_codigo').Value;
      Parameters.ParamByName('banco').Value := tbBanco.FieldByName('bcolib_codigo').Value;
      Open;
      if not IsEmpty then
      begin
        cbTabela.Enabled := True;
        edValorParcela.Enabled := True;
        edValorContrato.Enabled := True;
        cbTabelaPropertiesEditValueChanged(nil);
      end;
    end;
  end;
end;

procedure TfrmSimulador.cbOrgaoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  edData.Enabled := cbOrgao.EditValue <> null;

  edDataPropertiesEditValueChanged(nil);
end;

procedure TfrmSimulador.cbTabelaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculaPlanos;
  edValorRefin.Enabled := True;
  edTac.Enabled := True;
end;

procedure TfrmSimulador.edDataPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if tbBanco.Active then
    tbBanco.Close;
  if tbTabela.Active then
    tbTabela.Close;
  if tbValorParcela.Active then
    tbValorParcela.Close;
  if tbValorContrato.Active then
    tbValorContrato.Close;

  if edData.EditValue <> null then
  begin
    tbBanco.Parameters.ParamByName('orgav_codigo').Value := tbOrgao.FieldByName('orgav_codigo').Value;
    tbBanco.Parameters.ParamByName('data').Value := edData.EditValue;
    tbBanco.Open;
    cbBanco.Enabled := True;
  end
  else
    cbBanco.Enabled := False;

  cbBancoPropertiesEditValueChanged(nil);
end;

procedure TfrmSimulador.edTacPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculaPlanos;
end;

procedure TfrmSimulador.edValorContratoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculaPlanos;
end;

procedure TfrmSimulador.edValorParcelaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculaPlanos;
end;

procedure TfrmSimulador.edValorRefinPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculaPlanos;
end;

procedure TfrmSimulador.FormCreate(Sender: TObject);
begin
  inherited;
  tbOrgao.Open;
end;

procedure TfrmSimulador.tbTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  lbTac.Visible := tbTabela.FieldByName('tbb_tac_variavel').AsBoolean;
  edTac.Visible := tbTabela.FieldByName('tbb_tac_variavel').AsBoolean;
end;

procedure TfrmSimulador.tbTabelaCalcFields(DataSet: TDataSet);
var
  Descricao: string;
begin
  inherited;
  with DataSet do
  begin
    if FieldByName('tbb_tac_variavel').AsBoolean then
      Descricao := 'Variável'
    else if not FieldByName('tbb_tac').IsNull then
      Descricao := Format('%.2m', [FieldByName('tbb_tac').AsCurrency])
    else if not FieldByName('tbb_percentual_tac').IsNull then
    begin
      Descricao := Format('%.1f', [FieldByName('tbb_percentual_tac').AsFloat])+'%';
      if (not FieldByName('tbb_piso_tac').IsNull) or (not FieldByName('tbb_teto_tac').IsNull) then
      begin
        Descricao := Descricao + ' (';
        if not FieldByName('tbb_piso_tac').IsNull then
          Descricao := Descricao + 'MIN='+Format('%.2n', [FieldByName('tbb_piso_tac').AsCurrency])+' ';
        if not FieldByName('tbb_teto_tac').IsNull then
          Descricao := Descricao + 'MAX='+Format('%.2n', [FieldByName('tbb_teto_tac').AsCurrency]);
        Descricao := Descricao + ')';
      end;
    end
    else
      Descricao := 'Sem TAC';

    FieldByName('calc_descricao_tac').AsString := Descricao;
  end;

end;

end.
