using System;

namespace ODMS.Models
{
    public class DocumentStatus
    {
        public int SId { get; set; }
        public int DocumentId { get; set; }
        public int DepartmentId { get; set; }
        public string ApprovedBy { get; set; }
        public int StatusId { get; set; }
        public string Remarks { get; set; }
        public DateTime EntryDate { get; set; }
        public int UserId { get; set; }

    }
}