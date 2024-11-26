using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class Adminhomepage : System.Web.UI.Page
    {
        public bool UserIsLoggedIn = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.DataBind();

            if (!IsPostBack)
            {

                InjectRefreshScript();
                UpdateScheduleCount();
                updateval();
                updatecli();
                updatemsg();
            }
            ck();
            GetUserDisplayName();

        }

        protected void updateval()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
           
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT SUM(quotations) FROM wastedata";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {

                    connection.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Cast the MONEY value to decimal
                            decimal val = reader.GetDecimal(0);

                            // Update the front-end element with expenses
                            Label2.Text = val.ToString("C"); // Assuming you want to format it as currency
                        }
                        else
                        {
                            // Handle the case where no data was found
                            Label2.Text = "N/A"; // Or any other suitable default or error message
                        }
                    }
                }
            }

        }
        protected void updatecli()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(DISTINCT client_Id) FROM wastedata";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    connection.Open();
                    int clientCount = (int)cmd.ExecuteScalar();

                    // Update the front-end element with the count of unique client IDs
                    Label1.Text = clientCount.ToString();
                }
            }
        }
        protected void updatemsg()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString3"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(Id) FROM messages";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    connection.Open();
                    int messageCount = (int)cmd.ExecuteScalar();

                    // Update the front-end element with the count of messages
                    Label0.Text = messageCount.ToString();
                }
            }
        }


        private void ck()
        {

            if (string.IsNullOrEmpty((string)Session["admin_id"]))
            {
                Response.Write("<script>alert('Please Login!');window.location.href='Adminlogin.aspx';</script>");
            }


        }
        protected string GetUserDisplayName()
        {
            // Check if the user is logged in and session variable is available
            if (Session["admin_username"] != null)
            {
                return Session["admin_username"].ToString();
            }
            else
                return "Guest";
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
        protected void UpdateScheduleCount()
        {
            // Specify your connection string
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {
                // Create a SQL connection and command
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM wastedata";

                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        int scheduleCount = (int)cmd.ExecuteScalar();

                        // Store the count in a session variable
                        Session["schedulec"] = scheduleCount;

                        // Update the schedule count in your front-end element
                        Label3.Text = scheduleCount.ToString(); // Assuming you have a Label control for displaying the count
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions here, e.g., log the error
                // You can also display a user-friendly message or take other appropriate actions.
                // For this example, we'll just print the exception message to the console.
                Console.WriteLine("Error: " + ex.Message);
            }
        }
    }
}