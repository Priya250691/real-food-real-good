using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace JBL.PurpleAdmin_Free_Admin_Template_master.pages.forms
{
    public partial class generateReport : System.Web.UI.Page
    {
        
            protected void Page_Load(object sender, EventArgs e)
            {
            }

            protected void btnDownloadReport_Click(object sender, EventArgs e)
            {
                DataTable dt = new DataTable();
                string connectionString = "Data Source=DESKTOP-TJLGUAU\\SQLEXPRESS;Initial Catalog=JayBhavaniLocho;Integrated Security=True";// Update with your actual connection string
                //string query = "SELECT TOP (1000) [OrderId], [ReceiptId], [Amount], [Status] FROM [database].[dbo].[Orders]";
                string query = "SELECT TOP (1000) [OrderId], [ReceiptId], [Amount], [Status] FROM [dbo].[Orders]";


                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dt);
                }

                // Generate PDF
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=OrderReport.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);

                Document document = new Document();
                PdfWriter.GetInstance(document, Response.OutputStream);
                document.Open();

                PdfPTable table = new PdfPTable(dt.Columns.Count);
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    table.AddCell(new Phrase(dt.Columns[i].ColumnName));
                }

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        table.AddCell(dt.Rows[i][j].ToString());
                    }
                }

                document.Add(table);
                document.Close();
                Response.Write(document);
                Response.End();
            }
        }

}