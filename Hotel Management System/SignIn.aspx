<%@ Page Language="C#" %>
&nbsp;
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web" %>
<!DOCTYPE html>
<script runat="server">
    protected String Encryption(String Passw)
    {
        String pass = "";
        String[] arrAlpha = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" };
        String[] arrEncrp = { "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "Q", "Z", "X", "C", "V", "B", "N", "M", "L", "K", "J", "H", "G", "F", "D", "S", "A", "a", "s", "d", "f", "g", "h", "j", "k", "l", " x", "c", "v", "b", "n", "m", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p" };

        for (int x = 0; x < Passw.Length; x++)
        {
            for (int i = 0; i < arrEncrp.Length; i++)
            {
                if (Passw[x] == arrEncrp[i][0])
                {
                    String temp = arrEncrp[i];
                    arrEncrp[i] = arrEncrp[x];
                    arrEncrp[x] = temp;
                }
            }

        }
        for (int x = 0; x < Passw.Length; x++)
        {
            for (int i = 0; i < arrAlpha.Length; i++)
            {
                if (Passw[x] == arrAlpha[i][0])
                {
                    pass += arrEncrp[i];

                }

            }
        }

        return pass;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection conn1 = new SqlConnection();
        conn1.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|SGUEST.mdf;Integrated Security=True";

        // 2- Create SQL Insert statement string

       
        String pas = Encryption(txtPassword.Text);

        string strSelect1 = String.Format("SELECT * FROM SUGUEST WHERE UserName ='" + txtUsername.Text + "'" + " AND Password ='" + pas + "'");


        // 3- Create SQL Command
        SqlCommand cmdSelect = new SqlCommand(strSelect1, conn1);

        //4-Creat SQLdata reader 
        SqlDataReader reader;

        //5- Open the database
        conn1.Open();

        //6- Execute SQL Command

        reader = cmdSelect.ExecuteReader();

        if (reader.Read())
        {
            HttpCookie cookies = new HttpCookie("userInfo");
            cookies.Values.Add("UserName", txtUsername.Text);
            cookies.Values.Add("Password", txtPassword.Text);
            cookies.Expires = DateTime.Now.AddDays(7);
            Response.Cookies.Add(cookies);
            Response.Redirect("~/GuestHome.aspx");

        }
        else {
            lblLog.Text ="Invalid User Name or Password!!";
        }

        //7- Close the database
        conn1.Close();

    }
</script>

<script>

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
       .style1 {
             border-radius:10px;
            margin-left:120px;
            margin-top:50px;
            height:300px;
            background-image:url("/Images/eb4eaa8cf1ab9ae553ff65e0a66d2ce5.jpeg");
            background-position: top;
            background-size: cover;

        }
        .style2
        {
        }
        .style3
        {
            height: 34px;
        }
        .style4
        {
            height: 34px;
        }
        .style5
        {
            width: 96px;
        }
        .style6
        {
            height: 34px;
            width: 96px;
        }
        .asl1{
            
            margin-left:40px;
            margin-bottom:50px;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            position: relative;
            animation-name:example;
            animation-duration: 6s;
            
        }
        @keyframes example {
            0%   {color:goldenrod; left:0px; top:0px;}          
           
            100% {color:black; left:0px; top:0px;}
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label CssClass="asl1" ID="lblLog" runat="server" Font-Names="Monotype Corsiva" 
            Font-Size="X-Large" ForeColor="#000066" 
            Text="Enter your Username and Password to login in:"></asp:Label>
        <br />
        <br />
        <table class="style1">
            <tr>
                <td class="style5">
                    <asp:Label ID="Label2" runat="server" Font-Names="Arial" Font-Size="Medium" 
                        ForeColor="#000066" Text="Username:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" Font-Names="Arial" 
                        Font-Size="Medium" ForeColor="#000066" Width="175px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="Medium" 
                        ForeColor="#000066" Text="Password:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Font-Names="Arial" 
                        Font-Size="Medium" ForeColor="#000066" TextMode="Password" Width="175px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                </td>
                <td class="style4">
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Button  ID="btnLogin" runat="server" Font-Names="Arial" Font-Size="Medium" 
                        ForeColor="#000066"  Text="Log In" onclick="btnLogin_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    
    </form>
</body>
</html>
