object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Conserta Cidades do Agilus (Televendas)'
  ClientHeight = 477
  ClientWidth = 677
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
    Top = 57
    Width = 677
    Height = 367
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsCidades
      DataController.KeyFieldNames = 'cidade_origem'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1cidade_origem: TcxGridDBColumn
        Caption = 'Origem'
        DataBinding.FieldName = 'cidade_origem'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1cidade_destino: TcxGridDBColumn
        Caption = 'Destino (coloque # para limpar)'
        DataBinding.FieldName = 'cidade_destino'
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 57
    Align = alTop
    TabOrder = 1
    DesignSize = (
      677
      57)
    object cxLabel1: TcxLabel
      Left = 8
      Top = 18
      Caption = #211'rg'#227'o'
      Transparent = True
    end
    object cbOrgao: TcxLookupComboBox
      Left = 48
      Top = 17
      Properties.ClearKey = 46
      Properties.KeyFieldNames = 'orgav_codigo'
      Properties.ListColumns = <
        item
          FieldName = 'orgav_descricao'
        end>
      Properties.ListSource = dsOrgao
      TabOrder = 1
      Width = 297
    end
    object cxButton2: TcxButton
      Left = 488
      Top = 10
      Width = 179
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'Consultar'
      TabOrder = 3
      OnClick = cxButton2Click
    end
    object cxLabel2: TcxLabel
      Left = 360
      Top = 18
      Caption = 'UF'
      Transparent = True
    end
    object edUf: TcxTextEdit
      Left = 383
      Top = 17
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      Width = 34
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 424
    Width = 677
    Height = 53
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      677
      53)
    object cxButton1: TcxButton
      Left = 488
      Top = 10
      Width = 179
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'Gravar altera'#231#245'es'
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object Conexao: TADOConnection
    CommandTimeout = 120
    ConnectionString = 'FILE NAME=C:\Agilus\Incendio\ConsertaCidades\Conexao.udl;'
    Provider = 'SQLOLEDB.1'
    Left = 172
    Top = 244
  end
  object tbCidades: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandTimeout = 120
    Parameters = <
      item
        Name = 'Orgao'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'Uf'
        DataType = ftString
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'declare @orgao smallint'
      'declare @uf char(2)'
      ''
      'set @orgao = :Orgao'
      'set @uf = :Uf'
      ''
      
        'select distinct clt_cidade cidade_origem, convert(varchar(100),n' +
        'ull) cidade_destino'
      'into #temp_cidades'
      'from cliente_televenda'
      'where (@orgao is null or orgav_codigo = @orgao)'
      'and isnull(clt_cidade,'#39#39') <> '#39#39
      'and (@uf is null or clt_uf = @uf)'
      'order by clt_cidade'
      ''
      'select * from #temp_cidades'
      ''
      'drop table #temp_cidades'
      ''
      '')
    Left = 288
    Top = 216
    object tbCidadescidade_origem: TStringField
      FieldName = 'cidade_origem'
      ReadOnly = True
      Size = 100
    end
    object tbCidadescidade_destino: TStringField
      FieldName = 'cidade_destino'
      Size = 100
    end
  end
  object tbOrgao: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select orgav_codigo, orgav_descricao'
      'from orgaoav')
    Left = 396
    Top = 216
  end
  object dsOrgao: TDataSource
    DataSet = tbOrgao
    Left = 400
    Top = 288
  end
  object dsCidades: TDataSource
    DataSet = tbCidades
    Left = 288
    Top = 288
  end
end
