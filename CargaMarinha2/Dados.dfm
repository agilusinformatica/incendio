object dmDados: TdmDados
  OldCreateOrder = False
  Height = 358
  Width = 624
  object ConexaoAgilus: TADOConnection
    CommandTimeout = 0
    ConnectionString = 
      'FILE NAME=C:\Agilus Desenvolvimento\Incendio\CargaMarinha2\Conex' +
      'ao.udl;'
    LoginPrompt = False
    Provider = 'C:\Agilus Desenvolvimento\Incendio\CargaMarinha2\Conexao.udl'
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
      
        'create table #temp_sem_vinculo( nome varchar(50), bcolib_codigo ' +
        'smallint)'
      ''
      'insert into #temp_sem_vinculo(nome)'
      'select distinct banco'
      'from marinha_contratos'
      'where banco not in (select nome from vinculo_marinha_banco)'
      ''
      'select *'
      'from #temp_sem_vinculo'
      ''
      'drop table #temp_sem_vinculo')
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
  object prIncluiCliente: TADOStoredProc
    Connection = ConexaoAgilus
    CommandTimeout = 0
    ProcedureName = 'pr_processa_cliente_marinha2;1'
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
      end
      item
        Name = '@excluir_contratos_antigos'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@fil_codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 372
    Top = 148
  end
  object Cursor: TADOQuery
    Connection = ConexaoAgilus
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'set nocount on '
      ''
      'if object_id('#39'marinha'#39') <> 0'
      '   drop table marinha'
      ''
      'if object_id('#39'marinha_contratos'#39') <> 0'
      '   drop table marinha_contratos'
      ''
      'create table marinha('
      '  nome varchar(100),'
      '  cpf varchar(11),'
      '  matricula varchar(10),'
      '  cargo varchar(2),'
      '  categoria char(1),'
      '  salario_bruto varchar(20),'
      '  salario_desconto varchar(20),'
      '  salario_liquido varchar(20),'
      '  banco_conta varchar(3),'
      '  agencia varchar(5),'
      '  conta varchar(14),'
      '  endereco varchar(54),'
      '  endnumero varchar(6),'
      '  complemento varchar(30),'
      '  bairro varchar(30),'
      '  cidade varchar(58),'
      '  uf varchar(2),'
      '  cep varchar(8)'
      ')'
      ''
      'create table marinha_contratos('
      '  cpf varchar(11),'
      '  valor_parcela varchar(20),'
      '  banco varchar(50),'
      '  termino varchar(5),'
      '  matricula varchar(10)'
      ')'
      ''
      'declare '
      '  @linha varchar(500),'
      '  @tipo varchar(2),'
      '  @entrou bit,'
      '  @nome varchar(100),'
      '  @cpf varchar(11),'
      '  @cargo varchar(2),'
      '  @categoria char(1),'
      '  @valor_parcela varchar(20),'
      '  @banco varchar(50),'
      '  @termino varchar(5),'
      '  @salario_bruto varchar(20),'
      '  @salario_desconto varchar(20),'
      '  @salario_liquido varchar(20),'
      '  @contador tinyint,'
      '  @matricula varchar(10),'
      '  @banco_conta varchar(3),'
      '  @agencia varchar(5),'
      '  @conta varchar(14),'
      ''
      '  @endereco varchar(54),'
      '  @endnumero varchar(6),'
      '  @complemento varchar(30),'
      '  @bairro varchar(30),'
      '  @cidade varchar(58),'
      '  @uf varchar(2),'
      '  @cep varchar(8),'
      '  '
      '  @endereco1 varchar(54),'
      '  @endnumero1 varchar(6),'
      '  @complemento1 varchar(30),'
      '  @bairro1 varchar(30),'
      '  @cidade1 varchar(58),'
      '  @uf1 varchar(2),'
      '  @cep1 varchar(8),'
      ''
      '  @endereco2 varchar(54),'
      '  @endnumero2 varchar(6),'
      '  @complemento2 varchar(30),'
      '  @bairro2 varchar(30),'
      '  @cidade2 varchar(58),'
      '  @uf2 varchar(2),'
      '  @cep2 varchar(8),'
      '  '
      '  @pos_endereco tinyint,'
      '  @pos_cliente tinyint'
      '  '
      'declare cur_marinha cursor for'
      'select linha from folha_marinha order by seq'
      ''
      'open cur_marinha'
      ''
      'fetch cur_marinha into @linha'
      ''
      'set @entrou = 0'
      'set @pos_endereco = 0'
      'set @pos_cliente = 0'
      ''
      'while @@fetch_status = 0'
      'begin'
      '   set @tipo = left(@linha,2)   '
      '   '
      
        '   if @tipo = '#39'31'#39' and substring(@linha,3,3) <> dbo.fn_so_numero' +
        's(substring(@linha,3,3)) and @entrou = 0'
      '   begin'
      '      if @pos_endereco = 0'
      '         set @pos_endereco = 1'
      '   '
      '      if @pos_endereco = 1'
      '      begin'
      '         set @endereco1 = substring(@linha,3,54)'
      '         set @endnumero1 = substring(@linha,57,6)'
      '         fetch cur_marinha into @linha'
      '         set @complemento1 = substring(@linha,3,30)'
      '         set @bairro1 = substring(@linha,33,30)'
      '         fetch cur_marinha into @linha'
      '         set @cidade1 = substring(@linha,3,58)'
      '         set @uf1 = substring(@linha,61,2)'
      '         fetch cur_marinha into @linha'
      '         set @cep1 = substring(@linha,3,8)         '
      '         fetch cur_marinha into @linha'
      '      end'
      ''
      '      if @pos_endereco = 2'
      '      begin'
      '         set @endereco2 = substring(@linha,3,54)'
      '         set @endnumero2 = substring(@linha,57,6)'
      '         fetch cur_marinha into @linha'
      '         set @complemento2 = substring(@linha,3,30)'
      '         set @bairro2 = substring(@linha,33,30)'
      '         fetch cur_marinha into @linha'
      '         set @cidade2 = substring(@linha,3,58)'
      '         set @uf2 = substring(@linha,61,2)'
      '         fetch cur_marinha into @linha'
      '         set @cep2 = substring(@linha,3,8)         '
      '         fetch cur_marinha into @linha'
      '      end'
      ''
      '      set @pos_endereco = @pos_endereco + 1'
      '      set @tipo = left(@linha,2)'
      '   end'
      ''
      '   if @tipo = '#39'51'#39' and @entrou = 0'
      '   begin'
      '      set @entrou = 1'
      '      set @contador = 1'
      
        '      set @matricula = '#39#39' -- nao tenho certeza que todas fichas ' +
        'terao a matricula'
      '      '
      '      set @pos_cliente = @pos_cliente + 1'
      '   end'
      ''
      '   if @entrou = 1'
      '   begin'
      '      if @tipo = '#39'61'#39
      '      begin'
      '         set @matricula = substring(@linha,23,8)'
      '         set @banco_conta = substring(@linha,37,3)         '
      '         set @agencia = ltrim(substring(@linha,40,5))'
      
        '         set @conta = ltrim(substring(@linha,45,12))+'#39'-'#39'+substri' +
        'ng(@linha,58,1)'
      '      end'
      ''
      '      if @tipo = '#39'-1'#39' '
      '      begin'
      '         if @contador = 1 '
      '         begin'
      '            set @nome = substring(@linha,4,42)'
      '            set @cpf =  substring(@linha,46,11)'
      '            set @contador = @contador + 1'
      '         end'
      '         else'
      '            if @contador = 2'
      '            begin'
      '               set @cargo = substring(@linha,9,2)'
      '               set @categoria = substring(@linha,5,1)'
      '               set @contador = @contador + 1'
      '            end'
      '      end'
      '      if (@tipo = '#39' 1'#39' or @tipo = '#39'01'#39') and '
      '         (substring(@linha,56,1) = '#39'/'#39') and '
      '         (substring(@linha,22,3) = '#39'   '#39') and '
      '         (SUBSTRING(@linha,57,2) <> '#39'//'#39') and'
      '         (SUBSTRING(@linha,25,3) <> '#39'AD '#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'ASS '#39') and'
      '         (SUBSTRING(@linha,25,5) <> '#39'C ORG'#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'AUX '#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'BIBL'#39') and'
      '         (SUBSTRING(@linha,25,3) <> '#39'CN '#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'COND'#39') and'
      '         (SUBSTRING(@linha,25,5) <> '#39'COPIM'#39') and'
      '         (SUBSTRING(@linha,25,3) <> '#39'DES'#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'DIAS'#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'DSS '#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'COMP'#39')and '
      '         (SUBSTRING(@linha,25,4) <> '#39'GRAT'#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'IMP '#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'INC '#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'IND '#39') and'
      '         (SUBSTRING(@linha,25,5) <> '#39'INHOS'#39') and'
      '         (SUBSTRING(@linha,25,6) <> '#39'PENSAO'#39') and'
      '         (SUBSTRING(@linha,25,4) <> '#39'PHM '#39') and'
      '         (SUBSTRING(@linha,25,6) <> '#39'SEDIME'#39')      '
      '      begin'
      '         set @valor_parcela = ltrim(substring(@linha,12,10))'
      '         set @banco = substring(@linha,25,25)'
      '         set @termino = substring(@linha,54,5)'
      ''
      '         insert into marinha_contratos'
      
        '         values(@cpf, @valor_parcela, @banco, @termino, @matricu' +
        'la)'
      '      end'
      ''
      '      if @tipo = '#39'71'#39' '
      '      begin'
      '         if charindex('#39'INUTILIZADO'#39', @linha) = 0'
      '         begin'
      '            set @salario_bruto = ltrim(substring(@linha,15,10))'
      
        '            set @salario_desconto = ltrim(substring(@linha,33,10' +
        '))'
      
        '            set @salario_liquido = ltrim(substring(@linha,50,10)' +
        ')'
      '            '
      '            set @endereco = null'
      '            set @endnumero = null'
      '            set @complemento = null'
      '            set @bairro = null'
      '            set @cidade = null'
      '            set @uf = null'
      '            set @cep = null'
      '            '
      
        '            if @pos_cliente = 1 and @pos_endereco > 0 and @ender' +
        'eco1 is not null'
      '            begin'
      '               set @endereco = @endereco1'
      '               set @endnumero = @endnumero1'
      '               set @complemento = @complemento1'
      '               set @bairro = @bairro1'
      '               set @cidade = @cidade1'
      '               set @uf = @uf1'
      '               set @cep = @cep1'
      '            end'
      '            '
      
        '            if @pos_cliente = 2 and @pos_endereco > 0 and @ender' +
        'eco2 is not null'
      '            begin'
      '               set @endereco = @endereco2'
      '               set @endnumero = @endnumero2'
      '               set @complemento = @complemento2'
      '               set @bairro = @bairro2'
      '               set @cidade = @cidade2'
      '               set @uf = @uf2'
      '               set @cep = @cep2'
      '            end'
      ''
      
        '            insert into marinha(nome, cpf, matricula, cargo, cat' +
        'egoria, salario_bruto, salario_desconto, salario_liquido, banco_' +
        'conta, agencia, conta,'
      
        '                                endereco, endnumero, complemento' +
        ', bairro, cidade, uf, cep)'
      
        '            values(@nome, @cpf, @matricula, @cargo, @categoria, ' +
        '@salario_bruto, @salario_desconto, @salario_liquido, @banco_cont' +
        'a, @agencia, @conta, '
      
        '                   @endereco, @endnumero, @complemento, @bairro,' +
        ' @cidade, @uf, @cep)'
      ''
      '         end'
      '         set @entrou = 0'
      ''
      
        '         if @pos_cliente = 1 and @pos_endereco > 0 and @endereco' +
        '1 is not null'
      '         begin'
      '            set @endereco1 = null'
      '            set @endnumero1 = null'
      '            set @complemento1 = null'
      '            set @bairro1 = null'
      '            set @cidade1 = null'
      '            set @uf1 = null'
      '            set @cep1 = null'
      '         end'
      ''
      
        '         if @pos_cliente = 2 and @pos_endereco > 0 and @endereco' +
        '2 is not null'
      '         begin'
      '            set @endereco2 = null'
      '            set @endnumero2 = null'
      '            set @complemento2 = null'
      '            set @bairro2 = null'
      '            set @cidade2 = null'
      '            set @uf2 = null'
      '            set @cep2 = null'
      '         end'
      ''
      '         if @pos_cliente = 2'
      '         begin'
      '            set @pos_cliente = 0'
      '            set @pos_endereco = 0'
      '         end'
      '      end'
      '   end'
      '   '
      '   fetch cur_marinha into @linha'
      'end'
      ''
      'close cur_marinha'
      'deallocate cur_marinha'
      ''
      'set nocount off'
      ''
      'create index i_cpf on marinha(cpf)'
      'create index i_cpf on marinha_contratos(cpf)')
    Left = 148
    Top = 220
  end
  object Ajuste: TADOQuery
    Connection = ConexaoAgilus
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'update marinha'
      
        'set salario_bruto = replace( replace( salario_bruto, '#39'.'#39','#39#39'), '#39',' +
        #39','#39'.'#39'),'
      
        'salario_desconto = replace( replace( salario_desconto, '#39'.'#39','#39#39'), ' +
        #39','#39','#39'.'#39'),'
      
        'salario_liquido = replace( replace( salario_liquido, '#39'.'#39','#39#39'), '#39',' +
        #39','#39'.'#39')'
      ''
      'update marinha'
      'set salario_bruto = null,'
      'salario_desconto = null,'
      'salario_liquido = null'
      
        'where dbo.fn_so_numeros(salario_bruto) <> replace(salario_bruto,' +
        #39'.'#39','#39#39')'
      ''
      'alter table marinha alter column salario_bruto money'
      'alter table marinha alter column salario_desconto money'
      'alter table marinha alter column salario_liquido money;'
      '---------------------'
      'with dups as('
      
        '   select *, ROW_NUMBER() over (PARTITION BY cpf order by cpf, m' +
        'atricula desc, salario_bruto desc ) row'
      '   from marinha'
      ')'
      'delete dups'
      'where row > 1'
      ''
      '----------------------'
      'update marinha_contratos'
      
        'set valor_parcela = replace( replace( valor_parcela, '#39'.'#39','#39#39'), '#39',' +
        #39','#39'.'#39')'
      ''
      'alter table marinha_contratos alter column valor_parcela money')
    Left = 224
    Top = 220
  end
  object CreateProc: TADOQuery
    Connection = ConexaoAgilus
    Parameters = <>
    SQL.Strings = (
      'create procedure pr_processa_cliente_marinha2 '
      '(@orgav_codigo smallint,'
      ' @uni_codigo int,'
      ' @mes smalldatetime,'
      ' @qtde_clientes_incluidos int output,'
      ' @qtde_clientes_alterados int output,'
      ' @qtde_contratos_incluidos int output,'
      ' @excluir_contratos_antigos bit,'
      ' @fil_codigo int = null'
      ') '
      'with encryption'
      'as'
      'begin'
      '   set nocount on '
      ''
      '   update marinha'
      '   set banco_conta = null'
      '   where banco_conta = '#39'000'#39
      ''
      '   update cliente_televenda'
      '   set clt_salario = salario_bruto,'
      '       uni_codigo = @uni_codigo,'
      
        '       clt_endereco = case when endereco is not null then endere' +
        'co else clt_endereco end,'
      
        '       clt_endnumero = case when endereco is not null then endnu' +
        'mero else clt_endnumero end,'
      
        '       clt_complemento = case when endereco is not null then com' +
        'plemento else clt_complemento end,'
      
        '       clt_bairro = case when endereco is not null then bairro e' +
        'lse clt_bairro end,'
      
        '       clt_cidade = case when endereco is not null then cidade e' +
        'lse clt_cidade end,'
      
        '       clt_uf = case when endereco is not null then uf else clt_' +
        'uf end,'
      
        '       clt_cep = case when endereco is not null then cep else cl' +
        't_cep end,'
      '       ccl_codigo =    case categoria'
      '                            when '#39'A'#39' then 1'
      '                            when '#39'I'#39' then 2'
      '                            when '#39'P'#39' then 3'
      '                            else null'
      '                       end'
      '   from cliente_televenda'
      '   join marinha on clt_cpf = cpf'
      '   where orgav_codigo = @orgav_codigo'
      ''
      '   select @qtde_clientes_alterados = @@rowcount'
      ''
      
        '   insert into cliente_televenda( clt_nome, clt_cpf, clt_matricu' +
        'la, clt_cargo, clt_salario, '
      
        '   orgav_codigo, uni_codigo, fil_codigo, tst_codigo, clt_enderec' +
        'o, clt_endnumero, clt_complemento, clt_bairro, clt_cidade, clt_u' +
        'f, clt_cep, ccl_codigo )'
      
        '   select nome, cpf, matricula, cargo, salario_bruto, @orgav_cod' +
        'igo, @uni_codigo, isnull(@fil_codigo,1), 1, endereco, endnumero,' +
        ' complemento, bairro, cidade, uf, cep,'
      '   case categoria'
      '      when '#39'A'#39' then 1'
      '      when '#39'I'#39' then 2'
      '      when '#39'P'#39' then 3'
      '      else null'
      '   end'
      '   from marinha'
      '   where not exists (select 1 '
      '                     from cliente_televenda '
      '                     where orgav_codigo = @orgav_codigo '
      '                     and clt_cpf = cpf'
      
        '                     and (@fil_codigo is null or fil_codigo = @f' +
        'il_codigo))'
      ''
      '   select @qtde_clientes_incluidos = @@rowcount'
      '   '
      '   if @excluir_contratos_antigos = 1'
      '      delete refin_televenda'
      '      where orgav_codigo = @orgav_codigo'
      ''
      
        '   insert into refin_televenda( rft_cpf, rft_valor_parcela, bcol' +
        'ib_codigo, rft_matricula, rft_data_ultimo_vencimento, orgav_codi' +
        'go, rft_data_atualizacao, rft_importado, rft_totalizador)'
      
        '   select c.cpf, valor_parcela, b.bcolib_codigo, c.matricula, db' +
        'o.fn_converte_data('#39'01'#39'+left(termino,2)+'#39'20'#39'+right(termino,2), '#39 +
        'ddmmyyyy'#39'), @orgav_codigo, convert(varchar(11), getdate()), 0, b' +
        'anco'
      '   from marinha_contratos c'
      '   join vinculo_marinha_banco b on c.banco = b.nome'
      '   where b.bcolib_codigo is not null'
      '   and (@excluir_contratos_antigos = 1 or'
      '          not exists( '
      '            select 1'
      '            from refin_televenda r'
      '            where c.cpf = rft_cpf'
      '            and b.bcolib_codigo = r.bcolib_codigo'
      '            and r.orgav_codigo = @orgav_codigo'
      '            and c.matricula = rft_matricula'
      '            and valor_parcela = rft_valor_parcela))'
      ''
      '   select @qtde_contratos_incluidos = @@rowcount'
      '   '
      '   update cliente_televenda'
      '   set bcolib_codigo_conta = convert(smallint,banco_conta),'
      '       clt_agencia = agencia,'
      '       clt_conta_corrente = conta'
      '   from cliente_televenda'
      '   join marinha on clt_cpf = cpf'
      '   where banco_conta is not null'
      '   and orgav_codigo = @orgav_codigo'
      '   and (@fil_codigo is null or fil_codigo = @fil_codigo)'
      ''
      
        '   if (select par_cod_cliente from parametro where Par_padrao = ' +
        '1) = 88 -- tratamento especial para Luckcred'
      '   begin'
      '      update refin_televenda'
      '      set rft_parcelas_contrato = 72,'
      
        '          rft_data_primeiro_vencimento = DATEADD(month,-71,rft_d' +
        'ata_ultimo_vencimento),'
      
        '          rft_parcelas_aberto = 72 - DATEDIFF(month, rft_data_pr' +
        'imeiro_vencimento, GETDATE())'
      '      where orgav_codigo = @orgav_codigo'
      '      '
      '      update refin_televenda'
      
        '      set rft_parcelas_pagas = DATEDIFF(month, rft_data_primeiro' +
        '_vencimento, getdate())'
      '      where orgav_codigo = @orgav_codigo'
      '   end    '
      'end'
      ''
      '')
    Left = 72
    Top = 220
  end
  object DropProc: TADOQuery
    Connection = ConexaoAgilus
    Parameters = <>
    SQL.Strings = (
      'if object_id('#39'pr_processa_cliente_marinha2'#39') > 0'
      '   drop procedure pr_processa_cliente_marinha2')
    Left = 12
    Top = 220
  end
  object tbFilial: TADOQuery
    Connection = ConexaoAgilus
    CursorType = ctStatic
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'select fil_codigo, fil_descricao'
      'from filial'
      'where fil_ativa= 1')
    Left = 308
    Top = 84
  end
  object dsFilial: TDataSource
    DataSet = tbFilial
    Left = 384
    Top = 84
  end
end
