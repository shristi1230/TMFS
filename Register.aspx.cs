using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
//using TMFS.Connection;

public partial class Register : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["tmfsCon"].ConnectionString;
    MySqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new MySqlConnection(connectionString);
    }

    private bool register(string email, string first_name, string last_name, int age, string pan_no, string phone_no, string password)
    {
        con.Open();
        string query = "insert into users(email,password,first_name,last_name,age,pan_no,phone_no,is_admin) values('" + email + "',md5('" + password + "'),'" + first_name + "','" + last_name + "'," + age + ",'" + pan_no + "'," + phone_no + ",0)";
        MySqlCommand cmd = new MySqlCommand(query, con);
        if (cmd.ExecuteNonQuery() > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void registerButton_Click(object sender, EventArgs e)
    {
        string Email = email.Text;
        string First_name = first_name.Text;
        string Last_name = last_name.Text;
        int Age = int.Parse(age.Text);
        string Pan_no = pan_no.Text;
        string Phone = phone_no.Text;
        string Password = password.Text;

        if (register(Email, First_name, Last_name, Age, Pan_no, Phone, Password))
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Label1.Text = "error";
        }
    }
}