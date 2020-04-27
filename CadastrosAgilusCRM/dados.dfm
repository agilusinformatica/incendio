object dmDados: TdmDados
  OldCreateOrder = False
  Height = 370
  Width = 635
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=dbAgilusCRM;Data Source=.'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 72
    Top = 32
  end
  object tbSeguradora: TADOQuery
    Active = True
    Connection = Conexao
    CursorType = ctStatic
    AfterInsert = tbSeguradoraAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * from SeguradoraSeguroSaude'
      'where EmpresaId = 1')
    Left = 168
    Top = 32
    object tbSeguradoraId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tbSeguradoraNome: TWideMemoField
      FieldName = 'Nome'
      BlobType = ftWideMemo
    end
    object tbSeguradoraEmpresaId: TIntegerField
      FieldName = 'EmpresaId'
      Visible = False
    end
  end
  object tbRegiao: TADOQuery
    Active = True
    Connection = Conexao
    CursorType = ctStatic
    AfterInsert = tbSeguradoraAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * '
      'from RegiaoPlanoSaude'
      'where EmpresaId = 1')
    Left = 280
    Top = 32
    object tbRegiaoId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tbRegiaoNome: TWideMemoField
      FieldName = 'Nome'
      BlobType = ftWideMemo
    end
    object tbRegiaoEmpresaId: TIntegerField
      FieldName = 'EmpresaId'
      Visible = False
    end
  end
  object dsSeguradora: TDataSource
    DataSet = tbSeguradora
    Left = 168
    Top = 100
  end
  object dsRegiao: TDataSource
    DataSet = tbRegiao
    Left = 284
    Top = 100
  end
  object tbPlanoSaudeGenerico: TADOQuery
    Active = True
    Connection = Conexao
    CursorType = ctStatic
    AfterInsert = tbSeguradoraAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * '
      'from PlanoSaudeGenerico'
      'where EmpresaId = 1')
    Left = 392
    Top = 36
    object AutoIncField1: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object WideMemoField1: TWideMemoField
      FieldName = 'Nome'
      BlobType = ftWideMemo
    end
    object IntegerField1: TIntegerField
      FieldName = 'EmpresaId'
      Visible = False
    end
  end
  object dsPlanoSaudeGenerico: TDataSource
    DataSet = tbPlanoSaudeGenerico
    Left = 396
    Top = 104
  end
  object tbFaixaIdade: TADOQuery
    Active = True
    Connection = Conexao
    CursorType = ctStatic
    AfterInsert = tbSeguradoraAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * '
      'from FaixaIdade'
      'where EmpresaId = 1')
    Left = 544
    Top = 32
    object AutoIncField2: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'EmpresaId'
      Visible = False
    end
    object tbFaixaIdadeIdadeInicial: TIntegerField
      FieldName = 'IdadeInicial'
    end
    object tbFaixaIdadeIdadeFinal: TIntegerField
      FieldName = 'IdadeFinal'
    end
  end
  object dsFaixaIdade: TDataSource
    DataSet = tbFaixaIdade
    Left = 548
    Top = 100
  end
end
