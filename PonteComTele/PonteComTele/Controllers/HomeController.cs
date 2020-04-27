using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace PonteComTele.Controllers
{
    public class HomeController : Controller
    {

        public string Index()
        {
            return "/sendmessage?chave=c2463c0d-ebfb-45de-ac98-48f25f5f7279&destinatarios=11991967697&conteudo=mais um teste";
        }


        public string sendmessage(string chave, string destinatarios, string conteudo)
        {
            string url = "https://sms.comtele.com.br/api/"+chave+"/sendmessage?sender=agilus&receivers="+destinatarios+"&content="+conteudo;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "POST";
            request.ContentLength = 0;
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            if (response.StatusCode == HttpStatusCode.OK)
                return "OK";
            else
            {
                Stream resStream = response.GetResponseStream();
                string resposta = StreamToString(resStream);
                return resposta;
            }
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