using PonteConsultaDatweb.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace PonteConsultaDatweb.Controllers
{
    public class CaptchaController : Controller
    {
        //
        // GET: /Captcha/

        public ActionResult Index()
        {
            string url = "http://ws.datweb.com.br/captcha/" + Request.Url.Query;
            WebRequest getUrl = WebRequest.Create(url);
            WebResponse response = getUrl.GetResponse();

            if (response.ContentType == "image/jpg")
            {
                Stream objStream = response.GetResponseStream();
                MemoryStream memStream = new MemoryStream();
                objStream.CopyTo(memStream);
                return File(memStream.ToArray(), "image/jpeg");
            }
            else
            {
                Stream objStream = response.GetResponseStream();
                StreamReader objReader = new StreamReader(objStream, Encoding.Default);
                return Content(objReader.ReadToEnd());
            }
        }
    }
}
