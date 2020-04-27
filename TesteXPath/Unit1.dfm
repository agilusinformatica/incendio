object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 637
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 245
    Width = 903
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 392
  end
  object mmXml: TMemo
    Left = 0
    Top = 0
    Width = 903
    Height = 245
    Align = alTop
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 248
    Width = 903
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 368
    ExplicitTop = 316
    ExplicitWidth = 185
    object edtXPath: TEdit
      Left = 12
      Top = 11
      Width = 797
      Height = 21
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 820
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object resultado: TMemo
    Left = 0
    Top = 289
    Width = 903
    Height = 348
    Align = alClient
    TabOrder = 2
    ExplicitTop = 499
    ExplicitHeight = 245
  end
end
