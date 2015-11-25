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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null || Session["Email"] == null)
            {
                Response.Redirect("/LoginPage.aspx");
            }
            else
            {
                userNameTxtBx.Text = (string)Session["UserName"];
                emailTxtBx.Text = (string)Session["Email"];
            }

            usrNameLbl.Visible = false;
            emailLbl.Visible = false;
            passwrdLbl.Visible = false;
            varPasswrdLbl.Visible = false;
            firstNameLbl.Visible = false;
            lastNameLbl.Visible = false;
            failLbl.Visible = false;
        }

        protected bool passWrdCheck(string pass, string test)
        {
            if (pass.Length < 8) //checks if length is less than 8
            {
                passwrdLbl.Text = "*Password must be at least 8 characters long!";
                passwrdLbl.Visible = true;
                return false;
            }
            else if (!Char.IsLetter(pass[0])) //checks if first char is not a letter
            {
                passwrdLbl.Text = "*Password must start with a letter!";
                passwrdLbl.Visible = true;
                return false;
            }
            else if (!pass.Any(c => char.IsDigit(c))) //checks if string does not contain a digit
            {
                passwrdLbl.Text = "*Password must contain at least one digit!";
                passwrdLbl.Visible = true;
                return false;
            }
            else if (!pass.Any(c => char.IsLower(c))) //checks if string does not contain lowercase letter
            {
                passwrdLbl.Text = "*Password must contain at least one lowercase letter!";
                passwrdLbl.Visible = true;
                return false;
            }
            else if (!pass.Any(c => char.IsUpper(c))) //checks if string does not contain uppercase letter
            {
                passwrdLbl.Text = "*Password must contain at least one uppercase letter!";
                passwrdLbl.Visible = true;
                return false;
            }
            else if (pass != test) // checks if passwords do not match
            {
                varPasswrdLbl.Text = "*Passwords Do Not Match!";
                varPasswrdLbl.Visible = true;
                return false;
            }
            else //password is valid and matches second password
            {
                return true;
            }
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            string usrName = userNameTxtBx.Text;
            string email = emailTxtBx.Text;
            string password = passwordTxtBx.Text;
            string varPassword = varifyPasswordTxtBx.Text;
            string firstName = firstNameTxtBx.Text;
            string lastName = lastNameTxtBx.Text;

            bool validated = true;
            bool passValidated = true;

            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;


            if (usrName == "") //in case this page loads first
            {
                usrNameLbl.Text = "*User Name Required!";
                usrNameLbl.Visible = true;
                validated = false;
            }
            else if (email == "") //in case this page loads first
            {
                emailLbl.Text = "*An Email is required!";
                emailLbl.Visible = true;
                validated = false;
            }
            else if (password == "")
            {
                passwrdLbl.Text = "*A Password is required!";
                passwrdLbl.Visible = true;
                validated = false;
            }
            else if (firstName == "")
            {
                firstNameLbl.Text = "*A First Name is required!";
                firstNameLbl.Visible = true;
                validated = false;
            }
            else if (lastName == "")
            {
                lastNameLbl.Text = "*A Last Name is required!";
                lastNameLbl.Visible = true;
                validated = false;
            }

            passValidated = passWrdCheck(password, varPassword);

            if (passValidated && validated)
            {
                cmd.CommandText = "INSERT INTO [User] (User_ScreenName, User_FName, User_LName, User_Email, User_Password)"
                                   + "VALUES ('" + usrName + "', '" + firstName+ "', '" + lastName + "', '" + email + "', '" + password +"')";

                bool successWrite = false; //to protect against database errors

                try
                {
                    db.Open();
                    cmd.ExecuteNonQuery();
                    successWrite = true;
                }
                catch
                {
                    failLbl.Text = "*Error occured when attempting to write to database!";
                    failLbl.Visible = true;
                }
                finally
                {
                    db.Close();
                }

                if (successWrite) //this protects the code if database fails to be written to
                {//send stuff to next page
                    Session["UserName"] = userNameTxtBx.Text;
                    Response.Redirect("/LoginPage.aspx");
                }
            }

        }
    }
}