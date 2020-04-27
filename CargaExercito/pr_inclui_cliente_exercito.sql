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
exec pr_inclui_cliente_exercito 1, null, '2011-09-01', null
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
   clt_observacao, clt_cargo, clt_rg, clt_salario, clt_nome, clt_data_nascimento,
   clt_data_atualizacao_margem, orgav_codigo, uni_codigo, fil_codigo, tst_codigo )
   select cpf, [prec-cp], endereco, bairro, cidade, uf, cep,
      isnull('CAT: '+cat+char(13),'')+
      isnull('INDICATIVO: '+ind+char(13),'')+
      isnull('SIGLA: '+sigla+char(13),'')+
      isnull('CODOM: '+codom+char(13),''),
   pg, idt, bruto, nome, dbo.fn_converte_data(dt_nasc,'ddmmyyyy'), @mes,
   @orgav_codigo, @uni_codigo, 1, 1
   from temp_cliente_exercito
   where not exists( select 1 from cliente_televenda
                     where clt_cpf = cpf
                     and clt_matricula = [prec-cp]
                     and orgav_codigo = @orgav_codigo)
                     --and (@uni_codigo is null or uni_codigo = @uni_codigo) )

   select @qtde_registros = @@rowcount

end
GO

if object_id('pr_inclui_cliente_exercito') > 0
begin
   print '<< CREATE pr_inclui_cliente_exercito >>'
end
GO