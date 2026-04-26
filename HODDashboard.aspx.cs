using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ComplaintManagementSystem
{
    public partial class HODDashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔒 Session check
            if (Session["UserID"] == null || Session["Role"] == null || Session["Role"].ToString() != "HOD")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
                LoadData();
        }

        void LoadData()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT ComplaintID, Title, Description, Category, Status, Date, ImagePath 
                         FROM Complaints 
                         WHERE Department = @Dept
                         ORDER BY Date DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Dept", Session["Department"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Resolve")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(GridView1.DataKeys[index].Value);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "UPDATE Complaints SET Status='Resolved' WHERE ComplaintID=@ID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ID", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadData(); // Refresh grid
            }
        }
    }
}