object dmDados: TdmDados
  OldCreateOrder = False
  Height = 591
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
        Name = '@fil_codigo'
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
        Name = '@fil_codigo'
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
    Left = 436
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
  object tbCompleto: TADOTable
    Connection = ConexaoExercito
    TableName = 'completo'
    Left = 228
    Top = 224
  end
  object DropProc: TADOQuery
    Connection = ConexaoAgilus
    Parameters = <>
    SQL.Strings = (
      'if object_id('#39'pr_atualiza_cliente_exercito'#39') > 0'
      '   drop procedure pr_atualiza_cliente_exercito'
      'if object_id('#39'pr_inclui_cliente_exercito'#39') > 0'
      '   drop procedure pr_inclui_cliente_exercito'
      'if object_id('#39'pr_inclui_contrato_exercito'#39') > 0'
      '   drop procedure pr_inclui_contrato_exercito')
    Left = 200
    Top = 348
  end
  object CreateProcAtualizaCliente: TADOQuery
    Connection = ConexaoAgilus
    Parameters = <>
    SQL.Strings = (
      'create procedure pr_atualiza_cliente_exercito '
      '(@orgav_codigo smallint,'
      ' @uni_codigo int,'
      ' @mes smalldatetime,'
      ' @fil_codigo int,'
      ' @qtde_registros int output'
      ') '
      'with encryption'
      'as'
      'begin'
      '   insert into bancolib( bcolib_codigo, bcolib_descricao)'
      '   select distinct banco, banco'
      '   from temp_cliente_exercito'
      '   where banco not in ( select bcolib_codigo'
      '                        from bancolib ) '
      ''
      '   update cliente_televenda'
      '   set clt_matricula = [prec-cp],'
      '   /*clt_endereco = endereco,'
      '   clt_bairro = bairro, '
      '   clt_cidade = cidade,'
      '   clt_uf = uf, '
      '   clt_cep = cep,*/'
      '   clt_observacao = '
      '      isnull('#39'CAT: '#39'+cat+char(13),'#39#39')+'
      '      isnull('#39'INDICATIVO: '#39'+ind+char(13),'#39#39')+'
      '      isnull('#39'SIGLA: '#39'+sigla+char(13),'#39#39')+'
      '      isnull('#39'CODOM: '#39'+codom+char(13),'#39#39'),'
      '   clt_cargo = pg,'
      '   clt_rg = idt, '
      '   clt_salario = bruto,'
      '   clt_nome = nome,'
      
        '   clt_data_nascimento = dbo.fn_converte_data(dt_nasc,'#39'yyyymmdd'#39 +
        '),'
      '   clt_data_atualizacao_margem = @mes,'
      '   uni_codigo = isnull(@uni_codigo,uni_codigo),'
      '   ccl_codigo = case cat'
      '                   when '#39'MIL ATIVA'#39' then 1'
      '                   when '#39'MIL INATIVO'#39' then 2'
      '                   when '#39'PENSIONISTA'#39' then 3'
      '                   else null'
      '                end, '
      '   bcolib_codigo_conta = banco, '
      '   clt_agencia = Agencia, '
      '   clt_conta_corrente = conta'
      '   from cliente_televenda a, temp_cliente_exercito'
      '   where clt_cpf = cpf'
      '   and orgav_codigo = @orgav_codigo'
      '   and (@fil_codigo is null or fil_codigo = @fil_codigo)'
      '   --and (@uni_codigo is null or uni_codigo = @uni_codigo)'
      ''
      ''
      '   select @qtde_registros = @@rowcount'
      ''
      'end'
      '')
    Left = 200
    Top = 412
  end
  object CreateProcIncluiCliente: TADOQuery
    Connection = ConexaoAgilus
    Parameters = <>
    SQL.Strings = (
      'create procedure pr_inclui_cliente_exercito '
      '(@orgav_codigo smallint,'
      ' @uni_codigo int,'
      ' @mes smalldatetime,'
      ' @fil_codigo int,'
      ' @qtde_registros int output'
      ')'
      'with encryption'
      'as'
      'begin'
      ''
      '   update temp_cliente_exercito'
      '   set conta = null'
      '   where conta like '#39'%e+%'#39
      ''
      
        '   insert into cliente_televenda( clt_cpf, clt_matricula, clt_en' +
        'dereco, clt_bairro, clt_cidade, clt_uf, clt_cep,'
      
        '   clt_observacao, clt_cargo, clt_rg, clt_salario, clt_nome, clt' +
        '_data_nascimento,'
      
        '   clt_data_atualizacao_margem, orgav_codigo, uni_codigo, fil_co' +
        'digo, tst_codigo, ccl_codigo, bcolib_codigo_conta, clt_agencia, ' +
        'clt_conta_corrente )'
      '   select cpf, [prec-cp], endereco, bairro, cidade, uf, cep,'
      '      isnull('#39'CAT: '#39'+cat+char(13),'#39#39')+'
      '      isnull('#39'INDICATIVO: '#39'+ind+char(13),'#39#39')+'
      '      isnull('#39'SIGLA: '#39'+sigla+char(13),'#39#39')+'
      '      isnull('#39'CODOM: '#39'+codom+char(13),'#39#39'),'
      
        '   pg, idt, bruto, nome, dbo.fn_converte_data(dt_nasc,'#39'yyyymmdd'#39 +
        '),'
      '   @mes, @orgav_codigo, @uni_codigo, isnull(@fil_codigo,1), 1,'
      '   case cat'
      '      when '#39'MIL ATIVA'#39' then 1'
      '      when '#39'MIL INATIVO'#39' then 2'
      '      when '#39'PENSIONISTA'#39' then 3'
      '      else null'
      '   end,'
      '   banco, Agencia, conta'
      ''
      '   from temp_cliente_exercito'
      '   where not exists( select 1 from cliente_televenda'
      '                     where clt_cpf = cpf'
      '                     and clt_matricula = [prec-cp]'
      '                     and orgav_codigo = @orgav_codigo'
      
        '                     and (@fil_codigo is null or fil_codigo = @f' +
        'il_codigo))'
      
        '                     --and (@uni_codigo is null or uni_codigo = ' +
        '@uni_codigo) )'
      ''
      '   select @qtde_registros = @@rowcount'
      'end')
    Left = 196
    Top = 460
  end
  object CreateProcIncluiContrato: TADOQuery
    Connection = ConexaoAgilus
    Parameters = <>
    SQL.Strings = (
      'create procedure pr_inclui_contrato_exercito '
      '(@orgav_codigo smallint,'
      ' @uni_codigo int,'
      ' @qtde_registros int output'
      ') '
      'with encryption'
      'as'
      'begin'
      '   set nocount on '
      ''
      '   delete refin_televenda'
      '   where orgav_codigo = @orgav_codigo'
      ''
      
        '   -- como no exercito s'#243' pode ter um contrato por banco, posso ' +
        'me basear somente no banco'
      '   -- para verificar se um contrato ja estava pr'#233'-cadastrado '
      '   /*update refin_televenda'
      
        '   set rft_data_ultimo_vencimento = dbo.fn_converte_data('#39'01'#39'+le' +
        'ft(prazo,2)+'#39'20'#39'+right(prazo,2),'#39'ddmmyyyy'#39'),'
      '       rft_valor_parcela = valor,'
      '       rft_totalizador = d.discriminacao'
      
        '   from refin_televenda r, temp_contrato_exercito a, vinculo_exe' +
        'rcito_banco c, temp_totalizador_exercito d'
      '   where r.bcolib_codigo = c.bcolib_codigo'
      '   and a.[prec-cp] = r.rft_matricula'
      '   and a.cod = c.veb_codigo_totalizador_exercito'
      '   and a.cod = d.cod'
      '   and c.bcolib_codigo is not null'
      '   and r.orgav_codigo = @orgav_codigo*/'
      '   '
      ''
      
        '   insert into refin_televenda( rft_cpf, bcolib_codigo, rft_matr' +
        'icula, rft_data_ultimo_vencimento, '
      
        '   rft_valor_parcela, rft_importado, rft_totalizador, orgav_codi' +
        'go, rft_data_atualizacao )'
      '   select distinct b.cpf, bcolib_codigo, a.[prec-cp],  '
      
        '   dbo.fn_converte_data('#39'01'#39'+left(prazo,2)+'#39'20'#39'+right(prazo,2),'#39 +
        'ddmmyyyy'#39'), valor, 0, d.discriminacao, @orgav_codigo, convert(sm' +
        'alldatetime,convert(varchar(11), getdate()))'
      
        '   from temp_contrato_exercito a, temp_cliente_exercito b, vincu' +
        'lo_exercito_banco c, temp_totalizador_exercito d'
      '   where a.[prec-cp] = b.[prec-cp]'
      '   and a.cod = c.veb_codigo_totalizador_exercito'
      '   and a.cod = d.cod'
      '   and c.bcolib_codigo is not null'
      '   /*and not exists( select 1 from refin_televenda e'
      '                   where e.rft_cpf = b.cpf'
      '                   and e.rft_matricula = a.[prec-cp]'
      '                   and e.bcolib_codigo = c.bcolib_codigo'
      '                   and e.orgav_codigo = @orgav_codigo )*/'
      '                   '
      '   /*delete refin_televenda'
      '   from refin_televenda e'
      '   where orgav_codigo = @orgav_codigo'
      
        '   and not exists(   select 1 from temp_contrato_exercito a, vin' +
        'culo_exercito_banco c'
      '                     where a.[prec-cp] = e.rft_matricula'
      
        '                     and a.cod = c.veb_codigo_totalizador_exerci' +
        'to'
      '                     and c.bcolib_codigo = e.bcolib_codigo'
      '                     and e.orgav_codigo = @orgav_codigo )*/'
      '   '
      '   select @qtde_registros = @@rowcount'
      ''
      'end'
      '      ')
    Left = 196
    Top = 512
  end
  object tbFilial: TADOQuery
    Connection = ConexaoAgilus
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select fil_codigo, fil_descricao'
      'from filial')
    Left = 400
    Top = 228
  end
  object dsFilial: TDataSource
    DataSet = tbFilial
    Left = 476
    Top = 228
  end
end
