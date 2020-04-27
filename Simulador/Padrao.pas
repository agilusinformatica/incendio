unit Padrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms;

type
  TfrmPadrao = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  public
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
     key := #0;
     Perform(WM_NEXTDLGCTL,0,0);
  end;

   if key = #27 then
   begin
      key := #0;
      Close;
   end;
end;

end.



