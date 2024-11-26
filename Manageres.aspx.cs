using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class Manageres : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMaterialData();
            }
        }

        protected void BindMaterialData()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM wastematdata";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Check for empty fields
            if (string.IsNullOrEmpty(txtMaterial.Text) || string.IsNullOrEmpty(txtBasePrice.Text))
            {
                Response.Write("<script>alert('Please fill up all fields');</script>");
            }
            else
            {
                string material = txtMaterial.Text;
                string demands = DropDownList1.SelectedValue;
                decimal basePrice;

                // Check if the input can be parsed as a decimal
                if (decimal.TryParse(txtBasePrice.Text, out basePrice))
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string query = "INSERT INTO wastematdata (material, baseprice, demands) VALUES (@Material, @BasePrice, @Demands)";
                        SqlCommand cmd = new SqlCommand(query, connection);
                        cmd.Parameters.AddWithValue("@Material", material);
                        cmd.Parameters.AddWithValue("@BasePrice", basePrice);
                        cmd.Parameters.AddWithValue("@Demands", demands);
                        cmd.ExecuteNonQuery();
                    }

                    // Clear input fields and refresh data
                    txtMaterial.Text = string.Empty;
                    txtBasePrice.Text = string.Empty;
                    DropDownList1.SelectedIndex = 0;

                    BindMaterialData();
                    Response.Write("<script>alert('New material record added');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Base Price format');</script>");
                }
            }
        }



        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindMaterialData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string material = ((TextBox)row.FindControl("MaterialTextBox")).Text;
            decimal basePrice = Convert.ToDecimal(((TextBox)row.FindControl("BasePriceTextBox")).Text);
            string demands = ((DropDownList)row.FindControl("DemandsDropDown")).SelectedValue;

            // Check if any of the fields are empty
            if (!string.IsNullOrEmpty(material) && basePrice != 0)
            {
              
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string query = "UPDATE wastematdata SET material = @Material, baseprice = @BasePrice, demands = @Demands WHERE Id = @Id";
                        SqlCommand cmd = new SqlCommand(query, connection);
                        cmd.Parameters.AddWithValue("@Material", material);
                        cmd.Parameters.AddWithValue("@BasePrice", basePrice);
                        cmd.Parameters.AddWithValue("@Demands", demands);
                        cmd.Parameters.AddWithValue("@Id", id);
                        cmd.ExecuteNonQuery();
                    }

                    GridView1.EditIndex = -1;
                    BindMaterialData();  
            }
            else
            {
                Response.Write("<script>alert('Please fill up all fields');</script>");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "DELETE FROM wastematdata WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }

            BindMaterialData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindMaterialData();
        }
    }
}
