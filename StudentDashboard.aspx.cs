using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ComplaintManagementSystem
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔒 Session Check
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        void LoadData()
        {
            string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Title, Description, Category, Status, Date FROM Complaints WHERE UserID=@UserID ORDER BY Date DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    lblEmpty.Text = "";
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    lblEmpty.Text = "No complaints found!";
                }
            }
        }
    }
}