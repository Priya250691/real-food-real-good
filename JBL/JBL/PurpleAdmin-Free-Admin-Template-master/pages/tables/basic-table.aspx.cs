using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho.PurpleAdmin_Free_Admin_Template_master.pages.tables
{
    public partial class basic_table : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve all data from the Users table
                string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM Reg";
                    SqlCommand cmd = new SqlCommand(query, con);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Add a column for Sr No and populate it
                    DataColumn srNoColumn = new DataColumn("SrNo", typeof(int));
                    srNoColumn.AutoIncrement = true;
                    srNoColumn.AutoIncrementSeed = 1;
                    srNoColumn.AutoIncrementStep = 1;
                    dt.Columns.Add(srNoColumn);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                }
            }

           
        }
    }
}