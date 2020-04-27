object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Carga de Skins'
  ClientHeight = 152
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 28
    Top = 26
    Width = 27
    Height = 13
    Caption = 'Pasta'
  end
  object Button1: TButton
    Left = 28
    Top = 106
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 28
    Top = 40
    Width = 253
    Height = 21
    TabOrder = 0
    Text = 
      'C:\Users\Claudio\Documents\DevExpress VCL\ExpressSkins Library\B' +
      'inary Skin Files'
  end
  object cbAtualizar: TCheckBox
    Left = 28
    Top = 75
    Width = 145
    Height = 17
    Caption = 'Atualizar existentes'
    TabOrder = 1
  end
  object Connection: TADOConnection
    ConnectionString = 'FILE NAME=C:\Agilus\Incendio\CargaSkins\agilus.udl'
    LoginPrompt = False
    Provider = 'C:\Agilus\Incendio\CargaSkins\agilus.udl'
    Left = 184
    Top = 84
  end
  object tbSkin: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from skin')
    Left = 260
    Top = 84
    object tbSkinskn_codigo: TAutoIncField
      FieldName = 'skn_codigo'
      ReadOnly = True
    end
    object tbSkinskn_descricao: TStringField
      FieldName = 'skn_descricao'
      Size = 40
    end
    object tbSkinskn_conteudo: TBlobField
      FieldName = 'skn_conteudo'
    end
  end
end
