using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheGameBox
{
    public partial class AdminPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName;
            int UserID;
            string UserState;

            if ( ((string)Session["UserName"] != "" || (string)Session["UserID"] != "") && (string)Session["UserState"] == "Admin")
            {
                
                UserName = (string)(Session["UserName"]);
                UserID = (int)(Session["UserID"]);
                UserState = (string)Session["UserState"];
                string ImagePath = "~/Pictures/Admin/" + UserName + ".jpg";
                changeImage(ImagePath);
                Session["UserState"] = "Admin";
                Session["UserName"] = UserName;
                Session["UserID"] = UserID;
                lblWelcome.Text = string.Format("<h3>Admin Control Panel: {0}</h3>", UserName);
            }
            else
            {
                Response.Redirect("/LoginPage.aspx");
            }

            

        }

        protected void changeImage(string Path)
        {
            if(File.Exists(Server.MapPath(@Path)))
            {
                ProfileImage.Attributes["src"] = ResolveUrl(Path);
            }
            else
            {
                ProfileImage.Attributes["src"] = ResolveUrl("assets/img/gavel-small.jpg");
            }
                 
        }
    }
}