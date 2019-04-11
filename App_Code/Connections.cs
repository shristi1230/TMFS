using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Connections
/// </summary>

namespace TMFS.Connection
{
    public class Connections
    {
        string connectionString = ConfigurationManager.ConnectionStrings["tmdCon"].ConnectionString;
        MySqlConnection con;
        public void OpenConnection()
        {
            con = new MySqlConnection(connectionString);
            con.Open();
        }
        public void CloseConnection()
        {
            //con = new MySqlConnection(connectionString);
            con.Close();
        }
    }
}