using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string enteredUsername = TextBox1.Text;
            string enteredPassword = TextBox2.Text;

            string customeremail = "";
            string customerid = "";
            string customername = "";
            string customerstatus = "";

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            con.Open();

            string query = "SELECT * FROM clients WHERE client_username=@username AND client_password=@password";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", enteredUsername);
            cmd.Parameters.AddWithValue("@password", enteredPassword);

            cmd.CommandType = CommandType.Text;

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);

          

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    customerid = row["Id"].ToString();
                    customername = row["client_username"].ToString();
                    customerstatus = row["client_status"].ToString();
                }

               this.Session["client_email"] = customeremail;
                this.Session["client_id"] = customerid;
                this.Session["client_username"] = customername;
                this.Session["client_status"] = customerstatus;
                this.Session["role"] = "standard user";
                Response.Redirect("Homepage.aspx");
            }
            else
            {
                // Show a pop-up error message
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", "alert('Invalid username or password. Please try again.');", true);
            }
        }
    }
}
