object frmMain: TfrmMain
  Left = 498
  Top = 219
  Caption = ' CallFlex Integra'#231#227'o - CRM Side'
  ClientHeight = 350
  ClientWidth = 839
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 8
    Top = 312
    Width = 118
    Height = 19
    Caption = 'Desconectado.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cmdClear: TButton
    Left = 269
    Top = 310
    Width = 75
    Height = 25
    Caption = '&Limpar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = cmdClearClick
  end
  object cmdExit: TButton
    Left = 350
    Top = 310
    Width = 75
    Height = 25
    Caption = '&Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = cmdExitClick
  end
  object frmLogin: TGroupBox
    Left = 431
    Top = 0
    Width = 185
    Height = 79
    Caption = 'Login'
    TabOrder = 2
    object Label1: TLabel
      Left = 30
      Top = 26
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object txtLogin: TEdit
      Left = 76
      Top = 21
      Width = 98
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 0
    end
    object cmdLogin: TButton
      Left = 99
      Top = 45
      Width = 75
      Height = 23
      Caption = 'Logar'
      TabOrder = 1
      OnClick = cmdLoginClick
    end
    object cmdLogoff: TButton
      Left = 19
      Top = 45
      Width = 75
      Height = 23
      Caption = 'Deslogar'
      TabOrder = 2
      OnClick = cmdLogoffClick
    end
  end
  object frmPausa: TGroupBox
    Left = 431
    Top = 85
    Width = 185
    Height = 79
    Caption = 'Pausar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label2: TLabel
      Left = 30
      Top = 26
      Width = 33
      Height = 13
      Caption = 'Pausa:'
    end
    object cmdPause: TButton
      Left = 99
      Top = 45
      Width = 75
      Height = 23
      Caption = 'Pausar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = cmdPauseClick
    end
    object cmdUnpause: TButton
      Left = 19
      Top = 45
      Width = 75
      Height = 23
      Caption = 'Despausar'
      TabOrder = 1
      OnClick = cmdUnpauseClick
    end
  end
  object frmTransf: TGroupBox
    Left = 431
    Top = 257
    Width = 185
    Height = 79
    Caption = 'Transfer'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label3: TLabel
      Left = 30
      Top = 26
      Width = 41
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object txtTransf: TEdit
      Left = 76
      Top = 21
      Width = 98
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 0
    end
    object cmdTransf: TButton
      Left = 99
      Top = 45
      Width = 75
      Height = 23
      Caption = '&Transferir'
      TabOrder = 1
      OnClick = cmdTransfClick
    end
  end
  object frmDiscar: TGroupBox
    Left = 431
    Top = 170
    Width = 185
    Height = 79
    Caption = 'Discar'
    TabOrder = 5
    object Label4: TLabel
      Left = 30
      Top = 26
      Width = 41
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object txtNum: TEdit
      Left = 76
      Top = 21
      Width = 98
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 0
    end
    object cmdCall: TButton
      Left = 99
      Top = 45
      Width = 75
      Height = 23
      Caption = 'Discar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = cmdCallClick
    end
    object cmdHangup: TButton
      Left = 19
      Top = 45
      Width = 75
      Height = 23
      Caption = 'Desligar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = cmdHangupClick
    end
  end
  object frmControl: TGroupBox
    Left = 622
    Top = 6
    Width = 211
    Height = 35
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object cmdOpenSF: TButton
      Left = 7
      Top = 7
      Width = 96
      Height = 23
      Caption = 'Abrir Softphone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = cmdOpenSFClick
    end
    object cmdVersion: TButton
      Left = 108
      Top = 7
      Width = 96
      Height = 23
      Caption = 'Vers'#227'o da DLL'
      TabOrder = 1
      OnClick = cmdVersionClick
    end
  end
  object txtLog: TMemo
    Left = 8
    Top = 8
    Width = 417
    Height = 296
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object GroupBox1: TGroupBox
    Left = 622
    Top = 47
    Width = 212
    Height = 66
    TabOrder = 8
    object cmdGetQueues: TButton
      Left = 7
      Top = 6
      Width = 96
      Height = 25
      Caption = 'Filas'
      TabOrder = 0
      OnClick = cmdGetQueuesClick
    end
    object cmdGetAgentQueues: TButton
      Left = 108
      Top = 6
      Width = 96
      Height = 25
      Caption = 'Filas do Agente'
      TabOrder = 1
      OnClick = cmdGetAgentQueuesClick
    end
    object cmdGetAgents: TButton
      Left = 7
      Top = 34
      Width = 96
      Height = 25
      Caption = 'Agentes'
      TabOrder = 2
      OnClick = cmdGetAgentsClick
    end
    object cmdAskState: TButton
      Left = 108
      Top = 34
      Width = 96
      Height = 25
      Caption = 'Status Gerais'
      TabOrder = 3
      OnClick = cmdAskStateClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 622
    Top = 119
    Width = 212
    Height = 66
    TabOrder = 9
    object cmdMute: TButton
      Left = 7
      Top = 6
      Width = 96
      Height = 25
      Caption = 'Mudo'
      TabOrder = 0
      OnClick = cmdMuteClick
    end
    object cmdUnmute: TButton
      Left = 108
      Top = 6
      Width = 96
      Height = 25
      Caption = 'Retirar Mudo'
      TabOrder = 1
      OnClick = cmdUnmuteClick
    end
    object cmdHold: TButton
      Left = 7
      Top = 34
      Width = 95
      Height = 25
      Caption = 'Hold'
      TabOrder = 2
      OnClick = cmdHoldClick
    end
    object cmdUnhold: TButton
      Left = 108
      Top = 34
      Width = 96
      Height = 25
      Caption = 'Retirar Hold'
      TabOrder = 3
      OnClick = cmdUnholdClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 624
    Top = 192
    Width = 210
    Height = 41
    TabOrder = 10
    object cmdAgendamento: TButton
      Left = 107
      Top = 8
      Width = 94
      Height = 25
      Caption = 'Agendamento'
      TabOrder = 0
      OnClick = cmdAgendamentoClick
    end
    object Button1: TButton
      Left = 5
      Top = 8
      Width = 95
      Height = 25
      Caption = 'Status de Neg.'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
