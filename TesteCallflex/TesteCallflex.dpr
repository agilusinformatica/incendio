program TesteCallflex;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Agendamento in 'Agendamento.pas' {frmAgendamento},
  callflex_mid_TLB in 'Imports\callflex_mid_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
