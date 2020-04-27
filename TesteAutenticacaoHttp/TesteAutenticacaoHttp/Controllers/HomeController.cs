using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TesteAutenticacaoHttp.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        [RequireBasicAuthentication]
        public ActionResult Index(string cpf) 
        {
            var cred = System.Text.ASCIIEncoding.ASCII.GetString(Convert.FromBase64String(Request.Headers["Authorization"].Substring(6))).Split(':');
            var user = new { Name = cred[0], Pass = cred[1] };
            return Content(String.Format("user:{0}, password:{1}, cpf:{2}", user.Name, user.Pass, cpf));
        }
    }
}
