using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LogVcom.Models
{
    public class Ligacao
    {
        public string calldate { get; set; }
        public string src { get; set; }
        public string dst { get; set; }
        public string duration { get; set; }
        public string billsec { get; set; }
        public string disposition { get; set; }
        public string userfield { get; set; }
        public string callid { get; set; }
    }
}