using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class Adschreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Accept")
            {
                // Get the index of the row where the button was clicked
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the value of the DataKey (e.g., waste_Id) for the selected row
                int wasteId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

                // Update the status to "Accepted" in the database
                UpdateStatusToAccepted(wasteId);

                // Refresh the GridView to reflect the updated status
                GridView1.DataBind();
            }
        }
        private void UpdateStatusToAccepted(int wasteId)
        {
            // Define your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Define the SQL query to update the status
            string updateQuery = "UPDATE wastedata SET status = 'Accepted' WHERE waste_Id = @wasteId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    // Add the parameter for the wasteId
                    command.Parameters.AddWithValue("@wasteId", wasteId);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        // Check rowsAffected if needed for error handling.
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception (e.g., log it or display an error message)
                    }
                }
            }
        }
    }
}