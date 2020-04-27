object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Atualiza'#231#227'o de DNS'#39's Din'#226'micos (Agilus)'
  ClientHeight = 414
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    578
    414)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 8
    Top = 43
    Width = 562
    Height = 240
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object View: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ViewEndereco: TcxGridColumn
        Caption = 'Endere'#231'o DNS Din'#226'mico'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Width = 324
      end
      object ViewIp: TcxGridColumn
        Caption = 'IP'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Width = 119
      end
      object ViewUltimaAtualizacao: TcxGridColumn
        Caption = #218'lt.Atualiza'#231#227'o'
        DataBinding.ValueType = 'DateTime'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Width = 117
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = View
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 11
    Caption = 'Atualizar a cada'
    Transparent = True
  end
  object cxButton1: TcxButton
    Left = 425
    Top = 8
    Width = 145
    Height = 25
    Caption = 'Processar Agora'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object edTempoAtualizacao: TcxSpinEdit
    Left = 90
    Top = 10
    Properties.MinValue = 1.000000000000000000
    TabOrder = 3
    Value = 10
    Width = 47
  end
  object cxLabel2: TcxLabel
    Left = 139
    Top = 11
    Caption = 'minutos'
    Transparent = True
  end
  object lbProgresso: TcxLabel
    Left = 267
    Top = 11
    Caption = 'Progresso'
    Transparent = True
  end
  object lbErros: TcxListBox
    Left = 8
    Top = 300
    Width = 562
    Height = 106
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 6
    ExplicitHeight = 50
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 283
    Caption = 'Erros'
    Transparent = True
  end
  object ConexaoAgilus: TADOConnection
    CommandTimeout = 0
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=dbAgilus;Data Source=.;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 100
    Top = 116
  end
  object tbDns: TADOQuery
    Connection = ConexaoAgilus
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from liberacao_ip'
      'where isnull(lip_dns_dinamico,'#39#39') <> '#39#39
      
        'and isnull(lip_validade,'#39'2079-01-01'#39') > convert(varchar(11),getd' +
        'ate())')
    Left = 184
    Top = 168
  end
  object dsDns: TDataSource
    DataSet = tbDns
    Left = 184
    Top = 116
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 460
    Top = 116
  end
  object SkinController: TdxSkinController
    SkinName = 'Caramel'
    Left = 432
    Top = 168
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 260
    Top = 204
  end
end
