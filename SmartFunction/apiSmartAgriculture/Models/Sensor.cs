using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apiSmartAgriculture.Models
{
    internal class Sensor
    {
        public int Id { get; set; }
        public string Serial { get; set; }
        public decimal LinearFit { get; set; }
        public int SensorClassID { get; set; }
        public bool Available { get; set; }
    }
}
