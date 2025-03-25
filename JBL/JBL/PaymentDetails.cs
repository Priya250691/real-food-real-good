using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JayBhavaniLocho.Models
{
    public class PaymentDetails
    {
        public string PaymentId { get; set; }
        public string UserId { get; set; }
        public decimal Amount { get; set; }
        public DateTime PaymentDate { get; set; }
    }
}