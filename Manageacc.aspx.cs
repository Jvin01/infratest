using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class Manageacc : System.Web.UI.Page
    {
        private string adminConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private string clientConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAdminAccounts();
                BindClientAccounts();
            }
        }

        protected void BindAdminAccounts()
        {
            using (SqlConnection connection = new SqlConnection(adminConnectionString))
            {
                connection.Open();
                string query = "SELECT * FROM [admin]";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridViewAdmins.DataSource = dt;
                GridViewAdmins.DataBind();
            }
        }

        protected void BindClientAccounts()
        {
            using (SqlConnection connection = new SqlConnection(clientConnectionString))
            {
                connection.Open();
                string query = "SELECT * FROM [clients]";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridViewClients.DataSource = dt;
                GridViewClients.DataBind();
            }
        }

        protected void GridViewAdmins_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewAdmins.EditIndex = e.NewEditIndex;
            BindAdminAccounts();
        }

        protected void GridViewAdmins_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewAdmins.EditIndex = -1;
            BindAdminAccounts();
        }

        protected void GridViewAdmins_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewAdmins.Rows[e.RowIndex];
            int id = Convert.ToInt32(GridViewAdmins.DataKeys[e.RowIndex].Value);
            string username = ((TextBox)row.FindControl("AdminUsernameTextBox")).Text;
            string password = ((TextBox)row.FindControl("AdminPasswordTextBox")).Text;
            string email = ((TextBox)row.FindControl("AdminEmailTextBox")).Text;
            string name = ((TextBox)row.FindControl("AdminNameTextBox")).Text;
            string phonenumber = ((TextBox)row.FindControl("AdminPhoneNumberTextBox")).Text;

            // Validate if any field is empty
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(name) || string.IsNullOrEmpty(phonenumber))
            {
                Response.Write("<script>alert('Please fill in all fields');</script>");
            }
            else
            {
                // All fields are filled, proceed with the update
                UpdateAdminAccount(id, username, password, email, name, phonenumber);

                GridViewAdmins.EditIndex = -1;
                BindAdminAccounts();
            }
        }

        protected void GridViewAdmins_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (e.RowIndex >= 0 && GridViewAdmins.EditIndex == -1)
            {
                int id = Convert.ToInt32(GridViewAdmins.DataKeys[e.RowIndex].Value);
                DeleteAdminAccount(id);
                BindAdminAccounts();
            }
        }

        protected void GridViewClients_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewClients.EditIndex = e.NewEditIndex;
            BindClientAccounts();
        }

        protected void GridViewClients_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewClients.EditIndex = -1;
            BindClientAccounts();
        }

        protected void GridViewClients_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewClients.Rows[e.RowIndex];
            int id = Convert.ToInt32(GridViewClients.DataKeys[e.RowIndex].Value);
            string username = ((TextBox)row.FindControl("UsernameTextBox")).Text;
            string password = ((TextBox)row.FindControl("PasswordTextBox")).Text;
            string email = ((TextBox)row.FindControl("EmailTextBox")).Text;
            string name = ((TextBox)row.FindControl("NameTextBox")).Text;
            string phonenumber = ((TextBox)row.FindControl("PhoneNumberTextBox")).Text;
            string org = ((TextBox)row.FindControl("OrganizationTextBox")).Text;

            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password) &&
        !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(name) &&
        !string.IsNullOrEmpty(phonenumber) && !string.IsNullOrEmpty(org))
            {
                // All fields are filled, proceed with updating the client account
                UpdateClientAccount(id, username, password, email, name, phonenumber, org);

                GridViewClients.EditIndex = -1;
                BindClientAccounts();
            }
            else
            {
                Response.Write("<script>alert('Please fill in all fields.');</script>");
            }
        }



        protected void GridViewClients_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewClients.DataKeys[e.RowIndex].Value);
            DeleteClientAccount(id);
            BindClientAccounts();
        }


        private void UpdateAdminAccount(int id, string username, string password, string email, string name, string phonenumber)
        {
            using (SqlConnection connection = new SqlConnection(adminConnectionString))
            {
                connection.Open();
                string query = "UPDATE [admin] SET admin_username = @Username, admin_password = @Password, admin_name = @Name, admin_email = @Email, admin_phonenumber = @PhoneNumber WHERE Id = @ID";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber);
                cmd.ExecuteNonQuery();
            }
        }

        protected void UpdateClientAccount(int id, string username, string password, string email, string name, string phonenumber, string org)
        {
            using (SqlConnection connection = new SqlConnection(clientConnectionString))
            {
                connection.Open();
                string query = "UPDATE [clients] SET client_username = @Username, client_password = @Password, client_name = @Name, client_email = @Email, client_phonenumber = @PhoneNumber, client_organization = @Org WHERE Id = @ID";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber);
                cmd.Parameters.AddWithValue("@Org", org);
                cmd.ExecuteNonQuery();
            }
        }

        private void DeleteAdminAccount(int id)
        {
            using (SqlConnection connection = new SqlConnection(adminConnectionString))
            {
                connection.Open();
                string query = "DELETE FROM [admin] WHERE Id = @ID";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.ExecuteNonQuery();
            }
        }

        private void DeleteClientAccount(int id)
        {
            using (SqlConnection connection = new SqlConnection(clientConnectionString))
            {
                connection.Open();
                string query = "DELETE FROM [clients] WHERE Id = @ID";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.ExecuteNonQuery();
            }
        }

        protected void btnAddAccount_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string email = TextBox1.Text;
            string name = TextBox2.Text;
            string phonenumber = TextBox3.Text;
            string org = TextBox5.Text;

            bool isAdminAccount = accsel.SelectedValue == "Admin";

            if (isAdminAccount)
            {
                AddAdminAccount(username, password, email, name, phonenumber);
                BindAdminAccounts();
            }
            else
            {
                AddClientAccount(username, password, email, name, phonenumber, org);
                BindClientAccounts();
            }

            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }

        private void AddAdminAccount(string username, string password, string email, string name, string phonenumber)
        {
            using (SqlConnection connection = new SqlConnection(adminConnectionString))
            {
                connection.Open();
                string query = "INSERT INTO [admin] (admin_username, admin_password, admin_name, admin_email, admin_phonenumber) VALUES (@Username, @Password, @Name, @Email, @PhoneNumber)";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber);
                cmd.ExecuteNonQuery();
            }
        }

        private void AddClientAccount(string username, string password, string email, string name, string phonenumber, string org)
        {
            using (SqlConnection connection = new SqlConnection(clientConnectionString))
            {
                connection.Open();
                string query = "INSERT INTO [clients] (client_username, client_password, client_name, client_email, client_phonenumber, client_organization) VALUES (@Username, @Password, @Name, @Email, @PhoneNumber, @Org)";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber);
                cmd.Parameters.AddWithValue("@Org", org);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
