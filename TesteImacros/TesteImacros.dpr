program TesteImacros;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  iMacros_TLB in 'C:\Users\Claudio\Documents\RAD Studio\8.0\Imports\iMacros_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
