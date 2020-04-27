unit ListProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinCaramel,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxDBLookupComboBox, ADODB;

type
  TfrmListProduto = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Id: TcxGridDBColumn;
    cxGrid1DBTableView1Nome: TcxGridDBColumn;
    cxGrid1DBTableView1EmpresaId: TcxGridDBColumn;
    cxGrid1DBTableView1RegiaoId: TcxGridDBColumn;
    cxGrid1DBTableView1SeguradoraId: TcxGridDBColumn;
    cxGrid1DBTableView1Ativo: TcxGridDBColumn;
    cxGrid1DBTableView1CodigoSeguradora: TcxGridDBColumn;
    tbProduto: TADOQuery;
    tbProdutoId: TIntegerField;
    tbProdutoNome: TWideMemoField;
    tbProdutoRegiaoId: TIntegerField;
    tbProdutoSeguradoraId: TIntegerField;
    tbProdutoAtivo: TBooleanField;
    dsProduto: TDataSource;
    tbProdutoQtdeMaximoVidas: TIntegerField;
    tbProdutoCodigoSeguradora: TWideMemoField;
    procedure tbProdutoAfterInsert(DataSet: TDataSet);
    procedure tbProdutoAfterEdit(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListProduto: TfrmListProduto;

implementation

uses dados, CadProduto;

{$R *.dfm}

procedure TfrmListProduto.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  tbProduto.Edit;
end;

procedure TfrmListProduto.tbProdutoAfterEdit(DataSet: TDataSet);
begin
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  frmCadProduto.CodProduto := tbProdutoId.Value;
  frmCadProduto.cbSeguradora.EditValue := tbProdutoSeguradoraId.Value;
  frmCadProduto.edNome.Text := tbProdutoNome.Value;
  frmCadProduto.cbRegiao.EditValue := tbProdutoRegiaoId.Value;
  frmCadProduto.cbAtivo.Checked := tbProdutoAtivo.Value;
  frmCadProduto.edMaximoVidas.Text := tbProdutoQtdeMaximoVidas.AsString;
  frmCadProduto.edCodSeguradora.Text := tbProdutoCodigoSeguradora.Value;
  if frmCadProduto.ShowModal <> mrOk then
    tbProduto.Cancel;

  tbProduto.Close;
  tbProduto.Open;
  tbProduto.Locate('Id', frmCadProduto.CodProduto, []);
end;

procedure TfrmListProduto.tbProdutoAfterInsert(DataSet: TDataSet);
begin
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  frmCadProduto.CodProduto := 0;
  if frmCadProduto.ShowModal <> mrOk then
    tbProduto.Cancel;

  tbProduto.Close;
  tbProduto.Open;
  tbProduto.Locate('Id', frmCadProduto.CodProduto, []);
end;

end.
