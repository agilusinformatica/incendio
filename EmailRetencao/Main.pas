{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  110660: Main.pas 
{
{   Rev 1.0    25/10/2004 23:18:36  ANeillans    Version: 9.0.17
{ Verified
}
{-----------------------------------------------------------------------------
 Demo Name: Main
 Author:    Hadi Hariri <hadi@hadihariri.com>
 Copyright: Indy Pit Crew
 Purpose:
 History:
-----------------------------------------------------------------------------
 Notes:

 Demonstrates basic email component usage

Verified:
  Indy 9:
    D7: 25th Oct 2004 by Andy Neillans
}


unit Main;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, Menus, ComCtrls, IdSMTP, IdComponent, IdTCPConnection, ActiveX,
   IdTCPClient, IdMessageClient, IdPOP3, IdBaseComponent, IdMessage,
   StdCtrls, ExtCtrls, ToolWin, ActnList, ImgList, Buttons, StrUtils,
   IdAntiFreezeBase, IdAntiFreeze, IdExplicitTLSClientServerBase,
   IdAttachmentFile, IdAttachmentMemory, IdText, OleCtrls, SHDocVw, ComObj,
  IdCustomTransparentProxy, IdConnectThroughHttpProxy, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack;

type
   TfrmMain = class(TForm)
      ActionList1: TActionList;
      Actions1: TMenuItem;
      Button1: TBitBtn;
      Cc: TLabel;
      CheckMail: TAction;
      Checkmail1: TMenuItem;
      Date: TLabel;
      Delete: TAction;
      Deletecurrentmessage1: TMenuItem;
      Disconnect: TAction;
      Disconnect1: TMenuItem;
      Exit1: TMenuItem;
      From: TLabel;
      IdAntiFreeze1: TIdAntiFreeze;
      ImageList1: TImageList;
      Label1: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      lvHeaders: TListView;
      lvMessageParts: TListView;
      MainMenu1: TMainMenu;
      Memo1: TMemo;
      Msg: TIdMessage;
      N2: TMenuItem;
      N3: TMenuItem;
      Organization: TLabel;
      Panel1: TPanel;
      pnlBottom: TPanel;
      pnlBottomBottom: TPanel;
      pnlMain: TPanel;
      pnlAttachments: TPanel;
      pnlServerName: TPanel;
      pnlTop: TPanel;
      POP: TIdPOP3;
      Priority: TLabel;
      Purge: TAction;
      Purgemarkedmessages1: TMenuItem;
      Receipt: TLabel;
      Recipients: TLabel;
      Retrieve: TAction;
      Retrievecurrentmessage1: TMenuItem;
      SaveDialog1: TSaveDialog;
      Send: TAction;
      Send1: TMenuItem;
      Setup: TAction;
      Setup1: TMenuItem;
      Splitter1: TSplitter;
      StatusBar1: TStatusBar;
      StatusBar2: TStatusBar;
      Subject: TLabel;
      ToolBar1: TToolBar;
      ToolButton1: TToolButton;
      ToolButton10: TToolButton;
      ToolButton11: TToolButton;
      ToolButton12: TToolButton;
      ToolButton2: TToolButton;
      ToolButton3: TToolButton;
      ToolButton4: TToolButton;
      ToolButton5: TToolButton;
      ToolButton6: TToolButton;
      ToolButton7: TToolButton;
      ToolButton8: TToolButton;
      ToolButton9: TToolButton;
    Selectfromdeletion1: TMenuItem;
    ToolButton13: TToolButton;
    GeraExcel: TAction;
    wb: TWebBrowser;
    IdConnectThroughHttpProxy: TIdConnectThroughHttpProxy;
    IdIOHandlerStack1: TIdIOHandlerStack;
    ProgressBar: TProgressBar;
    function FindAttachment(stFilename: string): integer;
    procedure Button1Click(Sender: TObject);
    procedure CheckMailExecute(Sender: TObject);
    procedure DeleteExecute(Sender: TObject);
    procedure DisconnectExecute(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lvMessagePartsClick(Sender: TObject);
    procedure pnlServerNameClick(Sender: TObject);
    procedure PurgeExecute(Sender: TObject);
    procedure RetrieveExecute(Sender: TObject);
    procedure SendExecute(Sender: TObject);
    procedure SetupExecute(Sender: TObject);
    procedure ShowBusy(blBusy: boolean);
    procedure ShowFileStatus;
    procedure ShowStatus(stStatus: string);
    procedure lvHeadersDblClick(Sender: TObject);
    procedure Selectfromdeletion1Click(Sender: TObject);
    procedure GeraExcelExecute(Sender: TObject);
   private
    { Private declarations }
      procedure RetrievePOPHeaders(inMsgCount: Integer);
      procedure ResetHeadersGrid;
      procedure ToggleStatus(const Status: Boolean);
      procedure ReadConfiguration;
   public
    { Public declarations }
    FAttachPath: string;
    FMsgCount, FMailBoxSize: integer;
   end;

var
   frmMain: TfrmMain;
   Pop3ServerName: String;
   Pop3ServerPort: Integer;
   Pop3ServerUser: String;
   Pop3ServerPassword: String;
   SmtpServerName: String;
   SmtpServerPort: Integer;
   SmtpServerUser: String;
   SmtpServerPassword: String;
   SmtpAuthType: Integer;
   UserEmail: String;
   OutputFolder: String;
   NomeBanco: String;
   Interval: Integer;
   ProxyAddress: string;
   ProxyPort: Integer;
   ProxyUser: string;
   ProxyPassword: string;
implementation

uses Setup, MsgEditor, inifiles; //, smtpauth;

{$R *.DFM}

procedure CarregaHTML(Texto: string; WebBrowser: TWebBrowser);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank') ;
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := Texto;
        sl.SaveToStream(ms) ;
        ms.Seek(0, 0) ;
        (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms)) ;
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

function RetiraTags(Texto: string): string;

  function ProximoCaracter(posicao: integer): string;
  begin
    while Copy(Texto,posicao,1) = ' ' do
      Inc(Posicao);
    Result := Copy(Texto,posicao,1);
  end;
var
  p1, p2: integer;
  proximo: string;
begin
  // elimina quebras de linha indevidas
  p1 := Pos(#13#10, Texto);
  while p1 > 0 do
  begin
    proximo := ProximoCaracter(p1+2);
    if proximo <> '<' then
    begin
      p2 := PosEx(proximo, Texto, p1);
      if p2 > 0 then
        Texto := StuffString(Texto, p1, p2-p1, ' ');
    end;
    p1 := PosEx(#13#10, Texto, p1+2);
  end;

  // elimina tags
  p1 := Pos('<',Texto);
  while p1 > 0 do
  begin
    p2 := PosEx('>',Texto,p1+1);
    if p2 > 0 then
      Texto := StuffString(Texto, p1, p2-p1+1, '');
    p1 := Pos('<',Texto);
  end;

  // converte caracteres especiais
  Texto := ReplaceStr(Texto, '&Aacute;','Á');
  Texto := ReplaceStr(Texto, '&aacute;','á');
  Texto := ReplaceStr(Texto, '&Acirc;','Â');
  Texto := ReplaceStr(Texto, '&acirc;','â');
  Texto := ReplaceStr(Texto, '&Agrave;','À');
  Texto := ReplaceStr(Texto, '&agrave;','à');
  Texto := ReplaceStr(Texto, '&Aring;','Å');
  Texto := ReplaceStr(Texto, '&aring;','å');
  Texto := ReplaceStr(Texto, '&Atilde;','Ã');
  Texto := ReplaceStr(Texto, '&atilde;','ã');
  Texto := ReplaceStr(Texto, '&Auml;','Ä');
  Texto := ReplaceStr(Texto, '&auml;','ä');
  Texto := ReplaceStr(Texto, '&AElig;','Æ');
  Texto := ReplaceStr(Texto, '&aelig;','æ');
  Texto := ReplaceStr(Texto, '&Eacute;','É');
  Texto := ReplaceStr(Texto, '&eacute;','é');
  Texto := ReplaceStr(Texto, '&Ecirc;','Ê');
  Texto := ReplaceStr(Texto, '&ecirc;','ê');
  Texto := ReplaceStr(Texto, '&Egrave;','È');
  Texto := ReplaceStr(Texto, '&egrave;','è');
  Texto := ReplaceStr(Texto, '&Euml;','Ë');
  Texto := ReplaceStr(Texto, '&euml;','ë');
  Texto := ReplaceStr(Texto, '&ETH;','Ð');
  Texto := ReplaceStr(Texto, '&eth;','ð');
  Texto := ReplaceStr(Texto, '&Iacute;','Í');
  Texto := ReplaceStr(Texto, '&iacute;','í');
  Texto := ReplaceStr(Texto, '&Icirc;','Î');
  Texto := ReplaceStr(Texto, '&icirc;','î');
  Texto := ReplaceStr(Texto, '&Igrave;','Ì');
  Texto := ReplaceStr(Texto, '&igrave;','ì');
  Texto := ReplaceStr(Texto, '&Iuml;','Ï');
  Texto := ReplaceStr(Texto, '&iuml;','ï');
  Texto := ReplaceStr(Texto, '&Oacute;','Ó');
  Texto := ReplaceStr(Texto, '&oacute;','ó');
  Texto := ReplaceStr(Texto, '&Ocirc;','Ô');
  Texto := ReplaceStr(Texto, '&ocirc;','ô');
  Texto := ReplaceStr(Texto, '&Ograve;','Ò');
  Texto := ReplaceStr(Texto, '&ograve;','ò');
  Texto := ReplaceStr(Texto, '&Oslash;','Ø');
  Texto := ReplaceStr(Texto, '&oslash;','ø');
  Texto := ReplaceStr(Texto, '&Otilde;','Õ');
  Texto := ReplaceStr(Texto, '&otilde;','õ');
  Texto := ReplaceStr(Texto, '&Ouml;','Ö');
  Texto := ReplaceStr(Texto, '&ouml;','ö');
  Texto := ReplaceStr(Texto, '&Uacute;','Ú');
  Texto := ReplaceStr(Texto, '&uacute;','ú');
  Texto := ReplaceStr(Texto, '&Ucirc;','Û');
  Texto := ReplaceStr(Texto, '&ucirc;','û');
  Texto := ReplaceStr(Texto, '&Ugrave;','Ù');
  Texto := ReplaceStr(Texto, '&ugrave;','ù');
  Texto := ReplaceStr(Texto, '&Uuml;','Ü');
  Texto := ReplaceStr(Texto, '&uuml;','ü');
  Texto := ReplaceStr(Texto, '&Ccedil;','Ç');
  Texto := ReplaceStr(Texto, '&ccedil;','ç');
  Texto := ReplaceStr(Texto, '&Ntilde;','Ñ');
  Texto := ReplaceStr(Texto, '&ntilde;','ñ');
  Texto := ReplaceStr(Texto, '&lt;','<');
  Texto := ReplaceStr(Texto, '&gt;','>');
  Texto := ReplaceStr(Texto, '&amp;','&');
  Texto := ReplaceStr(Texto, '&quot;','"');
  Texto := ReplaceStr(Texto, '&reg;','®');
  Texto := ReplaceStr(Texto, '&copy;','©');
  Texto := ReplaceStr(Texto, '&Yacute;','Ý');
  Texto := ReplaceStr(Texto, '&yacute;','ý');
  Texto := ReplaceStr(Texto, '&THORN;','Þ');
  Texto := ReplaceStr(Texto, '&thorn;','þ');
  Texto := ReplaceStr(Texto, '&szlig;','ß');
  Texto := ReplaceStr(Texto, '&ordm;','º');
  Texto := ReplaceStr(Texto, '&ordf;','ª');

  Result := Texto;
end;

procedure TfrmMain.ShowBusy(blBusy: boolean);
begin
   if blBusy then
      screen.cursor := crHourglass
   else
      screen.cursor := crDefault;
end; (*  *)

procedure TfrmMain.ShowStatus(stStatus: string);
begin
   Statusbar1.Panels[1].text := stStatus;
   StatusBar1.Refresh;
end; (*  *)

procedure TfrmMain.ShowFileStatus;
begin
   Statusbar2.Panels[0].text := IntToStr(FMsgCount);
   Statusbar2.Panels[1].text := format('Mail takes up %dK on the server', [FMailBoxSize]);
   StatusBar1.Refresh;
end; (*  *)

function TfrmMain.FindAttachment(stFilename: string): integer;
var
   intIndex: Integer;
   found: boolean;
begin
   intIndex := -1;
   result := -1;
   if (Msg.MessageParts.Count < 1) then exit; //no attachments (or anything else)
   found := false;
   stFilename := uppercase(stFilename);
   repeat
      inc(intIndex);
      if (Msg.MessageParts.Items[intIndex] is TIdAttachmentMemory) then
         begin //general attachment
            if stFilename = uppercase(TIdAttachmentMemory(Msg.MessageParts.Items[intIndex]).Filename) then
               found := true;
         end;
   until found or (intIndex > Pred(Msg.MessageParts.Count));
   if found then
      result := intIndex
   else
      result := -1;
end; (*  *)

procedure TfrmMain.Button1Click(Sender: TObject);
var
   intIndex: integer;
   fname: string;
   intMSGIndex: integer;
begin
  // Find selected
   for intIndex := 0 to lvMessageParts.Items.Count - 1 do
      if lvMessageParts.Items[intIndex].Selected then
         begin
            //now find which TIdAttachment it is in MSG
            intMSGIndex := FindAttachment(lvMessageParts.Items[intIndex].caption);
            if intMSGIndex > 0 then
               begin
                  fname := FAttachPath + TIdAttachmentMemory(Msg.MessageParts.Items[intMSGIndex]).filename;
                  SaveDialog1.FileName := fname;
                  if SaveDialog1.Execute then
                     begin
                        Showbusy(true);
                        TIdAttachmentMemory(Msg.MessageParts.Items[intMSGIndex]).SaveToFile(SaveDialog1.FileName);
                        Showbusy(false);
                     end;
               end;
         end;
end;

procedure TfrmMain.RetrievePOPHeaders(inMsgCount: Integer);
var
   stTemp: string;
   intIndex: integer;
   itm: TListItem;

   function InverteData(Data: TDateTime): TDateTime;
   var
     ano, mes, dia, hora, minuto, segundo, milisegundo: word;
   begin
     DecodeDate(Data, ano, mes, dia);
     DecodeTime(Data, hora, minuto, segundo, milisegundo);

     if dia >= 13 then
       Result := Data
     else
       Result := EncodeDate(ano, dia, mes)+EncodeTime(hora, minuto, segundo, milisegundo);
   end;
begin
   stTemp := Statusbar1.Panels[1].text;
   lvHeaders.Items.Clear;
   for intIndex := 1 to inMsgCount do
      begin
         // Clear the message properties
         ShowStatus(format('Messsage %d of %d', [intIndex, inMsgCount]));
         Application.ProcessMessages;
         Msg.Clear;
         POP.RetrieveHeader(intIndex, Msg);
         // Add info to ListView
         itm := lvHeaders.Items.Add;
         itm.ImageIndex := 5;
         itm.Caption := Msg.Subject;
         itm.SubItems.Add(Msg.From.Text);
         itm.SubItems.Add(FormatDateTime('dd/mm/yyyy hh:nn', {InverteData}(Msg.Date)));
         itm.SubItems.Add(IntToStr(POP.RetrieveMsgSize(intIndex)));
         itm.SubItems.Add('n/a');
//         itm.SubItems.Add(POP.RetrieveUIDL(intIndex));
      end;
   ShowStatus(stTemp);
end;

procedure TfrmMain.ResetHeadersGrid;
begin
   lvHeaders.Items.Clear;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  {Set up authentication dialog-box}
//  frmSMTPAuthentication.cboAuthType.ItemIndex := Ord( frmMessageEditor.SMTP.AuthenticationType );
//  frmSMTPAuthentication.edtAccount.Text := fmSetup.Account.Text;
//  frmSMTPAuthentication.edtPassword.Text := fmSetup.Password.Text;
//  frmSMTPAuthentication.EnableControls;

   ResetHeadersGrid;
   ToggleStatus(False);
end;

procedure TfrmMain.ToggleStatus(const Status: Boolean);
begin
   CheckMail.Enabled := not Status;
   Retrieve.Enabled := Status;
   Delete.Enabled := Status;
   Purge.Enabled := Status;
   Disconnect.Enabled := Status;
   if Status then
      ShowStatus('Connected')
   else
      ShowStatus('Not connected');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Disconnect.Execute;
end;

procedure TfrmMain.CheckMailExecute(Sender: TObject);
begin
   Showbusy(true);
   ShowStatus('Connecting....');
   if POP.Connected then
      begin
         POP.Disconnect;
      end;
   ReadConfiguration;
   POP.Host := Pop3ServerName;
   POP.Port := Pop3ServerPort;
   POP.Username := Pop3ServerUser;
   POP.Password := Pop3ServerPassword;
   IdConnectThroughHttpProxy.Enabled := False;
   if Trim(ProxyAddress) <> '' then
   begin
    IdConnectThroughHttpProxy.Enabled := True;
    IdConnectThroughHttpProxy.Host := ProxyAddress;
    IdConnectThroughHttpProxy.Port := ProxyPort;
    IdConnectThroughHttpProxy.Username := ProxyUser;
    IdConnectThroughHttpProxy.Password := ProxyPassword;
   end;
   POP.Connect;
   ToggleStatus(True);
   FMsgCount := POP.CheckMessages;
   FMailBoxSize := POP.RetrieveMailBoxSize div 1024;
   ShowFileStatus;
   if FMsgCount > 0 then
      begin
         ShowFileStatus;
         RetrievePOPHeaders(FMsgCount);
      end
   else
      begin
         ShowStatus('No messages on server');
      end;
   Showbusy(false);
end;

procedure TfrmMain.RetrieveExecute(Sender: TObject);
var
   stTemp: string;
   intIndex: Integer;
   li: TListItem;
begin
   stTemp := Statusbar1.Panels[1].text;
   if lvHeaders.Selected = nil then
     Exit;
   //initialise
   Showbusy(true);
   Msg.Clear;
   Memo1.Clear;
   lvMessageParts.Items.Clear;
   From.Caption := '';
   Cc.Caption := '';
   Subject.Caption := '';
   Date.Caption := '';
   Receipt.Caption := '';
   Organization.Caption := '';
   Priority.Caption := '';
   pnlAttachments.visible := false;

   //get message and put into MSG
   ShowStatus('Retrieving message "' + lvHeaders.Selected.SubItems.Strings[3] + '"');
   POP.Retrieve(lvHeaders.Selected.Index + 1, Msg);
   statusbar1.Panels[0].text := lvHeaders.Selected.SubItems.Strings[3];

   //Setup fields on screen from MSG
   From.Caption := Msg.From.Text;
   Recipients.Caption := Msg.Recipients.EmailAddresses;
   Cc.Caption := Msg.CCList.EMailAddresses;
   Subject.Caption := Msg.Subject;
   Date.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', Msg.Date);
   Receipt.Caption := Msg.ReceiptRecipient.Text;
   Organization.Caption := Msg.Organization;
   Priority.Caption := IntToStr(Ord(Msg.Priority) + 1);

   if Msg.MessageParts.Count = 0 then
   begin
     Memo1.Lines.Clear;
     Memo1.Lines.AddStrings(Msg.Body);
     CarregaHTML(Msg.Body.Text, wb);
     //ShowMessage(RetiraTags(Msg.Body.Text));
   end;

   //Setup attachments list
   ShowStatus('Decoding attachments (' + IntToStr(Msg.MessageParts.Count) + ')');
   for intIndex := 0 to Pred(Msg.MessageParts.Count) do
      begin
         if (Msg.MessageParts.Items[intIndex] is TIdAttachmentFile) then
            begin //general attachment
               pnlAttachments.visible := true;
               li := lvMessageParts.Items.Add;
               li.ImageIndex := 8;
               li.Caption := TIdAttachmentFile(Msg.MessageParts.Items[intIndex]).Filename;
               li.SubItems.Add(TIdAttachmentFile(Msg.MessageParts.Items[intIndex]).ContentType);
            end
         else
            begin //body text
               if Msg.MessageParts.Items[intIndex] is TIdText then
                  begin
                     Memo1.Lines.Clear;
                     Memo1.Lines.AddStrings(TIdText(Msg.MessageParts.Items[intIndex]).Body);
                     CarregaHTML(TIdText(Msg.MessageParts.Items[intIndex]).Body.Text, wb);
                     Msg.Body := TIdText(Msg.MessageParts.Items[intIndex]).Body;
                     //ShowMessage(RetiraTags(TIdText(Msg.MessageParts.Items[intIndex]).Body.Text));
                  end
            end;
      end;
   ShowStatus(stTemp);
   Showbusy(false);
end;

procedure TfrmMain.DeleteExecute(Sender: TObject);
begin
   if lvHeaders.Selected <> nil then
      begin
         Showbusy(true);
         POP.Delete(lvHeaders.Selected.Index + 1);
         lvHeaders.Selected.ImageIndex := 3;
         Showbusy(false);
      end;
end;

procedure TfrmMain.PurgeExecute(Sender: TObject);
begin
   POP.Disconnect;
   ToggleStatus(False);
   CheckMailExecute(Sender);
end;

procedure TfrmMain.DisconnectExecute(Sender: TObject);
begin
   if POP.Connected then
      begin
         try
            POP.Reset;
         except
            ShowStatus('Your POP server doesn''t have Reset feature');
         end;
         POP.Disconnect;
         ToggleStatus(False);
      end;
end;

procedure TfrmMain.SetupExecute(Sender: TObject);
begin
  Application.CreateForm(TfmSetup, fmSetup);
  fmSetup.ShowModal;
end;

procedure TfrmMain.SendExecute(Sender: TObject);
begin
   frmMessageEditor.ShowModal;
end;

procedure TfrmMain.lvMessagePartsClick(Sender: TObject);
begin
  {display message parts we selected}
   if lvMessageParts.Selected <> nil then
      begin
         if lvMessageParts.Selected.Index > Msg.MessageParts.Count then
            begin
               MessageDlg('Unknown index', mtInformation, [mbOK], 0);
            end
         else
            begin
            showmessage(TIdAttachmentMemory(Msg.MessageParts.Items[lvMessageParts.Selected.Index]).Filename);
            end;
      end;
end;
//      Memo1.Lines.AddStrings(TIdText(Msg.MessageParts.Items[lvMessageParts.Selected.Index]).Body);

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
   close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // read the configuration from ini file
  ReadConfiguration;

   name := 'frmMain';

   //setup path to put attachments into
   FAttachPath := IncludeTrailingPathDelimiter(ExtractFileDir(Application.exename)); //starting directory
   FAttachPath := FAttachPath + 'Attach\';
   if not DirectoryExists(FAttachPath) then ForceDirectories(FAttachPath);

   FMsgCount := 0; FMailBoxSize := 0;
   Showbusy(false);
end;

procedure TfrmMain.GeraExcelExecute(Sender: TObject);
var
  i, j: integer;
  Body, MatriculaNome, Solicitante, NomeArquivo, ValorParcela, SaldoDevedor, Orgao: string;
  ExcelApp: OleVariant;

  function Conteudo(Chave: string): string;
  var
    P1, P2: integer;
    Texto: string;
  begin
    Chave := AnsiLowerCase(Chave);
    Texto := AnsiLowerCase(Body);
    P1 := AnsiPos(Chave, Texto);
    Result := '';
    if P1 > 0 then
    begin
      P2 := PosEx(#13, Texto, P1);
      Result := Trim(Copy(Body,P1+Length(Chave), P2-(P1+Length(Chave))));
    end;
  end;


begin
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Add;
  ExcelApp.Visible := True;

  ExcelApp.Cells[1, 1] := 'CONSIGNANTE';
  ExcelApp.Cells[1, 2] := 'CONSIGNATÁRIA';
  ExcelApp.Cells[1, 3] := 'MATRÍCULA';
  ExcelApp.Cells[1, 4] := 'NOME';
  ExcelApp.Cells[1, 5] := 'CPF';
  ExcelApp.Cells[1, 6] := 'N. ADE';
  ExcelApp.Cells[1, 7] := 'IDENT. ADE';
  ExcelApp.Cells[1, 8] := 'SERVIÇO';
  ExcelApp.Cells[1, 9] := 'VLR.PARCELA';
  ExcelApp.Cells[1,10] := 'PRAZO';
  ExcelApp.Cells[1,11] := 'PARC.PAGAS';
  ExcelApp.Cells[1,12] := 'SALDO DEVEDOR';
  ExcelApp.Cells[1,13] := 'SOLICITANTE';
  ExcelApp.Cells[1,14] := 'DATA/HORA';
  ExcelApp.Cells[1,15] := 'BANCO';

  j := 2;
  ProgressBar.Visible := True;
  ProgressBar.Max := lvHeaders.Items.Count;
  for i := 0 to lvHeaders.Items.Count-1 do
  begin
    lvHeaders.Items[i].Selected := True;
    RetrieveExecute(Sender);
    Body := RetiraTags(Msg.Body.Text);
    if (Pos('Consignante',Body) > 0) or (Pos('Gestor',Body) > 0) then
    begin
      Orgao := Conteudo('Consignante:');
      if Orgao = '' then
        Orgao := Conteudo('Gestor:');
      ExcelApp.Cells[j, 1] := Orgao;

      ExcelApp.Cells[j, 2] := Conteudo('Consignatária:');
      MatriculaNome := Conteudo('Militar/Pensionista:');
      if MatriculaNome = '' then
        MatriculaNome := Conteudo('Servidor:');
      ExcelApp.Cells[j, 3] := Trim(Copy(MatriculaNome,1,Pos('-',MatriculaNome)-1));
      ExcelApp.Cells[j, 4] := Trim(Copy(MatriculaNome,Pos('-',MatriculaNome)+1,100));
      ExcelApp.Cells[j, 5] := Conteudo('CPF:');
      ExcelApp.Cells[j, 6] := Conteudo('N. ADE:');
      ExcelApp.Cells[j, 7] := Conteudo('Ident. ADE:');
      ExcelApp.Cells[j, 8] := Conteudo('serviço:');

      ValorParcela := Conteudo('Vlr.Prest. (R$):');
      if ValorParcela <> '' then
        ExcelApp.Cells[j, 9] := ValorParcela
      else
        ExcelApp.Cells[j, 9] := Conteudo('Vlr. Prest. (R$):');

      ExcelApp.Cells[j,10] := Conteudo('N. Prest. (meses):');
      ExcelApp.Cells[j,11] := Conteudo('Parcelas Pagas:');

      SaldoDevedor := ReplaceStr(Conteudo('Vlr. Saldo Devedor:'),'R$','');
      if SaldoDevedor = '' then
        SaldoDevedor := Conteudo('Vlr. Saldo Devedor (R$):');
      ExcelApp.Cells[j,12] := SaldoDevedor;

      Solicitante := Conteudo('consignatária ');

      if Pos(' solicitou um novo', Solicitante) = 0 then
        ExcelApp.Cells[j,13] := Solicitante
      else
        ExcelApp.Cells[j,13] := Copy(Solicitante,1,Pos(' solicitou um novo', Solicitante)-1);

      ExcelApp.Cells[j,14] := #39+lvHeaders.Items[i].SubItems[1];

      ExcelApp.Cells[j,15] := NomeBanco;

      Inc(j);
    end;
    DeleteExecute(Sender);
    ProgressBar.Position := i;
  end;
  ProgressBar.Visible := False;

  NomeArquivo := IncludeTrailingPathDelimiter(OutputFolder) +'RET_'+FormatDateTime('yyyymmddhhnnss', Now);
  ExcelApp.WorkBooks[1].SaveAs( NomeArquivo );

  PurgeExecute(Sender);
  lvHeaders.Items.Clear;
end;

procedure TfrmMain.pnlServerNameClick(Sender: TObject);
begin
   SetupExecute(Sender); //show setup screen
end;

procedure TfrmMain.ReadConfiguration;
var
  MailIni: TIniFile;
begin
  MailIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Mail.ini');
  with MailIni do begin
    Pop3ServerName := ReadString('Pop3', 'ServerName', 'pop3.server.com');
    Pop3ServerPort := StrToInt(ReadString('Pop3', 'ServerPort', '110'));
    Pop3ServerUser := ReadString('Pop3', 'ServerUser', 'your_login');
    Pop3ServerPassword := ReadString('Pop3', 'ServerPassword', 'your_password');

    SmtpServerName := ReadString('Smtp', 'ServerName', 'smtp.server.com');
    SmtpServerPort := StrToInt(ReadString('Smtp', 'ServerPort', '25'));
    SmtpServerUser := ReadString('Smtp', 'ServerUser', 'your_login');
    SmtpServerPassword := ReadString('Smtp', 'ServerPassword', 'your_password');
    SmtpAuthType := ReadInteger('Smtp', 'SMTPAuthenticationType', 0);

    OutputFolder := ReadString('Export', 'OutputFolder', '');
    NomeBanco := ReadString('Export', 'NomeBanco', '');
    Interval := ReadInteger('Export','Interval',5);

    ProxyAddress := ReadString('Proxy', 'ProxyAddress', '');
    ProxyPort := StrToInt(ReadString('Proxy', 'ProxyPort', '8080'));
    ProxyUser := ReadString('Proxy', 'ProxyUser', '');
    ProxyPassword := ReadString('Proxy', 'ProxyPassword', '');

    UserEmail := ReadString('Email', 'PersonalEmail', 'someaddress@somewhere.com');
  end;
  MailIni.Free;
end;

procedure TfrmMain.lvHeadersDblClick(Sender: TObject);
begin
  RetrieveExecute(Sender);
end;

procedure TfrmMain.Selectfromdeletion1Click(Sender: TObject);
var i : integer;
begin
for i := 0 to lvHeaders.Items.Count - 1 do
  begin
  Showbusy(true);
  POP.Delete(i+1);
  lvHeaders.Items[i].ImageIndex := 3;
  Showbusy(false);
  end;
end;

end.

