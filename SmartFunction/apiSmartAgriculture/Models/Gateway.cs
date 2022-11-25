using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apiSmartAgriculture.Models
{
    internal class Gateway
    {
        public int Id { get; set; }
        public string Serial { get; set; }
        public int GatewayClassID { get; set; }
        public bool Available { get; set; }
    }
}
