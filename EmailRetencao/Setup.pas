{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  110658: Setup.pas 
{
{   Rev 1.0    25/10/2004 23:18:36  ANeillans    Version: 9.0.17
{ Verified
}
unit Setup;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ComCtrls;

type
  TfmSetup = class(TForm)
    BitBtn1: TBitBtn;
    pcSetup: TPageControl;
    tsPop3: TTabSheet;
    tsSmtp: TTabSheet;
    Label1: TLabel;
    POPServer: TEdit;
    Label2: TLabel;
    POPPort: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblAuthenticationType: TLabel;
    cboAuthType: TComboBox;
    lbAccount: TLabel;
    edtAccount: TEdit;
    lbPassword: TLabel;
    edtPassword: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    SMTPServer: TEdit;
    SMTPPort: TEdit;
    Email: TEdit;
    Account: TEdit;
    Password: TEdit;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    edtOutputFolder: TEdit;
    Label4: TLabel;
    edtInterval: TEdit;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    edtProxyAddress: TEdit;
    edtProxyPort: TEdit;
    Label7: TLabel;
    Label13: TLabel;
    edtProxyUser: TEdit;
    edtProxyPassword: TEdit;
    Label14: TLabel;
    edtNomeBanco: TEdit;
    procedure bbtnAuthenticationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
    { Private declarations }
   public
    { Public declarations }
      procedure UpdateServerLabel;
   end;

var
   fmSetup: TfmSetup;

implementation

{$R *.DFM}

uses Main, smtpauth, inifiles;

procedure TfmSetup.bbtnAuthenticationClick(Sender: TObject);
begin
   frmSMTPAuthentication.ShowModal;
end;

procedure TfmSetup.UpdateServerLabel;
begin
   frmMain.pnlServerName.caption := POPServer.Text;
end; (*  *)

procedure TfmSetup.FormCreate(Sender: TObject);
begin
  POPServer.Text := Pop3ServerName;
  POPPort.Text := IntToStr(Pop3ServerPort);
  Account.Text := Pop3ServerUser;
  Password.Text := Pop3ServerPassword;

  SMTPServer.Text := SmtpServerName;
  SMTPPort.Text := IntToStr(SmtpServerPort);
  edtAccount.Text := SmtpServerUser;
  edtPassword.Text := SmtpServerPassword;
  cboAuthType.ItemIndex := SmtpAuthType;

  edtOutputFolder.Text := OutputFolder;
  edtNomeBanco.Text := NomeBanco;
  edtInterval.Text := IntToStr(Interval);

  edtProxyAddress.Text := ProxyAddress;
  edtProxyPort.Text := IntToStr(ProxyPort);
  edtProxyUser.Text := ProxyUser;
  edtProxyPassword.Text := ProxyPassword;

  Email.Text := UserEmail;

  UpdateServerLabel;
end;

procedure TfmSetup.FormHide(Sender: TObject);
begin
   UpdateServerLabel;
end;

procedure TfmSetup.BitBtn1Click(Sender: TObject);
var
  MailIni: TIniFile;
begin
  MailIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Mail.ini');
  with MailIni do begin
    WriteString('Pop3', 'ServerName', POPServer.Text);
    Pop3ServerName := POPServer.Text;

    WriteString('Pop3', 'ServerPort', POPPort.Text);
    Pop3ServerPort := StrToIntDef(POPPort.Text, 110);

    WriteString('Pop3', 'ServerUser', Account.Text);
    Pop3ServerUser := Account.Text;

    WriteString('Pop3', 'ServerPassword', Password.Text);
    Pop3ServerPassword := Password.Text;

    WriteString('Smtp', 'ServerName', SMTPServer.Text);
    SmtpServerName := SMTPServer.Text;

    WriteString('Smtp', 'ServerPort', SMTPPort.Text);
    SmtpServerPort := StrToIntDef(SMTPPort.Text, 110);

    WriteString('Smtp', 'ServerUser', edtAccount.Text);
    SmtpServerUser := edtAccount.Text;

    WriteString('Smtp', 'ServerPassword', edtPassword.Text);
    SmtpServerPassword := edtPassword.Text;

    WriteString('Email', 'PersonalEmail', Email.Text);
    UserEmail := Email.Text;

    WriteInteger('Smtp', 'SMTPAuthenticationType', cboAuthType.ItemIndex);
    SmtpAuthType := cboAuthType.ItemIndex;

    WriteString('Export', 'OutputFolder', edtOutputFolder.Text);
    OutputFolder := edtOutputFolder.Text;

    WriteString('Export', 'NomeBanco', edtNomeBanco.Text);
    NomeBanco := edtNomeBanco.Text;

    WriteInteger('Export', 'Interval', StrToIntDef(edtInterval.Text,5));
    Interval := StrToIntDef(edtInterval.Text,5);

    WriteString('Proxy', 'ProxyAddress', edtProxyAddress.Text);
    Pop3ServerName := POPServer.Text;

    WriteString('Proxy', 'ProxyPort', edtProxyPort.Text);
    Pop3ServerPort := StrToIntDef(POPPort.Text, 8080);

    WriteString('Proxy', 'ProxyUser', edtProxyUser.Text);
    Pop3ServerUser := Account.Text;

    WriteString('Proxy', 'ProxyPassword', edtProxyPassword.Text);
    Pop3ServerPassword := Password.Text;

  end;
  MailIni.Free;
end;

procedure TfmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

