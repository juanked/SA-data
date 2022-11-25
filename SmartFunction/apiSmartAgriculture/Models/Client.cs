using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace apiSmartAgriculture.Models
{
    internal class Client
    {
        public int Id { get; set; }
        public string ContactName { get; set; }
        public string SocietyName { get; set; }
        public string TAXid { get; set; }
        public string Direction { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public string CountryISOCode { get; set; }
        public string Email { get; set; }
        public string Telephone { get; set; }
    }
}
