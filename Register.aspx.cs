using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ComplaintManagementSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "" || txtEmail.Text == "" || txtPassword.Text == "" || txtDept.Text == "" || txtRoll.Text == "")
            {
                lblMsg.Text = "All fields are required!";
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Check duplicate email
                SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email=@Email", con);
                checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                {
                    lblMsg.Text = "Email already exists!";
                    return;
                }

                // INSERT (FIXED: Department column)
                string query = "INSERT INTO Users (Name, Email, Password, Role, Department, RollNo) VALUES (@Name,@Email,@Password,'Student',@Dept,@Roll)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Dept", txtDept.Text.Trim());
                cmd.Parameters.AddWithValue("@Roll", txtRoll.Text.Trim());

                cmd.ExecuteNonQuery();

                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Registration Successful! Redirecting to Login...";

                Response.Redirect("Login.aspx");
            }
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}