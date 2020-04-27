unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

//uses CHILKATCSVLib_TLB;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  SearchRec: TSearchRec;
  ArqSQL: TStrings;
begin
  try
    ArqSql := TStringList.Create;
    FindFirst( Edit1.Text, faAnyFile, SearchRec);
    repeat
      ArqSql.LoadFromFile(ExtractFilePath(Edit1.Text)+'\'+SearchRec.Name);
      Memo1.Lines.Append(StringOfChar('-',50)+#13#10+ArqSql.Text);
    until FindNext(SearchRec) <> 0;
  finally
    FindClose( SearchRec );
    ArqSql.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
{var
  SearchRec: TSearchRec;
  Svc: TChilkatCsv;}
begin
{  Svc := TChilkatCsv.Create(Self);
  Svc.Delimiter := ';';
  FindFirst( Edit1.Text, faAnyFile, SearchRec);
  try
    repeat
      Svc.LoadFile2(ExtractFilePath(Edit1.Text)+SearchRec.Name, 'utf-16');
      Memo1.Lines.Append(Svc.SaveToString);
    until FindNext(SearchRec) <> 0;
  finally
    FindClose( SearchRec );
  end;}
end;

end.
