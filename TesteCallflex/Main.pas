unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StrUtils, OleServer, callflex_mid_TLB, Agendamento,
  StdCtrls;
type

  TfrmMain = class(TForm)
    lblStatus: TLabel;
    cmdClear: TButton;
    cmdExit: TButton;
    frmLogin: TGroupBox;
    Label1: TLabel;
    txtLogin: TEdit;
    cmdLogin: TButton;
    cmdLogoff: TButton;
    frmPausa: TGroupBox;
    Label2: TLabel;
    cmdPause: TButton;
    cmdUnpause: TButton;
    frmTransf: TGroupBox;
    Label3: TLabel;
    txtTransf: TEdit;
    cmdTransf: TButton;
    frmDiscar: TGroupBox;
    Label4: TLabel;
    txtNum: TEdit;
    cmdCall: TButton;
    cmdHangup: TButton;
    frmControl: TGroupBox;
    cmdVersion: TButton;
    txtLog: TMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    cmdGetQueues: TButton;
    cmdGetAgentQueues: TButton;
    cmdGetAgents: TButton;
    cmdAskState: TButton;
    cmdMute: TButton;
    cmdUnmute: TButton;
    cmdOpenSF: TButton;
    cmdHold: TButton;
    cmdUnhold: TButton;
    GroupBox3: TGroupBox;
    cmdAgendamento: TButton;
    Button1: TButton;

    procedure cmdVersionClick(Sender: TObject);
    procedure cmdOpenSFClick(Sender: TObject);
    procedure cmdMuteClick(Sender: TObject);
    procedure cmdUnmuteClick(Sender: TObject);
    procedure cmdGetQueuesClick(Sender: TObject);
    procedure cmdGetAgentQueuesClick(Sender: TObject);
    procedure cmdGetAgentsClick(Sender: TObject);
    procedure cmdAskStateClick(Sender: TObject);
    procedure addLog(v: string);
    function translatecode(code: string) : string;
    procedure cmdLoginClick(Sender: TObject);
    procedure cmdLogoffClick(Sender: TObject);
    procedure cmdHangupClick(Sender: TObject);
    procedure cmdCallClick(Sender: TObject);
    procedure cmdTransfClick(Sender: TObject);
    procedure cmdUnpauseClick(Sender: TObject);
    procedure cmdPauseClick(Sender: TObject);
    procedure cmdHoldClick(Sender: TObject);
    procedure cmdUnholdClick(Sender: TObject);
    procedure cmdClearClick(Sender: TObject);
    procedure cmdExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmdAgendamentoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

   protected
     procedure econnect(Sender: TObject);
     procedure edisconnect(Sender: TObject);
     procedure elogin(Sender: TObject; var Agente: WideString; var Login: WideString);
     procedure elogoff(Sender: TObject);
     procedure epause(Sender: TObject; var pTipo: WideString; var pTime: WideString);
     procedure eunpause(Sender: TObject);
     procedure ering(Sender: TObject; var callnum: WideString; var callid: WideString; var queue: WideString);
     procedure eincomingcall(Sender: TObject; var callnum: WideString; var callid: WideString; var queue: WideString; var crmid: WideString; var uniqueid: WideString);
     procedure eoutboundcall(Sender: TObject; var callnum: WideString);
     procedure eoutboundcallring(Sender: TObject; var callnum: WideString);
     procedure eoutboundcallanswer(Sender: TObject; var callnum: WideString);
     procedure eoutboundcallfailure(Sender: TObject; var reason: WideString; var callnum: WideString);
     procedure ehangup(Sender: TObject; var callnum: WideString; var uniqueid: WideString; var duracao: WideString);
     procedure emessage(Sender: TObject; var code: WideString);
   public
     clx: Tcallflex_middle;
  end;
var
  frmMain: TfrmMain;
  frmAgendamento: TfrmAgendamento;


implementation

{$R *.dfm}

// APLICA��O
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //INICIALIZA OBJETO
  clx := Tcallflex_middle.Create(Self);
  clx.Connect;

  //AGREGAR EVENTOS �S FUN��ES
  clx.Oneconnect := econnect;
  clx.Onedisconnect := edisconnect;
  clx.Onering := ering;
  clx.Oneincomingcall := eincomingcall;
  clx.Oneoutboundcall := eoutboundcall;
  clx.Oneoutboundcallring := eoutboundcallring;
  clx.Oneoutboundcallanswer := eoutboundcallanswer;
  clx.Oneoutboundcallfailure := eoutboundcallfailure;
  clx.Onehangup := ehangup;
  clx.Onepause := epause;
  clx.Oneunpause := eunpause;
  clx.Onelogin := elogin;
  clx.Onelogoff := elogoff;
  clx.Onemessage := emessage;

  //INSTANCIA FORMULARIOS
  frmAgendamento := TfrmAgendamento.Create(Self);
  frmAgendamento.clx := clx;
end;


// INTERFACE
/////////////////////////////////////////////////////////
procedure TfrmMain.cmdOpenSFClick(Sender: TObject);
begin
  clx.fOpenSF;
end;

procedure TfrmMain.cmdVersionClick(Sender: TObject);
begin
  addLog('Vers�o da DLL: ' + clx.fDLLVersion)
end;

procedure TfrmMain.cmdGetQueuesClick(Sender: TObject);
var ret: callflex_mid_TLB.tRGetQueues;
begin
    ret := clx.fGetQueues();

    If ret.ReturnState = sSuccess Then
        addLog(ret.ReturnVal)
    Else
        ShowMessage('Ocorreu um erro.')
end;

procedure TfrmMain.cmdHangupClick(Sender: TObject);
begin
    clx.fHangup;
end;

procedure TfrmMain.cmdHoldClick(Sender: TObject);
begin
    If Not clx.fHold Then
        ShowMessage('Ocorreu um erro durante a chamada do m�todo.');
end;

procedure TfrmMain.cmdLoginClick(Sender: TObject);
var ret: callflex_mid_TLB.tRLogin;
var login: WideString;
begin
    login := txtlogin.Text;
    ret := clx.fLogin(login);

    If ret.ReturnState = sFail then
        ShowMessage('Falha no login.' + sLineBreak + sLineBreak + translatecode(ret.MsgCode))
    else if ret.ReturnState = sSuccess then
        ShowMessage('Login efetuado com sucesso!' + sLineBreak + sLineBreak + 'Agente: ' + ret.agente + sLineBreak + 'Login: ' + ret.login + ' / AfterCall: ' + ret.Aftercall + ' / Discador: ' + booltostr(ret.Discador) + ' / PausaId: ' + inttostr(ret.Pausaid))
    else
        ShowMessage('Ocorreu um erro.');
end;

procedure TfrmMain.cmdLogoffClick(Sender: TObject);
var ret: callflex_mid_TLB.tRLogoff;
begin
    ret := clx.fLogoff;

    if ret.ReturnState = sFail Then
        ShowMessage('Falha no logoff.' + sLineBreak + sLineBreak + translatecode(ret.MsgCode))
    else if ret.ReturnState = sSuccess Then
        ShowMessage('Logoff efetuado com sucesso! Ser� disparado tamb�m um evento de logoff.')
    else
        ShowMessage('Ocorreu um erro.')
end;

procedure TfrmMain.cmdGetAgentQueuesClick(Sender: TObject);
var ret: callflex_mid_TLB.tRGetAgentQueues;
begin
    ret := clx.fGetAgentQueues();

    If ret.ReturnState = sSuccess Then
        addLog(ret.ReturnVal)
    Else
        ShowMessage('Ocorreu um erro.')
end;

procedure TfrmMain.cmdGetAgentsClick(Sender: TObject);
var ret: callflex_mid_TLB.tRGetAgents;
begin
    ret := clx.fGetAgents();

    If ret.ReturnState = sSuccess Then
        addLog(ret.ReturnVal)
    Else
        ShowMessage('Ocorreu um erro.')
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  ShowMessage('N�o implementado nesta aplica��o de exemplo. A funcionalidade est� dispon�vel na dll, verifique a documenta��o para maiores refer�ncias.');
end;

procedure TfrmMain.cmdAgendamentoClick(Sender: TObject);
begin
  frmAgendamento.Show;
end;

procedure TfrmMain.cmdAskStateClick(Sender: TObject);
var ret: callflex_mid_TLB.tRGetState;
begin
    ret := clx.fGetState();

    If ret.ReturnState = sSuccess Then
        //ENUM: ret.State
        addLog('Fone Status: ' + 'a' + ' / Hold: ' + booltostr(ret.Hold) + ' / Mute: ' + booltostr(ret.Mute) + ' / Aftercall: ' + ret.Aftercall + ' / PausaID: ' + inttostr(ret.Pausaid) + ' / Discador: ' + booltostr(ret.Discador))
    Else
        ShowMessage('Ocorreu um erro.')
end;

procedure TfrmMain.cmdCallClick(Sender: TObject);
var num: WideString;
begin
    num := txtnum.Text;
    If Not clx.fCall(num) Then
        ShowMessage('Ocorreu um erro durante a chamada do m�todo.');
end;

procedure TfrmMain.cmdClearClick(Sender: TObject);
begin
  txtlog.Clear;
end;

procedure TfrmMain.cmdExitClick(Sender: TObject);
begin
  frmMain.clx.Free;
  frmAgendamento.Free;
  application.Terminate;
end;

procedure TfrmMain.cmdTransfClick(Sender: TObject);
var num: WideString;
begin
    num := txtTransf.Text;
    clx.fTransf(num);
end;

procedure TfrmMain.cmdMuteClick(Sender: TObject);
begin
    If Not clx.fMute Then
        ShowMessage('Ocorreu um erro durante a chamada do m�todo.');
end;

procedure TfrmMain.cmdUnholdClick(Sender: TObject);
begin
    If Not clx.fUnHold Then
        ShowMessage('Ocorreu um erro durante a chamada do m�todo.');
end;

procedure TfrmMain.cmdUnmuteClick(Sender: TObject);
begin
    If Not clx.fUnMute Then
        ShowMessage('Ocorreu um erro durante a chamada do m�todo.');
end;

procedure TfrmMain.cmdPauseClick(Sender: TObject);
var ret: callflex_mid_TLB.tRPause;
var tipopausa: SmallInt;
begin
    tipopausa := 1;
    ret := clx.fPause(tipopausa);

    if ret.ReturnState = sFail then
        ShowMessage('Falha ao tentar colocar em pausa.' + sLineBreak + sLineBreak + translatecode(ret.MsgCode))
    else if ret.ReturnState = sSuccess Then
        ShowMessage('Pausado com sucesso! Ser� disparado tamb�m um evento de pausa.' + sLineBreak + sLineBreak + 'Id da Pausa: ' + ret.PauseId + sLineBreak + 'Inicio da pausa: ' + ret.StartTime)
    else
        ShowMessage('Ocorreu um erro.');
end;

procedure TfrmMain.cmdUnpauseClick(Sender: TObject);
var ret: callflex_mid_TLB.tRUnpause;
begin
    ret := clx.fUnpause;

    If ret.ReturnState = sFail Then
        ShowMessage('Falha ao tentar tirar de pausa.' + sLineBreak + sLineBreak + translatecode(ret.MsgCode))
    else if ret.ReturnState = sSuccess Then
        ShowMessage('Despausado com sucesso! Ser� disparado tamb�m um evento de despausa.')
    else
        ShowMessage('Ocorreu um erro.');
end;

// EVENTOS
/////////////////////////////////////////////////////////
{
EVENTO: CONEX�O DO COMPONENTE DE INTEGRA��O
Ocorre quando o componente de integra��o estabelece comunica��o com o Softphone CallFlex.
Par�metros:
  Sem parametros de retorno.
}
procedure Tfrmmain.econnect(Sender: TObject);
begin
   lblStatus.Caption := 'Conectado';
end;

{
EVENTO: DESCONEX�O DO COMPONENTE DE INTEGRA��O
Ocorre quando o componente de integra��o perde a comunica��o com o Softphone CallFlex.
Par�metros:
  Sem parametros de retorno.' +
}
procedure Tfrmmain.edisconnect(Sender: TObject);
begin
   lblStatus.Caption := 'Desconectado';
end;

{
EVENTO: RAMAL TOCANDO
Ocorre quando o ramal recebe uma liga��o e est� tocando, por�m ainda n�o foi atendida.
Par�metros:
  @callnum: Telefone
  @callid: Nome recebido pela bina
  @queue: Fila da qual a chamada foi recebida
}
procedure Tfrmmain.ering(Sender: TObject; var callnum: WideString; var callid: WideString; var queue: WideString);
begin
  addLog('O ramal est� tocando.' + sLineBreak + 'Telefone: ' + callnum + sLineBreak + 'Bina: ' + callid + sLineBreak + 'Fila: ' + queue);
end;

{
EVENTO: CHAMADA ENTRANTE
Ocorre quando o ramal recebe qualquer liga��o do PABX
Par�metros:
  @callnum: Telefone
  @callid: Nome recebido pela bina
  @queue: Fila da qual a chamada foi recebida
  @crmid: Caso chamada tenha sido recebida pelo discador o valor � preenchido com o ID do CRM recebido na importa��o de mailing.
  @uniqueid: Id �nico da chamada no discador
}
procedure Tfrmmain.eincomingcall(Sender: TObject; var callnum: WideString; var callid: WideString; var queue: WideString; var crmid: WideString; var uniqueid: WideString);
begin
  addLog('Chamada recebida.' + sLineBreak + 'Telefone: ' + callnum + sLineBreak + 'Bina: ' + callid + sLineBreak + 'Fila: ' + queue + sLineBreak + 'ID do CRM: ' + crmid + 'UniqueID: ' + uniqueid);
end;

{
EVENTO: CHAMADA SAINTE
Ocorre quando o ramal realiza uma liga��o do tipo sainte.
Par�metros:
  @callnum
}
procedure Tfrmmain.eoutboundcall(Sender: TObject; var callnum: WideString);
begin
  addLog('Chamada sainte.' + sLineBreak + 'Telefone discado: ' + callnum);
end;

{
EVENTO: CHAMADA SAINTE RINGANDO
Ocorre quando o ramal realiza uma liga��o do tipo sainte e come�a chamar
Par�metros:
  @callnum
}
procedure Tfrmmain.eoutboundcallring(Sender: TObject; var callnum: WideString);
begin
  addLog('Chamada sainte chamando.' + sLineBreak + 'Telefone discado: ' + callnum);
end;

{
EVENTO: CHAMADA SAINTE ATENDIDA
Ocorre quando o ramal realiza uma liga��o do tipo sainte e � atendida
Par�metros:
  @callnum
}
procedure Tfrmmain.eoutboundcallanswer(Sender: TObject; var callnum: WideString);
begin
  addLog('Chamada sainte atendida.' + sLineBreak + 'Telefone discado: ' + callnum);
end;

{
EVENTO: CHAMADA SAINTE ATENDIDA
Ocorre quando o ramal realiza uma liga��o do tipo sainte e � atendida
Par�metros:
  @callnum
}
procedure Tfrmmain.eoutboundcallfailure(Sender: TObject; var reason: WideString; var callnum: WideString);
begin
  addLog('Chamada sainte falhou.' + sLineBreak + 'Motivo: ' + reason + sLineBreak + 'Telefone discado: ' + callnum);
end;

{
EVENTO: CHAMADA DESLIGADA
Ocorre quando o ramal finaliza o atendimento de uma chamada
Par�metros:
  @callnum: Telefone
  @uniqueid: Id unico da chamada no sistema CallFlex
  @ducacao: Dura��o total da chamada
}
procedure Tfrmmain.ehangup(Sender: TObject; var callnum: WideString; var uniqueid: WideString; var duracao: WideString);
begin
  addLog('A chamada foi desligada.' + sLineBreak + 'Telefone: ' + callnum + sLineBreak + 'UniqueId: ' + uniqueid);
end;

{
EVENTO: LOGIN
Ocorre sempre que agente se logar no sistema (independente da origem da requisi��o)
Par�metros:
  @agente: C�digo Callflex do agente.
  @login: Nome de usu�rio que agente utiliza para se logar.
}
procedure TfrmMain.elogin(Sender: TObject; var Agente: WideString; var Login: WideString);
begin
    addLog('Login efetuado com sucesso! Agente: ' + Agente + ' / Login: ' + Login);
end;

{
EVENTO: LOGOFF
Ocorre sempre que agente sair do sistema (independente da origem da requisi��o)
Par�metros:
  Sem parametros de retorno.
}
procedure TfrmMain.elogoff(Sender: TObject);
begin
    addLog('Agente deslogado!');
end;

{
EVENTO: ENTRADA DE PAUSA
Ocorre sempre que agente for colocado em pausa (independente da origem da requisi��o)
Par�metros:
  @ptipo: Tipo da pausa em que agente entrou
  @ptime: Hor�rio em que agente entrou em pausa
}
procedure TfrmMain.epause(Sender: TObject; var pTipo: WideString; var pTime: WideString);
begin
  addLog('Agente pausado!' + sLineBreak + 'Tipo da pausa: ' + ptipo + sLineBreak + 'Timestamp: ' + ptime);
end;

{
EVENTO: SAIDA DE PAUSA
Ocorre sempre que agente sair da pausa (independente da origem da requisi��o)
Par�metros:
  Sem parametros de retorno.
}
procedure TfrmMain.eunpause(Sender: TObject);
begin
  addLog('Agente despausado!');
end;


{
EVENTO: MENSAGEM
Ocorre sempre que alguma requisi��o de a��o falhar.
Par�metros:
  @code: Cont�m o c�digo do que ocorreu.
}
procedure Tfrmmain.emessage(Sender: TObject; var code: WideString);
begin
    addLog(translatecode(code))
end;


//FUN��ES INTERNAS
/////////////////////////////////////////////////////////
procedure Tfrmmain.addLog(v: string);
begin
    //ADICIONA MENSAGEM AO LOG
    txtLog.lines.Add(v + sLineBreak + '-------------------------------------------------------');
end;

{
FUN��O: TRADUZIR CODIGO DE MENSAGEM
returna a descri��o do c�digo informado no par�metro
Par�metros:
  @code: Descri��o do c�digo a ser retornado
}
function Tfrmmain.translatecode(code: String) : string;
begin
    Case AnsiIndexStr(code, ['003', '004', '007', '012', '013', '014', '016', '024', '032', '033', '034', '038', '039', '040', '041', '042']) of
         0:Result := 'O agente n�o est� pausado'; //003
         1:Result := 'Tipo de pausa especificado invalido.'; //004
         2:Result := 'Agente n�o logado.'; //007
         3:Result := 'O usu�rio j� est� logado em outro ramal.'; //012
         4:Result := 'Usu�rio ou senha incorretos.'; //013
         5:Result := 'Seu usu�rio n�o pertence a nenhuma fila. Entre em contato com seu supervisor.'; //014
         6:Result := 'O agente j� est� logado.'; //016
         7:Result := 'Executado com sucesso.'; //024
         8:Result := 'O limite de agentes logados para o servidor PABX que seu ramal pertence foi atingido. N�o foi poss�vel realizar o login.'; //032
         9:Result := 'A licen�a do sistema expirou, n�o � poss�vel realizar o login.'; //033
        10:Result := 'N�o foi poss�vel realizar o login. Entre em contato com o suporte CallFlex e informe o c�digo de ocorr�ncia 034.'; //034
        11:Result := 'Hold n�o est� ativo'; //038
        12:Result := 'Hold j� est� ativo'; //039
        13:Result := 'Mute n�o est� ativo'; //040
        14:Result := 'Mute j� est� ativo'; //041
        15:Result := 'N�o h� nenhuma liga��o ativa.'; //042
        -1:Result := 'Sem c�digo de erro: ' + code;
    end;
end;

end.
