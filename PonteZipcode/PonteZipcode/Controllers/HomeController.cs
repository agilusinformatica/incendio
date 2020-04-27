using System.IO;
using System.Net;
using System.Text;
using System.Web.Mvc;

namespace PonteZipcode.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index(string cpf, string token)
        {
            string url = "https://service.zipcode.com.br/RestService.svc/ConsultaPF/xml?token="+token+"&cpf="+cpf;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072; // para habilitar tls 1.2 no .net 4.0
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
