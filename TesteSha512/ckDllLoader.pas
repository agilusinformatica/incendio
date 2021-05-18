unit ckDllLoader;

interface

procedure Chilkat_GetProcedureAddress(var P; ProcName: string);

implementation

uses windows, sysutils;

var
  hChilkatDLL: HModule;
  ckModuleName: String;

function LocalGetModuleFileName: string;
var
  Buffer: array[0..MAX_PATH] of char;
begin
  SetString(Result, Buffer, Windows.GetModuleFileName(HInstance,
    Buffer, SizeOf(Buffer)));
end;

function Chilkat_LoadModule: HModule;
var
  sFile:  String;
begin
  if hChilkatDLL = 0 then
  begin
  {$ifdef Win32}
    ckModuleName := 'ChilkatDelphi32.dll';
  {$else}
    ckModuleName := 'ChilkatDelphi64.dll';
  {$endif}
    hChilkatDLL := GetModuleHandle(PChar(ckModuleName));
    if hChilkatDLL = 0 then
    begin
      hChilkatDLL := LoadLibrary(PChar(ckModuleName));
      if hChilkatDLL = 0 then
      begin
        sFile := ExtractFilePath(LocalGetModuleFileName) + sFile;
        hChilkatDLL := LoadLibraryEx(PChar(sFile), 0, LOAD_WITH_ALTERED_SEARCH_PATH);
      end;
    end;
  end;
  result := hChilkatDLL;
end;

procedure Chilkat_Dispose;
begin
  if hChilkatDLL > 0 then
  begin
    FreeLibrary(hChilkatDLL);
    hChilkatDLL := 0;
  end;
end;

procedure Chilkat_GetProcedureAddress(var P; ProcName: string);
begin
  Chilkat_LoadModule;

  if hChilkatDLL = 0 then
    raise Exception.Create('Library not found: ' + ckModuleName)
  else
  begin
    Pointer(P) := GetProcAddress(hChilkatDLL, PWideChar(ProcName));
    if not Assigned(Pointer(P)) then
      raise Exception.Create('Function not found: ' + ckModuleName + '.' + ProcName);
  end;
end;

initialization
  hChilkatDLL := 0;
finalization
  if hChilkatDLL > 0 then
    Chilkat_Dispose;
end.
