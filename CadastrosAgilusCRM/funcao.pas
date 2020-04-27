unit funcao;

interface

uses Variants, SysUtils, ADODB;

function FormataVlrSQL(Value: Variant; CasasDecimais: byte = 4): string;
function FormataBooleanSQL(Value: Variant): string;
function FormataDataSQL(Value: Variant): string;
function FormataStringSQL(Value: Variant): string;
function AbreDataSet(InstrucaoSQL: string;
  Timeout: integer = 30; LockType: TADOLockType = ltOptimistic): TADOQuery;
function PegaValorSQL(InstrucaoSQL: string;
  Timeout: integer = 30; LockType: TADOLockType = ltReadOnly): Variant;

implementation

uses dados;

function FormataVlrSQL(Value: Variant; CasasDecimais: byte): string;
var DecimalSeparatorAnterior: char;
    Valor: extended;
begin
  if Value = null then
    Result := 'null'
  else
  begin
    Valor := Value;
    DecimalSeparatorAnterior := FormatSettings.DecimalSeparator;
    try
      FormatSettings.DecimalSeparator := '.';
      Result := Trim(Format('%18.'+IntToStr(CasasDecimais)+'f', [Valor]));
    finally
      FormatSettings.DecimalSeparator := DecimalSeparatorAnterior;
    end;
  end;
end;

function FormataBooleanSQL(Value: Variant): string;
begin
  if Value = null then
    Result := 'null';
  if Value = True then
    Result := '1';
  if Value = False then
    Result := '0';
end;

function FormataDataSQL(Value: Variant): string;
begin
  if Value = null then
    Result := 'null'
  else
    Result := QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Value));
end;

function FormataStringSQL(Value: Variant): string;
begin
  if Value = null then
    Result := 'null'
  else
    Result := QuotedStr(Value);
end;

function PegaValorSQL(InstrucaoSQL: string;
  Timeout: integer = 30; LockType: TADOLockType = ltReadOnly): Variant;
begin
  with AbreDataSet(InstrucaoSQL, Timeout, LockType) do
  begin
    try
      if Fields.Count <> 1 then
        raise Exception.Create('A instrução SQL só deve retornar um campo');
      if RecordCount <> 1 then
        raise Exception.Create('A instrução SQL só deve retornar uma linha'+#13#13+InstrucaoSQL);

      Result := Fields[0].Value;
    finally
      Free;
    end;
  end;
end;

function AbreDataSet(InstrucaoSQL: string;
  Timeout: integer; LockType: TADOLockType): TADOQuery;
var
  DataSetRetorno: TADOQuery;
  Msg: string;
begin
  try
    DataSetRetorno := TADOQuery.Create(nil);
    DataSetRetorno.CursorLocation := clUseClient;
    DataSetRetorno.CursorType := ctStatic;
    DataSetRetorno.Connection := dmDados.Conexao;
    DataSetRetorno.CommandTimeout := Timeout;
    DataSetRetorno.LockType := LockType;
    DataSetRetorno.SQL.Text := InstrucaoSQL;
    DataSetRetorno.Open;

    Result := DataSetRetorno;
  except
    on E: Exception do
    begin
      Msg := 'Erro abrindo Dataset SQL' +#13#13+E.Message+#13#13+InstrucaoSQL;
      raise Exception.Create(Msg);
    end;
  end;
end;

end.
