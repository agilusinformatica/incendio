using LogVcom.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Net.Mail;

namespace LogVcom.Controllers
{
    public class LigacaoController : Controller
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

            //string stringParametros = string.Join(",", parametros.AllKeys.SelectMany(key => parametros.GetValues(key)));
            //return stringParametros;

            Ligacao ligacao = new Ligacao();
            ligacao.calldate = parametros["calldate"];
            ligacao.src = parametros["src"];
            ligacao.dst = parametros["dst"];
            ligacao.duration = parametros["duration"];
            ligacao.billsec = parametros["billsec"];
            ligacao.disposition = parametros["disposition"];
            ligacao.userfield = parametros["userfield"];
            ligacao.callid = parametros["callid"];

            string connectionString = String.Format("Server={0};User Id={1};Password={2};Database={3};", cliente.Endereco, "agilus", "awrpu07!@$AFAFAsdfqrasfafJMYJYJ&* $%", cliente.Database);

            using (SqlConnection conexao = new SqlConnection(connectionString)) { 

                var comand = new SqlCommand(String.Format(@"INSERT INTO ligacao_telefonica (lit_nome_empresa, lit_data, lit_origem, lit_destino, lit_duracao_total, lit_duracao_conversacao, lit_status, lit_identificador_gravacao, lit_codigo_agilus) 
                                                            VALUES ('VCOM', '{0}', '{1}', '{2}', {3}, {4}, '{5}', '{6}', '{7}')", ligacao.calldate, ligacao.src, ligacao.dst, ligacao.duration, ligacao.billsec, 
                                                                                                                                  ligacao.disposition, ligacao.userfield, ligacao.callid), conexao);

                try
                {
                    conexao.Open();
                    comand.ExecuteNonQuery();
                    return "Ligação registrada com sucesso na empresa " + cliente.Nome;
                }
                catch(Exception e){
                    var erroEmail = "<p><b>cliente</b>: " + cliente.Nome + "</p><p><b>db</b>: " + cliente.Database + "</p><p><b>Endereço</b>: "+ cliente.Endereco + 
                    "</p><p><b>Comando</b>: "+ comand.CommandText +
                    "</p><p><b>Url</b>: " + HttpContext.Request.Url.AbsoluteUri +
                    "</p><p><b>Mensagem da Exceção</b>: " + e.Message;
                    Email.EnviarEmail("Erro LogVcom", erroEmail);
                    return "Ligação não registrada. Erro: " + e.Message;
                }
            }

        }

    }
}
