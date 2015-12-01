using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheGameBox
{
    public partial class WebPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName;
            int UserID;

            if (((string)Session["UserName"] != "" || (string)Session["UserID"] != ""))
            {

                UserName = (string)(Session["UserName"]);
                UserID = (int)(Session["UserID"]);
                Session["UserName"] = UserName;
                Session["UserID"] = UserID;
            }
            else
            {
                Response.Redirect("/LoginPage.aspx");
            }
        }
    }
}