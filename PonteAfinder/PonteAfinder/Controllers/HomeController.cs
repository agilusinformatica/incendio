using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.IO;
using System.Text;

namespace PonteAfinder.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index(string cpf, string usuario, string senha)
        {
            string url = "https://www.afinder.com.br/afinderwshvx/webservicesbyget.asmx/BuscaCPFXml?Usuario="+usuario+"&Senha="+senha+"&CPF="+cpf+"&Bases=FIXOMOVELSAT&FonesParaNaoRetornar=";
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
