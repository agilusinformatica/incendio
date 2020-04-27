unit Dados;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmDados = class(TDataModule)
    ConexaoExercito: TADOConnection;
    ConexaoAgilus: TADOConnection;
    tbOrgao: TADOQuery;
    dsOrgao: TDataSource;
    tbUnidade: TADOQuery;
    dsUnidade: TDataSource;
    tbContrato: TADOQuery;
    tbCliente: TADOQuery;
    tbTotalizador: TADOQuery;
    tbNaoVinculado: TADOQuery;
    dsNaoVinculado: TDataSource;
    tbBanco: TADOQuery;
    dsBanco: TDataSource;
    prAtualizaCliente: TADOStoredProc;
    prIncluiCliente: TADOStoredProc;
    prIncluiContrato: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{$R *.dfm}

end.
