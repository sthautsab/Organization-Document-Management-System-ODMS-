namespace ODMS.Models
{
    public class ReceiveStatusAccordingToDepartment
    {
        public int DId { get; set; }
        public int DepartmentId { get; set; }
        public int StatusId { get; set; }
        public string ApprovedBy { get; set; }
        public string Remarks { get; set; }
    }
}