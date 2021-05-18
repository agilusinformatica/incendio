program TesteSha;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Crypt2 in 'Crypt2.pas',
  Prng in 'Prng.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
