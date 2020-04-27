program sim;

uses
  Forms,
  Padrao in 'Padrao.pas' {frmPadrao},
  Simulador in 'Simulador.pas' {frmSimulador};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSimulador, frmSimulador);
  Application.CreateForm(TfrmPadrao, frmPadrao);
  Application.Run;
end.
