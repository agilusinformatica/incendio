unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxContainer, cxEdit, Menus, StdCtrls,
  cxButtons, cxLabel, cxTextEdit, cxMaskEdit, cxButtonEdit, cxShellBrowserDialog,
  ComObj, cxLookAndFeels, cxLookAndFeelPainters;

type
  TForm1 = class(TForm)
    BrowserDialog: TcxShellBrowserDialog;
    beArquivo: TcxButtonEdit;
    cxLabel4: TcxLabel;
    cxButton2: TcxButton;
    procedure cxButton2Click(Sender: TObject);
    procedure beArquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.beArquivoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if BrowserDialog.Execute then
  begin
    beArquivo.Text := BrowserDialog.Path;
  end;
end;

procedure TForm1.cxButton2Click(Sender: TObject);
var
  Arqs: TSearchRec;
  i, Ret: integer;
  ExcelApp: OleVariant;
  NomeArquivo, NovoNome: string;
begin
  ExcelApp := CreateOleObject('Excel.Application');
  Ret := FindFirst(IncludeTrailingBackslash(beArquivo.Text)+'*.htm*', faAnyFile, Arqs);
  try
    while Ret = 0 do
    begin
      NomeArquivo := IncludeTrailingBackslash(beArquivo.Text)+Arqs.Name;
      ExcelApp.Workbooks.Open(NomeArquivo);
      NovoNome := ChangeFileExt( NomeArquivo, '.xlsx');
      ExcelApp.ActiveWorkbook.SaveAs( NovoNome, 51 );
      ExcelApp.ActiveWorkbook.Close;

      Ret := FindNext(Arqs);
    end;
  finally
    FindClose(Arqs);
    ExcelApp.Quit;
  end;
end;

end.
