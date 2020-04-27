if object_id('pr_processa_cliente_aero') > 0
begin
   drop procedure pr_processa_cliente_aero
   print '<< DROP pr_processa_cliente_aero >>'
end
GO

create procedure pr_processa_cliente_aero 
/*----------------------------------------------------------------------------------------------------------------------
NOME: pr_processa_cliente_aero
OBJETIVO: Processa os clientes da aero, na carga da folha
DATA: 27/06/2011
----------------------------------------------------------------------------------------------------------------------
declare @qtde1 int, @qtde2 int, @qtde3 int

exec pr_processa_cliente_aero 5, null, '2013-04-01', @qtde1 output, @qtde2 output, @qtde3 output

select @qtde1 incluidos, @qtde2 alterados, @qtde3 contratos_incluidos

select * from orgaoav

delete refin_televenda
where orgav_codigo = 3

select count(*)
from refin_televenda
where orgav_codigo = 3


select * from temp_contrato_aero

select * from temp_carga_aero

delete temp_carga_aero
where cpf = 'cpf'
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
   set nocount on

   if object_id('temp_contrato_aero') > 0
      drop table temp_contrato_aero
      
   update temp_carga_aero
   set cpf = dbo.fn_strzero(cpf,11)
   where len(cpf) < 11

   select cpf, matricula, banco, convert(money, replace(replace(parcela,'.',''),',','.')) parcela, 
   convert(smalldatetime,termino,103) termino
   into temp_contrato_aero
   from temp_carga_aero
   
   select tipo, cargo, nome, matricula, cpf
   into #carga_aero
   from temp_carga_aero

   create index i_cpf on temp_contrato_aero(cpf)

   create index i_cpf on #carga_aero(cpf);

   With Dups as
   (
      select *, row_number() over (partition by cpf order by cpf) as RowNum 
      from #carga_aero
   )
   Delete from Dups where rownum > 1;

   update cliente_televenda
   set clt_matricula = matricula,
   --clt_observacao = 'TIPO: '+tipo,
   clt_cargo = cargo,
   clt_nome = nome,
   clt_data_atualizacao_margem = @mes
   from cliente_televenda a, #carga_aero
   where clt_cpf = cpf
   and orgav_codigo = @orgav_codigo
   and (@uni_codigo is null or uni_codigo = @uni_codigo)

   select @qtde_clientes_alterados = @@rowcount

   insert into cliente_televenda( clt_matricula, clt_nome, clt_cpf, clt_observacao, clt_cargo, clt_data_atualizacao_margem,
   orgav_codigo, uni_codigo, tst_codigo, fil_codigo )
   select matricula, nome, cpf, 'TIPO: '+tipo, cargo, @mes, @orgav_codigo, @uni_codigo, 1, 1
   from #carga_aero
   where not exists ( select 1 from cliente_televenda
                      where clt_cpf = cpf
                      and orgav_codigo = @orgav_codigo
                      and (@uni_codigo is null or uni_codigo = @uni_codigo) )

   select @qtde_clientes_incluidos = @@rowcount
   
   delete refin_televenda
   where orgav_codigo = @orgav_codigo

   insert into refin_televenda( rft_cpf, rft_matricula, bcolib_codigo, rft_valor_parcela, rft_data_ultimo_vencimento, rft_importado, orgav_codigo, rft_data_atualizacao )
   select cpf, matricula, banco, parcela, termino, 0, @orgav_codigo, convert(varchar(11), getdate())
   from temp_contrato_aero
   /*where not exists( select 1 from refin_televenda
                     where rft_cpf = cpf
                     and rft_matricula = matricula
                     and bcolib_codigo = banco
                     and rft_data_ultimo_vencimento = termino
                     and rft_valor_parcela = parcela
                     and orgav_codigo = @orgav_codigo )*/

   select @qtde_contratos_incluidos = @@rowcount
   
   if (select par_cod_cliente from parametro where par_padrao = 1) = 18 
   begin
      insert into refin_televenda( rft_cpf, rft_matricula, bcolib_codigo, rft_valor_parcela, rft_data_ultimo_vencimento, rft_importado, orgav_codigo, rft_data_atualizacao )
      select rft_cpf, rft_matricula, bcolib_codigo, rft_valor_parcela, rft_data_ultimo_vencimento, rft_importado, orgav_codigo, rft_data_atualizacao
      from refin_televenda_morada_cruzeiro a
      where orgav_codigo = @orgav_codigo
      and not exists( select 1 from refin_televenda b
                      where b.rft_cpf = a.rft_cpf
                      and b.rft_matricula = a.rft_matricula
                      and b.bcolib_codigo = a.bcolib_codigo
                      and b.rft_data_ultimo_vencimento = a.rft_data_ultimo_vencimento
                      and b.rft_valor_parcela = a.rft_valor_parcela
                      and b.orgav_codigo = @orgav_codigo )
                      
      select @qtde_contratos_incluidos = @qtde_contratos_incluidos + @@rowcount
   end
   
   drop table #carga_aero
end
GO

if object_id('pr_processa_cliente_aero') > 0
begin
   print '<< CREATE pr_processa_cliente_aero >>'
end
GO

