using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace LogVcom
{
    public static class Email
    {
        public static void EnviarEmail(string assunto, string mensagem)
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