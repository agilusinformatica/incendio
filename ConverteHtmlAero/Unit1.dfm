object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Conversor'
  ClientHeight = 221
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object beArquivo: TcxButtonEdit
    Left = 12
    Top = 52
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = beArquivoPropertiesButtonClick
    TabOrder = 0
    Width = 373
  end
  object cxLabel4: TcxLabel
    Left = 12
    Top = 35
    Caption = 'Selecione a pasta'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxButton2: TcxButton
    Left = 445
    Top = 50
    Width = 89
    Height = 25
    Caption = 'Processar'
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object BrowserDialog: TcxShellBrowserDialog
    FolderLabelCaption = 'Pasta Atual'
    Title = 'Selecione uma pasta'
    Left = 408
    Top = 48
  end
end
