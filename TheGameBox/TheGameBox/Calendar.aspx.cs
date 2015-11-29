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
        protected DateTime[] listOfDates = new DateTime [500];
        protected int numberOfEvents = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName = "";
            int UserID = 0;

            if(Session["UserName"]!=null || Session["UserID"] != null)
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
            UserNamePageLbl.Text = UserName;
            string startDate = Calendar1.TodaysDate.ToShortDateString();
            string endDate = Calendar1.TodaysDate.AddDays(7).ToShortDateString();
            DateStartLbl.Text = startDate;
            DateEndLbl.Text = endDate;

            OldEventsDateLbl.Text = startDate;

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

                    AgendaBox.Text += dt.ToShortDateString() + "\n";

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



            /*Mark off dates with Events*/
            cmd.CommandText = "Select * FROM [Calendar] WHERE Calendar_UserID = " + UserID + " ORDER BY Calendar_EventDate";


            db.Open();

            try
            {
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {

                    DateTime dt2 = Convert.ToDateTime(sdr["Calendar_EventDate"].ToString());
                    listOfDates[numberOfEvents] = dt2;
                    numberOfEvents = numberOfEvents + 1;

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

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            for (int x = 0; x < numberOfEvents; x++ )
            {
                if (e.Day.Date == listOfDates[x].Date)
                {
                    e.Cell.BackColor = System.Drawing.Color.Aqua;
                }
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
            DeleteOldEventsBtn.Enabled = false;

            AddEventBtn.Visible = false;
            RemoveEventBtn.Visible = false;
            DeleteOldEventsBtn.Visible= false;

            AddEventPanel.Visible = true;
        }

        protected void RemoveEventBtn_Click(object sender, EventArgs e)
        {

            AddEventBtn.Enabled = false;
            RemoveEventBtn.Enabled = false;
            DeleteOldEventsBtn.Enabled = false;

            AddEventBtn.Visible = false;
            RemoveEventBtn.Visible = false;
            DeleteOldEventsBtn.Visible = false;

            RemoveEventPanel.Visible = true;
        }

        protected void AddEventCancel_Click(object sender, EventArgs e)
        {
            AddEventPanel.Visible = false;

            AddEventBtn.Enabled = true;
            RemoveEventBtn.Enabled = true;
            DeleteOldEventsBtn.Enabled = true;

            AddEventBtn.Visible = true;
            RemoveEventBtn.Visible = true;
            DeleteOldEventsBtn.Visible = true;
        }

        protected void RemoveCancel_Click(object sender, EventArgs e)
        {
            RemoveEventPanel.Visible = false;

            AddEventBtn.Enabled = true;
            RemoveEventBtn.Enabled = true;
            DeleteOldEventsBtn.Enabled = true;

            AddEventBtn.Visible = true;
            RemoveEventBtn.Visible = true;
            DeleteOldEventsBtn.Visible = true;
        }

        protected void AddEventFinalBtn_Click(object sender, EventArgs e)
        {
            string date = EventDateTxtBx.Text;
            string eventName = EventNameTxtBox.Text;
            string description = EventDescriptionTxtBox.Text;

            if(eventName == "")
            {
                eventName = "User Created Event";
            }

            if (description == "")
            {
                description = "No Description Provided";
            }
            string startTime = TimeStartDrpList.Text;
            string endTime = TimeEndDrpList.Text;

            int UserID = (int)(Session["UserID"]);
            bool validTime = false;

            validTime = GetValidTime(startTime,endTime);

            if (validTime == true)
            {
                SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.Connection = db;
                cmd.CommandText = "INSERT [Calendar] (Calendar_EventDate, Calendar_EventName, Calendar_EventSummary, Calendar_UserID, Calendar_TimeStart, Calendar_TimeEnd) VALUES('" + date + "', '" + eventName + "', '" + description + "', '" + UserID + "', '" + startTime + "', '" + endTime + "' )";

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
                DeleteOldEventsBtn.Enabled = true;

                AddEventBtn.Visible = true;
                RemoveEventBtn.Visible = true;
                DeleteOldEventsBtn.Visible = true;

                Response.Redirect("/Calendar.aspx");
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Time range is not valid!');</script>");
            }
        }

        protected bool GetValidTime(string startTime, string endTime)
        {
            int startValue, endValue;

            switch(startTime)
            {
                case "12:00 AM":
                    startValue = 1;
                    break;
                case "12:15 AM":
                    startValue = 2;
                    break;
                case "12: 30 AM":
                    startValue = 3;
                    break;
                case "12:45 AM":
                    startValue = 4;
                    break;
                case "1:00 AM":
                    startValue = 5;
                    break;
                case "1:15 AM":
                    startValue = 6;
                    break;
                case "1:30 AM":
                    startValue = 7;
                    break;
                case "1:45 AM":
                    startValue = 8;
                    break;
                case "2:00 AM":
                    startValue = 9;
                    break;
                case "2:15 AM":
                    startValue = 10;
                    break;
                case "2:30 AM":
                    startValue = 11;
                    break;
                case "2:45 AM":
                    startValue = 12;
                    break;
                case "3:00 AM":
                    startValue = 13;
                    break;
                case "3:15 AM":
                    startValue = 14;
                    break;
                case "3:30 AM":
                    startValue = 15;
                    break; 
                case "3:45 AM":
                    startValue = 16;
                    break;
                case "4:00 AM":
                    startValue = 17;
                    break;
                case "4:15 AM":
                    startValue = 18;
                    break;
                case "4:30 AM":
                    startValue = 19;
                    break;
                case "4:45 AM":
                    startValue = 20;
                    break;
                case "5:00 AM":
                    startValue = 21;
                    break;
                case "5:15 AM":
                    startValue = 22;
                    break;
                case "5:30 AM":
                    startValue = 23;
                    break;
                case "5:45 AM":
                    startValue = 24;
                    break;
                case "6:00 AM":
                    startValue= 26;
                    break;
                case "6:15 AM":
                    startValue = 27;
                    break;
                case "6:30 AM":
                    startValue = 28;
                    break;
                case "6:45 AM":
                    startValue = 29;
                    break;
                case "7:00 AM":
                    startValue = 30;
                    break;
                case "7:15 AM":
                    startValue = 31;
                    break;
                case "7:30 AM":
                    startValue = 32;
                    break;
                case "7:45 AM":
                    startValue = 33;
                    break;
                case "8:00 AM":
                    startValue = 34;
                    break;
                case "8:15 AM":
                    startValue = 35;
                    break;
                case "8:30 AM":
                    startValue = 36;
                    break;
                case "8:45 AM":
                    startValue = 37;
                    break;
                case "9:00 AM":
                    startValue = 38;
                    break;
                case "9:15 AM":
                    startValue = 39;
                    break;
                case "9:30 AM":
                    startValue = 40;
                    break;
                case "9:45 AM":
                    startValue = 41;
                    break;
                case "10:00 AM":
                    startValue = 42;
                    break;
                case "10:15 AM":
                    startValue = 43;
                    break;
                case "10:45 AM":
                    startValue = 44;
                    break;
                case "11:00 AM":
                    startValue = 45;
                    break;
                case "11:15 AM":
                    startValue = 46;
                    break;
                case "11:30 AM":
                    startValue = 47;
                    break;
                case "11:45 AM":
                    startValue = 48;
                    break;
                case "12:00 PM":
                    startValue = 49;
                    break;
                case "12:15 PM":
                    startValue = 50;
                    break;
                case "12:30 PM":
                    startValue = 51;
                    break;
                case "12:45 PM":
                    startValue = 52;
                    break;
                case "1:00 PM":
                    startValue = 53;
                    break;
                case "1:15 PM":
                    startValue = 54;
                    break;
                case "1:30 PM":
                    startValue = 55;
                    break;
                case "1:45 PM":
                    startValue = 56;
                    break;
                case "2:00 PM":
                    startValue = 57;
                    break;
                case "2:15 PM":
                    startValue = 58;
                    break;
                case "2:30 PM":
                    startValue = 59;
                    break;
                case "2:45 PM":
                    startValue = 60;
                    break;
                case "3:00 PM":
                    startValue = 61;
                    break;
                case "3:15 PM":
                    startValue = 62;
                    break;
                case "3:30 PM":
                    startValue = 63;
                    break;
                case "3:45 PM":
                    startValue = 64;
                    break;
                case "4:00 PM":
                    startValue = 65;
                    break;
                case "4:15 PM":
                    startValue = 66;
                    break;
                case "4:30 PM":
                    startValue = 67;
                    break;
                case "4:45 PM":
                    startValue = 68;
                    break;
                case "5:00 PM":
                    startValue = 69;
                    break;
                case "5:15 PM":
                    startValue = 70;
                    break;
                case "5:30 PM":
                    startValue = 71;
                    break;
                case "5:45 PM": 
                    startValue = 72;
                    break;
                case "6:00 PM":
                    startValue = 73;
                    break;
                case "6:15 PM":
                    startValue = 74;
                    break;
                case "6:30 PM":
                    startValue = 75;
                    break;
                case "6:45 PM":
                    startValue = 76;
                    break;
                case "7:00 PM":
                    startValue = 77;
                    break;
                case "7:15 PM":
                    startValue = 78;
                    break;
                case "7:30 PM":
                    startValue = 79;
                    break;
                case "7:45 PM":
                    startValue = 80;
                    break;
                case "8:00 PM":
                    startValue = 81;
                    break;
                case "8:15 PM":
                    startValue = 82;
                    break;
                case "8:30 PM":
                    startValue = 83;
                    break;
                case "8:45 PM":
                    startValue = 84;
                    break;
                case "9:00 PM":
                    startValue = 85;
                    break;
                case "9:15 PM":
                    startValue = 86;
                    break;
                case "9:30 PM":
                    startValue = 87;
                    break;
                case "9:45 PM":
                    startValue = 88;
                    break;
                case "10:00 PM":
                    startValue = 89;
                    break;
                case "10:15 PM":
                    startValue = 90;
                    break;
                case "10:30 PM":
                    startValue = 91;
                    break;
                case "10:45 PM":
                    startValue = 92;
                    break;
                case "11:00 PM":
                    startValue = 93;
                    break;
                case "11:15 PM": 
                    startValue = 94;
                    break;
                case "11:30 PM":
                    startValue = 95;
                    break;
                case "11:45 PM":
                    startValue = 96;
                    break;
                default:
                    startValue = 9999;
                    break;
            }

            switch (endTime)
            {
                case "12:00 AM":
                    endValue = 1;
                    break;
                case "12:15 AM":
                    endValue = 2;
                    break;
                case "12: 30 AM":
                    endValue = 3;
                    break;
                case "12:45 AM":
                    endValue = 4;
                    break;
                case "1:00 AM":
                    endValue = 5;
                    break;
                case "1:15 AM":
                    endValue = 6;
                    break;
                case "1:30 AM":
                    endValue = 7;
                    break;
                case "1:45 AM":
                    endValue = 8;
                    break;
                case "2:00 AM":
                    endValue = 9;
                    break;
                case "2:15 AM":
                    endValue = 10;
                    break;
                case "2:30 AM":
                    endValue = 11;
                    break;
                case "2:45 AM":
                    endValue = 12;
                    break;
                case "3:00 AM":
                    endValue = 13;
                    break;
                case "3:15 AM":
                    endValue = 14;
                    break;
                case "3:30 AM":
                    endValue = 15;
                    break;
                case "3:45 AM":
                    endValue = 16;
                    break;
                case "4:00 AM":
                    endValue = 17;
                    break;
                case "4:15 AM":
                    endValue = 18;
                    break;
                case "4:30 AM":
                    endValue = 19;
                    break;
                case "4:45 AM":
                    endValue = 20;
                    break;
                case "5:00 AM":
                    endValue = 21;
                    break;
                case "5:15 AM":
                    endValue = 22;
                    break;
                case "5:30 AM":
                    endValue = 23;
                    break;
                case "5:45 AM":
                    endValue = 24;
                    break;
                case "6:00 AM":
                    endValue = 26;
                    break;
                case "6:15 AM":
                    endValue = 27;
                    break;
                case "6:30 AM":
                    endValue = 28;
                    break;
                case "6:45 AM":
                    endValue = 29;
                    break;
                case "7:00 AM":
                    endValue = 30;
                    break;
                case "7:15 AM":
                    endValue = 31;
                    break;
                case "7:30 AM":
                    endValue = 32;
                    break;
                case "7:45 AM":
                    endValue = 33;
                    break;
                case "8:00 AM":
                    endValue = 34;
                    break;
                case "8:15 AM":
                    endValue = 35;
                    break;
                case "8:30 AM":
                    endValue = 36;
                    break;
                case "8:45 AM":
                    endValue = 37;
                    break;
                case "9:00 AM":
                    endValue = 38;
                    break;
                case "9:15 AM":
                    endValue = 39;
                    break;
                case "9:30 AM":
                    endValue = 40;
                    break;
                case "9:45 AM":
                    endValue = 41;
                    break;
                case "10:00 AM":
                    endValue = 42;
                    break;
                case "10:15 AM":
                    endValue = 43;
                    break;
                case "10:45 AM":
                    endValue = 44;
                    break;
                case "11:00 AM":
                    endValue = 45;
                    break;
                case "11:15 AM":
                    endValue = 46;
                    break;
                case "11:30 AM":
                    endValue = 47;
                    break;
                case "11:45 AM":
                    endValue = 48;
                    break;
                case "12:00 PM":
                    endValue = 49;
                    break;
                case "12:15 PM":
                    endValue = 50;
                    break;
                case "12:30 PM":
                    endValue = 51;
                    break;
                case "12:45 PM":
                    endValue = 52;
                    break;
                case "1:00 PM":
                    endValue = 53;
                    break;
                case "1:15 PM":
                    endValue = 54;
                    break;
                case "1:30 PM":
                    endValue = 55;
                    break;
                case "1:45 PM":
                    endValue = 56;
                    break;
                case "2:00 PM":
                    endValue = 57;
                    break;
                case "2:15 PM":
                    endValue = 58;
                    break;
                case "2:30 PM":
                    endValue = 59;
                    break;
                case "2:45 PM":
                    endValue = 60;
                    break;
                case "3:00 PM":
                    endValue = 61;
                    break;
                case "3:15 PM":
                    endValue = 62;
                    break;
                case "3:30 PM":
                    endValue = 63;
                    break;
                case "3:45 PM":
                    endValue = 64;
                    break;
                case "4:00 PM":
                    endValue = 65;
                    break;
                case "4:15 PM":
                    endValue = 66;
                    break;
                case "4:30 PM":
                    endValue = 67;
                    break;
                case "4:45 PM":
                    endValue = 68;
                    break;
                case "5:00 PM":
                    endValue = 69;
                    break;
                case "5:15 PM":
                    endValue = 70;
                    break;
                case "5:30 PM":
                    endValue = 71;
                    break;
                case "5:45 PM":
                    endValue = 72;
                    break;
                case "6:00 PM":
                    endValue = 73;
                    break;
                case "6:15 PM":
                    endValue = 74;
                    break;
                case "6:30 PM":
                    endValue = 75;
                    break;
                case "6:45 PM":
                    endValue = 76;
                    break;
                case "7:00 PM":
                    endValue = 77;
                    break;
                case "7:15 PM":
                    endValue = 78;
                    break;
                case "7:30 PM":
                    endValue = 79;
                    break;
                case "7:45 PM":
                    endValue = 80;
                    break;
                case "8:00 PM":
                    endValue = 81;
                    break;
                case "8:15 PM":
                    endValue = 82;
                    break;
                case "8:30 PM":
                    endValue = 83;
                    break;
                case "8:45 PM":
                    endValue = 84;
                    break;
                case "9:00 PM":
                    endValue = 85;
                    break;
                case "9:15 PM":
                    endValue = 86;
                    break;
                case "9:30 PM":
                    endValue = 87;
                    break;
                case "9:45 PM":
                    endValue = 88;
                    break;
                case "10:00 PM":
                    endValue = 89;
                    break;
                case "10:15 PM":
                    endValue = 90;
                    break;
                case "10:30 PM":
                    endValue = 91;
                    break;
                case "10:45 PM":
                    endValue = 92;
                    break;
                case "11:00 PM":
                    endValue = 93;
                    break;
                case "11:15 PM":
                    endValue = 94;
                    break;
                case "11:30 PM":
                    endValue = 95;
                    break;
                case "11:45 PM":
                    endValue = 96;
                    break;
                default:
                    endValue = 9999;
                    break;
            }

            if(startValue < endValue)
            {
                return true;
            }
            else
            {
                return false;
            }
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
            DeleteOldEventsBtn.Enabled = true;

            AddEventBtn.Visible = true;
            RemoveEventBtn.Visible = true;
            DeleteOldEventsBtn.Visible = true;

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

        protected void DeleteOldEventsBtn_Click(object sender, EventArgs e)
        {
            AddEventBtn.Enabled = false;
            RemoveEventBtn.Enabled = false;

            AddEventBtn.Visible = false;
            RemoveEventBtn.Visible = false;

            DeleteOldEventsPanel.Visible = true;
        }

        protected void DeleteOldEvents_Click(object sender, EventArgs e)
        {
            AddEventBtn.Enabled = false;
            RemoveEventBtn.Enabled = false;
            DeleteOldEventsBtn.Enabled = false;

            AddEventBtn.Visible = false;
            RemoveEventBtn.Visible = false;
            DeleteOldEventsBtn.Visible = false;

            DeleteOldEventsPanel.Visible = true;

        }

        protected void CancelOldEvents_Click(object sender, EventArgs e)
        {
            AddEventBtn.Enabled = true;
            RemoveEventBtn.Enabled = true;
            DeleteOldEventsBtn.Enabled = true;

            AddEventBtn.Visible = true;
            RemoveEventBtn.Visible = true;
            DeleteOldEventsBtn.Visible = true;

            DeleteOldEventsPanel.Visible = false;
        }

        protected void DeleteOldEventsFinal_Click(object sender, EventArgs e)
        {
            string todaysDate = Calendar1.TodaysDate.ToShortDateString();
            int UserID = (int)Session["UserID"];
            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;
            cmd.CommandText = "DELETE  FROM [Calendar] WHERE Calendar_UserID = '" + UserID+ "' AND Calendar_EventDate < '" + todaysDate + "'";


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


            DeleteOldEventsPanel.Visible = false;
            AddEventBtn.Enabled = true;
            RemoveEventBtn.Enabled = true;
            DeleteOldEventsBtn.Enabled = true;

            AddEventBtn.Visible = true;
            RemoveEventBtn.Visible = true;
            DeleteOldEventsBtn.Visible = true;

            Response.Redirect("/calendar.aspx");
        }

        protected void DeleteOldEventCancelBtn_Click(object sender, EventArgs e)
        {
            AddEventBtn.Enabled = true;
            RemoveEventBtn.Enabled = true;
            DeleteOldEventsBtn.Enabled = true;

            AddEventBtn.Visible = true;
            RemoveEventBtn.Visible = true;
            DeleteOldEventsBtn.Visible = true;

            DeleteOldEventsPanel.Visible = false;
        }



    }
}