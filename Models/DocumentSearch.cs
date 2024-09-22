namespace ODMS.Models
{
    public class DocumentSearch
    {
        public int DId { get; set; }
        public int DartaNo { get; set; }
        public string DocumentTitle { get; set; }
        public string Organization { get; set; }
        public string MobileNo { get; set; }
        public int? StateId { get; set; }
        public int DistrictId { get; set; }
        public int VDCMUNId { get; set; }
        public string DepartmentName { get; set; }
        public string Status { get; set; }
    }
}