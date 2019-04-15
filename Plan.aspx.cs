using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class Plan : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["tmfsCon"].ConnectionString;
    MySqlConnection con;
    MySqlCommand cmd;
    MySqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new MySqlConnection(connectionString);
    }
    protected void calculateBtn_Click(object sender, EventArgs e)
    {
        int year = int.Parse(tenure.Text);
        int sip = int.Parse(tenure.Text);
        int risk_id = int.Parse(RiskLevel.SelectedValue);
        string query;

    }
    protected void startBtn_Click(object sender, EventArgs e)
    {
        con = new MySqlConnection(connectionString);
        con.Open();
        int year = int.Parse(tenure.Text);
        int sips = int.Parse(sip.Text);
        int risk_id = int.Parse(RiskLevel.SelectedValue);
        int year_id = 0;

        if (year >=0 || year <= 1)
        {
            year_id = 1;
        }
        else if (year > 1 || year <= 3)
        {
            year_id = 2;
        }
        else if (year > 3 || year <= 5)
        {
            year_id = 3;
        }
        else
        {
            year_id = 4;
        }


        string query = "select id from risk_plan where tenure_year_id = " + year_id + " and plan_id = " + risk_id;
        cmd = new MySqlCommand(query, con);
        int plan_id = int.Parse(cmd.ExecuteScalar().ToString());
        query = "select id from users where email = '" + Session["email"].ToString() + "'";
        cmd = new MySqlCommand(query, con);
        int uid = int.Parse(cmd.ExecuteScalar().ToString());
        query = "insert into investment(user_id, risk_plan_id, tenure, sip) values('" + uid + "','" +  plan_id + "', '" + year + "' , '" + sips + "')";
        cmd = new MySqlCommand(query, con);
        cmd.ExecuteNonQuery();
        Response.Redirect("Dashboard.aspx");
    }
}