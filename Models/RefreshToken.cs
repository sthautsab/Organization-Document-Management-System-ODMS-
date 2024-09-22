using System;

namespace ODMS.Models
{
    public class RefreshToken
    {
        public string refreshToken { get; set; }
        public DateTime expiryDate { get; set; }
        public DateTime entryDate { get; set; }
        public int UserId { get; set; }
    }
}