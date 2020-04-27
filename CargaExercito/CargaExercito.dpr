program CargaExercito;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Dados in 'Dados.pas' {dmDados: TDataModule},
  SemVinculo in 'SemVinculo.pas' {frmSemVinculo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
