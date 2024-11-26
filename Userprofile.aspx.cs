using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System;

namespace Rexorce
{
    public partial class Userprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is authenticated (you can use your authentication logic)
                if (UserIsAuthenticated())
                {
                    // Retrieve user information from the database
                    string userId = GetUserLoggedInUserId(); // Implement this method to get the user's ID
                    DataTable userData = GetUserDataFromDatabase(userId);

                    if (userData.Rows.Count > 0)
                    {
                        // Populate the labels with user data
                        lblUserName.Text = userData.Rows[0]["client_name"].ToString();
                        Label1.Text = Session["role"].ToString();
                        Label2.Text = userData.Rows[0]["Id"].ToString();
                        Label3.Text = userData.Rows[0]["client_name"].ToString();
                        Label4.Text = userData.Rows[0]["client_username"].ToString();
                        Label5.Text = userData.Rows[0]["client_email"].ToString();
                        Label6.Text = userData.Rows[0]["client_password"].ToString();
                        Label7.Text = userData.Rows[0]["client_organization"].ToString();
                        Label8.Text = userData.Rows[0]["client_phonenumber"].ToString();
                        // Add similar lines to populate other labels with user data
                    }
                }
                else
                {
                    // Handle unauthenticated user (redirect to login page, for example)
                }
            }
        }

        // Implement methods to check user authentication and retrieve user data from the database
        private bool UserIsAuthenticated()
        {
            if (string.IsNullOrEmpty((string)Session["client_id"]))
            {
                Response.Write("<script>alert('Please Login!');window.location.href='Login.aspx';</script>");
                return false; // Add this line to handle the case where the session is empty
            }
            else
            {
                return true;
            }
        }


        private string GetUserLoggedInUserId()
        {

            if (Session["client_id"] != null)
            {
                return Session["client_id"].ToString();

            }
            else
                return "Guest";
        }

        private DataTable GetUserDataFromDatabase(string userId)
        {
            // Implement logic to retrieve user data from the database using userId
            DataTable userData = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM clients WHERE Id = @UserId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserId", userId);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(userData);
                    }
                }
            }

            return userData;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usereditprofile.aspx");
        }
    }
}
