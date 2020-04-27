unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxContainer, cxEdit, cxTextEdit,
  cxListBox, dxSkinsForm, Menus, StdCtrls, cxButtons, StrUtils;

type
  TForm1 = class(TForm)
    Edit1: TcxTextEdit;
    dxSkinController1: TdxSkinController;
    cxButton1: TcxButton;
    ListBox: TcxListBox;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    function NomeArquivo(item: integer): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cxButton1Click(Sender: TObject);
var
  i, j: integer;
  Arq: TStrings;
  AbriuTLabel: boolean;
  TemTransparent: boolean;
  PosEnd: Integer;
begin
  Arq := TStringList.Create;
  for i := 0 to ListBox.Items.Count-1 do
  begin
    ListBox.ItemIndex := i;
    Arq.LoadFromFile(NomeArquivo(i));
    AbriuTLabel := False;
    j := 0;
    while j <= Arq.Count-1 do
    begin
      if Pos(': TLabel',Arq[j]) > 0 then
      begin
        AbriuTLabel := True;
        TemTransparent := False;
        Arq[j] := ReplaceStr(Arq[j], 'TLabel', 'TcxLabel');
      end;

      if AbriuTLabel and (Pos('Font',Arq[j]) > 0) and (Pos('ParentFont',Arq[j]) = 0)then
        Arq[j] := ReplaceStr(Arq[j], 'Font', 'Style.Font');

      if AbriuTLabel and (Trim(Arq[j]) = 'Transparent = True') then
        TemTransparent := True;

      if AbriuTLabel and (Trim(Arq[j]) = 'end') then
      begin
        PosEnd := Pos('end',Arq[j]);
        AbriuTLabel := False;

        if not TemTransparent then
        begin
          Arq.Insert(j-1, StringOfChar(' ',PosEnd-1+2)+'Transparent = True');
          Inc(j);
        end;

        Arq.Insert(j-1, StringOfChar(' ',PosEnd-1+2)+'Style.TransparentBorder = False');
        Inc(j);

      end;

      Inc(j);
    end;
    Arq.SaveToFile(NomeArquivo(i));
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  SearchRec: TSearchRec;
  ArqSQL: TStrings;
begin
  try
    ArqSql := TStringList.Create;
    FindFirst( Edit1.Text, faAnyFile, SearchRec);
    repeat
      ListBox.Items.Add(SearchRec.Name);
    until FindNext(SearchRec) <> 0;
  finally
    FindClose( SearchRec );
    ArqSql.Free;
  end;
end;

function TForm1.NomeArquivo(item: integer): string;
begin
  Result := ExtractFilePath(Edit1.Text)+'\'+ListBox.Items[item];
end;

end.
