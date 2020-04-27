if object_id('pr_atualiza_cliente_exercito') > 0
begin
   drop procedure pr_atualiza_cliente_exercito
   print '<< DROP pr_atualiza_cliente_exercito >>'
end
GO

create procedure pr_atualiza_cliente_exercito 
/*----------------------------------------------------------------------------------------------------------------------
NOME: pr_atualiza_cliente_exercito
OBJETIVO: Atualiza os clientes do exercito, na carga da folha
DATA: 19/04/2010
----------------------------------------------------------------------------------------------------------------------
exec pr_atualiza_cliente_exercito 1, null, '2011-09-01', null
----------------------------------------------------------------------------------------------------------------------*/
(@orgav_codigo smallint,
 @uni_codigo int,
 @mes smalldatetime,
 @qtde_registros int output
) 
with encryption
as
begin
   update cliente_televenda
   set clt_matricula = [prec-cp],
   clt_endereco = endereco,
   clt_bairro = bairro, 
   clt_cidade = cidade,
   clt_uf = uf, 
   clt_cep = cep,
   /*clt_observacao = 
      isnull('CAT: '+cat+char(13),'')+
      isnull('INDICATIVO: '+ind+char(13),'')+
      isnull('SIGLA: '+sigla+char(13),'')+
      isnull('CODOM: '+codom+char(13),''),*/
   clt_cargo = pg,
   clt_rg = idt, 
   clt_salario = bruto,
   clt_nome = nome,
   clt_data_nascimento = dbo.fn_converte_data(dt_nasc,'ddmmyyyy'),
   clt_data_atualizacao_margem = @mes,
   uni_codigo = isnull(@uni_codigo,uni_codigo)
   from cliente_televenda a, temp_cliente_exercito
   where clt_cpf = cpf
   and orgav_codigo = @orgav_codigo
   --and (@uni_codigo is null or uni_codigo = @uni_codigo)


   select @qtde_registros = @@rowcount

end
GO

if object_id('pr_atualiza_cliente_exercito') > 0
begin
   print '<< CREATE pr_atualiza_cliente_exercito >>'
end
GO