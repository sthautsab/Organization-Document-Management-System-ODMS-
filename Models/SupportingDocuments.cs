using System;

namespace ODMS.Models
{
    public class SupportingDocuments
    {
        public int SDId { get; set; }
        public int DocId { get; set; }
        public string DocumentTitle { get; set; }
        public string DocumentPath { get; set; }

        public int UserId { get; set; }
        public DateTime UploadedDate { get; set; }
        public bool IsActive { get; set; }
    }
}