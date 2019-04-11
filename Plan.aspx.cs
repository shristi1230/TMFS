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
    MySqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new MySqlConnection(connectionString);
        
    }
}