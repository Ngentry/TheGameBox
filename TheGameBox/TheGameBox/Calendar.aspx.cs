using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheGameBox
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName;
            int UserID = 0;

            if(Session["UserName"]!=null || Session["UserID"] != null)
            {
                UserName = (string)(Session["UserName"]);
                UserID = (int)(Session["UserID"]);
            }
            else
            {
                Response.Redirect("/LoginPage.aspx");

            }

            string startDate = Calendar1.TodaysDate.ToShortDateString();
            string endDate = Calendar1.TodaysDate.AddDays(7).ToShortDateString();
            DateStartLbl.Text = startDate;
            DateEndLbl.Text = endDate;
            

            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;
            cmd.CommandText = "Select * FROM [Calendar] WHERE (Calendar_EventDate BETWEEN '" + startDate + "' AND '" + endDate + "') AND Calendar_UserID = " + UserID + " ORDER BY Calendar_EventDate";


            db.Open();

            try
            {
                SqlDataReader sdr = cmd.ExecuteReader();

                AgendaBox.Text = "";
                while (sdr.Read())
                {
                    AgendaBox.Text += sdr["Calendar_EventName"].ToString() + "\n";
                    AgendaBox.Text += "Event Date: ";

                    DateTime dt = Convert.ToDateTime(sdr["Calendar_EventDate"].ToString());

                    AgendaBox.Text += dt.ToShortDateString() +"\n";

                    AgendaBox.Text += "Summary: ";
                    AgendaBox.Text += sdr["Calendar_EventSummary"].ToString() + "\n";
                    AgendaBox.Text += "Start: ";
                    AgendaBox.Text += sdr["Calendar_TimeStart"].ToString() + " ";
                    AgendaBox.Text += "End: ";
                    AgendaBox.Text += sdr["Calendar_TimeEnd"].ToString() + "\n";
                    AgendaBox.Text += "\n";

                }
                if (AgendaBox.Text == "")
                {
                    AgendaBox.Text = "NO EVENTS";
                }
            }
            catch
            {
                AgendaBox.Text = "An error occured displaying!";
                AgendaBox.Visible = true;
            }
            finally
            {
                db.Close();
            }
            
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            EventDateTxtBx.Text = Calendar1.SelectedDate.ToShortDateString();

        }

        protected void AddEventBtn_Click(object sender, EventArgs e)
        {
            if(EventDateTxtBx.Text == "")
            {
                EventDateTxtBx.Text = Calendar1.TodaysDate.ToShortDateString();
            }

            AddEventBtn.Enabled = false;
            RemoveEventBtn.Enabled = false;

            AddEventPanel.Visible = true;
        }

        protected void RemoveEventBtn_Click(object sender, EventArgs e)
        {
            AddEventBtn.Enabled = false;
            RemoveEventBtn.Enabled = false;

            RemoveEventPanel.Visible = true;
        }

        protected void AddEventCancel_Click(object sender, EventArgs e)
        {
            AddEventPanel.Visible = false;

            AddEventBtn.Enabled = true;
            RemoveEventBtn.Enabled = true;
        }

        protected void RemoveCancel_Click(object sender, EventArgs e)
        {
            RemoveEventPanel.Visible = false;

            AddEventBtn.Enabled = true;
            RemoveEventBtn.Enabled = true;
        }

        protected void AddEventFinalBtn_Click(object sender, EventArgs e)
        {
            string date = EventDateTxtBx.Text;
            string eventName = EventNameTxtBox.Text;
            string description = EventDescriptionTxtBox.Text;
            string startTime = TimeStartDrpList.Text;
            string endTime = TimeEndDrpList.Text;
            int UserID = 1;

            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;
            cmd.CommandText = "INSERT [Calendar] (Calendar_EventDate, Calendar_EventName, Calendar_EventSummary, Calendar_UserID, Calendar_TimeStart, Calendar_TimeEnd) VALUES('" + date + "', '" + eventName + "', '" + description + "', '"+UserID+"', '" + startTime + "', '" + endTime + "' )";

            db.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                AgendaBox.Text = "An error occured writing into database!";

            }
            finally
            {
                db.Close();
            }

            AddEventPanel.Visible = false;

            AddEventBtn.Enabled = true;
            RemoveEventBtn.Enabled = true;
            Calendar1.SelectedDayStyle.BackColor = System.Drawing.Color.Red;
            Response.Redirect("/Calendar.aspx");
        }

        protected void FinalRemoveEventBtn_Click(object sender, EventArgs e)
        {
            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;
            cmd.CommandText = "DELETE FROM [Calendar] WHERE Calendar_EventID = '" + RemoveEventDrpDwn.SelectedValue + "'";


            db.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                AgendaBox.Text = "An error occured deleting from database!";

            }
            finally
            {
                db.Close();
            }


            RemoveEventPanel.Visible = false;
            AddEventBtn.Enabled = true;
            RemoveEventBtn.Enabled = true;
            Response.Redirect("/calendar.aspx");
        }

        protected void RemoveEventDrpDwn_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;

            cmd.CommandText = "Select * FROM [Calendar] WHERE Calendar_EventID ='"+RemoveEventDrpDwn.Text+"'";


            db.Open();

            try
            {
                SqlDataReader sdr = cmd.ExecuteReader();

                RemoveInfoTxtBox.Text = "";
                while (sdr.Read())
                {
                    RemoveInfoTxtBox.Text += sdr["Calendar_EventName"].ToString() + "\n";
                    RemoveInfoTxtBox.Text += "Event Date: ";

                    DateTime dt = Convert.ToDateTime(sdr["Calendar_EventDate"].ToString());

                    RemoveInfoTxtBox.Text += dt.ToShortDateString() + "\n";

                    RemoveInfoTxtBox.Text += "Summary: ";
                    RemoveInfoTxtBox.Text += sdr["Calendar_EventSummary"].ToString() + "\n";
                    RemoveInfoTxtBox.Text += "Start: ";
                    RemoveInfoTxtBox.Text += sdr["Calendar_TimeStart"].ToString() + " ";
                    RemoveInfoTxtBox.Text += "End: ";
                    RemoveInfoTxtBox.Text += sdr["Calendar_TimeEnd"].ToString() + "\n";
                    RemoveInfoTxtBox.Text += "\n";

                }
                if (RemoveInfoTxtBox.Text == "")
                {
                    RemoveInfoTxtBox.Text = "NO EVENTS";
                }
            }
            catch
            {
                AgendaBox.Text = "An error occured displaying!";
            }
            finally
            {
                db.Close();
            }
        }
    }
}