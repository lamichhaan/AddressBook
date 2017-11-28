using LamichhaneAngat_AddressBooks.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LamichhaneAngat_AddressBooks
{
    public partial class AddressBook : System.Web.UI.Page
    {
        AddressBookEntities dbcontext = new AddressBookEntities();

        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlCommand com;
        string str;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            str = "select * from Addresses";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.Read())
            {
                TextBox1.Text = (reader["FirstName"].ToString());
                TextBox2.Text = (reader["LastName"].ToString());
                TextBox3.Text = (reader["Email"].ToString());
                TextBox4.Text = (reader["PhoneNumber"].ToString());
                reader.Close();
                con.Close();
            }
            


        }
        private static int getID = 1;
        protected void NextButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            List<Address> addresses = dbcontext.Addresses.ToList();
            int rowCount = addresses.Count;
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            if (getID >= 1 && getID < rowCount)
            {
                getID++;
                com = new SqlCommand("SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY AddressID ASC) AS rownum,FirstName,LastName,Email,PhoneNumber FROM ADDRESSES) AS foo WHERE rownum =" + getID + "", con);
                reader = com.ExecuteReader();
                if (reader.Read())
                {
                    TextBox1.Text = (reader["FirstName"].ToString());
                    TextBox2.Text = (reader["LastName"].ToString());
                    TextBox3.Text = (reader["Email"].ToString());
                    TextBox4.Text = (reader["PhoneNumber"].ToString());
                    reader.Close();
                    con.Close();
                }
                con.Close();
                TextBox5.Visible = true;
                TextBox5.Text = "This is entry number " + getID;

            }
            else {
                getID = 1;
                TextBox5.Visible = true;
                TextBox5.Text = "This is entry number " + getID;
            }
            
        }

        protected void PreviousButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            List<Address> addresses = dbcontext.Addresses.ToList();
            int rowCount = addresses.Count;
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();

            if (getID >= 1 && getID <= rowCount+1)
            {
                getID--;
                com = new SqlCommand("SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY AddressID ASC) AS rownum,FirstName,LastName,Email,PhoneNumber FROM ADDRESSES) AS foo WHERE rownum =" + getID + "", con);
                reader = com.ExecuteReader();

                if (reader.Read())
                {
                    TextBox1.Text = (reader["FirstName"].ToString());
                    TextBox2.Text = (reader["LastName"].ToString());
                    TextBox3.Text = (reader["Email"].ToString());
                    TextBox4.Text = (reader["PhoneNumber"].ToString());
                    reader.Close();
                    con.Close();
                    TextBox5.Text = "This is entry number " + getID;
                }
                else
                {
                    getID = rowCount + 1;
                }


            }
        }

       
    
        protected void ClearButton_Click(object sender, EventArgs e)
        {
            TextBox1.Text = String.Empty;
            TextBox2.Text = String.Empty;
            TextBox3.Text = String.Empty;
            TextBox4.Text = String.Empty;
            TextBox5.Visible = false;
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            /*
            {
                Address message = new Address();
                message.FirstName = TextBox1.Text;
                message.LastName = TextBox2.Text;
                message.Email = TextBox3.Text;
                message.PhoneNumber = TextBox4.Text;

                dbcontext.Addresses.Add(message);
                dbcontext.SaveChanges();
            }
           ClearButton_Click(sender, e);
          */
            SqlConnection con = new SqlConnection(connStr);
            try
            {
                string query = "insert into Addresses(FirstName,LastName,Email,PhoneNumber) values('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + TextBox4.Text + "'); ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                con.Open();
                da.SelectCommand.ExecuteNonQuery();
                con.Close();
                TextBox5.Text = "Data saved successfully.";
            }
            catch
            {
                con.Close();
                TextBox5.Text = "Error while saving data.";
            }

        }

        protected void FindButton_Click(object sender, EventArgs e)
        {

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(connStr);

            string sqlStatement = "DELETE FROM Addresses WHERE AddressID = @AddressID";

            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                cmd.Parameters.AddWithValue("@AddressID", getID);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();

            }
            finally
            {
                connection.Close();
            }

        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void FirstButton_Click(object sender, EventArgs e)
        {
            TextBox5.Visible = true;
            TextBox5.Text = "This is entry number 1";
        }

    }
}