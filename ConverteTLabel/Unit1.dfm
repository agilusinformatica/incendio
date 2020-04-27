object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 577
  ClientWidth = 531
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
  object ListBox: TcxListBox
    Left = 8
    Top = 44
    Width = 517
    Height = 477
    ItemHeight = 13
    TabOrder = 0
  end
  object Edit1: TcxTextEdit
    Left = 8
    Top = 8
    TabOrder = 1
    Text = 'E:\Agilus Desenvolvimento\AgilusCred\*.dfm'
    Width = 517
  end
  object cxButton1: TcxButton
    Left = 228
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Processar'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object dxSkinController1: TdxSkinController
    SkinName = 'Whiteprint'
    Left = 380
    Top = 292
  end
end
