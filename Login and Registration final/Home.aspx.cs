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
    public partial class home : System.Web.UI.Page
    {
        public string firstName;
        public string lastName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionstring);
                string commandString = string.Format("SELECT * FROM [Users] WHERE username=N'{0}'", Session["user"]);
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(commandString, connectionstring);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count == 1)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    firstName = row["firstName"].ToString();
                    lastName = row["lastName"].ToString();
                }

                if (Request.Form["logout"] != null)
                {
                    Session["user"] = null;
                    Response.Redirect("/Logout.aspx");
                }


            }
        }
    }
}