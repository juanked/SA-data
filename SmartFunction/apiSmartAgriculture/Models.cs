using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apiSmartAgriculture
{
    internal class Models
    {
        public class PlantationModel
        {
            public int Id { get; set; }
            public string LandRegistryReference { get; set; }
            public double FieldCapacity { get; set; }
            public int ClientID { get; set; }
            public int CropID { get; set; }
            public int EdgeNodeID { get; set; }
            public string Comments { get; set; }
        }
        public class CreatePlantationModel
        {
            public string LandRegistryRefernce { get; set; }
            public string Description { get; set; }
            public double FieldCapacity { get; set; }
            public int ClientID { get; set; }
            public int CropID { get; set; }
            public int EdgeNodeID { get; set; }
            public string Comments { get; set; }
        }
        //public class UpdateTaskModel
        //{
        //    public string Description { get; set; }
        //    public bool IsDone { get; set; }
        //}
    }
}
