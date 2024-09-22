using System;

namespace ODMS.Models
{
    public class DocumentTrackInDepartment
    {
        public int DId { get; set; }
        public int SId { get; set; }

        public int DepartmentId { get; set; }
        public string DocumentTitle { get; set; }
        public string DepartmentName { get; set; }
        public string ApprovedBy { get; set; }
        public string Status { get; set; }

        public string DocumentPath { get; set; }
        public DateTime EntryDate { get; set; }
        public bool IsActive { get; set; }
    }
}