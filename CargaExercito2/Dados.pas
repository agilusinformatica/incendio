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
    tbNaoVinculado: TADOQuery;
    dsNaoVinculado: TDataSource;
    tbBanco: TADOQuery;
    dsBanco: TDataSource;
    prAtualizaCliente: TADOStoredProc;
    prIncluiCliente: TADOStoredProc;
    prIncluiContrato: TADOStoredProc;
    tbCompleto: TADOTable;
    DropProc: TADOQuery;
    CreateProcAtualizaCliente: TADOQuery;
    CreateProcIncluiCliente: TADOQuery;
    CreateProcIncluiContrato: TADOQuery;
    tbFilial: TADOQuery;
    dsFilial: TDataSource;
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
