using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class Adminmessage : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Call the method to bind messages to the GridView
                BindMessages();
            }
        }

        private void BindMessages()
        {
            try
            {
                // Connection string from your web.config file
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                // SQL query to retrieve messages from the database
                string query = "SELECT Id, username, message, sent FROM messages";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        // Bind the data to the GridView
                        GridViewMessages.DataSource = reader;
                        GridViewMessages.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions here
                // You can log the error or display an error message
                // Example: ErrorMessageLabel.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}