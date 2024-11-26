using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using System.Drawing;

namespace Rexorce
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            


            // Get form field values
            string name = TextBox1.Text.Trim();
            string username = TextBox2.Text.Trim();
            string email = TextBox3.Text.Trim();
            string password = TextBox4.Text.Trim();
            string organization = TextBox5.Text.Trim();
            string phoneNumber = TextBox6.Text.Trim();

            // Validate name field (non-empty)
            if (string.IsNullOrEmpty(name))
            {
                Label1.Visible = true;
                Label1.Text = "Name is required.";
                return;
            }

            // Validate username field (non-empty)
            if (string.IsNullOrEmpty(username))
            {
                Label1.Visible = true;
                Label1.Text = "Username is required.";
                return;
            }
            // Validate email field (non-empty and valid email format)
            if (string.IsNullOrEmpty(email) || !IsValidEmail(email))
            {
                Label1.Visible = true;
                Label1.Text = "Invalid email format.";
                return;
            }

            // Validate password field (non-empty)
            if (string.IsNullOrEmpty(password))
            {
                Label1.Visible = true;
                Label1.Text = "Password is required.";
                return;
            }

            // Validate org field (non-empty)
            if (string.IsNullOrEmpty(organization))
            {
                Label1.Visible = true;
                Label1.Text = "Organization is required.";
                return;
            }

            // Validate phone number field (non-empty and valid phone number format)
            if (string.IsNullOrEmpty(phoneNumber) || !IsValidPhoneNumber(phoneNumber))
            {
                Label1.Visible = true;
                Label1.Text = "Invalid phone number format.";
                return;
            }

            if (IsUsernameExists(username))
            {
                Label1.Visible = true;
                Label1.Text = "Username already exists. Please choose a different username.";
                return;
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                string insertClientQuery = "INSERT INTO clients (client_name, client_username, client_email, client_password, client_organization, client_phonenumber) VALUES(@customer_name, @customer_username, @customer_email, @customer_password, @customer_org, @customer_phonenumber)";

                using (SqlCommand cmd = new SqlCommand(insertClientQuery, con))
                {
                    cmd.Parameters.AddWithValue("@customer_name", name);
                    cmd.Parameters.AddWithValue("@customer_username", username);
                    cmd.Parameters.AddWithValue("@customer_email", email);
                    cmd.Parameters.AddWithValue("@customer_password", password);
                    cmd.Parameters.AddWithValue("@customer_org", organization);
                    cmd.Parameters.AddWithValue("@customer_phonenumber", phoneNumber);
                    cmd.ExecuteNonQuery();
                }

                // Retrieve the client_Id of the newly created client
                string getClientIdQuery = "SELECT Id FROM clients WHERE client_email = @customer_email";
                using (SqlCommand getClientIdCmd = new SqlCommand(getClientIdQuery, con))
                {
                    getClientIdCmd.Parameters.AddWithValue("@customer_email", email);
                    int clientId = Convert.ToInt32(getClientIdCmd.ExecuteScalar());
                


                    // Database connection for the 'datavis' table
                    using (SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString))
                        {
                            con1.Open();
                            string insertDatavisQuery = "INSERT INTO datavis (client_Id, expenses, rexorcesaving, recyclerate, totalwaste) VALUES(@id, @exp, @rs, @rr, @tw)";

                            using (SqlCommand insertDatavisCmd = new SqlCommand(insertDatavisQuery, con1))
                            {
                                insertDatavisCmd.Parameters.AddWithValue("@id", clientId);
                                insertDatavisCmd.Parameters.AddWithValue("@exp", "0"); // You can set default values as needed
                                insertDatavisCmd.Parameters.AddWithValue("@rs", "0");
                                insertDatavisCmd.Parameters.AddWithValue("@rr", "0");
                                insertDatavisCmd.Parameters.AddWithValue("@tw", "0");
                                insertDatavisCmd.ExecuteNonQuery();
                            }
                        }
                    
                }

                // Close the connection
                con.Close();
            }
            Response.Write("<script>alert('account registered successfully.');</script>");
            Response.Redirect("Login.aspx");
        }
    
        private bool IsValidEmail(string email)
        {
            // Simple email format validation using regular expression
            string pattern = @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
            return Regex.IsMatch(email, pattern);
        }

        private bool IsValidPhoneNumber(string phoneNumber)
        {
            // Simple phone number format validation using regular expression
            string pattern = @"^[0-9]{10}$";
            return Regex.IsMatch(phoneNumber, pattern);
        }

        private bool IsUsernameExists(string username)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                string checkUsernameQuery = "SELECT COUNT(*) FROM clients WHERE client_username = @username";
                using (SqlCommand cmd = new SqlCommand(checkUsernameQuery, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    return count > 0;
                }
            }
        }
    }
}