object dmDados: TdmDados
  OldCreateOrder = False
  Height = 358
  Width = 624
  object ConexaoAgilus: TADOConnection
    CommandTimeout = 0
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=dbAgilus;Data Source=.;Use Procedure fo' +
      'r Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=' +
      'AGILUS;Use Encryption for Data=False;Tag with column collation w' +
      'hen possible=False;'
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
  object prProcessaCarga: TADOStoredProc
    Connection = ConexaoAgilus
    CommandTimeout = 0
    ProcedureName = 'pr_processa_cliente_marinha;1'
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
        Name = '@qtde_clientes_incluidos'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@qtde_clientes_alterados'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@qtde_contratos_incluidos'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 224
    Top = 208
  end
  object tbVinculo: TADOQuery
    Connection = ConexaoAgilus
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select * from vinculo_marinha_banco')
    Left = 308
    Top = 84
  end
  object dsVinculo: TDataSource
    DataSet = tbVinculo
    Left = 384
    Top = 84
  end
end
