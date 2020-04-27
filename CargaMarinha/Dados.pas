unit Dados;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmDados = class(TDataModule)
    ConexaoAgilus: TADOConnection;
    tbOrgao: TADOQuery;
    dsOrgao: TDataSource;
    tbUnidade: TADOQuery;
    dsUnidade: TDataSource;
    tbBanco: TADOQuery;
    dsBanco: TDataSource;
    prProcessaCarga: TADOStoredProc;
    tbVinculo: TADOQuery;
    dsVinculo: TDataSource;
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
