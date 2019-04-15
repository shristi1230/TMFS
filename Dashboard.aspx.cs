using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class Dashboard : System.Web.UI.Page
{
    MySqlConnection con;
    MySqlCommand cmd;
    MySqlDataReader dr;
    int inventID = 0;
    int months = 0;
    string connectionString = ConfigurationManager.ConnectionStrings["tmfsCon"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new MySqlConnection(connectionString);
        if (Session["userLoggedIn"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        string query = "select id from users where email = '" + Session["email"].ToString() + "'";
        // Response.Write(query);
        con.Open();
        cmd = new MySqlCommand(query, con);
        int uid = int.Parse(cmd.ExecuteScalar().ToString());
        query = "select * from investment where user_id = " + uid;
        cmd = new MySqlCommand(query, con);
        int risk_plan_id = 0;
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                inventID = int.Parse(dr["id"].ToString());
                tenure.Text = dr["tenure"].ToString();
                amt.Text = dr["sip"].ToString();
                sip.Text = dr["sip"].ToString();
                risk_plan_id = int.Parse(dr["risk_plan_id"].ToString());
            }
        }
        dr.Close();
        query = "select type from plans where id = (select plan_id from risk_plan where id = (select id from investment where risk_plan_id = " + risk_plan_id + "))";
        cmd = new MySqlCommand(query, con);
                
        MySqlDataReader dr1 = cmd.ExecuteReader();
        if (dr1.HasRows)
        {
            while (dr1.Read())
            {
                risk_level.Text = dr1["type"].ToString();
                risk.Text = dr1["type"].ToString();
            }
        }
        dr1.Close();
        query = "select count(*) from roi where investment_id = " + inventID;
        cmd = new MySqlCommand(query, con);
        months = int.Parse(cmd.ExecuteScalar().ToString()) + 1;
        month.Text = months.ToString();

    }
    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session["userLoggedIn"] = null;
        Response.Redirect("Default.aspx");
    }
    protected void investButton_Click(object sender, EventArgs e)
    {
        int amount = int.Parse(sip.Text);
        con.Open();
        double returns = (amount * months) + (amount * months * 5.6);
        string query = "insert into roi(investment_id, month, returns) values(" + inventID + ", " + months + ", " + returns + ")";
        cmd = new MySqlCommand(query, con);
        cmd.ExecuteNonQuery();
        Response.Redirect("Dashboard.aspx");
        con.Close();
    }
}