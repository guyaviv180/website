using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Login_and_Registration_final
{
    public partial class Delete_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            string connectionstring = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionstring);
            string commandString = string.Format("DELETE FROM [Users] WHERE username=N'{0}'", Session["user"]);
            SqlCommand command = new SqlCommand(commandString, connection);
            connection.Open();
            int deleteLines = command.ExecuteNonQuery();
            connection.Close();
            if (deleteLines != 0)
            {
                Session.Abandon();
                Response.Redirect("Delete user.aspx");
            }
        }
    }
}