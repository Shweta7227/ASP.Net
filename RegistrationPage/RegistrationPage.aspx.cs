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
    public partial class RegistrationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Shweta Sindhu\source\repos\DatabaseConnectivity\DatabaseConnectivity\App_Data\Database1.mdf;Integrated Security=True; Connect Timeout=30;");

        //inerstion
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                int c = 0;
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Register (Firstname, Lastname, Phonenum, Email, Age, Userid, Pass) VALUES ('" + txtFirstName.Text + "', '" + txtLastName.Text + "', '" + txtPhone.Text + "', '" + txtEmail.Text + "', '" + txtAge.Text + "', '" + txtUserID.Text + "', '" + txtPassword.Text + "')", con);
                cmd.ExecuteNonQuery();
                 c = 1;
                if(c>0)
                {
                    Label1.Text = "Insertion done Successfully!";
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "please try again.";
                    Label1.ForeColor = System.Drawing.Color.Red;


                }
            
            }catch(Exception ex)
            {
                Label1.Text="Error occured" + ex.Message;
            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }

        }
        //deletion
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int c = 0;
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Register WHERE Userid = @UserID", con);
                cmd.Parameters.AddWithValue("@UserID", txtUserID.Text);
                cmd.ExecuteNonQuery();
                c = 1;
                if (c > 0)
                {
                    Label1.Text = "Deletion done Successfully!";
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "please try again.";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "Error occured" + ex.Message;
            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
        //select
        protected void btnSelect_Click(object sender, EventArgs e)
        {
            try
            {
                int c = 0;
                con.Open();
                SqlDataAdapter da= new SqlDataAdapter("SELECT * FROM Register WHERE Userid = '" + txtUserID.Text + "'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
               
                c = 1;
                if (c > 0)
                {
                    Label1.Text = " done Successfully!";
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "please try again.";
                    Label1.ForeColor = System.Drawing.Color.Red;


                }

            }
            catch (Exception ex)
            {
                Label1.Text = "Error occured" + ex.Message;
            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }

        }
        //updation
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int c = 0;
                con.Open();

                
                SqlCommand cmd = new SqlCommand("UPDATE Register SET Firstname = @FirstName, Lastname = @LastName, Phonenum = @Phone, Email = @Email, Age = @Age, Pass = @Pass WHERE Userid = @UserID", con);

                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@Pass", txtPassword.Text);
                cmd.Parameters.AddWithValue("@UserID", txtUserID.Text);

                
                c = cmd.ExecuteNonQuery();
               
                if (c > 0)
                {
                    Label1.Text = "Update done successfully!";
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Please try again.";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "Error occurred: " + ex.Message;
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