using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;

namespace Rexorce
{
    public partial class Bookschedule : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate the waste types from the database
                PopulateWasteTypes();
            }
        }

        protected void PopulateWasteTypes()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString);

            con.Open();

            SqlCommand com = new SqlCommand("SELECT * FROM wastematdata", con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset  
            ddlWasteType.DataSource = ds.Tables[0].DefaultView.ToTable(true, "material");
            ddlWasteType.DataValueField = "material";
            ddlWasteType.DataTextField = "material";
            ddlWasteType.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // Calculate the amount based on the selected waste type and weight
                decimal basePrice = GetBasePrice(ddlWasteType.SelectedValue);
                decimal weight = decimal.Parse(txtWeight.Text);
                decimal amount = basePrice * weight;

                // Display the calculated amount
                lblAmount.Text = amount.ToString("C"); // Currency format

                // Save the schedule to the database
                SaveSchedule();
            }
            catch (Exception ex)
            {
                // Handle the exception
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        private void SaveSchedule()
        {
            try
            {
                string quotation = lblAmount.Text;
                string ewtype = ddlWasteType.SelectedValue;
                string cid = Session["client_id"].ToString();
                string coldate = txtCollectionDate.Text;
                string coltime = txtCollectionTime.Text;
                string colloc = loc.Value;
                string description = desc.Value;
                decimal weight = decimal.Parse(txtWeight.Text);
                string status = "pending";

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                con.Open();
                string query = "INSERT INTO wastedata (client_Id, waste_type, quantity, collection_date, collection_time, collection_location, description, status, quotations) VALUES (@client_Id, @waste_type, @quantity, @collection_date, @collection_time, @collection_location, @desc, @status, @q)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add parameters to the SQL command to prevent SQL injection
                    cmd.Parameters.AddWithValue("@collection_date", coldate);
                    cmd.Parameters.AddWithValue("@collection_time", coltime);
                    cmd.Parameters.AddWithValue("@client_Id", cid);
                    cmd.Parameters.AddWithValue("@waste_type", ewtype);
                    cmd.Parameters.AddWithValue("@quantity", weight);
                    cmd.Parameters.AddWithValue("@collection_location", colloc);
                    cmd.Parameters.AddWithValue("@desc", description);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@q", quotation);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    updatedatavis();
                    // Successful insert
                    Response.Write("<script>alert('Data inserted successfully.');</script>");
                     Response.Redirect("Homepage.aspx");

                }
            }
            catch (Exception)
            {
                  // Insert failed
                    Response.Write("<script>alert(Exception);</script>");
            }
        }

        private void updatedatavis() {
            int schedule = int.Parse(Session["schedulec"].ToString());
            string clientId = Session["client_id"].ToString();
            decimal rexorcesaving = decimal.Parse(lblAmount.Text, NumberStyles.Currency); // Assuming lblAmount displays the rexorcesaving amount
            decimal totalWaste = decimal.Parse(txtWeight.Text); // Assuming txtWeight represents the quantity

            

            SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);

            con2.Open();
            // Check if the record for this client ID exists in the 'datavis' table
            string selectQuery = "SELECT * FROM datavis WHERE client_Id = @client_id";
            using (SqlCommand selectCmd = new SqlCommand(selectQuery, con2))
            {
                selectCmd.Parameters.AddWithValue("@client_id", clientId);
                SqlDataReader reader = selectCmd.ExecuteReader();

                if (reader.Read())
                {
                    // Record for this client ID exists, get the existing values
                    decimal existingRexorceSaving = Convert.ToDecimal(reader["rexorcesaving"]);
                    decimal existingTotalWaste = Convert.ToDecimal(reader["totalwaste"]);
                    reader.Close();

                    // Calculate new values by adding current values to existing values
                    decimal newRexorceSaving = existingRexorceSaving + rexorcesaving;
                    decimal newTotalWaste = existingTotalWaste + totalWaste;

                    decimal recyclerate = schedule / newTotalWaste;
                    string formattedRecycleRate = (recyclerate * 100).ToString("0.00") + "%";

                    // Update the 'datavis' table with the new values
                    string updateQuery = "UPDATE datavis SET rexorcesaving = @rexorcesaving, totalwaste = @totalwaste, recyclerate = @rr WHERE client_id = @client_id";
                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, con2))
                    {
                        updateCmd.Parameters.AddWithValue("@rexorcesaving", newRexorceSaving);
                        updateCmd.Parameters.AddWithValue("@totalwaste", newTotalWaste);
                        updateCmd.Parameters.AddWithValue("@client_id", clientId);
                        updateCmd.Parameters.AddWithValue("@rr", formattedRecycleRate);

                        updateCmd.ExecuteNonQuery();
                    }
                }
                else
                {
                    // Record for this client ID doesn't exist, you can handle this case or ignore it
                    reader.Close();
                    // Handle the case where the record doesn't exist, if needed
                }
            }

        }





        protected decimal GetBasePrice(string wastetype)
        {
            // Connect to the database
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString))
            {
                connection.Open();

                // Create a SQL query to get the base price for the specified waste type
                string query = "SELECT baseprice FROM wastematdata WHERE material = @WasteType";

                // Create a SqlCommand object to execute the query
                SqlCommand command = new SqlCommand(query, connection);

                // Set the parameter value
                command.Parameters.AddWithValue("@WasteType", wastetype);

                // Execute the query
                decimal basePrice = (decimal)command.ExecuteScalar();

                // Close the connection
                connection.Close();

                return basePrice;
            }
        }
    }
}
