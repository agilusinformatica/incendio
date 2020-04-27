unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VCL.FlexCel.Core, FlexCel.XlsAdapter, Math, StdCtrls;

type
  TForm1 = class(TForm)
    Celula: TLabel;
    Label1: TLabel;
    edCelula: TEdit;
    edConteudo: TEdit;
    Button1: TButton;
    OpenDialog: TOpenDialog;
    Button2: TButton;
    lbNomeArquivo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    ExcelApp: TXlsFile;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function SoNumeros(Texto: string): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(Texto) do
  begin
    if Texto[i] in ['0'..'9'] then
      Result := Result + Texto[i];
  end;
end;

function SoLetras(Texto: string): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(Texto) do
  begin
    if Texto[i] in ['A'..'Z'] then
      Result := Result + Texto[i];
  end;
end;

function IndiceLetra(letra: char): word;
begin
  result := Ord(letra)-64;
end;

function LetrasParaNumero(letras: string): integer;
var
  i, o, p, Fator: integer;
begin
  Result := 0;
  letras := UpperCase(letras);
  Fator := Length(letras);
  for i := 1 to Length(letras) do
  begin
    o := IndiceLetra(letras[i]);
    p := Trunc(Power(26,Fator-1));
    Result := Result + (o*p);
    Dec(Fator);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  edConteudo.Text := ExcelApp.GetStringFromCell(StrToInt(SoNumeros(edCelula.Text)), LetrasParaNumero(SoLetras(edCelula.Text))).ToString;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    ExcelApp := TXlsFile.Create;
    ExcelApp.Open(OpenDialog.FileName);
    edCelula.Enabled := True;
    edConteudo.Enabled := True;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  lbNomeArquivo.Caption := EmptyStr;
end;

end.
