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
    public partial class User_info : System.Web.UI.Page
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
            

        }
    }
}