using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JBL.PurpleAdmin_Free_Admin_Template_master.pages.forms
{
    public partial class staff_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStaffData();
            }

        }

        private void BindStaffData()
        {
            try
            {
                string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT FullName, Email, Phone, Address, DOB, Username FROM Staff";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        GridViewStaff.DataSource = reader;
                        GridViewStaff.DataBind();
                    }
                    else
                    {
                        // No staff data found
                        // You can display a message here if needed
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                // Handle any database or other errors here
                // You can log the error or display an error message
                Response.Write("Error: " + ex.Message);
            }
        }

    }
}