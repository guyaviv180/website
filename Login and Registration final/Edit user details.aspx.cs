using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login_and_Registration_final
{
    public partial class edit_user_details : System.Web.UI.Page
    {
        public string username;
        public string firstName;
        public string lastName;
        public string password;
        public string birthdate;
        public string email;
        public string phone;
        public string gender;
        public string address;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionstring);
            string commandString = string.Format("SELECT * FROM [Users] WHERE username=N'{0}'", Session["user"]);
            connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(commandString, connectionstring);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            if (ds.Tables[0].Rows.Count != 1)
            {
                Response.Redirect("Login.aspx");
            }
            DataRow row = ds.Tables[0].Rows[0];
            username = row["username"].ToString();
            firstName = row["firstName"].ToString();
            lastName = row["lastName"].ToString();
            password = row["password"].ToString();
            birthdate = row["birthdate"].ToString();
            email = row["email"].ToString();
            phone = row["phone"].ToString();
            gender = row["gender"].ToString();
            address = row["address"].ToString();
            connection.Close();

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
                string address = Request.Form["address"];

                string sqlInsertData = string.Format("INSERT INTO [Users]" + "(username, password, firstName, lastName, birthdate, email, phone, gender, address)" + "VALUES (N'{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}', N'{6}', N'{7}', N'{8}')", username, password, firstName, lastName, birthdate, email, phone, gender, address);
                SqlConnection connectionObj = new SqlConnection(connectionstring);
                SqlCommand queryObj = new SqlCommand(sqlInsertData, connectionObj);
                connectionObj.Open();
                int rowsAffected = queryObj.ExecuteNonQuery();
                connectionObj.Close();

            }
            
        }

    }
}