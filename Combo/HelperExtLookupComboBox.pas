unit HelperExtLookupComboBox;

interface

uses
  Windows, Controls, Messages, Variants, cxDBExtLookupComboBox,
  cxGridCustomTableView, cxGridDBTableView;

type
  THelperExtLookupComboBox = class helper for TcxExtLookupComboBox
  private
    function GetFieldItem: TcxCustomGridTableItem;
    procedure SetFieldItem(const Value: TcxCustomGridTableItem);
  protected
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
  public
    property FieldItem: TcxCustomGridTableItem
      read GetFieldItem write SetFieldItem;
  end;

implementation

var
  FFieldItem: TcxCustomGridTableItem;

{ THelperExtLookupComboBox }

procedure THelperExtLookupComboBox.CMEnter(var Message: TCMEnter);
begin
  FieldItem := Self.Properties.ListFieldItem;
end;

procedure THelperExtLookupComboBox.CMExit(var Message: TCMExit);
begin
  with Self.Properties do
  begin
    ListFieldItem := FieldItem;
    Self.Text := TcxGridDBTableView(View).GetColumnByFieldName(
      TcxGridDBColumn(ListFieldItem).DataBinding.FieldName).EditValue;
  end;
end;

function THelperExtLookupComboBox.GetFieldItem: TcxCustomGridTableItem;
begin
  result := FFieldItem;
end;

procedure THelperExtLookupComboBox.SetFieldItem(
  const Value: TcxCustomGridTableItem);
begin
  FFieldItem.Assign(Value);
end;

procedure THelperExtLookupComboBox.WMKeyDown(var Message: TWMKeyDown);
var
  i, index: integer;
begin
  if TWMKey(Message).CharCode = VK_F12 then
  begin
    if Self.EditValue = null then
      Exit;

    with Self.Properties do
    begin
      Index := ListFieldItem.Index;
      Inc(Index);
      if Index > View.ItemCount - 1 then
        Index := 0;
      for i := 0 to View.ItemCount - 1 do
        if Index = View.Items[i].Index then
        begin
          ListFieldItem := TcxGridDBColumn(View.Items[i]);
          Self.Text := TcxGridDBTableView(View).GetColumnByFieldName(
            TcxGridDBColumn(ListFieldItem).DataBinding.FieldName).EditValue;
          Self.SelectAll;
          Break;
        end;
    end;
  end;
end;

initialization
  FFieldItem := TcxCustomGridTableItem.Create(nil);

finalization
  FFieldItem.Free;

end.
