object frmCadProduto: TfrmCadProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produto'
  ClientHeight = 579
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cbSeguradora: TcxLookupComboBox
    Left = 32
    Top = 36
    Properties.ClearKey = 46
    Properties.DropDownSizeable = True
    Properties.KeyFieldNames = 'Id'
    Properties.ListColumns = <
      item
        FieldName = 'Id'
      end
      item
        FieldName = 'Nome'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmDados.dsSeguradora
    Properties.OnChange = cbSeguradoraPropertiesChange
    TabOrder = 0
    Width = 297
  end
  object cxLabel1: TcxLabel
    Left = 32
    Top = 20
    Caption = 'Seguradora'
  end
  object cxLabel2: TcxLabel
    Left = 32
    Top = 64
    Caption = 'Nome'
  end
  object edNome: TcxTextEdit
    Left = 32
    Top = 80
    TabOrder = 2
    Width = 297
  end
  object cbRegiao: TcxLookupComboBox
    Left = 32
    Top = 128
    Properties.ClearKey = 46
    Properties.DropDownSizeable = True
    Properties.KeyFieldNames = 'Id'
    Properties.ListColumns = <
      item
        FieldName = 'Id'
      end
      item
        FieldName = 'Nome'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmDados.dsRegiao
    TabOrder = 3
    Width = 297
  end
  object cxLabel3: TcxLabel
    Left = 32
    Top = 112
    Caption = 'Regi'#227'o'
  end
  object cbAtivo: TcxCheckBox
    Left = 372
    Top = 36
    Caption = 'Ativo?'
    State = cbsChecked
    TabOrder = 1
    Width = 121
  end
  object cxLabel4: TcxLabel
    Left = 32
    Top = 160
    Caption = 'M'#225'ximo de Vidas'
  end
  object edMaximoVidas: TcxTextEdit
    Left = 32
    Top = 176
    TabOrder = 4
    OnKeyPress = edMaximoVidasKeyPress
    Width = 97
  end
  object cxLabel5: TcxLabel
    Left = 156
    Top = 160
    Caption = 'C'#243'd.Seguradora'
  end
  object edCodSeguradora: TcxTextEdit
    Left = 156
    Top = 176
    TabOrder = 5
    Width = 97
  end
  object cxGrid1: TcxGrid
    Left = 32
    Top = 232
    Width = 297
    Height = 269
    TabOrder = 11
    object vwPlanoSaude: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsPlanoSaude
      DataController.KeyFieldNames = 'Id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object vwPlanoSaudeMarca: TcxGridDBColumn
        DataBinding.FieldName = 'Marca'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.OnChange = vwPlanoSaudeMarcaPropertiesChange
      end
      object vwPlanoSaudeId: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        Visible = False
        Options.Editing = False
      end
      object vwPlanoSaudeNome: TcxGridDBColumn
        DataBinding.FieldName = 'Nome'
        Options.Editing = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = vwPlanoSaude
    end
  end
  object gridFaixaIdade: TcxGrid
    Left = 352
    Top = 232
    Width = 353
    Height = 269
    TabOrder = 12
    object vwFaixaIdade: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsFaixaIdade
      DataController.KeyFieldNames = 'Id;PlanoSaudeId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object vwFaixaIdademarca: TcxGridDBColumn
        DataBinding.FieldName = 'marca'
        Width = 64
      end
      object vwFaixaIdadeId: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        Visible = False
      end
      object vwFaixaIdadeIdadeInicial: TcxGridDBColumn
        DataBinding.FieldName = 'IdadeInicial'
        Width = 86
      end
      object vwFaixaIdadeIdadeFinal: TcxGridDBColumn
        DataBinding.FieldName = 'IdadeFinal'
        Width = 127
      end
      object vwFaixaIdadeEmpresaId: TcxGridDBColumn
        DataBinding.FieldName = 'EmpresaId'
        Visible = False
      end
      object vwFaixaIdadePlanoSaudeId: TcxGridDBColumn
        DataBinding.FieldName = 'PlanoSaudeId'
        Visible = False
      end
      object vwFaixaIdadevalor: TcxGridDBColumn
        DataBinding.FieldName = 'valor'
        Width = 126
      end
    end
    object gridFaixaIdadeLevel1: TcxGridLevel
      GridView = vwFaixaIdade
    end
  end
  object cxButton1: TcxButton
    Left = 32
    Top = 532
    Width = 83
    Height = 33
    Caption = 'Salvar'
    ModalResult = 1
    TabOrder = 13
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 140
    Top = 532
    Width = 83
    Height = 33
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 14
    OnClick = cxButton2Click
  end
  object tbPlanoSaude: TADOQuery
    Connection = dmDados.Conexao
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = tbPlanoSaudeAfterScroll
    Parameters = <
      item
        Name = 'SeguradoraId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ProdutoId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select *, convert(bit,0) Marca'
      'into #plano'
      'from PlanoSaude'
      'where SeguradoraId = :SeguradoraId'
      ''
      'update #plano'
      'set Marca = 1'
      'from #plano a'
      'join ProdutoPlanoSaude b on a.Id = b.PlanoSaudeId'
      'where ProdutoId = :ProdutoId'
      ''
      'select *'
      'from #plano'
      ''
      'drop table #plano')
    Left = 124
    Top = 336
    object tbPlanoSaudeId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tbPlanoSaudeNome: TWideMemoField
      FieldName = 'Nome'
      BlobType = ftWideMemo
    end
    object tbPlanoSaudeSeguradoraId: TIntegerField
      FieldName = 'SeguradoraId'
    end
    object tbPlanoSaudePlanoSaudeGenericoId: TIntegerField
      FieldName = 'PlanoSaudeGenericoId'
    end
    object tbPlanoSaudeMarca: TBooleanField
      FieldName = 'Marca'
    end
  end
  object dsPlanoSaude: TDataSource
    DataSet = tbPlanoSaude
    Left = 200
    Top = 336
  end
  object tbFaixaIdade: TADOQuery
    Connection = dmDados.Conexao
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'SeguradoraId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ProdutoId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select a.*, b.Id PlanoSaudeId,CONVERT(money,null) valor, CONVERT' +
        '(bit, 0) marca'
      'into #faixa'
      'from FaixaIdade a'
      'cross join PlanoSaude b'
      'where SeguradoraId = :SeguradoraId'
      ''
      'update #faixa'
      'set marca = 1,'
      '    valor = c.Valor'
      'from ProdutoPlanoSaude a'
      'join PlanoSaude b on a.PlanoSaudeId = b.Id'
      'join FaixaIdadePlano c on a.Id = c.ProdutoPlanoSaudeId'
      
        'join #faixa f on f.Id = c.FaixaIdadeId and f.PlanoSaudeId = a.Pl' +
        'anoSaudeId'
      'where ProdutoId = :ProdutoId'
      ''
      ''
      'select *'
      'from #faixa'
      ''
      'drop table #faixa')
    Left = 544
    Top = 352
    object tbFaixaIdadeId: TIntegerField
      FieldName = 'Id'
    end
    object tbFaixaIdadeIdadeInicial: TIntegerField
      FieldName = 'IdadeInicial'
    end
    object tbFaixaIdadeIdadeFinal: TIntegerField
      FieldName = 'IdadeFinal'
    end
    object tbFaixaIdadeEmpresaId: TIntegerField
      FieldName = 'EmpresaId'
    end
    object tbFaixaIdadePlanoSaudeId: TIntegerField
      FieldName = 'PlanoSaudeId'
    end
    object tbFaixaIdadevalor: TBCDField
      FieldName = 'valor'
      DisplayFormat = '#,##0.00'
      EditFormat = '#0.00'
      Precision = 19
    end
    object tbFaixaIdademarca: TBooleanField
      FieldName = 'marca'
    end
  end
  object dsFaixaIdade: TDataSource
    DataSet = tbFaixaIdade
    Left = 624
    Top = 352
  end
end
