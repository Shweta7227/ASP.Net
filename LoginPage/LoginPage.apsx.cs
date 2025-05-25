using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DatabaseConnectivity
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\USERS\SHWETA SINDHU\SOURCE\REPOS\DatabaseConnectivity\DatabaseConnectivity\App_Data\Database1.mdf;Integrated Security=True;Connect Timeout=30;");
        protected void Button1_Click(object sender, EventArgs e)
        {
            string Userid = TextBox1.Text;
            string Password = TextBox2.Text;
            
            try
            {
                string Pass;
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT  Pass FROM Detail WHERE Userid = '" + TextBox1.Text + "'", con);
                SqlDataReader sdr;
                sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    Pass = sdr[0].ToString();
                    if (Pass.Trim() == TextBox2.Text)
                    {
                        Label1.Text = "Successfully logged in!";
                        Label1.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        Label1.Text = "Invalid credentials, please try again.";
                        Label1.ForeColor = System.Drawing.Color.Red;

                    }
                }

            }
            catch (Exception ex)
            {
                Label1.Text = "An error occurred: " + ex.Message;
                Label1.ForeColor = System.Drawing.Color.Red;

            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }




        }
    }
}