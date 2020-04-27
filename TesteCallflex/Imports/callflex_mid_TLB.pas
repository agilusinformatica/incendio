unit callflex_mid_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 31855 $
// File generated on 22/12/2017 09:29:50 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Agilus Desenvolvimento\Incendio\TesteCallflex\callflex_mid.TLB (1)
// LIBID: {04B3C396-EF4B-4C28-8897-AC8117344E89}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (Tcallflex_middle) : No Server registered for this CoClass
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  callflex_midMajorVersion = 23;
  callflex_midMinorVersion = 2;

  LIBID_callflex_mid: TGUID = '{04B3C396-EF4B-4C28-8897-AC8117344E89}';

  IID__callflex_middle: TGUID = '{E451CF62-FB99-4A14-8CBB-672EF93D09E2}';
  DIID___callflex_middle: TGUID = '{668F68C2-C2F3-4B1A-BEDA-0985E1A531AC}';
  CLASS_callflex_middle: TGUID = '{634377C6-9067-4DC0-93C0-43EF651A22CF}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum ephonestate
type
  ephonestate = TOleEnum;
const
  Offline = $00000000;
  OnLine = $00000001;
  Dialing = $00000002;
  Ringing = $00000003;
  Talking = $00000004;
  Transfer = $00000005;

// Constants for enum eRetState
type
  eRetState = TOleEnum;
const
  sTimeout = $00000000;
  sInvalidParam = $00000001;
  sDisconected = $00000002;
  sSuccess = $00000003;
  sFail = $00000004;
  sIsWorking = $00000005;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _callflex_middle = interface;
  _callflex_middleDisp = dispinterface;
  __callflex_middle = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  callflex_middle = _callflex_middle;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//

  callflex_middle___v0 = _callflex_middle; 
  callflex_middle___v1 = _callflex_middle; 

  tRLogin = record
    Agente: WideString;
    Login: WideString;
    ReturnState: eRetState;
    MsgCode: WideString;
    Aftercall: WideString;
    Pausaid: Smallint;
    Discador: WordBool;
    FilaMestre: Smallint;
  end;

  tRLogoff = record
    ReturnState: eRetState;
    MsgCode: WideString;
  end;

  tRPause = record
    PauseId: WideString;
    StartTime: WideString;
    ReturnState: eRetState;
    MsgCode: WideString;
    ActionID: Integer;
  end;

  tRUnpause = record
    ReturnState: eRetState;
    MsgCode: WideString;
    ActionID: Integer;
  end;

  tRGetState = record
    State: ephonestate;
    Hold: WordBool;
    Mute: WordBool;
    Aftercall: WideString;
    Pausaid: Smallint;
    Discador: WordBool;
    ReturnState: eRetState;
    MsgCode: WideString;
  end;

  tRGetQueues = record
    ReturnVal: WideString;
    ReturnState: eRetState;
    MsgCode: WideString;
  end;

  tRGetAgentQueues = record
    ReturnVal: WideString;
    ReturnState: eRetState;
    MsgCode: WideString;
  end;

  tRGetAgents = record
    ReturnVal: WideString;
    ReturnState: eRetState;
    MsgCode: WideString;
  end;


// *********************************************************************//
// Interface: _callflex_middle
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {E451CF62-FB99-4A14-8CBB-672EF93D09E2}
// *********************************************************************//
  _callflex_middle = interface(IDispatch)
    ['{E451CF62-FB99-4A14-8CBB-672EF93D09E2}']
    procedure GhostMethod__callflex_middle_28_1; safecall;
    procedure GhostMethod__callflex_middle_32_2; safecall;
    procedure GhostMethod__callflex_middle_36_3; safecall;
    procedure GhostMethod__callflex_middle_40_4; safecall;
    procedure GhostMethod__callflex_middle_44_5; safecall;
    procedure GhostMethod__callflex_middle_48_6; safecall;
    procedure GhostMethod__callflex_middle_52_7; safecall;
    procedure GhostMethod__callflex_middle_56_8; safecall;
    procedure GhostMethod__callflex_middle_60_9; safecall;
    procedure GhostMethod__callflex_middle_64_10; safecall;
    procedure GhostMethod__callflex_middle_68_11; safecall;
    procedure GhostMethod__callflex_middle_72_12; safecall;
    procedure GhostMethod__callflex_middle_76_13; safecall;
    procedure GhostMethod__callflex_middle_80_14; safecall;
    procedure GhostMethod__callflex_middle_84_15; safecall;
    procedure GhostMethod__callflex_middle_88_16; safecall;
    procedure GhostMethod__callflex_middle_92_17; safecall;
    procedure GhostMethod__callflex_middle_96_18; safecall;
    procedure GhostMethod__callflex_middle_100_19; safecall;
    procedure GhostMethod__callflex_middle_104_20; safecall;
    procedure GhostMethod__callflex_middle_108_21; safecall;
    procedure GhostMethod__callflex_middle_112_22; safecall;
    procedure GhostMethod__callflex_middle_116_23; safecall;
    function IsConnected: WordBool; safecall;
    function fLogin(var p_login: WideString): tRLogin; safecall;
    function fLogoff: tRLogoff; safecall;
    function fPause(var p_tipo: Smallint): tRPause; safecall;
    function fUnpause: tRUnpause; safecall;
    function fMute: WordBool; safecall;
    function fUnMute: WordBool; safecall;
    function fHold: WordBool; safecall;
    function fUnHold: WordBool; safecall;
    function fCall(var num: WideString): WordBool; safecall;
    function fCallWithID(var num: WideString; var name: WideString; var crmid: WideString): WordBool; safecall;
    function fHangup: WordBool; safecall;
    function fHangupTransf: WordBool; safecall;
    function fTransf(var num: WideString): WordBool; safecall;
    function fTransfWithID(var num: WideString; var name: WideString; var crmid: WideString): WordBool; safecall;
    function fGetState: tRGetState; safecall;
    function fGetQueues: tRGetQueues; safecall;
    function fGetAgentQueues: tRGetAgentQueues; safecall;
    function fGetAgents: tRGetAgents; safecall;
    function fOpenSF: WordBool; safecall;
    function fSchedulePrivate(var name: WideString; var clientid: WideString; var num: WideString; 
                              var agendata: WideString): WordBool; safecall;
    function fSchedulePublic(var name: WideString; var clientid: WideString; var num: WideString; 
                             var agendata: WideString; var queue: Smallint): WordBool; safecall;
    function fReturnStatus(var uniqueid: WideString; var Status: WideString): WordBool; safecall;
    function fDLLVersion: WideString; safecall;
    function fTransfAssistida(var num: WideString): WordBool; safecall;
    function fReturnStatusExtra(var uniqueid: WideString; var chave: WideString; 
                                var valor: WideString; var identificador1: WideString; 
                                var identificador2: WideString; var identificador3: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  _callflex_middleDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {E451CF62-FB99-4A14-8CBB-672EF93D09E2}
// *********************************************************************//
  _callflex_middleDisp = dispinterface
    ['{E451CF62-FB99-4A14-8CBB-672EF93D09E2}']
    procedure GhostMethod__callflex_middle_28_1; dispid 1610743808;
    procedure GhostMethod__callflex_middle_32_2; dispid 1610743809;
    procedure GhostMethod__callflex_middle_36_3; dispid 1610743810;
    procedure GhostMethod__callflex_middle_40_4; dispid 1610743811;
    procedure GhostMethod__callflex_middle_44_5; dispid 1610743812;
    procedure GhostMethod__callflex_middle_48_6; dispid 1610743813;
    procedure GhostMethod__callflex_middle_52_7; dispid 1610743814;
    procedure GhostMethod__callflex_middle_56_8; dispid 1610743815;
    procedure GhostMethod__callflex_middle_60_9; dispid 1610743816;
    procedure GhostMethod__callflex_middle_64_10; dispid 1610743817;
    procedure GhostMethod__callflex_middle_68_11; dispid 1610743818;
    procedure GhostMethod__callflex_middle_72_12; dispid 1610743819;
    procedure GhostMethod__callflex_middle_76_13; dispid 1610743820;
    procedure GhostMethod__callflex_middle_80_14; dispid 1610743821;
    procedure GhostMethod__callflex_middle_84_15; dispid 1610743822;
    procedure GhostMethod__callflex_middle_88_16; dispid 1610743823;
    procedure GhostMethod__callflex_middle_92_17; dispid 1610743824;
    procedure GhostMethod__callflex_middle_96_18; dispid 1610743825;
    procedure GhostMethod__callflex_middle_100_19; dispid 1610743826;
    procedure GhostMethod__callflex_middle_104_20; dispid 1610743827;
    procedure GhostMethod__callflex_middle_108_21; dispid 1610743828;
    procedure GhostMethod__callflex_middle_112_22; dispid 1610743829;
    procedure GhostMethod__callflex_middle_116_23; dispid 1610743830;
    function IsConnected: WordBool; dispid 1610810051;
    function fLogin(var p_login: WideString): {??tRLogin}OleVariant; dispid 1610810052;
    function fLogoff: {??tRLogoff}OleVariant; dispid 1610810053;
    function fPause(var p_tipo: Smallint): {??tRPause}OleVariant; dispid 1610810054;
    function fUnpause: {??tRUnpause}OleVariant; dispid 1610810055;
    function fMute: WordBool; dispid 1610810056;
    function fUnMute: WordBool; dispid 1610810057;
    function fHold: WordBool; dispid 1610810058;
    function fUnHold: WordBool; dispid 1610810059;
    function fCall(var num: WideString): WordBool; dispid 1610810060;
    function fCallWithID(var num: WideString; var name: WideString; var crmid: WideString): WordBool; dispid 1610810061;
    function fHangup: WordBool; dispid 1610810062;
    function fHangupTransf: WordBool; dispid 1610810063;
    function fTransf(var num: WideString): WordBool; dispid 1610810064;
    function fTransfWithID(var num: WideString; var name: WideString; var crmid: WideString): WordBool; dispid 1610810065;
    function fGetState: {??tRGetState}OleVariant; dispid 1610810066;
    function fGetQueues: {??tRGetQueues}OleVariant; dispid 1610810067;
    function fGetAgentQueues: {??tRGetAgentQueues}OleVariant; dispid 1610810068;
    function fGetAgents: {??tRGetAgents}OleVariant; dispid 1610810069;
    function fOpenSF: WordBool; dispid 1610810070;
    function fSchedulePrivate(var name: WideString; var clientid: WideString; var num: WideString; 
                              var agendata: WideString): WordBool; dispid 1610810071;
    function fSchedulePublic(var name: WideString; var clientid: WideString; var num: WideString; 
                             var agendata: WideString; var queue: Smallint): WordBool; dispid 1610810072;
    function fReturnStatus(var uniqueid: WideString; var Status: WideString): WordBool; dispid 1610810073;
    function fDLLVersion: WideString; dispid 1610810074;
    function fTransfAssistida(var num: WideString): WordBool; dispid 1610810092;
    function fReturnStatusExtra(var uniqueid: WideString; var chave: WideString; 
                                var valor: WideString; var identificador1: WideString; 
                                var identificador2: WideString; var identificador3: WideString): WordBool; dispid 1610810110;
  end;

// *********************************************************************//
// DispIntf:  __callflex_middle
// Flags:     (4240) Hidden NonExtensible Dispatchable
// GUID:      {668F68C2-C2F3-4B1A-BEDA-0985E1A531AC}
// *********************************************************************//
  __callflex_middle = dispinterface
    ['{668F68C2-C2F3-4B1A-BEDA-0985E1A531AC}']
    procedure NewCall(const id: WideString; const tel: WideString); dispid 1;
    procedure econnect; dispid 2;
    procedure edisconnect; dispid 3;
    procedure ering(var callnum: WideString; var callid: WideString; var queue: WideString); dispid 4;
    procedure eincomingcall(var callnum: WideString; var callid: WideString; var queue: WideString; 
                            var crmid: WideString; var uniqueid: WideString); dispid 5;
    procedure eoutboundcall(var callnum: WideString); dispid 6;
    procedure eoutboundcallring(var callnum: WideString); dispid 7;
    procedure eoutboundcallanswer(var callnum: WideString); dispid 8;
    procedure eoutboundcallfailure(var reason: WideString; var callnum: WideString); dispid 9;
    procedure ehangup(var callnum: WideString; var uniqueid: WideString; var duracao: WideString); dispid 10;
    procedure epause(var pTipo: WideString; var pTime: WideString); dispid 11;
    procedure eunpause; dispid 12;
    procedure elogin(var Agente: WideString; var Login: WideString); dispid 13;
    procedure elogoff; dispid 14;
    procedure emessage(var code: WideString); dispid 15;
  end;

// *********************************************************************//
// The Class Cocallflex_middle provides a Create and CreateRemote method to          
// create instances of the default interface _callflex_middle exposed by              
// the CoClass callflex_middle. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Cocallflex_middle = class
    class function Create: _callflex_middle;
    class function CreateRemote(const MachineName: string): _callflex_middle;
  end;

  Tcallflex_middleNewCall = procedure(ASender: TObject; const id: WideString; const tel: WideString) of object;
  Tcallflex_middleering = procedure(ASender: TObject; var callnum: WideString; 
                                                      var callid: WideString; var queue: WideString) of object;
  Tcallflex_middleeincomingcall = procedure(ASender: TObject; var callnum: WideString; 
                                                              var callid: WideString; 
                                                              var queue: WideString; 
                                                              var crmid: WideString; 
                                                              var uniqueid: WideString) of object;
  Tcallflex_middleeoutboundcall = procedure(ASender: TObject; var callnum: WideString) of object;
  Tcallflex_middleeoutboundcallring = procedure(ASender: TObject; var callnum: WideString) of object;
  Tcallflex_middleeoutboundcallanswer = procedure(ASender: TObject; var callnum: WideString) of object;
  Tcallflex_middleeoutboundcallfailure = procedure(ASender: TObject; var reason: WideString; 
                                                                     var callnum: WideString) of object;
  Tcallflex_middleehangup = procedure(ASender: TObject; var callnum: WideString; 
                                                        var uniqueid: WideString; 
                                                        var duracao: WideString) of object;
  Tcallflex_middleepause = procedure(ASender: TObject; var pTipo: WideString; var pTime: WideString) of object;
  Tcallflex_middleelogin = procedure(ASender: TObject; var Agente: WideString; var Login: WideString) of object;
  Tcallflex_middleemessage = procedure(ASender: TObject; var code: WideString) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : Tcallflex_middle
// Help String      : 
// Default Interface: _callflex_middle
// Def. Intf. DISP? : No
// Event   Interface: __callflex_middle
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  Tcallflex_middleProperties= class;
{$ENDIF}
  Tcallflex_middle = class(TOleServer)
  private
    FOnNewCall: Tcallflex_middleNewCall;
    FOneconnect: TNotifyEvent;
    FOnedisconnect: TNotifyEvent;
    FOnering: Tcallflex_middleering;
    FOneincomingcall: Tcallflex_middleeincomingcall;
    FOneoutboundcall: Tcallflex_middleeoutboundcall;
    FOneoutboundcallring: Tcallflex_middleeoutboundcallring;
    FOneoutboundcallanswer: Tcallflex_middleeoutboundcallanswer;
    FOneoutboundcallfailure: Tcallflex_middleeoutboundcallfailure;
    FOnehangup: Tcallflex_middleehangup;
    FOnepause: Tcallflex_middleepause;
    FOneunpause: TNotifyEvent;
    FOnelogin: Tcallflex_middleelogin;
    FOnelogoff: TNotifyEvent;
    FOnemessage: Tcallflex_middleemessage;
    FIntf: _callflex_middle;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: Tcallflex_middleProperties;
    function GetServerProperties: Tcallflex_middleProperties;
{$ENDIF}
    function GetDefaultInterface: _callflex_middle;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _callflex_middle);
    procedure Disconnect; override;
    function IsConnected: WordBool;
    function fLogin(var p_login: WideString): tRLogin;
    function fLogoff: tRLogoff;
    function fPause(var p_tipo: Smallint): tRPause;
    function fUnpause: tRUnpause;
    function fMute: WordBool;
    function fUnMute: WordBool;
    function fHold: WordBool;
    function fUnHold: WordBool;
    function fCall(var num: WideString): WordBool;
    function fCallWithID(var num: WideString; var name: WideString; var crmid: WideString): WordBool;
    function fHangup: WordBool;
    function fHangupTransf: WordBool;
    function fTransf(var num: WideString): WordBool;
    function fTransfWithID(var num: WideString; var name: WideString; var crmid: WideString): WordBool;
    function fGetState: tRGetState;
    function fGetQueues: tRGetQueues;
    function fGetAgentQueues: tRGetAgentQueues;
    function fGetAgents: tRGetAgents;
    function fOpenSF: WordBool;
    function fSchedulePrivate(var name: WideString; var clientid: WideString; var num: WideString; 
                              var agendata: WideString): WordBool;
    function fSchedulePublic(var name: WideString; var clientid: WideString; var num: WideString; 
                             var agendata: WideString; var queue: Smallint): WordBool;
    function fReturnStatus(var uniqueid: WideString; var Status: WideString): WordBool;
    function fDLLVersion: WideString;
    function fTransfAssistida(var num: WideString): WordBool;
    function fReturnStatusExtra(var uniqueid: WideString; var chave: WideString; 
                                var valor: WideString; var identificador1: WideString; 
                                var identificador2: WideString; var identificador3: WideString): WordBool;
    property DefaultInterface: _callflex_middle read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: Tcallflex_middleProperties read GetServerProperties;
{$ENDIF}
    property OnNewCall: Tcallflex_middleNewCall read FOnNewCall write FOnNewCall;
    property Oneconnect: TNotifyEvent read FOneconnect write FOneconnect;
    property Onedisconnect: TNotifyEvent read FOnedisconnect write FOnedisconnect;
    property Onering: Tcallflex_middleering read FOnering write FOnering;
    property Oneincomingcall: Tcallflex_middleeincomingcall read FOneincomingcall write FOneincomingcall;
    property Oneoutboundcall: Tcallflex_middleeoutboundcall read FOneoutboundcall write FOneoutboundcall;
    property Oneoutboundcallring: Tcallflex_middleeoutboundcallring read FOneoutboundcallring write FOneoutboundcallring;
    property Oneoutboundcallanswer: Tcallflex_middleeoutboundcallanswer read FOneoutboundcallanswer write FOneoutboundcallanswer;
    property Oneoutboundcallfailure: Tcallflex_middleeoutboundcallfailure read FOneoutboundcallfailure write FOneoutboundcallfailure;
    property Onehangup: Tcallflex_middleehangup read FOnehangup write FOnehangup;
    property Onepause: Tcallflex_middleepause read FOnepause write FOnepause;
    property Oneunpause: TNotifyEvent read FOneunpause write FOneunpause;
    property Onelogin: Tcallflex_middleelogin read FOnelogin write FOnelogin;
    property Onelogoff: TNotifyEvent read FOnelogoff write FOnelogoff;
    property Onemessage: Tcallflex_middleemessage read FOnemessage write FOnemessage;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : Tcallflex_middle
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 Tcallflex_middleProperties = class(TPersistent)
  private
    FServer:    Tcallflex_middle;
    function    GetDefaultInterface: _callflex_middle;
    constructor Create(AServer: Tcallflex_middle);
  protected
  public
    property DefaultInterface: _callflex_middle read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function Cocallflex_middle.Create: _callflex_middle;
begin
  Result := CreateComObject(CLASS_callflex_middle) as _callflex_middle;
end;

class function Cocallflex_middle.CreateRemote(const MachineName: string): _callflex_middle;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_callflex_middle) as _callflex_middle;
end;

procedure Tcallflex_middle.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{634377C6-9067-4DC0-93C0-43EF651A22CF}';
    IntfIID:   '{E451CF62-FB99-4A14-8CBB-672EF93D09E2}';
    EventIID:  '{668F68C2-C2F3-4B1A-BEDA-0985E1A531AC}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure Tcallflex_middle.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as _callflex_middle;
  end;
end;

procedure Tcallflex_middle.ConnectTo(svrIntf: _callflex_middle);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure Tcallflex_middle.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function Tcallflex_middle.GetDefaultInterface: _callflex_middle;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor Tcallflex_middle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := Tcallflex_middleProperties.Create(Self);
{$ENDIF}
end;

destructor Tcallflex_middle.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function Tcallflex_middle.GetServerProperties: Tcallflex_middleProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure Tcallflex_middle.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnNewCall) then
         FOnNewCall(Self,
                    Params[0] {const WideString},
                    Params[1] {const WideString});
    2: if Assigned(FOneconnect) then
         FOneconnect(Self);
    3: if Assigned(FOnedisconnect) then
         FOnedisconnect(Self);
    4: if Assigned(FOnering) then
         FOnering(Self,
                  WideString((TVarData(Params[0]).VPointer)^) {var WideString},
                  WideString((TVarData(Params[1]).VPointer)^) {var WideString},
                  WideString((TVarData(Params[2]).VPointer)^) {var WideString});
    5: if Assigned(FOneincomingcall) then
         FOneincomingcall(Self,
                          WideString((TVarData(Params[0]).VPointer)^) {var WideString},
                          WideString((TVarData(Params[1]).VPointer)^) {var WideString},
                          WideString((TVarData(Params[2]).VPointer)^) {var WideString},
                          WideString((TVarData(Params[3]).VPointer)^) {var WideString},
                          WideString((TVarData(Params[4]).VPointer)^) {var WideString});
    6: if Assigned(FOneoutboundcall) then
         FOneoutboundcall(Self, WideString((TVarData(Params[0]).VPointer)^) {var WideString});
    7: if Assigned(FOneoutboundcallring) then
         FOneoutboundcallring(Self, WideString((TVarData(Params[0]).VPointer)^) {var WideString});
    8: if Assigned(FOneoutboundcallanswer) then
         FOneoutboundcallanswer(Self, WideString((TVarData(Params[0]).VPointer)^) {var WideString});
    9: if Assigned(FOneoutboundcallfailure) then
         FOneoutboundcallfailure(Self,
                                 WideString((TVarData(Params[0]).VPointer)^) {var WideString},
                                 WideString((TVarData(Params[1]).VPointer)^) {var WideString});
    10: if Assigned(FOnehangup) then
         FOnehangup(Self,
                    WideString((TVarData(Params[0]).VPointer)^) {var WideString},
                    WideString((TVarData(Params[1]).VPointer)^) {var WideString},
                    WideString((TVarData(Params[2]).VPointer)^) {var WideString});
    11: if Assigned(FOnepause) then
         FOnepause(Self,
                   WideString((TVarData(Params[0]).VPointer)^) {var WideString},
                   WideString((TVarData(Params[1]).VPointer)^) {var WideString});
    12: if Assigned(FOneunpause) then
         FOneunpause(Self);
    13: if Assigned(FOnelogin) then
         FOnelogin(Self,
                   WideString((TVarData(Params[0]).VPointer)^) {var WideString},
                   WideString((TVarData(Params[1]).VPointer)^) {var WideString});
    14: if Assigned(FOnelogoff) then
         FOnelogoff(Self);
    15: if Assigned(FOnemessage) then
         FOnemessage(Self, WideString((TVarData(Params[0]).VPointer)^) {var WideString});
  end; {case DispID}
end;

function Tcallflex_middle.IsConnected: WordBool;
begin
  Result := DefaultInterface.IsConnected;
end;

function Tcallflex_middle.fLogin(var p_login: WideString): tRLogin;
begin
  Result := DefaultInterface.fLogin(p_login);
end;

function Tcallflex_middle.fLogoff: tRLogoff;
begin
  Result := DefaultInterface.fLogoff;
end;

function Tcallflex_middle.fPause(var p_tipo: Smallint): tRPause;
begin
  Result := DefaultInterface.fPause(p_tipo);
end;

function Tcallflex_middle.fUnpause: tRUnpause;
begin
  Result := DefaultInterface.fUnpause;
end;

function Tcallflex_middle.fMute: WordBool;
begin
  Result := DefaultInterface.fMute;
end;

function Tcallflex_middle.fUnMute: WordBool;
begin
  Result := DefaultInterface.fUnMute;
end;

function Tcallflex_middle.fHold: WordBool;
begin
  Result := DefaultInterface.fHold;
end;

function Tcallflex_middle.fUnHold: WordBool;
begin
  Result := DefaultInterface.fUnHold;
end;

function Tcallflex_middle.fCall(var num: WideString): WordBool;
begin
  Result := DefaultInterface.fCall(num);
end;

function Tcallflex_middle.fCallWithID(var num: WideString; var name: WideString; 
                                      var crmid: WideString): WordBool;
begin
  Result := DefaultInterface.fCallWithID(num, name, crmid);
end;

function Tcallflex_middle.fHangup: WordBool;
begin
  Result := DefaultInterface.fHangup;
end;

function Tcallflex_middle.fHangupTransf: WordBool;
begin
  Result := DefaultInterface.fHangupTransf;
end;

function Tcallflex_middle.fTransf(var num: WideString): WordBool;
begin
  Result := DefaultInterface.fTransf(num);
end;

function Tcallflex_middle.fTransfWithID(var num: WideString; var name: WideString; 
                                        var crmid: WideString): WordBool;
begin
  Result := DefaultInterface.fTransfWithID(num, name, crmid);
end;

function Tcallflex_middle.fGetState: tRGetState;
begin
  Result := DefaultInterface.fGetState;
end;

function Tcallflex_middle.fGetQueues: tRGetQueues;
begin
  Result := DefaultInterface.fGetQueues;
end;

function Tcallflex_middle.fGetAgentQueues: tRGetAgentQueues;
begin
  Result := DefaultInterface.fGetAgentQueues;
end;

function Tcallflex_middle.fGetAgents: tRGetAgents;
begin
  Result := DefaultInterface.fGetAgents;
end;

function Tcallflex_middle.fOpenSF: WordBool;
begin
  Result := DefaultInterface.fOpenSF;
end;

function Tcallflex_middle.fSchedulePrivate(var name: WideString; var clientid: WideString; 
                                           var num: WideString; var agendata: WideString): WordBool;
begin
  Result := DefaultInterface.fSchedulePrivate(name, clientid, num, agendata);
end;

function Tcallflex_middle.fSchedulePublic(var name: WideString; var clientid: WideString; 
                                          var num: WideString; var agendata: WideString; 
                                          var queue: Smallint): WordBool;
begin
  Result := DefaultInterface.fSchedulePublic(name, clientid, num, agendata, queue);
end;

function Tcallflex_middle.fReturnStatus(var uniqueid: WideString; var Status: WideString): WordBool;
begin
  Result := DefaultInterface.fReturnStatus(uniqueid, Status);
end;

function Tcallflex_middle.fDLLVersion: WideString;
begin
  Result := DefaultInterface.fDLLVersion;
end;

function Tcallflex_middle.fTransfAssistida(var num: WideString): WordBool;
begin
  Result := DefaultInterface.fTransfAssistida(num);
end;

function Tcallflex_middle.fReturnStatusExtra(var uniqueid: WideString; var chave: WideString; 
                                             var valor: WideString; var identificador1: WideString; 
                                             var identificador2: WideString; 
                                             var identificador3: WideString): WordBool;
begin
  Result := DefaultInterface.fReturnStatusExtra(uniqueid, chave, valor, identificador1, 
                                                identificador2, identificador3);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor Tcallflex_middleProperties.Create(AServer: Tcallflex_middle);
begin
  inherited Create;
  FServer := AServer;
end;

function Tcallflex_middleProperties.GetDefaultInterface: _callflex_middle;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [Tcallflex_middle]);
end;

end.
