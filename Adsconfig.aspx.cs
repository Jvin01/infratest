using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class Adsconfig : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAdsData();
            }
        }

        private void BindAdsData()
        {
            // Define the connection string
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Create a new SQL connection
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a SQL command to select ads data
                string query = "SELECT * FROM [ads]";
                SqlCommand command = new SqlCommand(query, connection);

                // Open the connection
                connection.Open();

                // Execute the command and populate the GridView
                SqlDataReader reader = command.ExecuteReader();
                AdminGridView.DataSource = reader;
                AdminGridView.DataBind();
            }
        }

        protected void AdminGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            AdminGridView.EditIndex = e.NewEditIndex;
            BindAdsData();
        }

        protected void AdminGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            AdminGridView.EditIndex = -1;
            BindAdsData();
        }

        protected void AdminGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int adId = Convert.ToInt32(AdminGridView.DataKeys[e.RowIndex].Value);
            GridViewRow row = AdminGridView.Rows[e.RowIndex];

            TextBox navigationUrlTextBox = (TextBox)row.FindControl("NavigationUrlTextBox");
            TextBox keywordTextBox = (TextBox)row.FindControl("KeywordTextBox");

            string navigationUrl = navigationUrlTextBox.Text;
            string keyword = keywordTextBox.Text;

            if (!string.IsNullOrEmpty(navigationUrl) && !string.IsNullOrEmpty(keyword))
            {
                // Update the ad data in the database
                UpdateAd(adId, navigationUrlTextBox.Text, keywordTextBox.Text);

                AdminGridView.EditIndex = -1;
                BindAdsData();
            }
            else
            {
                // Display an error message indicating that the fields are required
                Response.Write("<script>alert('Navigation URL and Keyword cannot be empty');</script>");
            }
           
        }

        protected void AdminGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int adId = Convert.ToInt32(AdminGridView.DataKeys[e.RowIndex].Value);

            // Delete the ad from the database
            DeleteAd(adId);

            BindAdsData();
        }

        protected void AddAdButton_Click(object sender, EventArgs e)
        {
            string imageUrl = SaveImageAndGetUrl(NewImageUrlFileUpload);

            string navigationUrl = NewNavigationUrlTextBox.Text;
            string keyword = NewKeywordTextBox.Text;

            if (!string.IsNullOrEmpty(imageUrl) && !string.IsNullOrEmpty(navigationUrl) && !string.IsNullOrEmpty(keyword))
            {
                AddNewAd(imageUrl, navigationUrl, keyword);
                BindAdsData();
                Response.Write("<script>alert('New ads record created');</script>");
            }
            else
            {
                Response.Write("<script>alert('Please fill up all fields');</script>");
            }
        }

        private void UpdateAd(int id, string navigationUrl, string keyword)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE [ads] SET [NavigateUrl] = @NavigateUrl, [Keyword] = @Keyword WHERE [Id] = @Id";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Id", id);
                command.Parameters.AddWithValue("@NavigateUrl", navigationUrl);
                command.Parameters.AddWithValue("@Keyword", keyword);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        private void DeleteAd(int id)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM [ads] WHERE [Id] = @Id";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Id", id);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        private void AddNewAd(string imageUrl, string navigationUrl, string keyword)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO [ads] ([ImageUrl], [NavigateUrl], [Keyword]) VALUES (@ImageUrl, @NavigateUrl, @Keyword)";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ImageUrl", imageUrl);
                command.Parameters.AddWithValue("@NavigateUrl", navigationUrl);
                command.Parameters.AddWithValue("@Keyword", keyword);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        private string SaveImageAndGetUrl(FileUpload fileUpload)
        {
            string imageUrl = string.Empty;

            if (fileUpload.HasFile)
            {
                string filename = Path.GetFileName(fileUpload.FileName);
                string saveLocation = Server.MapPath("~/ads/") + filename;
                fileUpload.SaveAs(saveLocation);
                imageUrl = "Uploads/" + filename;
            }
           
            return imageUrl;
        }
    }
}