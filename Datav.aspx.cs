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
    public partial class Datav : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                InjectRefreshScript();
                UpdateScheduleCount();
                updateexpense();
                updateearning();
                updaterr();
            }
            Page.DataBind();
            GetUserDisplayName();
        }
        protected void updateexpense()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
            // Define the client ID for which you want to count schedules
            int clientId = 0; // Default value or appropriate default if needed

            if (Session["client_id"] != null)
            {
                int.TryParse(Session["client_id"].ToString(), out clientId);
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT expenses FROM datavis WHERE client_Id = @clientId";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@clientId", clientId);

                    connection.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Cast the MONEY value to decimal
                            decimal expenses = reader.GetDecimal(0);

                            // Update the front-end element with expenses
                            Label3.Text = expenses.ToString("C"); // Assuming you want to format it as currency
                        }
                        else
                        {
                            // Handle the case where no data was found
                            Label3.Text = "N/A"; // Or any other suitable default or error message
                        }
                    }
                }
            }

        }
        protected void updateearning() 
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
            // Define the client ID for which you want to count schedules
            int clientId = 0; // Default value or appropriate default if needed

            if (Session["client_id"] != null)
            {
                int.TryParse(Session["client_id"].ToString(), out clientId);
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT rexorcesaving FROM datavis WHERE client_Id = @clientId";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@clientId", clientId);

                    connection.Open();
                    string ern = cmd.ExecuteScalar() as string;

                    // Update the schedule count in your front-end element
                    Label2.Text = ern; // Assuming you have a Label control for displaying the count

                    
                }

            }
        }
        protected void updaterr() 
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
            // Define the client ID for which you want to count schedules
            int clientId = 0; // Default value or appropriate default if needed

            if (Session["client_id"] != null)
            {
                int.TryParse(Session["client_id"].ToString(), out clientId);
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT recyclerate FROM datavis WHERE client_Id = @clientId";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@clientId", clientId);

                    connection.Open();
                    string rr = cmd.ExecuteScalar() as string;

                    // Update the schedule count in your front-end element
                    Label1.Text = rr; // Assuming you have a Label control for displaying the count


                }

            }

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
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

            // Define the client ID for which you want to count schedules
            int clientId = 0; // Default value or appropriate default if needed

            if (Session["client_id"] != null)
            {
                int.TryParse(Session["client_id"].ToString(), out clientId);
            }

            // Create a SQL connection and command
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM wastedata WHERE client_Id = @clientId";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@clientId", clientId);

                    connection.Open();
                    int scheduleCount = (int)cmd.ExecuteScalar();

                    // Update the schedule count in your front-end element
                    lblScheduleCount.Text = scheduleCount.ToString(); // Assuming you have a Label control for displaying the count

                    string updateQuery = "UPDATE datavis SET schedules = @scheduleCount WHERE client_Id = @clientId";
                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, connection))
                    {
                        updateCmd.Parameters.AddWithValue("@scheduleCount", scheduleCount);
                        updateCmd.Parameters.AddWithValue("@clientId", clientId);

                        int rowsAffected = updateCmd.ExecuteNonQuery();

                        // Optionally, you can check the 'rowsAffected' value to ensure the update was successful.
                        // If 'rowsAffected' is greater than 0, the update was successful.
                    }
                }

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
            {
                string cid = Session["client_id"].ToString();
                string exp = TextBox1.Text;

                // Specify your connection string
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                // Create a SQL connection and command to update expenses
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string updateQuery = "UPDATE datavis SET expenses = @expense WHERE client_id = @clientId";

                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, connection))
                    {
                        // Add parameters to the SQL command
                        updateCmd.Parameters.AddWithValue("@clientId", cid);
                        updateCmd.Parameters.AddWithValue("@expense", exp);

                        // Open the connection and execute the update query
                        connection.Open();
                        int rowsAffected = updateCmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Update successful
                            Response.Write("<script>alert('Expenses updated successfully.');</script>");
                            TextBox1.Text = "";
                            Response.Redirect(Request.RawUrl);
                        }
                        else
                        {
                            // Update failed
                            Response.Write("<script>alert('Expenses update failed.');</script>");
                        }
                    }
                }
            }


        }
    }
