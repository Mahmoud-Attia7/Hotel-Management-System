<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="midChecking.aspx.cs" Inherits="Hotel_Management_System.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .body{
           
        }
        .table{
            border-radius:10px;
            margin-left:10px;
            height:300px;
            background-image:url("/Images/eb4eaa8cf1ab9ae553ff65e0a66d2ce5.jpeg");
            background-position: top;
            background-size: cover;
        }
        .tr{
            
        }
        .tdw{
            
            width:105px;
             margin-left:30px;
             margin-right:30px;
             border-radius:10px;
        }
        .tdm{
            margin-left:30px;
            border-radius:10px;
        }
        .lt{
            font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            font-size:17px;
           

        }
        .auto-style1 {
            height: 74px;
        }
        .h2s{
            margin-top:30px;
            margin-left:150px;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            position: relative;
            animation-name:example;
            animation-duration: 6s;
        }
        @keyframes example {
            0%   {color:goldenrod; left:0px; top:0px;}          
           
            100% {color:black; left:0px; top:0px;}
        }
        .btn{
            border-radius:10px;
        }
        
    </style>
</head>
<body class="body">
    <h2 class="h2s"><b>Searsh for your booking..</b></h2>
    <form id="form1" runat="server">
        <table class="table" border="0">
            <tr class="tr">
                <td><label class="lt" for="check in">Chick-in:</label></td>
                <td><input class="tdm" type="date" id="check_in" name="check in" placeholder="datein"/></td>
                <td><label class="lt" for="check out">Chick-out:</label></td>
                <td><input class="tdm" type="date" id="check_out" name="check out"   placeholder="dateout"/></td>
                
                <td></td>
            </tr>
            <tr>
                
                <td class="auto-style1"><label  class="lt" for="Rooms">Rooms:</label></td>
                <td class="auto-style1" ><input class="tdw" type="number" id="Rooms" name="Rooms" /></td>
                <td class="auto-style1"><label  class="lt" for="adults">Adults:</label></td>
                <td class="auto-style1" ><input class="tdw" type="number" id="adults" name="adults" /></td>
            </tr>
            <tr>
                <td><button class="btn" id="btn1" type="submit">Search</button></td>
            </tr>
        </table>
    </form>
</body>
</html>
