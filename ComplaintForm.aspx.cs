using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ComplaintManagementSystem
{
    public partial class ComplaintForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check login
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtTitle.Text == "" || txtDesc.Text == "" || ddlCategory.SelectedValue == "")
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please fill all fields!";
                return;
            }

            string imagePath = "";

            // 📌 Image Upload Logic
            if (fileProof.HasFile)
            {
                string ext = System.IO.Path.GetExtension(fileProof.FileName).ToLower();

                // Allow only images
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                {
                    string fileName = Guid.NewGuid().ToString() + ext;
                    string folderPath = Server.MapPath("~/Uploads/");

                    // Create folder if not exists
                    if (!System.IO.Directory.Exists(folderPath))
                    {
                        System.IO.Directory.CreateDirectory(folderPath);
                    }

                    string fullPath = folderPath + fileName;
                    fileProof.SaveAs(fullPath);

                    imagePath = "Uploads/" + fileName;
                }
                else
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Only JPG, JPEG, PNG allowed!";
                    return;
                }
            }

            string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO Complaints 
(UserID, Title, Description, Category, Department, Status, Date, ImagePath) 
VALUES (@UserID,@Title,@Desc,@Cat,@Dept,'Pending',GETDATE(),@Img)"; ;

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Dept", Session["Department"]);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Desc", txtDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Img", imagePath);

                con.Open();
                cmd.ExecuteNonQuery();

                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Complaint Submitted Successfully!";

                txtTitle.Text = "";
                txtDesc.Text = "";
                ddlCategory.SelectedIndex = 0;
                Response.Redirect("StudentDashboard.aspx");
            }
        }
    }
}