using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheGameBox
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void lblInsert_Click(object sender, EventArgs e)
        {
            string UserID =((TextBox)GridView1.FooterRow.FindControl("txtUserID")).Text;
            SqlDataSource1.InsertParameters["Group_Name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtGroupName")).Text;
            SqlDataSource1.InsertParameters["Group_Creater"].DefaultValue = UserID;
            SqlDataSource1.Insert();
            SqlDataSource1.DataBind();
        }
    }
}