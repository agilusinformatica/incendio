object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 714
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    695
    714)
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 20
    Top = 20
    Width = 481
    Height = 21
    TabOrder = 0
    Text = 'http://www3.dataprev.gov.br/cws/contexto/hiscre/hiscrenet2.asp'
  end
  object Button1: TButton
    Left = 518
    Top = 18
    Width = 75
    Height = 25
    Caption = 'GO'
    TabOrder = 1
    OnClick = Button1Click
  end
  object PageControl1: TPageControl
    Left = 20
    Top = 375
    Width = 657
    Height = 326
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Fonte'
      ExplicitHeight = 344
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 649
        Height = 298
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        WordWrap = False
        ExplicitHeight = 344
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Preview'
      ImageIndex = 1
      ExplicitHeight = 344
      object WebBrowser: TWebBrowser
        Left = 0
        Top = 0
        Width = 649
        Height = 298
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 224
        ExplicitTop = 80
        ExplicitWidth = 300
        ExplicitHeight = 150
        ControlData = {
          4C00000013430000CD1E00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object Button2: TButton
    Left = 602
    Top = 18
    Width = 75
    Height = 25
    Caption = 'Preview'
    TabOrder = 3
    OnClick = Button2Click
  end
  object edMatricula: TLabeledEdit
    Left = 20
    Top = 64
    Width = 121
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' Matr'#237'cula'
    TabOrder = 4
    Text = '1204039086'
  end
  object edDtNasc: TLabeledEdit
    Left = 24
    Top = 112
    Width = 121
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'Dt Nascimento'
    TabOrder = 5
    Text = '14/01/1940'
  end
  object Panel1: TPanel
    Left = 20
    Top = 139
    Width = 667
    Height = 230
    TabOrder = 6
    object edNome: TLabeledEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      TabOrder = 0
    end
    object edFormaPgto: TLabeledEdit
      Left = 16
      Top = 64
      Width = 121
      Height = 21
      EditLabel.Width = 102
      EditLabel.Height = 13
      EditLabel.Caption = 'Forma de Pagamento'
      TabOrder = 1
    end
    object edBanco: TLabeledEdit
      Left = 16
      Top = 104
      Width = 121
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'Banco'
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 518
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Pega Valor'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object edCampo: TLabeledEdit
      Left = 380
      Top = 26
      Width = 121
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome do Campo'
      TabOrder = 4
    end
    object edValor: TLabeledEdit
      Left = 380
      Top = 64
      Width = 121
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'Valor'
      TabOrder = 5
    end
    object Grid: TStringGrid
      Left = 208
      Top = 104
      Width = 433
      Height = 121
      ColCount = 4
      DefaultColWidth = 75
      FixedCols = 0
      RowCount = 2
      GridLineWidth = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ScrollBars = ssNone
      TabOrder = 6
    end
  end
  object btCarregar: TButton
    Left = 518
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 7
    OnClick = btCarregarClick
  end
end
