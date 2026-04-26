using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ComplaintManagementSystem
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔒 Admin Security
            if (Session["UserID"] == null || Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadData();
                LoadStats();
            }
        }

        // 📊 Load complaints into GridView
        void LoadData()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT ComplaintID, Title, Description, Category, Status, Date 
                                 FROM Complaints 
                                 ORDER BY Date DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        // 📈 Load dashboard statistics
        void LoadStats()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                lblUsers.Text = Convert.ToString(new SqlCommand("SELECT COUNT(*) FROM Users", con).ExecuteScalar());

                lblStudents.Text = Convert.ToString(new SqlCommand("SELECT COUNT(*) FROM Users WHERE Role='Student'", con).ExecuteScalar());

                lblHOD.Text = Convert.ToString(new SqlCommand("SELECT COUNT(*) FROM Users WHERE Role='HOD'", con).ExecuteScalar());

                lblTotalComplaints.Text = Convert.ToString(new SqlCommand("SELECT COUNT(*) FROM Complaints", con).ExecuteScalar());

                lblPending.Text = Convert.ToString(new SqlCommand("SELECT COUNT(*) FROM Complaints WHERE Status='Pending'", con).ExecuteScalar());

                lblResolved.Text = Convert.ToString(new SqlCommand("SELECT COUNT(*) FROM Complaints WHERE Status='Resolved'", con).ExecuteScalar());
            }
        }

        // ⚙ GridView Button Actions
        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            // Ensure command argument exists
            if (e.CommandArgument == null) return;

            int index = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(GridView1.DataKeys[index].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                if (e.CommandName == "Resolve")
                {
                    string query = "UPDATE Complaints SET Status='Resolved' WHERE ComplaintID=@ID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                        cmd.ExecuteNonQuery();
                    }
                }
                else if (e.CommandName == "DeleteRow")
                {
                    string query = "DELETE FROM Complaints WHERE ComplaintID=@ID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                        cmd.ExecuteNonQuery();
                    }
                }
            }

            // 🔄 Refresh UI
            LoadData();
            LoadStats();
        }
    }
}