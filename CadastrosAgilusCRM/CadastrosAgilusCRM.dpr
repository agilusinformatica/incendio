program CadastrosAgilusCRM;

uses
  Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  dados in 'dados.pas' {dmDados: TDataModule},
  CadProduto in 'CadProduto.pas' {frmCadProduto},
  ListSeguradora in 'ListSeguradora.pas' {frmListSeguradora},
  ListProduto in 'ListProduto.pas' {frmListProduto},
  funcao in 'funcao.pas',
  ListPlanoSaude in 'ListPlanoSaude.pas' {frmListPlanoSaude},
  ListPlanoSaudeGenerico in 'ListPlanoSaudeGenerico.pas' {frmListPlanoSaudeGenerico},
  ListFaixaIdade in 'ListFaixaIdade.pas' {frmListFaixaIdade};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
