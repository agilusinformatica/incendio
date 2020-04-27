if object_id('pr_processa_cliente_marinha2') > 0
begin
   drop procedure pr_processa_cliente_marinha2
   print '<< DROP pr_processa_cliente_marinha2 >>'
end
GO

create procedure pr_processa_cliente_marinha2 
/*----------------------------------------------------------------------------------------------------------------------
NOME: pr_processa_cliente_marinha2
OBJETIVO: Processa os clientes da marinha, na carga da folha
DATA: 22/04/2010
----------------------------------------------------------------------------------------------------------------------
declare @qtde1 int, @qtde2 int, @qtde3 int

exec pr_processa_cliente_marinha2 4, null, '2012-05-01', @qtde1 output, @qtde2 output, @qtde3 output, 1

select @qtde1 incluidos, @qtde2 alterados, @qtde3 contratos_incluidos

sp_spaceused marinha_contratos

drop table marinha_contratos

select * from vinculo_marinha_banco
where nome like '%fibra%'
or nome like '%morada%'

insert into vinculo_marinha_banco
values('BANCO MORADA',738)
insert into vinculo_marinha_banco
values('FIBRA',224)


select * from orgaoav
----------------------------------------------------------------------------------------------------------------------*/
(@orgav_codigo smallint,
 @uni_codigo int,
 @mes smalldatetime,
 @qtde_clientes_incluidos int output,
 @qtde_clientes_alterados int output,
 @qtde_contratos_incluidos int output,
 @excluir_contratos_antigos bit 
) 
with encryption
as
begin
   set nocount on 

   update cliente_televenda
   set clt_salario = salario_bruto,
       uni_codigo = @uni_codigo,
       clt_endereco = endereco,
       clt_endnumero = endnumero,
       clt_complemento = complemento,
       clt_bairro = bairro,
       clt_cidade = cidade,
       clt_uf = uf,
       clt_cep = cep
   from cliente_televenda
   join marinha on clt_cpf = cpf
   where orgav_codigo = @orgav_codigo

   select @qtde_clientes_alterados = @@rowcount

   insert into cliente_televenda( clt_nome, clt_cpf, clt_matricula, clt_cargo, clt_salario, 
   orgav_codigo, uni_codigo, fil_codigo, tst_codigo, clt_endereco, clt_endnumero, clt_complemento, clt_bairro, clt_cidade, clt_uf, clt_cep )
   select nome, cpf, matricula, cargo, salario_bruto, @orgav_codigo, @uni_codigo, 1, 1, endereco, endnumero, complemento, bairro, cidade, uf, cep
   from marinha
   where cpf not in (select clt_cpf from cliente_televenda where orgav_codigo = @orgav_codigo)

   select @qtde_clientes_incluidos = @@rowcount
   
   if @excluir_contratos_antigos = 1
      delete refin_televenda
      where orgav_codigo = @orgav_codigo

   insert into refin_televenda( rft_cpf, rft_valor_parcela, bcolib_codigo, rft_matricula, rft_data_ultimo_vencimento, orgav_codigo, rft_data_atualizacao, rft_importado, rft_totalizador)
   select c.cpf, valor_parcela, b.bcolib_codigo, n.matricula, dbo.fn_converte_data('01'+left(termino,2)+'20'+right(termino,2), 'ddmmyyyy'), @orgav_codigo, convert(varchar(11), getdate()), 0, banco
   from marinha_contratos c
   join vinculo_marinha_banco b on c.banco = b.nome
   join marinha n on c.cpf = n.cpf
   where b.bcolib_codigo is not null
   and (@excluir_contratos_antigos = 1 or
          not exists( 
            select 1
            from refin_televenda r
            where n.cpf = rft_cpf
            and r.orgav_codigo = @orgav_codigo
            and n.matricula = rft_matricula
            and valor_parcela = rft_valor_parcela
            and dbo.fn_converte_data('01'+left(termino,2)+'20'+right(termino,2), 'ddmmyyyy') = rft_data_ultimo_vencimento))

   select @qtde_contratos_incluidos = @@rowcount
   
   
   if (select par_cod_cliente from parametro where par_padrao = 1) = 64 -- tratamento especial para LatinCred
   begin
      declare @sql varchar(300)
      
      set @sql = 
         'update cliente_televenda
         set usr_banco_cc = banco_conta,
             usr_agencia = agencia,
             usr_conta_corrente = conta
         from cliente_televenda
         join marinha on clt_cpf = cpf
         where banco_conta is not null
         and orgav_codigo = '+convert(varchar,@orgav_codigo)
      execute(@sql)
   end
end
GO

if object_id('pr_processa_cliente_marinha2') > 0
begin
   print '<< CREATE pr_processa_cliente_marinha2 >>'
end
GO
