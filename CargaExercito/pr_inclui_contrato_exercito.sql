if object_id('pr_inclui_contrato_exercito') > 0
begin
   drop procedure pr_inclui_contrato_exercito
   print '<< DROP pr_inclui_contrato_exercito >>'
end
GO

create procedure pr_inclui_contrato_exercito 
/*----------------------------------------------------------------------------------------------------------------------
NOME: pr_inclui_contrato_exercito
OBJETIVO: Atualiza os clientes do exercito, na carga da folha
DATA: 19/04/2010
----------------------------------------------------------------------------------------------------------------------
exec pr_inclui_contrato_exercito 1, null, null
select * from temp_contrato_exercito
select * from temp_totalizador_exercito
select * from orgaoav
----------------------------------------------------------------------------------------------------------------------*/
(@orgav_codigo smallint,
 @uni_codigo int,
 @qtde_registros int output
) 
with encryption
as
begin
   -- como no exercito só pode ter um contrato por banco, posso me basear somente no banco
   -- para verificar se um contrato ja estava pré-cadastrado 
   update refin_televenda
   set rft_data_ultimo_vencimento = dbo.fn_converte_data('01'+left(prazo,2)+'20'+right(prazo,2),'ddmmyyyy'),
       rft_valor_parcela = valor,
       rft_totalizador = d.discriminacao
   from refin_televenda r, temp_contrato_exercito a, vinculo_exercito_banco c, temp_totalizador_exercito d
   where r.bcolib_codigo = c.bcolib_codigo
   and a.[prec-cp] = r.rft_matricula
   and a.cod = c.veb_codigo_totalizador_exercito
   and a.cod = d.cod
   and c.bcolib_codigo is not null
   and r.orgav_codigo = @orgav_codigo
   

   insert into refin_televenda( rft_cpf, bcolib_codigo, rft_matricula, rft_data_ultimo_vencimento, 
   rft_valor_parcela, rft_importado, rft_totalizador, orgav_codigo, rft_data_atualizacao )
   select distinct b.cpf, bcolib_codigo, a.[prec-cp],  
   dbo.fn_converte_data('01'+left(prazo,2)+'20'+right(prazo,2),'ddmmyyyy'), valor, 0, d.discriminacao, @orgav_codigo, convert(smalldatetime,convert(varchar(11), getdate()))
   from temp_contrato_exercito a, temp_cliente_exercito b, vinculo_exercito_banco c, temp_totalizador_exercito d
   where a.[prec-cp] = b.[prec-cp]
   and a.cod = c.veb_codigo_totalizador_exercito
   and a.cod = d.cod
   and c.bcolib_codigo is not null
   and not exists( select 1 from refin_televenda e
                   where e.rft_cpf = b.cpf
                   and e.rft_matricula = a.[prec-cp]
                   and e.bcolib_codigo = c.bcolib_codigo
                   and e.orgav_codigo = @orgav_codigo )
                   
   delete refin_televenda
   from refin_televenda e
   where orgav_codigo = @orgav_codigo
   and not exists(   select 1 from temp_contrato_exercito a, vinculo_exercito_banco c
                     where a.[prec-cp] = e.rft_matricula
                     and a.cod = c.veb_codigo_totalizador_exercito
                     and c.bcolib_codigo = e.bcolib_codigo
                     and e.orgav_codigo = @orgav_codigo )
   
   select @qtde_registros = @@rowcount

end
GO

if object_id('pr_inclui_contrato_exercito') > 0
begin
   print '<< CREATE pr_inclui_contrato_exercito >>'
end
GO
