using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apiSmartAgriculture.Models
{
    internal class GatewayClass
    {
        public int Id { get; set; }
        public string Manufacturer { get; set; }
        public string Model { get; set; }
        public string Connector { get; set; }
        public int Channels { get; set; }
    }
}
