using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hotel_Management_System
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String UserName = "";
            if(Request.Cookies["userInfo"]!=null)
            {
                UserName = Request.Cookies["userInfo"].Values["UserName"];
            }
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename= |DataDirectory|SGUEST.mdf;Integrated Security=True";
            string strSelect = String.Format("SELECT Fname,Lname FROM SUGUEST where Username ='"+UserName+"'");
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
            SqlDataReader reader;

            //5- Open the database
            conn.Open();

            //6- Execute SQL Command

            reader = cmdSelect.ExecuteReader();
            if (reader.Read())
            {
                Label1.Text = "Welcom "+ reader[0]+" "+ reader[1];
            }
            conn.Close();
        }
    }
}