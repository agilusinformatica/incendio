object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 203
  ClientWidth = 447
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
  object Celula: TLabel
    Left = 44
    Top = 56
    Width = 29
    Height = 13
    Caption = 'C'#233'lula'
  end
  object Label1: TLabel
    Left = 44
    Top = 108
    Width = 47
    Height = 13
    Caption = 'Conte'#250'do'
  end
  object lbNomeArquivo: TLabel
    Left = 148
    Top = 18
    Width = 72
    Height = 13
    Caption = 'lbNomeArquivo'
  end
  object edCelula: TEdit
    Left = 44
    Top = 72
    Width = 57
    Height = 21
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 0
  end
  object edConteudo: TEdit
    Left = 44
    Top = 123
    Width = 337
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 252
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 44
    Top = 13
    Width = 75
    Height = 25
    Caption = 'Abrir'
    TabOrder = 3
    OnClick = Button2Click
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'Arquivo Excel (*.xls; *.xlsx)|*.xls;*.xlsx|Todos os Arquivos (*.' +
      '*)|*.*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Title = 'Selecione arquivo'
    Left = 112
    Top = 153
  end
end
