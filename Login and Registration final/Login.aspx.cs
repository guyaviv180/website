using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Login_and_Registration_final
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string username = Request.Form["username"];
                string password = Request.Form["password"];

                if (isAdmin(username, password))
                {
                    Session["usernameData"] = username;
                    Session["passwordData"] = password;
                    Session["isAdmin"] = true;
                    Response.Redirect("/User info.aspx");
                }

                else if (isInputCorrect(username, password))
                {
                    Session["isAdmin"] = false;
                    Session["usernameData"] = username;
                    Session["passwordData"] = password;
                    Response.Redirect("/User info.aspx");
                }

                else
                {
                    Session["CsErr"] = "שגיאה 401 המשתמש לא נמצא או שסיסמא לא נכונה";
                    Response.Redirect("/Error page.aspx");
                }
            }
        }

        public bool isInputCorrect(string usern, string pass)
        {
            bool correct = false;
            string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionstring);
            string commandString = string.Format("SELECT * FROM [Users] WHERE username=N'{0}' AND password=N'{1}'", usern, pass);
            SqlCommand command = new SqlCommand(commandString, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                correct = true;
                Session["user"] = usern;
            }
            connection.Close();
            return correct;

        }

        public bool isAdmin(string username, string password)
        {
            bool isAdmin = false;
            DataSet xmlDs = new DataSet();
            xmlDs.ReadXml(System.Web.HttpContext.Current.Server.MapPath("admins.xml"));
            foreach (DataRow row in xmlDs.Tables[0].Rows)
            {
                if (username.Equals(row[0]) && password.Equals(row[1]))
                {
                    isAdmin = true;
                    Session["user"] = username;
                }
            }
            return isAdmin;
        }

    }
}

