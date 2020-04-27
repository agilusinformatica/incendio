using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace LogVcom.Models
{
    public class Cliente
    {
        public string Nome { get; set; }
        public string Endereco { get; set; }
        public string Database { get; set; }
        
    }

    public static class OperacaoClientes
    {
        public static List<Cliente> ObtemClientes()
        {
            //using (FileStream file = new FileStream(HttpContext.Current.Server.MapPath("~/App_Data/clientes.json"), FileMode.OpenOrCreate))
            using (FileStream file = new FileStream((@"e:\home\agilus\Temp\clientes.json"), FileMode.OpenOrCreate))
            {
                StreamReader sr = new StreamReader(file);
                string leitura = sr.ReadToEnd();
                List<Cliente> clientes = new List<Cliente>();
                var js = new JavaScriptSerializer();
                clientes = js.Deserialize<List<Cliente>>(leitura);
                return clientes;
            }
        }

        public static void GravaClientes(List<Cliente> clientes)
        {
            var js = new JavaScriptSerializer();
            var clientesJson = js.Serialize(clientes);
            //using (FileStream file = new FileStream(HttpContext.Current.Server.MapPath("~/App_Data/clientes.json"), FileMode.Create))
            using (FileStream file = new FileStream((@"e:\home\agilus\Temp\clientes.json"), FileMode.OpenOrCreate))
            {
                StreamWriter sw = new StreamWriter(file);
                sw.Write(clientesJson);
                sw.Flush();
            }

        }
    }
}