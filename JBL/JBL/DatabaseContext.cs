using Org.BouncyCastle.Ocsp;
using System;
using System.Collections.Generic;
using System.Data.Entity; // Added this directive for DbContext and DbSet
using System.Linq;
using System.Web;

namespace JayBhavaniLocho.Models
{
    public class DatabaseContext : DbContext
    {
        public DbSet<PaymentDetails> PaymentDetails { get; set; }
        public DbSet<Reg> Reg { get; set; } // Add this DbSet property

        // Constructor to specify the connection string
        //public DatabaseContext() : base("Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True")
        public DatabaseContext() : base("name=DatabaseContext")
        {
            // Optional: Configuration or initialization logic can be added here
        }
    }
}
