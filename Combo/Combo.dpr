program Combo;

uses
  Forms,
  Unit2 in 'Unit2.pas' {Form2},
  ComboAgilus in '..\..\Componentes\ComboAgilus.pas',
  HelperExtLookupComboBox in 'HelperExtLookupComboBox.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
