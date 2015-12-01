﻿using System;
using System.IO;
using System.Windows;
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

            if ((string)Session["UserName"] != "" || (string)Session["UserID"] != "")
            {
                UserName = (string)(Session["UserName"]);
                UserID = (int)(Session["UserID"]);

                Session["UserName"] = UserName;
                Session["UserID"] = UserID;
            }
            else
            {
                UserName = "Fancy Pants";
                UserID = 1;
            }
            Label1.Text = "<h1>" + UserName +", Welcome Home!</h1>";
        }

        protected void btnUpdateImage_Click(object sender, EventArgs e)
        {
            string UserName = (string)(Session["UserName"]);
            string fileName = "~/Pictures/Admin/" + UserName + ".jpg";
         
         //   if(FileUploadControl.HasFile)
         //   {
        //        string filePath = Path.GetFileName(FileUploadControl.Filename);
//
          //  }
        }
    }
}