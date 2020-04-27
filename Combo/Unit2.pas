unit Unit2;

interface

uses
  HelperExtLookupComboBox,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, dxSkinsCore, dxSkinsDefaultPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, ADODB,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLookAndFeels, dxSkinsForm;

type
  TForm2 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Combo: TcxExtLookupComboBox;
    cxGridViewRepository1: TcxGridViewRepository;
    cxGridViewRepository1DBTableView1: TcxGridDBTableView;
    cxGridViewRepository1DBTableView1bcolib_codigo: TcxGridDBColumn;
    cxGridViewRepository1DBTableView1bcolib_descricao: TcxGridDBColumn;
    cxTextEdit1: TcxTextEdit;
    cxButton1: TcxButton;
    dxSkinController1: TdxSkinController;
    Button1: TButton;
    procedure ComboKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboEnter(Sender: TObject);
    procedure ComboExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FieldItem: TcxCustomGridTableItem;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  s: string;
  t: TClass;
begin
  s := '';

  t := Combo.ClassType;
  s := t.ClassName + #13;
  repeat
    t := t.ClassParent;
    s := s + t.ClassName + #13;
  until t = TObject;

  ShowMessage(s);
end;

procedure TForm2.ComboEnter(Sender: TObject);
begin
  FieldItem := (Sender as TcxExtLookupComboBox).Properties.ListFieldItem;
end;

procedure TForm2.ComboExit(Sender: TObject);
begin
  with (Sender as TcxExtLookupComboBox).Properties do
  begin
    ListFieldItem := FieldItem;
    (Sender as TcxExtLookupComboBox).Text := TcxGridDBTableView(View).GetColumnByFieldName(TcxGridDBColumn(ListFieldItem).DataBinding.FieldName).EditValue;
  end;
end;

procedure TForm2.ComboKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, index: integer;
begin
  if key = VK_F12 then
  begin
    if (Sender as TcxExtLookupComboBox).EditValue = null then
      Exit;

    with (Sender as TcxExtLookupComboBox).Properties do
    begin
      Index := ListFieldItem.Index;
      Inc(Index);
      if Index > View.ItemCount - 1 then
        Index := 0;
      for i := 0 to View.ItemCount - 1 do
        if Index = View.Items[i].Index then
        begin
          ListFieldItem := TcxGridDBColumn(View.Items[i]);
          (Sender as TcxExtLookupComboBox).Text := TcxGridDBTableView(View).GetColumnByFieldName(TcxGridDBColumn(ListFieldItem).DataBinding.FieldName).EditValue;
          (Sender as TcxExtLookupComboBox).SelectAll;
          Break;
        end;
    end;
  end;
end;

end.
