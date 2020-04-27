using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.IO;
using System.Text;

namespace PontePortabilidadeItau.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index(string dataInicio, string dataFim, string uf, string banco)
        {
            string url = "";
            if ((banco == "") || (banco.ToUpper() == "ITAU"))
                url = "https://www.portalitaubmg.com.br/MPT010/mailing.asmx/ConsultarMailing?dataInicio="+dataInicio+"&dataFim="+dataFim+"&uf="+uf+"&usuario=t.fonseca&senha=WNEHPA15" ;
            else if (banco.ToUpper() == "BMG")
                url = "https://aplic.bancobmg.com.br/mpt010_bmg/Mailing.asmx/ConsultarMailing?dataInicio="+dataInicio+"&dataFim="+dataFim+"&uf="+uf;
            else if (banco.ToUpper() == "CIFRA")
                url = "https://aplic.bancobmg.com.br/mpt010_cifra/Mailing.asmx/ConsultarMailing?dataInicio="+dataInicio+"&dataFim="+dataFim+"&uf="+uf;
            else if (banco.ToUpper() == "BCV")
                url = "https://aplic.bancobmg.com.br/mpt010_bcv/Mailing.asmx/ConsultarMailing?dataInicio="+dataInicio+"&dataFim="+dataFim+"&uf="+uf;

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream resStream = response.GetResponseStream();
            string resposta = StreamToString(resStream).Replace("&lt;", "<").Replace("&gt;", ">").Replace("<string xmlns=\"http://tempuri.org/\">", "").Replace("</string>","");

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
