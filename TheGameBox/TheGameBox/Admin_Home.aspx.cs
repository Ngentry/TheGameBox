using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheGameBox
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName;
            int UserID;

            if (Session["UserName"] != null || Session["UserID"] != null)
            {
                UserName = (string)(Session["UserName"]);
                UserID = (int)(Session["UserID"]);

                Session["UserName"] = UserName;
            }
            else
            {
                UserName = "Fancy Pants";
                UserID = 1;
            }
            Label1.Text = string.Format("<h1>{0}, Welcome Home!</h1>", UserName);
        }
    }
}