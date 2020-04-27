﻿using LogVcom.Models;
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
                    EnviarEmail("Erro LogVcom", erroEmail);
                    return "Ligação não registrada. Erro: " + e.Message;
                }
            }

        }

        private void EnviarEmail(string assunto, string mensagem)
        {
            using (MailMessage objEmail = new MailMessage())
            {
                objEmail.From = new System.Net.Mail.MailAddress("henrique@agilus.com.br");

                objEmail.To.Add("claudio@agilus.com.br");

                objEmail.Priority = System.Net.Mail.MailPriority.Normal;

                objEmail.IsBodyHtml = true;

                objEmail.Subject = assunto;

                objEmail.Body = mensagem;


                //Para evitar problemas de caracteres "estranhos", configuramos o charset para "ISO-8859-1"
                objEmail.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
                objEmail.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

                //Cria objeto com os dados do SMTP
                System.Net.Mail.SmtpClient objSmtp = new System.Net.Mail.SmtpClient();
                //Alocamos o endereço do host para enviar os e-mails  
                objSmtp.Credentials = new System.Net.NetworkCredential("henrique@agilus.com.br", "ac@78902");
                objSmtp.Host = "smtp.agilus.com.br";
                objSmtp.Port = 587;

                try
                {
                    objSmtp.Send(objEmail);
                }
                catch (Exception ex)
                {
                   //Envio de email relatando erro a pessoa que convidou.
                    throw new Exception("Ocorreram problemas no envio do e-mail. Erro = " + ex.Message);
                }
            }

        }
    }
}