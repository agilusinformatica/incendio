if object_id('pr_processa_cliente_marinha') > 0
begin
   drop procedure pr_processa_cliente_marinha
   print '<< DROP pr_processa_cliente_marinha >>'
end
GO

create procedure pr_processa_cliente_marinha 
/*----------------------------------------------------------------------------------------------------------------------
NOME: pr_processa_cliente_marinha
OBJETIVO: Processa os clientes da marinha, na carga da folha
DATA: 22/04/2010
----------------------------------------------------------------------------------------------------------------------
declare @qtde1 int, @qtde2 int, @qtde3 int

exec pr_processa_cliente_marinha 4, null, '2010-02-01', @qtde1 output, @qtde2 output, @qtde3 output

select @qtde1 incluidos, @qtde2 alterados, @qtde3 contratos_incluidos

select * from temp_carga_marinha

delete temp_carga_marinha
where banco = 318

select * from temp_contrato_marinha

select * from orgaoav
----------------------------------------------------------------------------------------------------------------------*/
(@orgav_codigo smallint,
 @uni_codigo int,
 @mes smalldatetime,
 @qtde_clientes_incluidos int output,
 @qtde_clientes_alterados int output,
 @qtde_contratos_incluidos int output
) 
with encryption
as
begin
   if object_id('temp_contrato_marinha') > 0
      drop table temp_contrato_marinha

   select cpf, matricula, banco, convert(money, replace(replace(pagamento,'.',''),',','.')) parcela, 
   dbo.fn_converte_data('01'+left(termino,2)+'20'+right(termino,2),'ddmmyyyy') termino
   into temp_contrato_marinha
   from temp_carga_marinha

   create index i_cpf on temp_contrato_marinha(cpf)

   create index i_cpf on temp_carga_marinha(cpf);

   With Dups as
   (
      select *, row_number() over (partition by cpf order by cpf) as RowNum 
      from temp_carga_marinha
   )
   Delete from Dups where rownum > 1;

   update cliente_televenda
   set clt_matricula = matricula,
   --clt_observacao = 'SIT: '+sit,
   clt_cargo = pt,
   clt_nome = nome,
   clt_data_atualizacao_margem = @mes
   from cliente_televenda a, temp_carga_marinha
   where clt_cpf = cpf
   and orgav_codigo = @orgav_codigo
   and (@uni_codigo is null or uni_codigo = @uni_codigo)

   select @qtde_clientes_alterados = @@rowcount

   insert into cliente_televenda( clt_matricula, clt_nome, clt_cpf, clt_observacao, clt_cargo, clt_data_atualizacao_margem,
   orgav_codigo, uni_codigo, tst_codigo, fil_codigo )
   select matricula, nome, cpf, 'SIT: '+sit, pt, @mes, @orgav_codigo, @uni_codigo, 1, 1
   from temp_carga_marinha
   where not exists ( select 1 from cliente_televenda
                      where clt_cpf = cpf
                      and orgav_codigo = @orgav_codigo
                      and (@uni_codigo is null or uni_codigo = @uni_codigo) )

   select @qtde_clientes_incluidos = @@rowcount

   insert into refin_televenda( rft_cpf, rft_matricula, bcolib_codigo, rft_valor_parcela, rft_data_ultimo_vencimento, rft_importado, orgav_codigo, rft_data_atualizacao )
   select cpf, matricula, banco, parcela, termino, 0, @orgav_codigo, convert(varchar(11), getdate())
   from temp_contrato_marinha
   where not exists( select 1 from refin_televenda
                     where rft_cpf = cpf
                     and rft_matricula = matricula
                     and bcolib_codigo = banco
                     and rft_data_ultimo_vencimento = termino
                     and rft_valor_parcela = parcela
                     and orgav_codigo = @orgav_codigo )

   select @qtde_contratos_incluidos = @@rowcount

end
GO

if object_id('pr_processa_cliente_marinha') > 0
begin
   print '<< CREATE pr_processa_cliente_marinha >>'
end
GO