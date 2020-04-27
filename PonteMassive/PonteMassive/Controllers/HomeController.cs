using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace PonteMassive.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index(string telefone, string token, string mensagem, int flash)
        {
            string url = "https://massive.net.br/api/v1/sms/enviar?api_token=" + token + "&telefone=" + telefone + "&mensagem=" + mensagem + "&flash=" + flash.ToString();
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Headers.Add("Authentication", "Bearer " + token);
            request.Method = "POST";
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream resStream = response.GetResponseStream();
            string resposta = StreamToString(resStream);

            return this.Content(resposta, response.ContentType);
        }
        private string StreamToString(Stream stream)
        {
            //stream.Position = 0;
            using (StreamReader reader = new StreamReader(stream, Encoding.UTF8))
            {
                return reader.ReadToEnd();
            }
        }

        private Stream StringToStream(string src)
        {
            byte[] byteArray = Encoding.UTF8.GetBytes(src);
            return new MemoryStream(byteArray);
        }

    }
}
