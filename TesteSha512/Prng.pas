unit Prng;

interface

type

HCkBinData = Pointer;
HCkPrng = Pointer;
HCkByteData = Pointer;
HCkString = Pointer;


function CkPrng_Create: HCkPrng;
procedure CkPrng_Dispose(handle: HCkPrng);
procedure CkPrng_getDebugLogFilePath(objHandle: HCkPrng; outPropVal: HCkString);
procedure CkPrng_putDebugLogFilePath(objHandle: HCkPrng; newPropVal: PWideChar);
function CkPrng__debugLogFilePath(objHandle: HCkPrng): PWideChar;
procedure CkPrng_getLastErrorHtml(objHandle: HCkPrng; outPropVal: HCkString);
function CkPrng__lastErrorHtml(objHandle: HCkPrng): PWideChar;
procedure CkPrng_getLastErrorText(objHandle: HCkPrng; outPropVal: HCkString);
function CkPrng__lastErrorText(objHandle: HCkPrng): PWideChar;
procedure CkPrng_getLastErrorXml(objHandle: HCkPrng; outPropVal: HCkString);
function CkPrng__lastErrorXml(objHandle: HCkPrng): PWideChar;
function CkPrng_getLastMethodSuccess(objHandle: HCkPrng): wordbool;
procedure CkPrng_putLastMethodSuccess(objHandle: HCkPrng; newPropVal: wordbool);
procedure CkPrng_getPrngName(objHandle: HCkPrng; outPropVal: HCkString);
procedure CkPrng_putPrngName(objHandle: HCkPrng; newPropVal: PWideChar);
function CkPrng__prngName(objHandle: HCkPrng): PWideChar;
function CkPrng_getVerboseLogging(objHandle: HCkPrng): wordbool;
procedure CkPrng_putVerboseLogging(objHandle: HCkPrng; newPropVal: wordbool);
procedure CkPrng_getVersion(objHandle: HCkPrng; outPropVal: HCkString);
function CkPrng__version(objHandle: HCkPrng): PWideChar;
function CkPrng_AddEntropy(objHandle: HCkPrng; entropy: PWideChar; encoding: PWideChar): wordbool;
function CkPrng_AddEntropyBytes(objHandle: HCkPrng; entropy: HCkByteData): wordbool;
function CkPrng_ExportEntropy(objHandle: HCkPrng; outStr: HCkString): wordbool;
function CkPrng__exportEntropy(objHandle: HCkPrng): PWideChar;
function CkPrng_FirebasePushId(objHandle: HCkPrng; outStr: HCkString): wordbool;
function CkPrng__firebasePushId(objHandle: HCkPrng): PWideChar;
function CkPrng_GenRandom(objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar; outStr: HCkString): wordbool;
function CkPrng__genRandom(objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar): PWideChar;
function CkPrng_GenRandomBd(objHandle: HCkPrng; numBytes: Integer; bd: HCkBinData): wordbool;
function CkPrng_GenRandomBytes(objHandle: HCkPrng; numBytes: Integer; outData: HCkByteData): wordbool;
function CkPrng_GetEntropy(objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar; outStr: HCkString): wordbool;
function CkPrng__getEntropy(objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar): PWideChar;
function CkPrng_GetEntropyBytes(objHandle: HCkPrng; numBytes: Integer; outData: HCkByteData): wordbool;
function CkPrng_ImportEntropy(objHandle: HCkPrng; entropy: PWideChar): wordbool;
function CkPrng_RandomInt(objHandle: HCkPrng; low: Integer; high: Integer): Integer;
function CkPrng_RandomPassword(objHandle: HCkPrng; length: Integer; mustIncludeDigit: wordbool; upperAndLowercase: wordbool; mustHaveOneOf: PWideChar; excludeChars: PWideChar; outStr: HCkString): wordbool;
function CkPrng__randomPassword(objHandle: HCkPrng; length: Integer; mustIncludeDigit: wordbool; upperAndLowercase: wordbool; mustHaveOneOf: PWideChar; excludeChars: PWideChar): PWideChar;
function CkPrng_RandomString(objHandle: HCkPrng; length: Integer; bDigits: wordbool; bLower: wordbool; bUpper: wordbool; outStr: HCkString): wordbool;
function CkPrng__randomString(objHandle: HCkPrng; length: Integer; bDigits: wordbool; bLower: wordbool; bUpper: wordbool): PWideChar;
function CkPrng_SaveLastError(objHandle: HCkPrng; path: PWideChar): wordbool;
implementation

uses windows, sysutils, ckDllLoader;

Type
  TCkPrng_Create = function : HCkPrng; stdcall;
  TCkPrng_Dispose = procedure (handle: HCkPrng); stdcall;
  TCkPrng_getDebugLogFilePath = procedure (objHandle: HCkPrng; outPropVal: HCkString); stdcall;
  TCkPrng_putDebugLogFilePath = procedure (objHandle: HCkPrng; newPropVal: PWideChar); stdcall;
  TCkPrng__debugLogFilePath = function (objHandle: HCkPrng): PWideChar; stdcall;
  TCkPrng_getLastErrorHtml = procedure (objHandle: HCkPrng; outPropVal: HCkString); stdcall;
  TCkPrng__lastErrorHtml = function (objHandle: HCkPrng): PWideChar; stdcall;
  TCkPrng_getLastErrorText = procedure (objHandle: HCkPrng; outPropVal: HCkString); stdcall;
  TCkPrng__lastErrorText = function (objHandle: HCkPrng): PWideChar; stdcall;
  TCkPrng_getLastErrorXml = procedure (objHandle: HCkPrng; outPropVal: HCkString); stdcall;
  TCkPrng__lastErrorXml = function (objHandle: HCkPrng): PWideChar; stdcall;
  TCkPrng_getLastMethodSuccess = function (objHandle: HCkPrng): wordbool; stdcall;
  TCkPrng_putLastMethodSuccess = procedure (objHandle: HCkPrng; newPropVal: wordbool); stdcall;
  TCkPrng_getPrngName = procedure (objHandle: HCkPrng; outPropVal: HCkString); stdcall;
  TCkPrng_putPrngName = procedure (objHandle: HCkPrng; newPropVal: PWideChar); stdcall;
  TCkPrng__prngName = function (objHandle: HCkPrng): PWideChar; stdcall;
  TCkPrng_getVerboseLogging = function (objHandle: HCkPrng): wordbool; stdcall;
  TCkPrng_putVerboseLogging = procedure (objHandle: HCkPrng; newPropVal: wordbool); stdcall;
  TCkPrng_getVersion = procedure (objHandle: HCkPrng; outPropVal: HCkString); stdcall;
  TCkPrng__version = function (objHandle: HCkPrng): PWideChar; stdcall;
  TCkPrng_AddEntropy = function (objHandle: HCkPrng; entropy: PWideChar; encoding: PWideChar): wordbool; stdcall;
  TCkPrng_AddEntropyBytes = function (objHandle: HCkPrng; entropy: HCkByteData): wordbool; stdcall;
  TCkPrng_ExportEntropy = function (objHandle: HCkPrng; outStr: HCkString): wordbool; stdcall;
  TCkPrng__exportEntropy = function (objHandle: HCkPrng): PWideChar; stdcall;
  TCkPrng_FirebasePushId = function (objHandle: HCkPrng; outStr: HCkString): wordbool; stdcall;
  TCkPrng__firebasePushId = function (objHandle: HCkPrng): PWideChar; stdcall;
  TCkPrng_GenRandom = function (objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkPrng__genRandom = function (objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar): PWideChar; stdcall;
  TCkPrng_GenRandomBd = function (objHandle: HCkPrng; numBytes: Integer; bd: HCkBinData): wordbool; stdcall;
  TCkPrng_GenRandomBytes = function (objHandle: HCkPrng; numBytes: Integer; outData: HCkByteData): wordbool; stdcall;
  TCkPrng_GetEntropy = function (objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkPrng__getEntropy = function (objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar): PWideChar; stdcall;
  TCkPrng_GetEntropyBytes = function (objHandle: HCkPrng; numBytes: Integer; outData: HCkByteData): wordbool; stdcall;
  TCkPrng_ImportEntropy = function (objHandle: HCkPrng; entropy: PWideChar): wordbool; stdcall;
  TCkPrng_RandomInt = function (objHandle: HCkPrng; low: Integer; high: Integer): Integer; stdcall;
  TCkPrng_RandomPassword = function (objHandle: HCkPrng; length: Integer; mustIncludeDigit: wordbool; upperAndLowercase: wordbool; mustHaveOneOf: PWideChar; excludeChars: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkPrng__randomPassword = function (objHandle: HCkPrng; length: Integer; mustIncludeDigit: wordbool; upperAndLowercase: wordbool; mustHaveOneOf: PWideChar; excludeChars: PWideChar): PWideChar; stdcall;
  TCkPrng_RandomString = function (objHandle: HCkPrng; length: Integer; bDigits: wordbool; bLower: wordbool; bUpper: wordbool; outStr: HCkString): wordbool; stdcall;
  TCkPrng__randomString = function (objHandle: HCkPrng; length: Integer; bDigits: wordbool; bLower: wordbool; bUpper: wordbool): PWideChar; stdcall;
  TCkPrng_SaveLastError = function (objHandle: HCkPrng; path: PWideChar): wordbool; stdcall;

var
  _fkt_ptr_arr:   array [0..39] of Pointer;

function _Map( k:Integer; n:String):Pointer;
begin
  Result:=  _fkt_ptr_arr[k];
  if Result = nil then begin
    Chilkat_GetProcedureAddress(Result, n);
    _fkt_ptr_arr[k]:=   Result;
  end;
end;


function CkPrng_Create : HCkPrng;
begin
  result := TCkPrng_Create(_map(0, 'CkPrng_Create'));
end;

procedure CkPrng_Dispose (handle: HCkPrng);
begin
  TCkPrng_Dispose(_map(1, 'CkPrng_Dispose'))
    (handle);
end;


procedure CkPrng_getDebugLogFilePath (objHandle: HCkPrng; outPropVal: HCkString);
begin
  TCkPrng_getDebugLogFilePath(_map(2, 'CkPrng_getDebugLogFilePath'))
    (objHandle, outPropVal);
end;

procedure CkPrng_putDebugLogFilePath (objHandle: HCkPrng; newPropVal: PWideChar);
begin
  TCkPrng_putDebugLogFilePath(_map(3, 'CkPrng_putDebugLogFilePath'))
    (objHandle, newPropVal);
end;

function CkPrng__debugLogFilePath (objHandle: HCkPrng): PWideChar;
begin
  result := TCkPrng__debugLogFilePath(_map(4, 'CkPrng__debugLogFilePath'))
    (objHandle);
end;

procedure CkPrng_getLastErrorHtml (objHandle: HCkPrng; outPropVal: HCkString);
begin
  TCkPrng_getLastErrorHtml(_map(5, 'CkPrng_getLastErrorHtml'))
    (objHandle, outPropVal);
end;

function CkPrng__lastErrorHtml (objHandle: HCkPrng): PWideChar;
begin
  result := TCkPrng__lastErrorHtml(_map(6, 'CkPrng__lastErrorHtml'))
    (objHandle);
end;

procedure CkPrng_getLastErrorText (objHandle: HCkPrng; outPropVal: HCkString);
begin
  TCkPrng_getLastErrorText(_map(7, 'CkPrng_getLastErrorText'))
    (objHandle, outPropVal);
end;

function CkPrng__lastErrorText (objHandle: HCkPrng): PWideChar;
begin
  result := TCkPrng__lastErrorText(_map(8, 'CkPrng__lastErrorText'))
    (objHandle);
end;

procedure CkPrng_getLastErrorXml (objHandle: HCkPrng; outPropVal: HCkString);
begin
  TCkPrng_getLastErrorXml(_map(9, 'CkPrng_getLastErrorXml'))
    (objHandle, outPropVal);
end;

function CkPrng__lastErrorXml (objHandle: HCkPrng): PWideChar;
begin
  result := TCkPrng__lastErrorXml(_map(10, 'CkPrng__lastErrorXml'))
    (objHandle);
end;

function CkPrng_getLastMethodSuccess (objHandle: HCkPrng): wordbool;
begin
    result := TCkPrng_getLastMethodSuccess(_map(11, 'CkPrng_getLastMethodSuccess'))
    (objHandle);
end;

procedure CkPrng_putLastMethodSuccess (objHandle: HCkPrng; newPropVal: wordbool);
begin
  TCkPrng_putLastMethodSuccess(_map(12, 'CkPrng_putLastMethodSuccess'))
    (objHandle, newPropVal);
end;

procedure CkPrng_getPrngName (objHandle: HCkPrng; outPropVal: HCkString);
begin
  TCkPrng_getPrngName(_map(13, 'CkPrng_getPrngName'))
    (objHandle, outPropVal);
end;

procedure CkPrng_putPrngName (objHandle: HCkPrng; newPropVal: PWideChar);
begin
  TCkPrng_putPrngName(_map(14, 'CkPrng_putPrngName'))
    (objHandle, newPropVal);
end;

function CkPrng__prngName (objHandle: HCkPrng): PWideChar;
begin
  result := TCkPrng__prngName(_map(15, 'CkPrng__prngName'))
    (objHandle);
end;

function CkPrng_getVerboseLogging (objHandle: HCkPrng): wordbool;
begin
    result := TCkPrng_getVerboseLogging(_map(16, 'CkPrng_getVerboseLogging'))
    (objHandle);
end;

procedure CkPrng_putVerboseLogging (objHandle: HCkPrng; newPropVal: wordbool);
begin
  TCkPrng_putVerboseLogging(_map(17, 'CkPrng_putVerboseLogging'))
    (objHandle, newPropVal);
end;

procedure CkPrng_getVersion (objHandle: HCkPrng; outPropVal: HCkString);
begin
  TCkPrng_getVersion(_map(18, 'CkPrng_getVersion'))
    (objHandle, outPropVal);
end;

function CkPrng__version (objHandle: HCkPrng): PWideChar;
begin
  result := TCkPrng__version(_map(19, 'CkPrng__version'))
    (objHandle);
end;

function CkPrng_AddEntropy (objHandle: HCkPrng; entropy: PWideChar; encoding: PWideChar): wordbool;
begin
  result := TCkPrng_AddEntropy(_map(20, 'CkPrng_AddEntropy'))
    (objHandle, entropy, encoding);
end;

function CkPrng_AddEntropyBytes (objHandle: HCkPrng; entropy: HCkByteData): wordbool;
begin
  result := TCkPrng_AddEntropyBytes(_map(21, 'CkPrng_AddEntropyBytes'))
    (objHandle, entropy);
end;

function CkPrng_ExportEntropy (objHandle: HCkPrng; outStr: HCkString): wordbool;
begin
  result := TCkPrng_ExportEntropy(_map(22, 'CkPrng_ExportEntropy'))
    (objHandle, outStr);
end;

function CkPrng__exportEntropy (objHandle: HCkPrng): PWideChar;
begin
  result := TCkPrng__exportEntropy(_map(23, 'CkPrng__exportEntropy'))
    (objHandle);
end;

function CkPrng_FirebasePushId (objHandle: HCkPrng; outStr: HCkString): wordbool;
begin
  result := TCkPrng_FirebasePushId(_map(24, 'CkPrng_FirebasePushId'))
    (objHandle, outStr);
end;

function CkPrng__firebasePushId (objHandle: HCkPrng): PWideChar;
begin
  result := TCkPrng__firebasePushId(_map(25, 'CkPrng__firebasePushId'))
    (objHandle);
end;

function CkPrng_GenRandom (objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkPrng_GenRandom(_map(26, 'CkPrng_GenRandom'))
    (objHandle, numBytes, encoding, outStr);
end;

function CkPrng__genRandom (objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar): PWideChar;
begin
  result := TCkPrng__genRandom(_map(27, 'CkPrng__genRandom'))
    (objHandle, numBytes, encoding);
end;

function CkPrng_GenRandomBd (objHandle: HCkPrng; numBytes: Integer; bd: HCkBinData): wordbool;
begin
  result := TCkPrng_GenRandomBd(_map(28, 'CkPrng_GenRandomBd'))
    (objHandle, numBytes, bd);
end;

function CkPrng_GenRandomBytes (objHandle: HCkPrng; numBytes: Integer; outData: HCkByteData): wordbool;
begin
  result := TCkPrng_GenRandomBytes(_map(29, 'CkPrng_GenRandomBytes'))
    (objHandle, numBytes, outData);
end;

function CkPrng_GetEntropy (objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkPrng_GetEntropy(_map(30, 'CkPrng_GetEntropy'))
    (objHandle, numBytes, encoding, outStr);
end;

function CkPrng__getEntropy (objHandle: HCkPrng; numBytes: Integer; encoding: PWideChar): PWideChar;
begin
  result := TCkPrng__getEntropy(_map(31, 'CkPrng__getEntropy'))
    (objHandle, numBytes, encoding);
end;

function CkPrng_GetEntropyBytes (objHandle: HCkPrng; numBytes: Integer; outData: HCkByteData): wordbool;
begin
  result := TCkPrng_GetEntropyBytes(_map(32, 'CkPrng_GetEntropyBytes'))
    (objHandle, numBytes, outData);
end;

function CkPrng_ImportEntropy (objHandle: HCkPrng; entropy: PWideChar): wordbool;
begin
  result := TCkPrng_ImportEntropy(_map(33, 'CkPrng_ImportEntropy'))
    (objHandle, entropy);
end;

function CkPrng_RandomInt (objHandle: HCkPrng; low: Integer; high: Integer): Integer;
begin
  result := TCkPrng_RandomInt(_map(34, 'CkPrng_RandomInt'))
    (objHandle, low, high);
end;

function CkPrng_RandomPassword (objHandle: HCkPrng; length: Integer; mustIncludeDigit: wordbool; upperAndLowercase: wordbool; mustHaveOneOf: PWideChar; excludeChars: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkPrng_RandomPassword(_map(35, 'CkPrng_RandomPassword'))
    (objHandle, length, mustIncludeDigit, upperAndLowercase, mustHaveOneOf, excludeChars, outStr);
end;

function CkPrng__randomPassword (objHandle: HCkPrng; length: Integer; mustIncludeDigit: wordbool; upperAndLowercase: wordbool; mustHaveOneOf: PWideChar; excludeChars: PWideChar): PWideChar;
begin
  result := TCkPrng__randomPassword(_map(36, 'CkPrng__randomPassword'))
    (objHandle, length, mustIncludeDigit, upperAndLowercase, mustHaveOneOf, excludeChars);
end;

function CkPrng_RandomString (objHandle: HCkPrng; length: Integer; bDigits: wordbool; bLower: wordbool; bUpper: wordbool; outStr: HCkString): wordbool;
begin
  result := TCkPrng_RandomString(_map(37, 'CkPrng_RandomString'))
    (objHandle, length, bDigits, bLower, bUpper, outStr);
end;

function CkPrng__randomString (objHandle: HCkPrng; length: Integer; bDigits: wordbool; bLower: wordbool; bUpper: wordbool): PWideChar;
begin
  result := TCkPrng__randomString(_map(38, 'CkPrng__randomString'))
    (objHandle, length, bDigits, bLower, bUpper);
end;

function CkPrng_SaveLastError (objHandle: HCkPrng; path: PWideChar): wordbool;
begin
  result := TCkPrng_SaveLastError(_map(39, 'CkPrng_SaveLastError'))
    (objHandle, path);
end;

end.
