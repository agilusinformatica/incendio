object dmDados: TdmDados
  OldCreateOrder = False
  Height = 358
  Width = 624
  object ConexaoExercito: TADOConnection
    CommandTimeout = 0
    ConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 112
    Top = 224
  end
  object ConexaoAgilus: TADOConnection
    CommandTimeout = 0
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=dbAgilus;Data Source=.;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 24
  end
  object tbOrgao: TADOQuery
    Connection = ConexaoAgilus
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select orgav_codigo, orgav_descricao'
      'from orgaoav')
    Left = 148
    Top = 24
  end
  object dsOrgao: TDataSource
    DataSet = tbOrgao
    Left = 224
    Top = 24
  end
  object tbUnidade: TADOQuery
    Connection = ConexaoAgilus
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'CodOrgao'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select uni_codigo, uni_descricao'
      'from unidade'
      'where orgav_codigo = :CodOrgao')
    Left = 148
    Top = 84
  end
  object dsUnidade: TDataSource
    DataSet = tbUnidade
    Left = 224
    Top = 84
  end
  object tbContrato: TADOQuery
    Connection = ConexaoExercito
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'SELECT [Prec-cp], Valor, Prazo, Cod'
      'FROM total'
      'WHERE Prazo <> "0000"'
      'AND Valor is not null')
    Left = 288
    Top = 224
  end
  object tbCliente: TADOQuery
    Connection = ConexaoExercito
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'SELECT c.CODOM, c.pg, c.nrpg, c.cat, s.Simples, '
      'c.[Prec-cp], c.Ind, c.SIGLA, c.CPF, c.Idt, c.Nome, '
      's.Dt_Nasc, c.Banco, c.Agencia, c.Conta, c.Bruto, c.Desconto, '
      'c.L'#237'quido, c.Endereco, c.Bairro, c.Cidade, c.UF, c.CEP'
      'FROM Completo as c '
      'INNER JOIN Simples as s ON c.[Prec-cp] = s.[Prec-cp]')
    Left = 204
    Top = 224
  end
  object tbTotalizador: TADOQuery
    Connection = ConexaoExercito
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'SELECT DISTINCT tl.cod, tl.Discriminacao'
      'FROM total as t'
      'INNER JOIN tab_Ligacao_Codigo as tl ON t.Cod = tl.cod'
      'WHERE tl.tipo = "EMP"')
    Left = 368
    Top = 224
  end
  object tbNaoVinculado: TADOQuery
    Connection = ConexaoAgilus
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select cod, discriminacao, convert(smallint,null) bcolib_codigo '
      'into #totalizador'
      'from temp_totalizador_exercito'
      
        'where cod not in (select veb_codigo_totalizador_exercito from vi' +
        'nculo_exercito_banco)'
      ''
      'select * from #totalizador'
      ''
      'drop table #totalizador')
    Left = 148
    Top = 144
  end
  object dsNaoVinculado: TDataSource
    DataSet = tbNaoVinculado
    Left = 224
    Top = 144
  end
  object tbBanco: TADOQuery
    Connection = ConexaoAgilus
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select bcolib_codigo, bcolib_descricao'
      'into #banco'
      'from bancolib'
      ''
      'insert into #banco'
      'values(-1, '#39'<ignorar>'#39')'
      ''
      'select * from #banco'
      'order by bcolib_codigo'
      ''
      'drop table #banco')
    Left = 308
    Top = 24
  end
  object dsBanco: TDataSource
    DataSet = tbBanco
    Left = 384
    Top = 24
  end
  object prAtualizaCliente: TADOStoredProc
    Connection = ConexaoAgilus
    CommandTimeout = 0
    ProcedureName = 'pr_atualiza_cliente_exercito;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@orgav_codigo'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@uni_codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@mes'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@qtde_registros'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 324
    Top = 120
  end
  object prIncluiCliente: TADOStoredProc
    Connection = ConexaoAgilus
    CommandTimeout = 0
    ProcedureName = 'pr_inclui_cliente_exercito;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@orgav_codigo'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@uni_codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@mes'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@qtde_registros'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 428
    Top = 120
  end
  object prIncluiContrato: TADOStoredProc
    Connection = ConexaoAgilus
    CommandTimeout = 0
    ProcedureName = 'pr_inclui_contrato_exercito;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@orgav_codigo'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@uni_codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@qtde_registros'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 528
    Top = 120
  end
end
