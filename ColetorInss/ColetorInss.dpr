program ColetorInss;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Resultado in 'Resultado.pas' {frmResultado};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
