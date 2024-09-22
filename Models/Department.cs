using System;

namespace ODMS.Models
{
    public class Department
    {
        public int DeportId { get; set; }
        public int OrgId { get; set; }
        public string DepartmentName { get; set; }
        public int DepartmentCode { get; set; }
        public DateTime EntryDate { get; set; }
        public int UserId { get; set; }
        public bool IsActive { get; set; }
    }
}