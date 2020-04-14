using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Login_and_Registration_final
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string firstName = Request.Form["firstName"];
                string lastName = Request.Form["lastName"];
                string username = Request.Form["username"];
                string password = Request.Form["password"];
                string birthdate = Request.Form["birthdate"];
                string email = Request.Form["email"];
                string phone = Request.Form["phone"];
                string gender = Request.Form["gender"];
                string street = Request.Form["street"];
                string houseNumber = Request.Form["houseNumber"];
                string city = Request.Form["city"];
                string address = street + " " + houseNumber + " " + city;

                if (email != "" && username != "")
                {
                    if (does_email_exist(email))
                    {
                        Session["CsErr"] = "כתובת האימייל קיימת כבר במערכת";
                        Response.Redirect("/Error page.aspx");
                    }
                    if (does_username_exist(username))
                    {
                        Session["CsErr"] = "שם המשתמש קיים כבר במערכת";
                        Response.Redirect("/Error page.aspx");
                    }
                }
                string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString; 
                string sqlInsertData = string.Format("INSERT INTO [Users]" + "(username, password, firstName, lastName, birthdate, email, phone, gender, address)" + "VALUES (N'{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}', N'{6}', N'{7}', N'{8}')", username, password, firstName, lastName, birthdate, email, phone, gender, address);
                SqlConnection connectionObj = new SqlConnection(connectionstring);
                SqlCommand queryObj = new SqlCommand(sqlInsertData, connectionObj);
                connectionObj.Open();
                int rowsAffected = queryObj.ExecuteNonQuery();
                connectionObj.Close();
                if (rowsAffected == 1)
                {
                    Response.Redirect("/login.aspx");
                }
            }
        }

        bool does_email_exist(string email)
        {
            bool exists = false;
            string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionstring);
            string commandstring = string.Format("SELECT * FROM [Users] WHERE (email = N'{0}')", email);
            SqlCommand SqlCommand = new SqlCommand(commandstring, conn);
            conn.Open();
            SqlDataReader reader = SqlCommand.ExecuteReader();
            if (reader.HasRows)
                exists = true;
            conn.Close();
            return (exists);
        }

        bool does_username_exist(string username)
        {
            bool exists = false;
            string connection = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            string commandstring = string.Format("SELECT * FROM [Users] WHERE (username = N'{0}')", username);
            SqlCommand sqlCmd = new SqlCommand(commandstring, conn);
            conn.Open();
            SqlDataReader reader = sqlCmd.ExecuteReader();

            if (reader.HasRows)
            {
                exists = true;
            }
            conn.Close();
            return (exists);
        }
    }
}