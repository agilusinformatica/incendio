using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace PonteAssertiva.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index(string cpf, string empresa, string usuario, string senha, string tipo = "pf")
        {
            string url = "https://api.assertivasolucoes.com.br/api/1.0.0/localize/xml/" + tipo + "?empresa=" + empresa + "&usuario=" + usuario + "&senha=" + senha + "&documento=" + cpf;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream resStream = response.GetResponseStream();
            string resposta = StreamToString(resStream);

            return this.Content(resposta, "text/xml");
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
