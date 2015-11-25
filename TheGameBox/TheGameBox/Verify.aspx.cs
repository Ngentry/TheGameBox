using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheGameBox
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorLbl.Visible = false;
        }

        protected void VerifyBtn_Click(object sender, EventArgs e)
        {
            string usrName = userNameTxtBx.Text;
            string userEmail = emailTxtBx.Text;

            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;

            if (usrName == "")
            {
                ErrorLbl.Text = "*A User Name is required!";
                ErrorLbl.Visible = true;
            }
            else if (userEmail == "")
            {
                ErrorLbl.Text = "*An Email is required!";
                ErrorLbl.Visible = true;
            }
            else
            {
                cmd.CommandText = "SELECT COUNT(*) FROM [User] WHERE User_ScreenName ='" + usrName + "'";

                int count;

                try
                {
                    db.Open();
                    count = (int)cmd.ExecuteScalar(); //obtains count of number of users with that userName
                }
                catch
                {
                    count = -1;
                }
                finally
                {
                    db.Close();
                }


                if (count > 0)
                {
                    ErrorLbl.Text = "*User Name is already taken!";
                    ErrorLbl.Visible = true;
                }
                else if (count == -1)//error with database has occured
                {
                    ErrorLbl.Text = "*An error has occured with the database!";
                    ErrorLbl.Visible = true;
                }
                else//send stuff to next page
                {
                    Session["UserName"] = userNameTxtBx.Text;
                    Session["Email"] = emailTxtBx.Text;
                    Response.Redirect("/Register.aspx");
                }

            }
        }
    }
}