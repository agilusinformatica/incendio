unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, ImgList, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, StdCtrls, cxButtons, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinsForm, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, StrUtils,
  cxClasses, cxCustomData, cxStyles, cxCustomPivotGrid, cxPivotGrid, DB, ADODB,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TForm1 = class(TForm)
    ImageList: TcxImageList;
    dxSkinController1: TdxSkinController;
    ImageComboBox: TcxImageComboBox;
    ADOConnection1: TADOConnection;
    tbSkin: TADOTable;
    tbSkinskn_codigo: TAutoIncField;
    tbSkinskn_descricao: TStringField;
    tbSkinskn_conteudo: TBlobField;
    tbSkinskn_icone: TBlobField;
    procedure FormCreate(Sender: TObject);
    procedure ImageComboBoxPropertiesEditValueChanged(Sender: TObject);
  private
    procedure PopulateGallery;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  PopulateGallery;
end;

procedure TForm1.ImageComboBoxPropertiesEditValueChanged(Sender: TObject);
begin
  dxSkinController1.SkinName := ReplaceStr(ImageComboBox.Text, ' ','');
end;

procedure TForm1.PopulateGallery;
var
  APainter: TcxCustomLookAndFeelPainter;
  ASkinDetails: TdxSkinDetails;
  I, cont: Integer;
  Item: TcxImageComboBoxItem;
  Bitmap: TBitmap;
  fs: TMemoryStream;
begin
  Bitmap := TBitmap.Create;
  try
    cont := 0;
    for I := 0 to cxLookAndFeelPaintersManager.Count - 1 do
    begin
      APainter := cxLookAndFeelPaintersManager[I];
      if (APainter.LookAndFeelStyle = lfsSkin) and not APainter.IsInternalPainter then
      begin
        if APainter.GetPainterDetails(ASkinDetails) then
        begin
          Bitmap.Assign(ASkinDetails.Icons[sis16]);
          ImageList.Add(Bitmap, nil);
          Item := ImageComboBox.Properties.Items.Add;
          Item.ImageIndex := cont;
          Item.Description := ASkinDetails.DisplayName;

          if not tbSkin.Locate('skn_descricao', ReplaceStr(ASkinDetails.DisplayName, ' ',''), []) then
            raise Exception.Create('Skin não encontrado');
          fs := TMemoryStream.Create;
          try
            Bitmap.SaveToStream(fs);
            fs.Position := 0;
            tbSkin.Edit;
            tbSkinskn_icone.LoadFromStream(fs);
            tbSkin.Post;
          finally
            fs.Free;
          end;


          Inc(cont);
        end;
      end;
    end;
  finally
    Bitmap.Free;
  end;
end;


end.
