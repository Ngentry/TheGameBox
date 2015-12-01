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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserName"] = "";
            Session["UserID"] = "";
            Session["UserState"] = "";
            Session["CalGroupID"] = "";
            failLbl.Visible = false;
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string userName = UserNameTxtBox.Text;
            string password = PasswordTxtBox.Text;
            string UserID = "";
            //string AdminID = "";


            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;

            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandType = System.Data.CommandType.Text;
            cmd3.Connection = db;

            SqlConnection db2 = new SqlConnection(SqlDataSource2.ConnectionString);
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd2.Connection = db2;

            SqlCommand cmd4 = new SqlCommand();
            cmd4.CommandType = System.Data.CommandType.Text;
            cmd4.Connection = db2;

            if (userName == "")//makes sure that a user name is provided
            {
                failLbl.Text = "*A User Name is required!";
                failLbl.Visible = true;
            }
            else if (password == "")//makes sure that a password is provided
            {
                failLbl.Text = "*A Password is required!";
                failLbl.Visible = true;
            }
            else if(!AdminCheckBox.Checked)
            {
                cmd.CommandText = "SELECT COUNT(*) FROM [User] WHERE User_ScreenName ='" + userName + "'COLLATE SQL_Latin1_General_CP1_CS_AS AND User_Password = '" + password + "' COLLATE SQL_Latin1_General_CP1_CS_AS"; //case sensitive on password
                int count;

                try
                {
                    db.Open();
                    count = (int)cmd.ExecuteScalar(); //obtains count of number of users with that userName and password
                }
                catch
                {
                    count = -1;
                }
                finally
                {
                    db.Close();
                }

                if (count > 0)//send user to next page
                {
                    Session["UserName"] = userName;

                    db.Open();
                    cmd3.CommandText = "Select * FROM [User] WHERE User_ScreenName ='" + userName + "'COLLATE SQL_Latin1_General_CP1_CS_AS";
                    SqlDataReader sdr = cmd3.ExecuteReader();
                    while (sdr.Read())
                    {
                        UserID = sdr["User_ID"].ToString();
                    }
                    db.Close();

                    Session["UserID"] = Int32.Parse(UserID);
                    Response.Redirect("/Default.aspx");
                }
                else if (count == -1)//error with database has occured
                {
                    failLbl.Text = "*An error has occured with the user database!";
                    failLbl.Visible = true;
                }
                else//not valid credentials
                {
                    failLbl.Text = "*Invalid User Name or Password!";
                    failLbl.Visible = true;
                }
            }else
            {
                cmd2.CommandText = "SELECT COUNT(*) FROM [Admin] WHERE Admin_AdminName ='" + userName + "'COLLATE SQL_Latin1_General_CP1_CS_AS AND Admin_Password = '" + password + "' COLLATE SQL_Latin1_General_CP1_CS_AS"; //case sensitive on password
                int count;

                try
                {
                    db2.Open();
                    count = (int)cmd2.ExecuteScalar(); //obtains count of number of users with that userName and password
                }
                catch
                {
                    count = -1;
                }
                finally
                {
                    db2.Close();
                }

                if (count > 0)//send user to next page
                {
                    Session["UserName"] = userName;

                    db2.Open();
                    cmd4.CommandText = "Select * FROM [Admin] WHERE Admin_AdminName ='" + userName + "'COLLATE SQL_Latin1_General_CP1_CS_AS";
                    SqlDataReader sdr2 = cmd4.ExecuteReader();
                    while (sdr2.Read())
                    {
                        UserID = sdr2["Admin_AdminID"].ToString();
                    }
                    db2.Close();

                    Session["UserID"] = Int32.Parse(UserID);
                    Session["UserState"] = "Admin";
                    Response.Redirect("/Admin_Home.aspx");
                }
                else if (count == -1)//error with database has occured
                {
                    failLbl.Text = "*An error has occured with the Admin database!";
                    failLbl.Visible = true;
                }
                else//not valid credentials
                {
                    failLbl.Text = "*Invalid Admin Name or Password!";
                    failLbl.Visible = true;
                }
            }
        }
    }
}