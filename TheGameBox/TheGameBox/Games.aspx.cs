using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace TheGameBox
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lblInsert_Click(object sender, EventArgs e)
        {
            Int32 UserID = (Int32)Session["UserID"];
            String Game_ID = ((Label)FormView1.FindControl("Label1")).Text;
            Int32 GameID = Convert.ToInt32(Game_ID);


            SqlConnection db = new SqlConnection(SqlDataSource2.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = db;
            cmd.CommandText = "INSERT INTO [Games_Owned] ([User_ID], [Game_ID]) VALUES (@User_ID, @GameID)";
            cmd.Parameters.AddWithValue("User_ID", Convert.ToString(UserID));
            cmd.Parameters.AddWithValue("GameID", Convert.ToString(GameID));
            //SqlDataSource2.SelectParameters.Add("User_ID", Convert.ToString(UserID));
            // SqlDataSource2.SelectParameters.Add("GameID", Convert.ToString(GameID));
            try
            {
                db.Open();
                cmd.ExecuteNonQuery();
                lblDB.Text = "Game Added to your Library!";
                lblDB.Visible = true;
            }
            catch (Exception ex)
            {
                lblDB.Text = "Failed to add game to your library!<br> This game may already be in your library.<br>Try Reloading the page and selecting a new game.";
                lblDB.Visible = true;
            }
            finally
            {
                db.Close();
            }
        }
    }
}