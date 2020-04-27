object dmDados: TdmDados
  OldCreateOrder = False
  Height = 358
  Width = 624
  object ConexaoAgilus: TADOConnection
    CommandTimeout = 0
    ConnectionString = 
      'FILE NAME=C:\Agilus Desenvolvimento\Incendio\CargaAero\conexao.u' +
      'dl;'
    Provider = 'SQLNCLI11.1'
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
    ProcedureName = 'pr_processa_cliente_aero;1'
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
      'select * from vinculo_aero_banco')
    Left = 308
    Top = 84
  end
  object dsVinculo: TDataSource
    DataSet = tbVinculo
    Left = 384
    Top = 84
  end
  object CreateProc: TADOQuery
    Connection = ConexaoAgilus
    Parameters = <
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'create procedure pr_processa_cliente_aero '
      '(@orgav_codigo smallint,'
      ' @uni_codigo int,'
      ' @mes smalldatetime,'
      ' @fil_codigo int,'
      ' @qtde_clientes_incluidos int output,'
      ' @qtde_clientes_alterados int output,'
      ' @qtde_contratos_incluidos int output'
      ') '
      'with encryption'
      'as'
      'begin'
      '   set nocount on'
      ''
      '   if object_id('#39'temp_contrato_aero'#39') > 0'
      '      drop table temp_contrato_aero'
      '      '
      '   update temp_carga_aero'
      '   set cpf = dbo.fn_strzero(cpf,11)'
      '   where len(cpf) < 11'
      ''
      
        '   select cpf, matricula, banco, dbo.fn_converte_moeda(parcela) ' +
        'parcela, dbo.fn_converte_data('#39'01-'#39'+left(termino,4)+'#39'20'#39'+right(t' +
        'ermino,2),'#39'dd-mmm-yyyy'#39') termino'
      '   into temp_contrato_aero'
      '   from temp_carga_aero'
      '   '
      '   select tipo, cargo, nome, matricula, cpf, upag'
      '   into #carga_aero'
      '   from temp_carga_aero'
      ''
      '   create index i_cpf on temp_contrato_aero(cpf)'
      ''
      '   create index i_cpf on #carga_aero(cpf);'
      ''
      '   With Dups as'
      '   ('
      
        '      select *, row_number() over (partition by cpf order by cpf' +
        ') as RowNum '
      '      from #carga_aero'
      '   )'
      '   Delete from Dups where rownum > 1;'
      ''
      '   update cliente_televenda'
      '   set clt_matricula = matricula,'
      '   clt_cargo = cargo,'
      '   clt_nome = nome,'
      '   clt_data_atualizacao_margem = @mes'
      '   from cliente_televenda a, #carga_aero'
      '   where clt_cpf = cpf'
      '   and orgav_codigo = @orgav_codigo'
      '   and (@uni_codigo is null or uni_codigo = @uni_codigo)'
      ''
      '   select @qtde_clientes_alterados = @@rowcount'
      ''
      
        '   insert into cliente_televenda( clt_matricula, clt_nome, clt_c' +
        'pf, clt_observacao, clt_cargo, clt_data_atualizacao_margem,'
      '   orgav_codigo, uni_codigo, tst_codigo, fil_codigo )'
      
        '   select matricula, nome, cpf, '#39'TIPO: '#39'+tipo+char(13)+'#39'UPAG: '#39'+' +
        'upag, cargo, @mes, @orgav_codigo, @uni_codigo, 1, isnull(@fil_co' +
        'digo,1)'
      '   from #carga_aero'
      '   where not exists ( select 1 from cliente_televenda'
      '                      where clt_cpf = cpf'
      '                      and orgav_codigo = @orgav_codigo'
      
        '                      and (@uni_codigo is null or uni_codigo = @' +
        'uni_codigo) )'
      ''
      '   select @qtde_clientes_incluidos = @@rowcount'
      ''
      ''
      
        '   if (select par_cod_cliente from parametro where par_padrao = ' +
        '1) = 240 -- tratamento especial para uniao cred'
      '   begin'
      '      update cliente_televenda'
      '      set ccl_codigo ='
      '        case tipo'
      '          when 1 then 1'
      '          when 3 then 5'
      '          when 4 then 5'
      '          when 5 then 3'
      '          else ccl_codigo'
      '        end'
      '      from cliente_televenda a, #carga_aero'
      '      where clt_cpf = cpf'
      '      and orgav_codigo = @orgav_codigo'
      '      and (@uni_codigo is null or uni_codigo = @uni_codigo)'
      '   end'
      ''
      '   delete refin_televenda'
      '   where orgav_codigo = @orgav_codigo'
      ''
      
        '   insert into refin_televenda( rft_cpf, rft_matricula, bcolib_c' +
        'odigo, rft_valor_parcela, rft_data_ultimo_vencimento, rft_import' +
        'ado, orgav_codigo, rft_data_atualizacao )'
      
        '   select cpf, matricula, banco, parcela, termino, 0, @orgav_cod' +
        'igo, convert(varchar(11), getdate())'
      '   from temp_contrato_aero'
      ''
      '   select @qtde_contratos_incluidos = @@rowcount'
      ''
      
        '   if (select par_cod_cliente from parametro where par_padrao = ' +
        '1) = 18'
      '   begin'
      
        '      insert into refin_televenda( rft_cpf, rft_matricula, bcoli' +
        'b_codigo, rft_valor_parcela, rft_data_ultimo_vencimento, rft_imp' +
        'ortado, orgav_codigo, rft_data_atualizacao )'
      
        '      select rft_cpf, rft_matricula, bcolib_codigo, rft_valor_pa' +
        'rcela, rft_data_ultimo_vencimento, rft_importado, orgav_codigo, ' +
        'rft_data_atualizacao'
      '      from refin_televenda_morada_cruzeiro a'
      '      where orgav_codigo = @orgav_codigo'
      '      and not exists( select 1 from refin_televenda b'
      '                      where b.rft_cpf = a.rft_cpf'
      '                      and b.rft_matricula = a.rft_matricula'
      '                      and b.bcolib_codigo = a.bcolib_codigo'
      
        '                      and b.rft_data_ultimo_vencimento = a.rft_d' +
        'ata_ultimo_vencimento'
      
        '                      and b.rft_valor_parcela = a.rft_valor_parc' +
        'ela'
      '                      and b.orgav_codigo = @orgav_codigo )'
      '                      '
      
        '      select @qtde_contratos_incluidos = @qtde_contratos_incluid' +
        'os + @@rowcount'
      '   end'
      '   '
      '   drop table #carga_aero'
      'end'
      ''
      '')
    Left = 108
    Top = 252
  end
  object DropProc: TADOQuery
    Connection = ConexaoAgilus
    Parameters = <>
    SQL.Strings = (
      'if object_id('#39'pr_processa_cliente_aero'#39') > 0'
      '   drop procedure pr_processa_cliente_aero')
    Left = 48
    Top = 252
  end
  object tbFilial: TADOQuery
    Connection = ConexaoAgilus
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select fil_codigo, fil_descricao'
      'from filial')
    Left = 148
    Top = 152
  end
  object dsFilial: TDataSource
    DataSet = tbFilial
    Left = 224
    Top = 152
  end
end
