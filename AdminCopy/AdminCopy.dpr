program AdminCopy;

uses
  Windows,
  Dialogs;

var
  hToken: THandle;
  tkp: TOKEN_PRIVILEGES;
  zero: DWord;

  cmd: string;
  si: STARTUPINFO;
  pi: _PROCESS_INFORMATION;
begin
  if ParamCount = 0 then
    cmd := InputBox('ForceCommand', 'Comando', '')
  else
    cmd := ParamStr(1);
  if cmd = '' then
    exit;

  OpenProcessToken(
    GetCurrentProcess,
    TOKEN_ADJUST_PRIVILEGES,
    hToken
  );
  LookupPrivilegeValue(
    nil,
    'SeTakeOwnershipPrivilege',
    //'SeSystemProfilePrivilege',
    //'SeTcbPrivilege',
    tkp.Privileges[0].Luid
  );
  tkp.PrivilegeCount := 1;
  tkp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
  zero := 0;

  AdjustTokenPrivileges(
    hToken,
    FALSE,
    tkp,
    zero,
    nil,
    zero
  );


  if CreateProcess(
    nil,
    pchar(cmd),
    nil, nil, false, CREATE_NEW_CONSOLE,
    nil, nil, si, pi
  ) then
  begin
    WaitForSingleObject(pi.hProcess, INFINITE);
    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);
  end;
end.

