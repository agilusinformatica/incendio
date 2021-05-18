object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Carga Siape (Exclu'#237'dos)'
  ClientHeight = 548
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    760
    548)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 16
    Top = 57
    Width = 728
    Height = 446
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object Grid: TcxGridTableView
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
      object ColumnMarca: TcxGridColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Width = 27
      end
      object ColumnArquivo: TcxGridColumn
        Caption = 'Arquivo'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 471
      end
      object ColumnProgresso: TcxGridColumn
        Caption = 'Progresso'
        PropertiesClassName = 'TcxProgressBarProperties'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 134
      end
      object ColumnQtdeLinhas: TcxGridColumn
        Caption = 'Qtde de Linhas'
        HeaderAlignmentHorz = taCenter
        Width = 82
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = Grid
    end
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 9
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
    Top = 26
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = beArquivoPropertiesButtonClick
    TabOrder = 2
    Width = 373
  end
  object cxButton1: TcxButton
    Left = 404
    Top = 24
    Width = 61
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 3
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 17
    Top = 515
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Processar'
    TabOrder = 4
    OnClick = cxButton2Click
  end
  object ProgressBar: TcxProgressBar
    Left = 112
    Top = 521
    Anchors = [akLeft, akRight, akBottom]
    Properties.AnimationPath = cxapPingPong
    Properties.AnimationSpeed = 5
    Properties.BeginColor = 54056
    Properties.Max = 10.000000000000000000
    Properties.OverloadValue = 10.000000000000000000
    Properties.PeakValue = 10.000000000000000000
    Properties.ShowTextStyle = cxtsText
    TabOrder = 5
    Width = 628
  end
  object cbNaoLimparDadosGravados: TcxCheckBox
    Left = 528
    Top = 24
    Caption = 'N'#227'o limpar dados gravados'
    TabOrder = 6
    Width = 185
  end
  object SkinController: TdxSkinController
    Kind = lfStandard
    SkinName = 'Caramel'
    Left = 296
    Top = 196
  end
  object PropertiesStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = beArquivo
        Properties.Strings = (
          'Text')
      end>
    StorageName = 'CargaAero'
    Left = 392
    Top = 200
  end
  object BrowserDialog: TcxShellBrowserDialog
    FolderLabelCaption = 'Pasta Atual'
    Title = 'Selecione uma pasta'
    Left = 555
    Top = 10
  end
end
