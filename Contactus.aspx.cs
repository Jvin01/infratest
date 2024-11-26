using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class Contactus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.DataBind();

            if (!IsPostBack)
            {

                InjectRefreshScript();
            }
            GetUserDisplayName();
        }


        protected string GetUserDisplayName()
        {
            // Check if the user is logged in and session variable is available
            if (Session["client_username"] != null)
            {
                return Session["client_username"].ToString();
            }
            else
                return "Guest";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string emessage = message.Value;
            string username = (string)Session["client_username"];
            string userId = (string)Session["client_id"];

            // Get the current date and time
            DateTime sentDateTime = DateTime.Now;

            // Your database connection string
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Insert the message into the messages table along with the sent date and time
                using (SqlCommand insertCommand = new SqlCommand("INSERT INTO messages (username, message, sent) VALUES (@UserID, @MessageText, @SentDateTime)", connection))
                {
                    insertCommand.Parameters.AddWithValue("@UserID", username);
                    insertCommand.Parameters.AddWithValue("@MessageText", emessage);
                    insertCommand.Parameters.AddWithValue("@SentDateTime", sentDateTime);

                    // Execute the insert query
                    insertCommand.ExecuteNonQuery();
                }
            }

            Response.Write("<script>alert('Message sent!');window.location.href='Contactus.aspx';</script>");
        }

        private void InjectRefreshScript()
        {
            string script = @"
        <script type='text/javascript'>
            if (window.performance && window.performance.navigation.type === 2) {
                window.location.reload();
            }
        </script>";

            Page.ClientScript.RegisterStartupScript(this.GetType(), "RefreshScript", script);
        }
    }
}