using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class Admineditprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load user's existing profile data and populate the input fields
                LoadUserProfileData();
            }
        }

        private void LoadUserProfileData()
        {
            string userId = Session["admin_id"].ToString();
            DataTable userData = GetUserDataFromDatabase(userId);

            if (userData.Rows.Count > 0)
            {
                // Populate the labels with user data
                usernametb.Text = userData.Rows[0]["admin_username"].ToString();
                passwordtb.Text = userData.Rows[0]["admin_password"].ToString();
                phnumtb.Text = userData.Rows[0]["admin_phonenumber"].ToString();
                emailtb.Text = userData.Rows[0]["admin_email"].ToString();
                nametb.Text = userData.Rows[0]["admin_name"].ToString();
            }
        }

        private DataTable GetUserDataFromDatabase(string userId)
        {
            // Implement logic to retrieve user data from the database using userId
            DataTable userData = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM admin WHERE Id = @adminId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@adminId", userId);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(userData);
                    }
                }
            }

            return userData;
        }

        private void UpdateUserProfile()
        {
            // Validate the input fields
            if (IsValidInput())
            {
                // Retrieve the user account information from the form fields
                string newuname = usernametb.Text;
                string newemail = emailtb.Text;
                string newpassword = passwordtb.Text;
                string newphnum = phnumtb.Text;
                string newname = nametb.Text;
                string userId = Session["admin_id"].ToString();

                // Define the connection string from your Web.config
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                // Create a SQL connection
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Define the SQL update command to update user data
                    string updateQuery = "UPDATE admin SET admin_username = @uName, admin_email = @Email, admin_password = @Password, admin_name = @name, admin_phonenumber = @phnum WHERE Id = @UserId";

                    // Create a SQL command
                    using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
                    {
                        // Add parameters to the command
                        cmd.Parameters.AddWithValue("@uName", newuname);
                        cmd.Parameters.AddWithValue("@Email", newemail);
                        cmd.Parameters.AddWithValue("@Password", newpassword);
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@name", newname);
                        cmd.Parameters.AddWithValue("@phnum", newphnum);

                        try
                        {
                            // Open the connection and execute the update
                            connection.Open();
                            cmd.ExecuteNonQuery();
                            Response.Write("<script>alert('Account updated!');window.location.href='Adminhomepage.aspx';</script>");
                        }
                        catch (Exception ex)
                        {
                            Response.Write("Error: " + ex.ToString());
                        }
                    }
                }
            }
        }

        private bool IsValidInput()
        {
            // Perform validation on the input fields
            if (string.IsNullOrEmpty(usernametb.Text) || string.IsNullOrEmpty(passwordtb.Text) || string.IsNullOrEmpty(emailtb.Text))
            {
                // Display an error message if any field is empty
                Label1.Visible = true;
                Label1.Text = "Please fill in all the fields.";
                return false;
            }

            // Validate the email format
            string emailPattern = @"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
            if (!Regex.IsMatch(emailtb.Text, emailPattern))
            {
                Label1.Visible = true;
                Label1.Text = "Invalid email format.";
                return false;
            }

            // Check the password length (add your desired password length)
            if (passwordtb.Text.Length < 8)
            {
                Label1.Visible = true;
                Label1.Text = "Password must be at least 8 characters long.";
                return false;
            }

            // Add more validation rules as needed

            return true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            UpdateUserProfile();
        }
    }
}
