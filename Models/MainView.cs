using System.Collections.Generic;

namespace ODMS.Models
{
    public class MainView
    {
        public int DId { get; set; }
        public int? DartaNo { get; set; }
        public string DocumentTitle { get; set; }

        public string DocumentPath { get; set; }
        public string Organization { get; set; }
        public string MobileNo { get; set; }
        public int? StateId { get; set; }
        public string StateName { get; set; }

        public int DistrictId { get; set; }
        public string District { get; set; }

        public int VDCMUNId { get; set; }
        public string VDCName { get; set; }

        public string Status { get; set; }

        public List<string> SupportingDocuments { get; set; }
    }
}