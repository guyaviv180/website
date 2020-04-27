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
    public partial class Delete_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
            string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionstring);
            string commandString = string.Format("DELETE FROM [Users] WHERE username=N'{0}'" , Session["user"]);
            SqlCommand command = new SqlCommand(commandString, connection);
            connection.Open();
            int deleteLines = command.ExecuteNonQuery();
            if (deleteLines != 0)
            {
                Response.Redirect("Delete user.aspx");
            }
        }
    }
}