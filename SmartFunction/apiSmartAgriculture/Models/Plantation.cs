using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apiSmartAgriculture.Models
{
    internal class Plantation
    {
        public int Id { get; set; }
        public string LandRegistryReference { get; set; }
        public double FieldCapacity { get; set; }
        public int ClientID { get; set; }
        public int CropID { get; set; }
        public int EdgeNodeID { get; set; }
        public string Comments { get; set; }
    }
}
