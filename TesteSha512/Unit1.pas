unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Crypt2, Prng;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  crypt: HCkCrypt2;
  s: PWideChar;
  hash: PWideChar;
  fortuna: HCkPrng;
begin
  // This example requires the Chilkat API to have been previously unlocked.
  // See Global Unlock Sample for sample code.

  crypt := CkCrypt2_Create();

  s := PWideChar(Edit1.Text);

  CkCrypt2_putEncodingMode(crypt,'hex');

  // Other possible EncodingMode settings are:
  // "quoted-printable", "base64","url", and many more..

  // Hash using SHA-256
  CkCrypt2_putHashAlgorithm(crypt,'sha256');
  hash := CkCrypt2__hashStringENC(crypt,s);
  Memo1.Lines.Add('SHA256: ' + hash);


  CkCrypt2_Dispose(crypt);

  //////////////////////////////////
  fortuna := CkPrng_Create();
  Memo1.Lines.Add(CkPrng__genRandom(fortuna,16,'hex'));
  CkPrng_Dispose(fortuna);
end;

end.
