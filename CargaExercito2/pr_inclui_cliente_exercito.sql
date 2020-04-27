if object_id('pr_inclui_cliente_exercito') > 0
begin
   drop procedure pr_inclui_cliente_exercito
   print '<< DROP pr_inclui_cliente_exercito >>'
end
GO

create procedure pr_inclui_cliente_exercito 
/*----------------------------------------------------------------------------------------------------------------------
NOME: pr_inclui_cliente_exercito
OBJETIVO: Atualiza os clientes do exercito, na carga da folha
DATA: 19/04/2010
----------------------------------------------------------------------------------------------------------------------
exec pr_inclui_cliente_exercito 3, null, '2014-01-01', null
----------------------------------------------------------------------------------------------------------------------*/
(@orgav_codigo smallint,
 @uni_codigo int,
 @mes smalldatetime,
 @qtde_registros int output
) 
with encryption
as
begin
   insert into cliente_televenda( clt_cpf, clt_matricula, clt_endereco, clt_bairro, clt_cidade, clt_uf, clt_cep,
   clt_observacao, clt_cargo, clt_rg, clt_salario, clt_nome, clt_data_nascimento, clt_senha_orgao,
   clt_data_atualizacao_margem, orgav_codigo, uni_codigo, fil_codigo, tst_codigo, ccl_codigo, bcolib_codigo_conta, clt_agencia, clt_conta_corrente )
   select cpf, [prec-cp], endereco, bairro, cidade, uf, cep,
      isnull('CAT: '+cat+char(13),'')+
      isnull('INDICATIVO: '+ind+char(13),'')+
      isnull('SIGLA: '+sigla+char(13),'')+
      isnull('CODOM: '+codom+char(13),''),
   pg, idt, bruto, nome, dbo.fn_converte_data(dt_nasc,'yyyymmdd'), idt,
   @mes, @orgav_codigo, @uni_codigo, 1, 1,
   case cat
      when 'MIL ATIVA' then 1
      when 'MIL INATIVO' then 2
      when 'PENSIONISTA' then 3
      else null
   end, 
   banco, Agencia, conta
      
   from temp_cliente_exercito
   where not exists( select 1 from cliente_televenda
                     where clt_cpf = cpf
                     and clt_matricula = [prec-cp]
                     and orgav_codigo = @orgav_codigo)
                     --and (@uni_codigo is null or uni_codigo = @uni_codigo) )

   select @qtde_registros = @@rowcount
   
   if (select par_cod_cliente from parametro where par_padrao = 1) = 64 -- tratamento especial para LatinCred
   begin
      declare @sql varchar(300)
      
      set @sql = 
         'update cliente_televenda
         set usr_banco_cc = banco,
             usr_agencia = agencia,
             usr_conta_corrente = conta
         from cliente_televenda
         join temp_cliente_exercito on clt_cpf = cpf
         where banco is not null
         and orgav_codigo = '+convert(varchar,@orgav_codigo)
      execute(@sql)
   end
   

end
GO

if object_id('pr_inclui_cliente_exercito') > 0
begin
   print '<< CREATE pr_inclui_cliente_exercito >>'
end
GO