unit dados;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmDados = class(TDataModule)
    Conexao: TADOConnection;
    tbSeguradora: TADOQuery;
    tbSeguradoraId: TAutoIncField;
    tbSeguradoraNome: TWideMemoField;
    tbSeguradoraEmpresaId: TIntegerField;
    tbRegiao: TADOQuery;
    tbRegiaoId: TAutoIncField;
    tbRegiaoNome: TWideMemoField;
    tbRegiaoEmpresaId: TIntegerField;
    dsSeguradora: TDataSource;
    dsRegiao: TDataSource;
    tbPlanoSaudeGenerico: TADOQuery;
    AutoIncField1: TAutoIncField;
    WideMemoField1: TWideMemoField;
    IntegerField1: TIntegerField;
    dsPlanoSaudeGenerico: TDataSource;
    tbFaixaIdade: TADOQuery;
    AutoIncField2: TAutoIncField;
    IntegerField2: TIntegerField;
    dsFaixaIdade: TDataSource;
    tbFaixaIdadeIdadeInicial: TIntegerField;
    tbFaixaIdadeIdadeFinal: TIntegerField;
    procedure tbSeguradoraAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{$R *.dfm}

procedure TdmDados.tbSeguradoraAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('EmpresaId').Value := 1;
end;

end.
