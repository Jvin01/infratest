using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize the ad display on the initial page load
                DisplayRandomAd();
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
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Katana 15\\source\\repos\\Rexorce\\Rexorce\\App_Data\\Rexorcedb.mdf;Integrated Security=True;";

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
