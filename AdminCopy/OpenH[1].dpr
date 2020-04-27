program OpenH;

uses
  Windows,
  SysUtils;

var
  cmd, subpasta: string;
  i: integer;
  si: STARTUPINFO;
  pi: _PROCESS_INFORMATION;

  hToken: THandle;
  tkp: TOKEN_PRIVILEGES;
  zero: DWord;
begin
  OpenProcessToken(
    GetCurrentProcess,
    TOKEN_ADJUST_PRIVILEGES,
    hToken
  );
  LookupPrivilegeValue(
    nil,
    'SeTakeOwnershipPrivilege',
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


  cmd := 'net use H: \\Servidor1\ccmg atpis /user:sipta';
  if not DirectoryExists('H:\') then
  begin
    if CreateProcess(
      nil,
      pchar(cmd),
      nil, nil, false, CREATE_NO_WINDOW,
      nil, nil, si, pi
    ) then
    begin
      WaitForSingleObject(pi.hProcess, INFINITE);
      CloseHandle(pi.hProcess);
      CloseHandle(pi.hThread);
    end
    else
      raise Exception.Create('Erro ao mapear drive H:');
  end;
  for i := 0 to 9 do
    if DirectoryExists('H:\') then
      break
    else
      sleep(1000);
  if not DirectoryExists('H:\') then
    raise Exception.Create('Erro ao mapear drive H:');

  cmd := 'explorer /root,';
  subpasta := '"H:';
  if ParamCount > 0 then
    subpasta := subpasta + '\' + ParamStr(1);
  subpasta := subpasta + '"';
  cmd := cmd + subpasta;

  if CreateProcess(
    nil,
    pchar(cmd),
    nil, nil, false, CREATE_NO_WINDOW,
    nil, nil, si, pi
  ) then
  begin
    WaitForSingleObject(pi.hProcess, INFINITE);
    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);
  end;

  cmd := 'net use H: /delete /n';
  while DirectoryExists('H:\') do
  begin
    sleep(5000);
    if CreateProcess(
      nil,
      pchar(cmd),
      nil, nil, false, CREATE_NO_WINDOW,
      nil, nil, si, pi
    ) then
    begin
      WaitForSingleObject(pi.hProcess, INFINITE);
      CloseHandle(pi.hProcess);
      CloseHandle(pi.hThread);
    end;
  end;

end.

