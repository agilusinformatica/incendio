object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Carga da Marinha no Sistema Agilus'
  ClientHeight = 584
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    581
    584)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 16
    Top = 155
    Width = 549
    Height = 375
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 9
    object Grid: TcxGridTableView
      OnKeyDown = GridKeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object ColumnArquivo: TcxGridColumn
        Caption = 'Arquivo'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ColumnArquivoPropertiesButtonClick
        Width = 179
      end
      object ColumnBanco: TcxGridColumn
        Caption = 'Banco'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ClearKey = 46
        Properties.KeyFieldNames = 'bcolib_codigo'
        Properties.ListColumns = <
          item
            FieldName = 'bcolib_descricao'
          end>
        Properties.ListSource = dmDados.dsBanco
        Properties.OnEditValueChanged = ColumnBancoPropertiesEditValueChanged
        Width = 178
      end
      object ColumnProgresso: TcxGridColumn
        Caption = 'Progresso'
        PropertiesClassName = 'TcxProgressBarProperties'
        Options.Editing = False
        Width = 178
      end
      object ColumnQtdeLinhas: TcxGridColumn
        Caption = 'Qtde de Linhas'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = Grid
    end
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 16
    Caption = #211'rg'#227'o'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cbOrgao: TcxLookupComboBox
    Left = 16
    Top = 32
    Properties.ClearKey = 46
    Properties.KeyFieldNames = 'orgav_codigo'
    Properties.ListColumns = <
      item
        FieldName = 'orgav_descricao'
      end>
    Properties.ListSource = dmDados.dsOrgao
    Properties.OnEditValueChanged = cxDBLookupComboBox1PropertiesEditValueChanged
    TabOrder = 0
    Width = 245
  end
  object cxLabel2: TcxLabel
    Left = 276
    Top = 16
    Caption = 'Unidade'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cbUnidade: TcxLookupComboBox
    Left = 276
    Top = 32
    Properties.ClearKey = 46
    Properties.KeyFieldNames = 'uni_codigo'
    Properties.ListColumns = <
      item
        FieldName = 'uni_descricao'
      end>
    Properties.ListSource = dmDados.dsUnidade
    TabOrder = 1
    Width = 245
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 60
    Caption = 'M'#234's da Folha'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object edMes: TcxDateEdit
    Left = 16
    Top = 76
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 2
    Width = 121
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 103
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
  object beArquivo: TcxButtonEdit
    Left = 16
    Top = 120
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = beArquivoPropertiesButtonClick
    TabOrder = 3
    Width = 373
  end
  object cxButton1: TcxButton
    Left = 404
    Top = 118
    Width = 61
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 17
    Top = 543
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Processar'
    TabOrder = 10
    OnClick = cxButton2Click
  end
  object ProgressBar: TcxProgressBar
    Left = 112
    Top = 546
    Anchors = [akLeft, akRight, akBottom]
    Properties.AnimationPath = cxapPingPong
    Properties.AnimationSpeed = 5
    Properties.BeginColor = 54056
    Properties.Max = 100.000000000000000000
    Properties.PeakValue = 100.000000000000000000
    TabOrder = 11
    Width = 453
  end
  object cxButton3: TcxButton
    Left = 480
    Top = 118
    Width = 85
    Height = 25
    Caption = 'Atualiza Bancos'
    TabOrder = 12
    OnClick = cxButton3Click
  end
  object SkinController: TdxSkinController
    Kind = lfOffice11
    SkinName = 'Caramel'
    Left = 256
    Top = 68
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = beArquivo
        Properties.Strings = (
          'Text')
      end
      item
        Component = cbOrgao
        Properties.Strings = (
          'EditValue')
      end
      item
        Component = cbUnidade
        Properties.Strings = (
          'EditValue')
      end>
    StorageName = 'default'
    Left = 356
    Top = 68
  end
  object BrowserDialog: TcxShellBrowserDialog
    FolderLabelCaption = 'Pasta Atual'
    Title = 'Selecione uma pasta'
    Left = 516
    Top = 68
  end
end
