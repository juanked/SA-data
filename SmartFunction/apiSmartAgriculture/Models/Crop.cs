using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apiSmartAgriculture.Models
{
    internal class Crop
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal OptimalWater { get; set; }
    }
}
