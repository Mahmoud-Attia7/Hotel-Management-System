<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server" >
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // 1- Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|SGUEST.mdf;Integrated Security=True";

        // 2- Create SQL Insert statement string


        String pas = Encryption(txtPassword.Text);
        string strInsert = String.Format("INSERT INTO SUGUEST VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}')", txtFname.Text, txtLname.Text, txtEmail.Text, txtPhone.Text, ddlCountry.SelectedValue,  pas, txtUsername.Text, rblSex.SelectedValue);
        // 3- Create SQL Command
        SqlCommand cmdInsert = new SqlCommand(strInsert, conn);


       

            


            // 4- Open the database
            conn.Open();

            // 5- Execute SQL Command
            cmdInsert.ExecuteNonQuery();

            // 6- Close the database
            conn.Close();

            // Save user profile picture
            if (fupPic.HasFile)
                fupPic.SaveAs(Server.MapPath("userPic") + "\\" + l1.Text + ".jpg");

            HttpCookie koko = new HttpCookie("userInfo");
            koko.Values.Add("usern", l1.Text);
            koko.Values.Add("passw", llll.Text);

            koko.Values.Add("Fn", txtFname.Text);
            koko.Values.Add("Ln", l.Text);
            koko.Values.Add("Em", l2.Text);

            koko.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(koko);

            lblMsg.Text = "Welcome " + txtFname.Text + ", Your Account has been Successfully Created!!";
        

        
    }

    protected void txtFname4_TextChanged(object sender, EventArgs e)
    {

    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
             border-radius:10px;
            margin-left:10px;
            height:300px;
            background-image:url("/Images/eb4eaa8cf1ab9ae553ff65e0a66d2ce5.jpeg");
            background-position: top;
            background-size: cover;
        }
        .auto-style3 {
            width: 176px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 176px;
            height: 26px;
        }
        .auto-style7 {
            height: 28px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style1 {
            width: 649%;
        }
        .auto-style10 {
            width: 176px;
            height: 38px;
        }
        .auto-style13 {
            height: 38px;
        }
        .auto-style14 {
            width: 176px;
            height: 42px;
        }
        .auto-style15 {
            height: 42px;
        }
        .asl1{
            margin-top:30px;
            margin-left:20px;
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
            <asp:Label CssClass="asl1"  ID="Label1" runat="server"  Font-Names="Monotype Corsiva" Font-Size="Large"  ForeColor="#000066" Text="To Sign Up, Fill In All the Following Fields, Then Click Submit"></asp:Label>
            <br/>
            <table  class="auto-style2">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="textFname" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="First Name:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtFname" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="212px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style5"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="l" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Last Name"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtLname" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="212px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style13">
                        &nbsp;</td>
                    <td class="auto-style13"></td>
                    <td class="auto-style13"></td>
                    <td class="auto-style13"></td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="l1" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Username"></asp:Label>
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtUsername" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="212px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">
                        &nbsp;</td>
                    <td class="auto-style15"></td>
                    <td class="auto-style15"></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="txtUsernam" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Sex:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:RadioButtonList ID="rblSex" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="l2" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Email Address:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtEmail" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="212px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="ll" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Phone Number:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtPhone" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="212px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lll" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Country:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="ddlCountry" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066">
                            <asp:ListItem Selected="True">Egypt</asp:ListItem>
                            <asp:ListItem>Sudan</asp:ListItem>
                            <asp:ListItem>France</asp:ListItem>
                            <asp:ListItem>Italy</asp:ListItem>
                            <asp:ListItem>Spain</asp:ListItem>
                            <asp:ListItem>Lebanon</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="llll" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Password:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtPassword" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="212px" OnTextChanged="txtFname4_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="llkl" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Retype Password:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtrPassword" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Width="212px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lkl" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#000066" Text="Upload Profile Pic:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:FileUpload ID="fupPic" runat="server" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="btnSubmit" runat="server" Font-Bold="True" Font-Names="Arial Black" Font-Size="Medium" ForeColor="#000066"  Text="Submit" OnClick="btnSubmit_Click" />
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="5">
                        <asp:Label ID="lblMsg" runat="server" Font-Names="Monotype Corsiva" Font-Size="XX-Large" ForeColor="#000066"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
