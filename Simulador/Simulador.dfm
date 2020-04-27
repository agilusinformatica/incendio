inherited frmSimulador: TfrmSimulador
  Caption = 'Simulador'
  ClientHeight = 492
  ClientWidth = 470
  OnCreate = FormCreate
  ExplicitWidth = 478
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 148
    Align = alTop
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 12
      Caption = #211'rg'#227'o'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 244
      Top = 12
      Caption = 'Banco'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 55
      Caption = 'Data de Libera'#231#227'o'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object edData: TcxDateEdit
      Left = 16
      Top = 71
      Enabled = False
      Properties.OnEditValueChanged = edDataPropertiesEditValueChanged
      TabOrder = 3
      Width = 106
    end
    object cbTabela: TcxExtLookupComboBox
      Left = 244
      Top = 71
      Enabled = False
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 300
      Properties.View = TableViewTabela
      Properties.KeyFieldNames = 'tbb_codigo'
      Properties.ListFieldItem = cxGrid1DBTableView1tbb_descricao
      Properties.OnEditValueChanged = cbTabelaPropertiesEditValueChanged
      TabOrder = 7
      Width = 209
    end
    object cxLabel4: TcxLabel
      Left = 244
      Top = 55
      Caption = 'Tabela'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cbOrgao: TcxExtLookupComboBox
      Left = 16
      Top = 28
      Properties.View = TableViewOrgaoAv
      Properties.KeyFieldNames = 'Orgav_codigo'
      Properties.ListFieldItem = TableViewOrgaoAvOrgav_descricao
      Properties.OnEditValueChanged = cbOrgaoPropertiesEditValueChanged
      TabOrder = 1
      Width = 209
    end
    object cbBanco: TcxExtLookupComboBox
      Left = 244
      Top = 28
      Enabled = False
      Properties.View = TableViewBanco
      Properties.KeyFieldNames = 'Bcolib_codigo'
      Properties.ListFieldItem = cxGrid1DBTableView1Bcolib_descricao
      Properties.OnEditValueChanged = cbBancoPropertiesEditValueChanged
      TabOrder = 5
      Width = 209
    end
    object edValorRefin: TcxCalcEdit
      Left = 244
      Top = 114
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.DisplayFormat = '#,##0.00'
      Properties.OnEditValueChanged = edValorRefinPropertiesEditValueChanged
      TabOrder = 8
      Width = 125
    end
    object cxLabel7: TcxLabel
      Left = 244
      Top = 98
      Caption = 'Valor Refin/Comp.D'#237'v.'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object edTac: TcxCalcEdit
      Left = 384
      Top = 114
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.DisplayFormat = '#,##0.00'
      Properties.OnEditValueChanged = edTacPropertiesEditValueChanged
      TabOrder = 10
      Visible = False
      Width = 69
    end
    object lbTac: TcxLabel
      Left = 384
      Top = 98
      Caption = 'Tac'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 148
    Width = 470
    Height = 344
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 235
      Top = 0
      Width = 235
      Height = 344
      Align = alClient
      TabOrder = 1
      object cxLabel6: TcxLabel
        Left = 16
        Top = 12
        Caption = 'Vlr. Contrato'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object edValorContrato: TcxCalcEdit
        Left = 95
        Top = 11
        EditValue = 0.000000000000000000
        Enabled = False
        Properties.DisplayFormat = '#,##0.00'
        Properties.OnEditValueChanged = edValorContratoPropertiesEditValueChanged
        TabOrder = 1
        Width = 96
      end
      object GridValorContrao: TcxGrid
        Left = 1
        Top = 44
        Width = 233
        Height = 299
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        object cxGridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsValorContrato
          DataController.KeyFieldNames = 'itb_qtde_parcelas'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGridDBTableView1itb_qtde_parcelas: TcxGridDBColumn
            DataBinding.FieldName = 'itb_qtde_parcelas'
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
          end
          object cxGridDBTableView1valor_parcela: TcxGridDBColumn
            DataBinding.FieldName = 'valor_parcela'
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 235
      Height = 344
      Align = alLeft
      TabOrder = 0
      object cxLabel5: TcxLabel
        Left = 16
        Top = 12
        Caption = 'Vlr. Parcela'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object edValorParcela: TcxCalcEdit
        Left = 89
        Top = 11
        EditValue = 0.000000000000000000
        Enabled = False
        Properties.DisplayFormat = '#,##0.00'
        Properties.OnEditValueChanged = edValorParcelaPropertiesEditValueChanged
        TabOrder = 1
        Width = 96
      end
      object GridValorParcela: TcxGrid
        Left = 1
        Top = 44
        Width = 233
        Height = 299
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        object GridValorParcelaDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsValorParcela
          DataController.KeyFieldNames = 'itb_qtde_parcelas'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object GridValorParcelaDBTableView1itb_qtde_parcelas: TcxGridDBColumn
            DataBinding.FieldName = 'itb_qtde_parcelas'
            HeaderAlignmentHorz = taCenter
            SortIndex = 0
            SortOrder = soAscending
          end
          object GridValorParcelaDBTableView1valor_contrato: TcxGridDBColumn
            DataBinding.FieldName = 'valor_contrato'
            HeaderAlignmentHorz = taCenter
          end
        end
        object GridValorParcelaLevel1: TcxGridLevel
          GridView = GridValorParcelaDBTableView1
        end
      end
    end
  end
  object tbOrgao: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct a.orgav_codigo, a.orgav_descricao'
      'from orgaoav a, produto b'
      'where a.orgav_codigo = b.orgav_codigo'
      'order by a.orgav_descricao')
    Left = 68
    Top = 21
    object tbOrgaoorgav_codigo: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'orgav_codigo'
    end
    object tbOrgaoorgav_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'orgav_descricao'
      Size = 50
    end
  end
  object tbBanco: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'data'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'orgav_codigo'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'declare @data smalldatetime'
      ''
      'select @data = :data'
      ''
      'select a.bcolib_codigo, a.bcolib_descricao'
      'from bancolib a, produto b'
      'where a.bcolib_codigo = b.bcolib_codigo'
      'and b.orgav_codigo = :orgav_codigo'
      'and exists( '
      '   select 1'
      '   from tabela_banco c'
      '   where b.prd_codigo = c.prd_codigo'
      '   and tbb_ativa = 1'
      
        '   and @data between tbb_data_inicial and isnull(tbb_data_final,' +
        ' '#39'2079-06-06'#39')'
      '   and (tbb_dia_fixo is null or day(@data) = tbb_dia_fixo)'
      ')'
      'order by a.bcolib_descricao')
    Left = 68
    Top = 64
    object tbBancobcolib_codigo: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'bcolib_codigo'
    end
    object tbBancobcolib_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'bcolib_descricao'
      Size = 40
    end
  end
  object dsOrgao: TDataSource
    DataSet = tbOrgao
    Left = 132
    Top = 21
  end
  object dsBanco: TDataSource
    DataSet = tbBanco
    Left = 132
    Top = 64
  end
  object tbTabela: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = tbTabelaAfterScroll
    OnCalcFields = tbTabelaCalcFields
    Parameters = <
      item
        Name = 'data'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'orgao'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'banco'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @data smalldatetime'
      ''
      'select @data = :data'
      ''
      'select tbb_codigo, tbb_descricao, tbb_tac, tbb_percentual_tac, '
      '          tbb_piso_tac, tbb_teto_tac, tbb_tac_variavel'
      'from tabela_banco a, produto b'
      'where a.prd_codigo = b.prd_codigo'
      'and a.tbb_ativa = 1'
      'and orgav_codigo = :orgao'
      'and bcolib_codigo = :banco'
      'and tbb_ativa = 1'
      
        'and @data between tbb_data_inicial and isnull(tbb_data_final, '#39'2' +
        '079-06-06'#39')'
      'and (tbb_dia_fixo is null or day(@data) = tbb_dia_fixo)')
    Left = 300
    Top = 48
    object tbTabelatbb_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'tbb_codigo'
    end
    object tbTabelatbb_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'tbb_descricao'
      Size = 50
    end
    object tbTabelatbb_tac: TBCDField
      FieldName = 'tbb_tac'
      Precision = 19
    end
    object tbTabelatbb_percentual_tac: TFloatField
      FieldName = 'tbb_percentual_tac'
    end
    object tbTabelatbb_piso_tac: TBCDField
      FieldName = 'tbb_piso_tac'
      Precision = 19
    end
    object tbTabelatbb_teto_tac: TBCDField
      FieldName = 'tbb_teto_tac'
      Precision = 19
    end
    object tbTabelatbb_tac_variavel: TBooleanField
      FieldName = 'tbb_tac_variavel'
    end
    object tbTabelacalc_descricao_tac: TStringField
      DisplayLabel = 'Tac'
      FieldKind = fkCalculated
      FieldName = 'calc_descricao_tac'
      Size = 50
      Calculated = True
    end
  end
  object dsTabela: TDataSource
    DataSet = tbTabela
    Left = 344
    Top = 48
  end
  object ViewRepository: TcxGridViewRepository
    Left = 387
    Top = 8
    object TableViewOrgaoAv: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsOrgao
      DataController.KeyFieldNames = 'Orgav_codigo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object TableViewOrgaoAvOrgav_codigo: TcxGridDBColumn
        DataBinding.FieldName = 'Orgav_codigo'
        SortIndex = 0
        SortOrder = soAscending
        Width = 68
      end
      object TableViewOrgaoAvOrgav_descricao: TcxGridDBColumn
        DataBinding.FieldName = 'Orgav_descricao'
        Width = 180
      end
    end
    object TableViewBanco: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsBanco
      DataController.KeyFieldNames = 'Bcolib_codigo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1Bcolib_codigo: TcxGridDBColumn
        DataBinding.FieldName = 'Bcolib_codigo'
        SortIndex = 0
        SortOrder = soAscending
        Width = 68
      end
      object cxGrid1DBTableView1Bcolib_descricao: TcxGridDBColumn
        DataBinding.FieldName = 'Bcolib_descricao'
        Width = 180
      end
    end
    object TableViewTabela: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsTabela
      DataController.KeyFieldNames = 'tbb_codigo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1tbb_codigo: TcxGridDBColumn
        DataBinding.FieldName = 'tbb_codigo'
        Visible = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 68
      end
      object cxGrid1DBTableView1tbb_descricao: TcxGridDBColumn
        DataBinding.FieldName = 'tbb_descricao'
        Width = 180
      end
      object cxGrid1DBTableView1calc_descricao_tac: TcxGridDBColumn
        DataBinding.FieldName = 'calc_descricao_tac'
        Width = 180
      end
    end
  end
  object dsValorParcela: TDataSource
    DataSet = tbValorParcela
    Left = 132
    Top = 224
  end
  object tbValorParcela: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filter = 'valor_contrato > 0'
    Filtered = True
    Parameters = <
      item
        Name = 'valor'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'valor_refin'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'tac'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'orgao'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'banco'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'tabela'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @valor money'
      'declare @refin money'
      'declare @tac money'
      ''
      'select @valor = :valor'
      'select @refin = :valor_refin'
      'select @tac = :tac'
      ''
      
        'select c.itb_qtde_parcelas, (@valor / c.itb_indice - coalesce(@t' +
        'ac, dbo.fn_valor_tac( b.prd_codigo, b.tbb_codigo, (@valor / c.it' +
        'b_indice))))-@refin valor_contrato'
      
        'from produto a, tabela_banco b, item_tabela_banco c, parcela_pro' +
        'duto d, remuneracao_produto e'
      'where a.prd_codigo = b.prd_codigo'
      'and b.prd_codigo = c.prd_codigo'
      'and b.tbb_codigo = c.tbb_codigo'
      'and a.prd_codigo = e.prd_codigo'
      'and e.rem_codigo = b.rem_codigo'
      'and e.prd_codigo = d.prd_codigo'
      'and e.rem_codigo = d.rem_codigo'
      
        'and c.itb_qtde_parcelas between d.ppr_parcela_inicial and d.ppr_' +
        'parcela_final'
      'and a.orgav_codigo = :orgao'
      'and a.bcolib_codigo = :banco'
      'and b.tbb_codigo = :tabela')
    Left = 52
    Top = 224
    object tbValorParcelaitb_qtde_parcelas: TSmallintField
      DisplayLabel = 'Plano'
      FieldName = 'itb_qtde_parcelas'
    end
    object tbValorParcelavalor_contrato: TFloatField
      DisplayLabel = 'Valor do Contrato'
      FieldName = 'valor_contrato'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
  end
  object tbValorContrato: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'valor'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'valor_refin'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'tac'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'orgao'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'banco'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'tabela'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @valor money'
      'declare @refin money'
      'declare @tac money'
      ''
      'select @valor = :valor'
      'select @refin = :valor_refin'
      'select @tac = :tac'
      ''
      
        'select c.itb_qtde_parcelas, (@valor+@refin+ coalesce(@tac, dbo.f' +
        'n_valor_tac( b.prd_codigo, b.tbb_codigo, (@valor+@refin))))* c.i' +
        'tb_indice  valor_parcela'
      
        'from produto a, tabela_banco b, item_tabela_banco c, parcela_pro' +
        'duto d, remuneracao_produto e'
      'where a.prd_codigo = b.prd_codigo'
      'and b.prd_codigo = c.prd_codigo'
      'and b.tbb_codigo = c.tbb_codigo'
      'and a.prd_codigo = e.prd_codigo'
      'and e.rem_codigo = b.rem_codigo'
      'and e.prd_codigo = d.prd_codigo'
      'and e.rem_codigo = d.rem_codigo'
      
        'and c.itb_qtde_parcelas between d.ppr_parcela_inicial and d.ppr_' +
        'parcela_final'
      'and a.orgav_codigo = :orgao'
      'and a.bcolib_codigo = :banco'
      'and b.tbb_codigo = :tabela')
    Left = 300
    Top = 228
    object tbValorContratoitb_qtde_parcelas: TSmallintField
      DisplayLabel = 'Plano'
      FieldName = 'itb_qtde_parcelas'
    end
    object tbValorContratovalor_parcela: TFloatField
      DisplayLabel = 'Valor da Parcela'
      FieldName = 'valor_parcela'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
  end
  object dsValorContrato: TDataSource
    DataSet = tbValorContrato
    Left = 380
    Top = 228
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=awrpu07!@$AFAFAsdfqrasfafJMYJYJ&* $' +
      '%;Persist Security Info=True;User ID=agilus;Initial Catalog=dbAg' +
      'ilus;Data Source=201.24.7.210'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 112
  end
end
