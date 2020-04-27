unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, cxPropertiesStore, Grids, AdvObj, BaseGrid,
  AdvGrid, StdCtrls, cxButtons, cxButtonEdit, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel, DateUtils, cxFormats, cxCheckBox, ComCtrls, dxCore, cxDateUtils, db;

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
    Grid: TAdvStringGrid;
    cxButton1: TcxButton;
    cbExcluirContratos: TcxCheckBox;
    cbNaoReprocessarCursor: TcxCheckBox;
    cbFilial: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    procedure cxDBLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Dados, SemVinculo;

{$R *.dfm}

procedure TfrmMain.cxButton1Click(Sender: TObject);
var
  LinhaProgressoAtual: integer;
begin
  LinhaProgressoAtual := 0;
  Grid.ClearCols(COL_STATUS, 1);

  // lendo tabela folha_marinha
  Inc(LinhaProgressoAtual);
  Grid.Cells[1,LinhaProgressoAtual] := 'Lendo folha da marinha';
  Application.ProcessMessages;
  if not cbNaoReprocessarCursor.Checked then
    dmDados.Cursor.ExecSQL;

  Inc(LinhaProgressoAtual);
  Grid.Cells[1,LinhaProgressoAtual] := 'Ajustando tabelas temporárias';
  if not cbNaoReprocessarCursor.Checked then
    dmDados.Ajuste.ExecSQL;

  Inc(LinhaProgressoAtual);
  Grid.Cells[1,LinhaProgressoAtual] := 'Comparando bancos';
  Application.ProcessMessages;

  dmDados.tbNaoVinculado.Open;
  while not dmDados.tbNaoVinculado.IsEmpty do
  begin
    Application.CreateForm(TfrmSemVinculo, frmSemVinculo);
    if frmSemVinculo.ShowModal = mrCancel then
      Exit;
    dmDados.tbNaoVinculado.Close;
    dmDados.tbNaoVinculado.Open;
  end;

  Inc(LinhaProgressoAtual);
  Grid.Cells[1,LinhaProgressoAtual] := 'Gravando no Agilus';
  Application.ProcessMessages;
  dmDados.DropProc.ExecSQL;
  dmDados.ConexaoAgilus.Execute(dmDados.CreateProc.SQL.Text);
  with dmDados.prIncluiCliente do
  begin
    Parameters.ParamByName('@orgav_codigo').Value := cbOrgao.EditValue;
    Parameters.ParamByName('@uni_codigo').Value := cbUnidade.EditValue;
    Parameters.ParamByName('@mes').Value := edMes.EditValue;
    Parameters.ParamByName('@excluir_contratos_antigos').Value := cbExcluirContratos.Checked;
    Parameters.ParamByName('@fil_codigo').Value := cbFilial.EditValue;
    ExecProc;
  end;

  Inc(LinhaProgressoAtual);
  Grid.Cells[1,LinhaProgressoAtual] := 'Finalizado!';
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

  if dmDados.tbOrgao.Locate('orgav_descricao', 'MARINHA', [loCaseInsensitive]) then
  begin
    cbOrgao.EditValue := dmDados.tbOrgao.FieldByName('orgav_codigo').AsInteger;
    cbOrgao.Enabled := False;
  end;

  dmDados.tbFilial.Open;

  PropertiesStore.Active := True;
  PropertiesStore.RestoreFrom;
end;

end.
