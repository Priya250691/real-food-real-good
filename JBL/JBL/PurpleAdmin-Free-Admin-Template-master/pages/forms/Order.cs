using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JBL.PurpleAdmin_Free_Admin_Template_master.pages.forms
{
    public class Order
    {
        public string OrderId { get; set; }
        public string ReceiptId { get; set; }
        public decimal Amount { get; set; }
        public string Status { get; set; }
        public DateTime OrderDate { get; set; }
    }
}