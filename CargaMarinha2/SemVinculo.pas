unit SemVinculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxMemo, cxDBLookupComboBox, Menus,
  StdCtrls, cxButtons, cxNavigator;

type
  TfrmSemVinculo = class(TForm)
    cxMemo1: TcxMemo;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1discriminacao: TcxGridDBColumn;
    cxGrid1DBTableView1bcolib_codigo: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1EditKeyUp(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
  private
    procedure IgnoraRegistro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSemVinculo: TfrmSemVinculo;

implementation

uses Dados;

{$R *.dfm}

procedure TfrmSemVinculo.cxButton1Click(Sender: TObject);
var
  CodBanco: string;
begin
  dmDados.tbNaoVinculado.First;
  while not dmDados.tbNaoVinculado.Eof do
  begin
    if not dmDados.tbNaoVinculado.FieldByName('bcolib_codigo').IsNull then
    begin
      if dmDados.tbNaoVinculado.FieldByName('bcolib_codigo').AsInteger = -1 then
        CodBanco := 'null'
      else
        CodBanco := dmDados.tbNaoVinculado.FieldByName('bcolib_codigo').AsString;

      dmDados.ConexaoAgilus.Execute(
        ' insert into vinculo_marinha_banco( nome, bcolib_codigo ) values( '+
        QuotedStr(dmDados.tbNaoVinculado.FieldByName('nome').AsString)+','+
        CodBanco+')');
    end;

    dmDados.tbNaoVinculado.Next;
  end;
end;

procedure TfrmSemVinculo.cxGrid1DBTableView1EditKeyUp(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F11 then
    IgnoraRegistro;
end;

procedure TfrmSemVinculo.cxGrid1DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F11 then
    IgnoraRegistro;
end;

procedure TfrmSemVinculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSemVinculo.FormCreate(Sender: TObject);
begin
  dmDados.tbBanco.Close;
  dmDados.tbBanco.Open;
end;

procedure TfrmSemVinculo.IgnoraRegistro;
begin
  with dmDados.tbNaoVinculado do
  begin
    if State <> dsEdit then
      Edit;
    FieldByName('bcolib_codigo').AsInteger := -1;
    Post;
    Next;
  end;
end;

end.
