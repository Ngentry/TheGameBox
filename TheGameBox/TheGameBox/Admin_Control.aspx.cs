﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheGameBox
{
    public partial class WebForm6 : System.Web.UI.Page
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
            SqlDataSource1.InsertParameters["Admin_AdminName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtUserName")).Text;
            SqlDataSource1.InsertParameters["Admin_FName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtFName")).Text;
            SqlDataSource1.InsertParameters["Admin_LName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtLName")).Text;
            SqlDataSource1.InsertParameters["Admin_Email"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtEmail")).Text;
            SqlDataSource1.InsertParameters["Admin_Password"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPassword")).Text;

            SqlDataSource1.Insert();
            SqlDataSource1.DataBind();

        }
    }
}