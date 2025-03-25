using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho
{
    public partial class profileDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();
                    GetUserDetailsAndPopulateControls(username);
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        private void GetUserDetailsAndPopulateControls(string username)
        {
            // Connection string from your web.config
            string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Your SQL query
                string query = "SELECT [UserID], [FullName], [Username], [MobileNumber], [DateOfBirth], [Gender], [Address], [City], [Pincode], [Email], [Password] " +
                               "FROM [JayBhavaniLocho].[dbo].[Reg] WHERE [Username] = @Username";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Assign user details to controls in the ASPX file
                            lblUserID.Text = reader["UserID"].ToString();
                            lblFullName.Text = reader["FullName"].ToString();
                            lblUsername.Text = reader["Username"].ToString();
                            lblMobileNumber.Text = reader["MobileNumber"].ToString();
                            lblDateOfBirth.Text = Convert.ToDateTime(reader["DateOfBirth"]).ToString("yyyy-MM-dd");
                            lblGender.Text = reader["Gender"].ToString();
                            lblAddress.Text = reader["Address"].ToString();
                            lblCity.Text = reader["City"].ToString();
                            lblPincode.Text = reader["Pincode"].ToString();
                            lblEmail.Text = reader["Email"].ToString();
                            // Password is usually not displayed in profiles for security reasons
                            // lblPassword.Text = reader["Password"].ToString();
                        }
                    }
                }
            }
        }

    }
}