unit ListPlanoSaude;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinCaramel,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxContainer, cxLabel, ExtCtrls, ADODB, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmListPlanoSaude = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Id: TcxGridDBColumn;
    cxGrid1DBTableView1Nome: TcxGridDBColumn;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cbSeguradora: TcxLookupComboBox;
    tbPlanoSaude: TADOQuery;
    tbPlanoSaudeId: TAutoIncField;
    tbPlanoSaudeNome: TWideMemoField;
    tbPlanoSaudeSeguradoraId: TIntegerField;
    tbPlanoSaudePlanoSaudeGenericoId: TIntegerField;
    dsPlanoSaude: TDataSource;
    cxGrid1DBTableView1SeguradoraId: TcxGridDBColumn;
    cxGrid1DBTableView1PlanoSaudeGenericoId: TcxGridDBColumn;
    procedure cbSeguradoraPropertiesChange(Sender: TObject);
    procedure tbPlanoSaudeAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListPlanoSaude: TfrmListPlanoSaude;

implementation

uses dados;

{$R *.dfm}

procedure TfrmListPlanoSaude.cbSeguradoraPropertiesChange(Sender: TObject);
begin
  if tbPlanoSaude.Active then
  begin
    if tbPlanoSaude.State in [dsInsert,dsEdit] then
      tbPlanoSaude.Post;
    tbPlanoSaude.Close;
  end;
  if cbSeguradora.EditValue <> null then
  begin
    tbPlanoSaude.Parameters.ParamByName('SeguradoraId').Value := cbSeguradora.EditValue;
    tbPlanoSaude.Open;
  end;
end;

procedure TfrmListPlanoSaude.tbPlanoSaudeAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('SeguradoraId').Value := cbSeguradora.EditValue;
end;

end.
