object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Coletor INSS'
  ClientHeight = 475
  ClientWidth = 900
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 250
    Height = 434
    Align = alLeft
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataModeController.GridMode = True
      DataController.DataSource = dsColetorInss
      DataController.KeyFieldNames = 'cin_codigo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1cin_codigo: TcxGridDBColumn
        DataBinding.FieldName = 'cin_codigo'
        Visible = False
      end
      object cxGrid1DBTableView1cin_beneficio: TcxGridDBColumn
        DataBinding.FieldName = 'cin_beneficio'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1cin_data_consulta: TcxGridDBColumn
        DataBinding.FieldName = 'cin_data_consulta'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1cin_resultado: TcxGridDBColumn
        DataBinding.FieldName = 'cin_resultado'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object WebBrowser1: TWebBrowser
    Left = 250
    Top = 41
    Width = 650
    Height = 434
    Align = alClient
    TabOrder = 1
    ExplicitTop = 40
    ControlData = {
      4C0000002E430000DB2C00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 41
    Align = alTop
    TabOrder = 2
    object edDataBase: TcxDateEdit
      Left = 168
      Top = 11
      TabOrder = 0
      Width = 121
    end
    object cxButton1: TcxButton
      Left = 332
      Top = 9
      Width = 75
      Height = 25
      Action = acConsultar
      TabOrder = 1
    end
  end
  object HTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = True
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 544
    Top = 188
  end
  object ConexaoAgilus: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=dbAgilus;Data Source=.\NEW;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 388
    Top = 108
  end
  object tbColetorInss: TADOQuery
    Connection = ConexaoAgilus
    CursorLocation = clUseServer
    CursorType = ctStatic
    AfterScroll = tbColetorInssAfterScroll
    Parameters = <
      item
        Name = 'DataBase'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from coletor_inss'
      'where cin_data_consulta is null'
      'or cin_data_consulta < :DataBase')
    Left = 388
    Top = 192
    object tbColetorInsscin_codigo: TAutoIncField
      FieldName = 'cin_codigo'
      ReadOnly = True
      Visible = False
    end
    object tbColetorInsscin_beneficio: TStringField
      DisplayLabel = 'N'#186' Benef'#237'cio'
      FieldName = 'cin_beneficio'
    end
    object tbColetorInsscin_data_consulta: TDateTimeField
      DisplayLabel = 'Dt.Consulta'
      FieldName = 'cin_data_consulta'
      DisplayFormat = 'dd/MM/yyyy hh:nn:ss'
    end
    object tbColetorInsscin_resultado: TMemoField
      FieldName = 'cin_resultado'
      Visible = False
      BlobType = ftMemo
    end
  end
  object dsColetorInss: TDataSource
    DataSet = tbColetorInss
    Left = 388
    Top = 276
  end
  object ActionList1: TActionList
    Left = 544
    Top = 108
    object acConsultar: TAction
      Caption = 'Consultar'
      OnExecute = acConsultarExecute
    end
  end
end
