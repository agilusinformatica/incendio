object frmAgendamento: TfrmAgendamento
  Left = 738
  Top = 211
  BorderStyle = bsSingle
  Caption = 'Agendamento'
  ClientHeight = 321
  ClientWidth = 308
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
  object cmdCancel: TButton
    Left = 185
    Top = 275
    Width = 105
    Height = 32
    Caption = 'Cancelar'
    TabOrder = 0
    OnClick = cmdCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 169
    TabOrder = 1
    object Label1: TLabel
      Left = 59
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 50
      Top = 51
      Width = 40
      Height = 13
      Caption = 'ID CRM:'
    end
    object Label3: TLabel
      Left = 44
      Top = 78
      Width = 46
      Height = 13
      Caption = 'Telefone:'
    end
    object Label4: TLabel
      Left = 63
      Top = 105
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object txtNome: TEdit
      Left = 96
      Top = 21
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object txtClientId: TEdit
      Left = 96
      Top = 48
      Width = 169
      Height = 21
      TabOrder = 1
    end
    object txtTel: TEdit
      Left = 96
      Top = 75
      Width = 169
      Height = 21
      TabOrder = 2
    end
    object txtData: TEdit
      Left = 96
      Top = 102
      Width = 169
      Height = 21
      TabOrder = 3
    end
    object cmdPrivate: TButton
      Left = 160
      Top = 131
      Width = 105
      Height = 25
      Caption = 'Agendar Privado'
      TabOrder = 4
      OnClick = cmdPrivateClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 185
    Width = 282
    Height = 84
    TabOrder = 2
    object Label5: TLabel
      Left = 70
      Top = 19
      Width = 20
      Height = 13
      Caption = 'Fila:'
    end
    object txtQueue: TEdit
      Left = 96
      Top = 16
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object cmdPublic: TButton
      Left = 160
      Top = 43
      Width = 105
      Height = 25
      Caption = 'Agendar P'#250'blico'
      TabOrder = 1
      OnClick = cmdPublicClick
    end
  end
end
