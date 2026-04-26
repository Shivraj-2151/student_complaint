using System;
using System.Data.SqlClient;
using System.Configuration;

namespace ComplaintManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text == "" || txtPassword.Text == "" || ddlRole.SelectedValue == "")
            {
                lblMsg.Text = "Please fill all fields!";
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT UserID, Role, Department FROM Users WHERE Email=@Email AND Password=@Password AND Role=@Role";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();

                    Session["UserID"] = dr["UserID"].ToString();
                    Session["Role"] = dr["Role"].ToString();
                    Session["UserID"] = dr["UserID"].ToString();
                    Session["Role"] = dr["Role"].ToString();
                    Session["Department"] = dr["Department"].ToString();

                    string role = ddlRole.SelectedValue;

                    if (role == "Student")
                        Response.Redirect("StudentDashboard.aspx");
                    else if (role == "HOD")
                        Response.Redirect("HODDashboard.aspx");
                    else if (role == "Admin")
                        Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    lblMsg.Text = "Invalid Email, Password or Role!";
                }
            }
        }


        protected void lnkRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        
    }
}