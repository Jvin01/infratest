using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class aboutus : System.Web.UI.Page
    {// Declare UserIsLoggedIn at the class level
        public bool UserIsLoggedIn = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.DataBind();


            
                if (!IsPostBack)
                {

                    InjectRefreshScript();
                }
                // Initialize the ad display on the initial page load
                DisplayRandomAd();
                ck();
                GetUserDisplayName();
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
        protected string GetUserDisplayName()
        {
            // Check if the user is logged in and session variable is available
            if (Session["client_username"] != null)
            {
                return Session["client_username"].ToString();
            }
            else
            // If not logged in or session variable is not available, return a default value or an empty string
            return "Guest"; // You can change this to any default value you prefer
        }

        private void ck()
        {

            if (!string.IsNullOrEmpty((string)Session["client_id"]))
            {
                // Set UserIsLoggedIn to true if the session variable is not empty
                UserIsLoggedIn = true;
            }


        }
            protected void Timer1_Tick(object sender, EventArgs e)
        {
            // Display a new random ad when the timer ticks
            DisplayRandomAd();
        }

        private void DisplayRandomAd()
        {
            // Replace with your actual database connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Katana 15\source\repos\Rexorce\Rexorce\App_Data\Rexorcedb.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT TOP 1 ImageUrl FROM ads ORDER BY NEWID()", connection))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string adImageUrl = reader["ImageUrl"].ToString();
                            AdImage.ImageUrl = adImageUrl;

                            // Trigger an asynchronous postback to update the panel
                            UpdatePanel1.Update();
                        }
                    }
                }
            }
        }
    }
}