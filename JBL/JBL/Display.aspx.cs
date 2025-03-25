using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;

namespace JayBhavaniLocho
{
    public partial class Display : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    // Retrieve all data from the Users table
            //    string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            //    using (SqlConnection con = new SqlConnection(connectionString))
            //    {
            //        string query = "SELECT * FROM Users";
            //        SqlCommand cmd = new SqlCommand(query, con);

            //        SqlDataAdapter da = new SqlDataAdapter(cmd);
            //        DataTable dt = new DataTable();
            //        da.Fill(dt);

            //        GridView1.DataSource = dt;
            //        GridView1.DataBind();
            //    }
            //}

            //if (!IsPostBack)
            //{
            //    // Fetch data from the database
            //    string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";
            //    using (SqlConnection con = new SqlConnection(connectionString))
            //    {
            //        string query = "SELECT * FROM Users";
            //        SqlCommand cmd = new SqlCommand(query, con);

            //        SqlDataAdapter da = new SqlDataAdapter(cmd);
            //        DataTable dt = new DataTable();
            //        da.Fill(dt);

            //        // Generate HTML for data
            //        StringBuilder html = new StringBuilder();
            //        foreach (DataRow row in dt.Rows)
            //        {
            //            html.Append("<tr>");
            //            for (int i = 0; i < dt.Columns.Count; i++)
            //            {
            //                html.Append("<td>" + row[i].ToString() + "</td>");
            //            }
            //            html.Append("</tr>");
            //        }

            //        // Inject HTML into the placeholder
            //        const string placeholder = "<!--##INSERT_DYNAMIC_DATA_HERE##-->";
            //        basicTableHtml.Text = basicTableHtml.Text.Replace(placeholder, html.ToString());
            //    }
            //}
        }
    }
}
