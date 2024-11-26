using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rexorce
{
    public partial class Adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string enteredUsername = TextBox1.Text;
            string enteredPassword = TextBox2.Text;

            string adminemail = "";
            string adminid = "";
            string adminname = "";
            string adminstatus = "";

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            con.Open();

            string query = "SELECT * FROM admin WHERE admin_username=@username AND admin_password=@password";

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
                    adminid = row["Id"].ToString();
                    adminname = row["admin_username"].ToString();
                    adminstatus = row["admin_status"].ToString();
                }

                this.Session["admin_email"] = adminemail;
                this.Session["admin_id"] = adminid;
                this.Session["admin_username"] = adminname;
                this.Session["admin_status"] = adminstatus;
                this.Session["role"] = "Administrator";
                Response.Redirect("Adminhomepage.aspx");
            }
            else
            {
                // Show a pop-up error message
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", "alert('Invalid username or password. Please try again.');", true);
            }
        }
    }
}