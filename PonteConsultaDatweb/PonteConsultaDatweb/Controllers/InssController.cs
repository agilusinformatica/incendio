using PonteConsultaDatweb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PonteConsultaDatweb.Controllers
{
    public class InssController : Controller
    {
        //
        // GET: /Inss/

        public string Index()
        {
            return Utilitarios.FonteUrl("http://ws.datweb.com.br/inss/" + Request.Url.Query);
        }
    }
}
