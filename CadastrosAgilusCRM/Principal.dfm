object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastros Agilus CRM'
  ClientHeight = 301
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 0
    Top = 250
    Width = 263
    Height = 50
    Align = alTop
    Caption = 'Cadastro de Produtos'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 0
    Top = 0
    Width = 263
    Height = 50
    Align = alTop
    Caption = 'Cadastro de Regi'#245'es'
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 0
    Top = 100
    Width = 263
    Height = 50
    Align = alTop
    Caption = 'Cadastro de Seguradoras'
    TabOrder = 2
    OnClick = cxButton3Click
  end
  object cxButton4: TcxButton
    Left = 0
    Top = 150
    Width = 263
    Height = 50
    Align = alTop
    Caption = 'Cadastro de Planos de Sa'#250'de'
    TabOrder = 3
    OnClick = cxButton4Click
  end
  object cxButton5: TcxButton
    Left = 0
    Top = 50
    Width = 263
    Height = 50
    Align = alTop
    Caption = 'Cadastro de Planos de Sa'#250'de Gen'#233'ricos'
    TabOrder = 4
    OnClick = cxButton5Click
  end
  object cxButton6: TcxButton
    Left = 0
    Top = 200
    Width = 263
    Height = 50
    Align = alTop
    Caption = 'Cadastro de Faixas de Idade'
    TabOrder = 5
    OnClick = cxButton6Click
  end
  object SkinController: TdxSkinController
    NativeStyle = False
    SkinName = 'Caramel'
    Left = 200
    Top = 4
  end
end
