using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Text;
using System.IO;

namespace PonteConsultaDatweb.Models
{
    public static class Utilitarios
    {
        public static string FonteUrl(string url)
        {
            WebRequest getUrl = WebRequest.Create(url);
            WebResponse response = getUrl.GetResponse();
            Stream objStream = response.GetResponseStream();

            StreamReader objReader = new StreamReader(objStream, Encoding.Default);
            return objReader.ReadToEnd();
        }
    }
}