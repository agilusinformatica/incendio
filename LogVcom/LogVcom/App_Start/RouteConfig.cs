using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace LogVcom
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "Cliente/{action}/{id}",
                defaults: new { controller = "Cliente", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "GravaLigacao",
                url: "{nomeCliente}",
                defaults: new { controller = "Ligacao", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "RegistraLigacaoEntrante",
                url: "Entrante/{nomeCliente}",
                defaults: new { controller = "Entrante", action = "Index" }
            );


        }
    }
}