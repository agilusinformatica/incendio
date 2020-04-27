unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TDriveType = (dtUnknown, dtNoDrive, dtFloppy, dtFixed, dtNetwork, dtCDROM, dtRAM);

type
  TForm2 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function GetTmpDir: string; // Get the windows temporary directory
var
  pc: PChar;
begin
  pc := StrAlloc(MAX_PATH + 1);
  GetTempPath(MAX_PATH, pc);
  Result := string(pc);
  StrDispose(pc);
end;

procedure DelExe; // procedure to delete the current program
  function GetTmpFileName(ext: string): string;
  var
    pc: PChar;
  begin
    pc := StrAlloc(MAX_PATH + 1);
    GetTempFileName(PChar(GetTmpDir), 'EZC', 0, pc);
    Result := string(pc);
    Result := ChangeFileExt(Result, ext);
    StrDispose(pc);
  end;

var
  batchfile: TStringList;
  batchname: string;
begin
  if (TDRiveType(GetDriveType(PChar('C:\'))) = dtFloppy) or (TDRiveType(GetDriveType(PChar('C:\'))) = dtFixed) then
  begin
    batchname := GetTmpFileName('.bat');
    FileSetAttr(ParamStr(0), 0);
    batchfile := TStringList.Create;
    with batchfile do
    begin
      try
        Add(':Label1');
        Add('del "' + ParamStr(0) + '"');
        Add('if Exist "' + ParamStr(0) + '" goto Label1');
        Add('rmdir "' + ExtractFilePath(ParamStr(0)) + '"');
        Add('del "' + GetTmpDir + ExtractFileName(ParamStr(0)) + '"');
        Add('del ' + batchname);
        SaveToFile(batchname);
        ChDir(GetTmpDir);
        WinExec(PAnsiChar(batchname), SW_HIDE);
      finally
        batchfile.Free;
      end;
      Halt;
    end;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    try
      ADOConnection1.ConnectionString := ADOConnection1.ConnectionString + Edit1.Text;
      ADOConnection1.Connected := True;
      ADOQuery1.ExecSQL;

      Application.MessageBox('Login criado com sucesso', 'Aviso', mb_iconwarning+mb_ok);
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Erro criando login:'+#13#13+E.Message), 'Erro', mb_iconerror+mb_ok);
      end;
    end;
  finally
    Close;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DelExe;
end;

end.
