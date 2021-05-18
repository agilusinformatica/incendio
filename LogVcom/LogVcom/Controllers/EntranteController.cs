using LogVcom.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LogVcom.Controllers
{
    public class EntranteController : Controller
    {
        public string Index()
        {
            var caminho = HttpContext.Request.Path.Split('/');
            var empresa = caminho[caminho.Length - 1];
            Cliente cliente = OperacaoClientes.ObtemClientes().Find(x => x.Nome.ToUpper() == empresa.ToUpper());
            if (cliente == null)
            {
                return "Cliente não encontrado!";
            }
            var parametros = HttpContext.Request.Params;
            Entrante ligacao = new Entrante();
            ligacao.peer = parametros["peer"];
            ligacao.phone = parametros["phone"];
            ligacao.codcli = parametros["codcli"];

            string connectionString = String.Format("Server={0};User Id={1};Password={2};Database={3};", cliente.Endereco, "agilus", "awrpu07!@$AFAFAsdfqrasfafJMYJYJ&* $%", cliente.Database);

            using (SqlConnection conexao = new SqlConnection(connectionString))
            {

                var comand = new SqlCommand(String.Format(@"INSERT INTO ligacao_entrante_discador (lid_nome_empresa, lid_ramal, lid_telefone, lid_codigo_agilus) 
                                                            VALUES ('VCOM', '{0}', '{1}', '{2}')", ligacao.peer, ligacao.phone, ligacao.codcli), conexao);

                try
                {
                    conexao.Open();
                    comand.ExecuteNonQuery();
                    return "Ligação entrante registrada com sucesso na empresa " + cliente.Nome;
                }
                catch (Exception e)
                {
                    var erroEmail = "<p><b>cliente</b>: " + cliente.Nome + "</p><p><b>db</b>: " + cliente.Database + "</p><p><b>Endereço</b>: " + cliente.Endereco +
                    "</p><p><b>Comando</b>: " + comand.CommandText +
                    "</p><p><b>Url</b>: " + HttpContext.Request.Url.AbsoluteUri +
                    "</p><p><b>Mensagem da Exceção</b>: " + e.Message;
                    Email.EnviarEmail("Erro entrante LogVcom", erroEmail);
                    return "Ligação entrante não registrada. Erro: " + e.Message;
                }
            }
        }
    }
}