using LogVcom.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace LogVcom.Controllers
{
    public class ClienteController : Controller
    {
        public ActionResult Index()
        {
            return View(OperacaoClientes.ObtemClientes());
        }

        public ActionResult Create()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Create(Cliente cliente)
        {
            try
            {
                var clientes = OperacaoClientes.ObtemClientes();
                clientes.Add(cliente);
                OperacaoClientes.GravaClientes(clientes);
                return RedirectToAction("Index");
            }
            catch
            {
                return View(cliente);
            }
        }



        public ActionResult Edit(string nome)
        {
            var cliente = OperacaoClientes.ObtemClientes().Find(x => x.Nome == nome);
            return View(cliente);
        }



        [HttpPost]
        public ActionResult Edit(Cliente clienteNovo)
        {
            try
            {
                var clientes = OperacaoClientes.ObtemClientes();
                var clienteAntigo = clientes.Find(x => x.Nome == clienteNovo.Nome);
                clientes.Remove(clienteAntigo);
                clientes.Add(clienteNovo);
                OperacaoClientes.GravaClientes(clientes);
                return RedirectToAction("Index");
            }
            catch
            {
                return View(clienteNovo);
            }
        }


        public ActionResult Delete(string nome)
        {
            var cliente = OperacaoClientes.ObtemClientes().Find(x => x.Nome == nome);
            return View(cliente);
        }

        [HttpPost]
        public ActionResult Delete(Cliente cliente)
        {
            try
            {
                var clientes = OperacaoClientes.ObtemClientes();
                var clienteAntigo = clientes.Find(x => x.Nome == cliente.Nome);
                clientes.Remove(clienteAntigo);
                OperacaoClientes.GravaClientes(clientes);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
