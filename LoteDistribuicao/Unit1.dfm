object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Lote de Distribui'#231#227'o'
  ClientHeight = 431
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  DesignSize = (
    727
    431)
  PixelsPerInch = 96
  TextHeight = 14
  object cxGrid1: TcxGrid
    Left = 8
    Top = 48
    Width = 711
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCliente
      DataController.KeyFieldNames = 'clt_codigo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.NoDataToDisplayInfoText = '<Sem dados>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1clt_codigo: TcxGridDBColumn
        DataBinding.FieldName = 'clt_codigo'
        Width = 45
      end
      object cxGrid1DBTableView1clt_cpf: TcxGridDBColumn
        DataBinding.FieldName = 'clt_cpf'
        Width = 94
      end
      object cxGrid1DBTableView1clt_nome: TcxGridDBColumn
        DataBinding.FieldName = 'clt_nome'
        Width = 212
      end
      object cxGrid1DBTableView1tst_descricao: TcxGridDBColumn
        DataBinding.FieldName = 'tst_descricao'
        Width = 109
      end
      object cxGrid1DBTableView1fil_descricao: TcxGridDBColumn
        DataBinding.FieldName = 'fil_descricao'
        Width = 80
      end
      object cxGrid1DBTableView1orgav_descricao: TcxGridDBColumn
        DataBinding.FieldName = 'orgav_descricao'
        Width = 93
      end
      object cxGrid1DBTableView1usu_login: TcxGridDBColumn
        DataBinding.FieldName = 'usu_login'
        Width = 76
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 399
    Anchors = [akLeft, akBottom]
    Caption = 'Passar os clientes acima para o operador:'
    Transparent = True
  end
  object cbOperador: TcxLookupComboBox
    Left = 268
    Top = 398
    Anchors = [akLeft, akBottom]
    Properties.DropDownSizeable = True
    Properties.KeyFieldNames = 'usu_codigo'
    Properties.ListColumns = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'usu_codigo'
      end
      item
        Caption = 'Login'
        FieldName = 'usu_login'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListOptions.CaseInsensitive = True
    Properties.ListSource = dsOperador
    TabOrder = 6
    Width = 241
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 16
    Caption = 'CPF:'
    Transparent = True
  end
  object edCpf: TcxMaskEdit
    Left = 44
    Top = 15
    Properties.EditMask = '999\.999\.999\-99;1;_'
    Properties.MaxLength = 0
    TabOrder = 0
    Text = '   .   .   -  '
    Width = 113
  end
  object btIncluir: TcxButton
    Left = 170
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = btIncluirClick
  end
  object btLimpar: TcxButton
    Left = 516
    Top = 12
    Width = 91
    Height = 25
    Caption = 'Limpar Tudo'
    TabOrder = 2
    OnClick = btLimparClick
  end
  object btProcessar: TcxButton
    Left = 525
    Top = 396
    Width = 84
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Processar'
    TabOrder = 7
    OnClick = btProcessarClick
  end
  object AgilusConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=Agilus;I' +
      'nitial Catalog=dbAgilus;Data Source=.;Use Procedure for Prepare=' +
      '1;Auto Translate=True;Packet Size=4096;Workstation ID=AGILUS;Use' +
      ' Encryption for Data=False;Tag with column collation when possib' +
      'le=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    BeforeDisconnect = AgilusConnectionBeforeDisconnect
    Left = 156
    Top = 88
  end
  object tbCliente: TADOQuery
    Connection = AgilusConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select convert(int,clt_codigo) clt_codigo, clt_cpf, clt_nome, ts' +
        't_descricao, fil_descricao, orgav_descricao, usu_login'
      'into #temp'
      'from cliente_televenda a'
      
        'inner join tipo_status_televenda b on a.tst_codigo = b.tst_codig' +
        'o'
      'inner join filial c on a.fil_codigo = c.fil_codigo'
      'inner join orgaoav d on a.orgav_codigo = d.orgav_codigo'
      'left join usuario e on a.usu_codigo_operador = e.usu_codigo'
      'where 1=2'
      ''
      'select * from #temp'
      ''
      'drop table #temp')
    Left = 304
    Top = 84
    object tbClienteclt_codigo: TAutoIncField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clt_codigo'
    end
    object tbClienteclt_cpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'clt_cpf'
      EditMask = '999.999.999-99;0;_'
      Size = 14
    end
    object tbClienteclt_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'clt_nome'
      Size = 100
    end
    object tbClientetst_descricao: TStringField
      DisplayLabel = 'Status'
      FieldName = 'tst_descricao'
      Size = 100
    end
    object tbClientefil_descricao: TWideStringField
      DisplayLabel = 'Filial'
      FieldName = 'fil_descricao'
      Size = 50
    end
    object tbClienteorgav_descricao: TWideStringField
      DisplayLabel = #211'rg'#227'o'
      FieldName = 'orgav_descricao'
      Size = 50
    end
    object tbClienteusu_login: TWideStringField
      DisplayLabel = 'Operador'
      FieldName = 'usu_login'
    end
  end
  object dsCliente: TDataSource
    DataSet = tbCliente
    Left = 432
    Top = 88
  end
  object tbOperador: TADOQuery
    Connection = AgilusConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select usu_codigo, usu_login'
      'from usuario a, perfil b'
      'where a.prf_codigo = b.prf_codigo'
      'and b.prf_operador_televenda = 1'
      'and a.usu_ativo = 1'
      'order by usu_login')
    Left = 304
    Top = 160
  end
  object dsOperador: TDataSource
    DataSet = tbOperador
    Left = 436
    Top = 164
  end
  object LookAndFeel: TcxLookAndFeelController
    Kind = lfStandard
    NativeStyle = True
    Left = 156
    Top = 152
  end
end
