using PonteProcob.Models;
using System.Web.Mvc;

namespace PonteProcob.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /ConsultarProcob/
        public ActionResult Index(string cpf, string usuario, string senha)
        {
            Consulta c = new Consulta(cpf, usuario, senha);
            return Content(c.ToXML(c.Dados()));
        }
    }
}
    