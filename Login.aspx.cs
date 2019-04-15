using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["tmfsCon"].ConnectionString;
    MySqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userLoggedIn"] != null)
        {
            Response.Redirect("Default.aspx");
        }

        con = new MySqlConnection(connectionString);
    }
    protected void loginButton_Click(object sender, EventArgs e)
    {
        string Email = email.Text;
        string Password = password.Text;
        if (login(Email, Password))
        {
            Session["userLoggedIn"] = getName(Email);
            Session["email"] = Email;
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            Label1.Text = "Invalid Credentials";
        }
    }

    private bool login(string email, string password)
    {
        con.Open();
        string query = "select count(*) from users where email = '" + email +"' and password = md5('" + password +"')";
        MySqlCommand cmd = new MySqlCommand(query, con);
        var count = cmd.ExecuteScalar();
        if (int.Parse(count.ToString()) == 1)
        {
            con.Close();
            return true;
        }
        else
        {
            con.Close();
            return false;
        }
    }

    private string getName(string email)
    {
        con.Open();
        string query = "select first_name, last_name from users where email = '" + email +"';";
        MySqlCommand cmd = new MySqlCommand(query, con);
        MySqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            if (dr.Read())
            {
                return dr["first_name"].ToString() + " " + dr["last_name"].ToString();
            }
        }
        return "Not Found";
    }
}