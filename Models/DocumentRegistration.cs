using System;

namespace ODMS.Models
{
    public class DocumentRegistration
    {
        public int DId { get; set; }
        public int? DartaNo { get; set; }
        public string DocumentTitle { get; set; }
        public string Organization { get; set; }
        public int StateId { get; set; }
        public int DistrictId { get; set; }
        public int VDCMUNId { get; set; }
        public int WardNo { get; set; }
        public string Tole { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string MobileNo { get; set; }
        public DateTime EntryDate { get; set; }
        public int UserId { get; set; }
        public string DocumentPath { get; set; }
        public bool IsActive { get; set; }
        public string Remarks { get; set; }
    }
}