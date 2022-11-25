using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apiSmartAgriculture.Models
{
    internal class Installation
    {
        public int Id { get; set; }
        public int PlantationID { get; set; }
        public int SensorID { get; set; }
        public int ActuatorID { get; set; }
        public int AzureResourceID { get; set; }
        public DateTime InstallationDate { get; set; }
        public string Comments { get; set; }
    }
}
