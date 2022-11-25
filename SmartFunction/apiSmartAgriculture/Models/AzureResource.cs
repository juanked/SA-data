using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apiSmartAgriculture.Models
{
    internal class AzureResource
    {
        public int id { get; set; }
        public string name { get; set; }
        public string publicIP { get; set; }
        public object privateIP { get; set; }
        public string resourceGroup { get; set; }
        public string description { get; set; }
    }
}
