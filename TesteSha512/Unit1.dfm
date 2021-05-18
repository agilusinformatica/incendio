object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 303
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    578
    303)
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 48
    Top = 60
    Width = 329
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 440
    Top = 58
    Width = 75
    Height = 25
    Caption = 'Criptografar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 48
    Top = 128
    Width = 467
    Height = 145
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
end
