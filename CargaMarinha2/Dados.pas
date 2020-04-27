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
    tbNaoVinculado: TADOQuery;
    dsNaoVinculado: TDataSource;
    tbBanco: TADOQuery;
    dsBanco: TDataSource;
    prIncluiCliente: TADOStoredProc;
    Cursor: TADOQuery;
    Ajuste: TADOQuery;
    CreateProc: TADOQuery;
    DropProc: TADOQuery;
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
