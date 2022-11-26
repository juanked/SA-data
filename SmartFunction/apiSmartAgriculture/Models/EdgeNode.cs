using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apiSmartAgriculture.Models
{
    internal class EdgeNode
    {
        public int Id { get; set; }
        public string Hostname { get; set; }
        public string Serial { get; set; }
        public int EdgeNodeClassID { get; set; }
        public int GatewayID { get; set; }
        public string IP { get; set; }
        public string Comments { get; set; }
        public bool Available { get; set; }
    }
}
