<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GHeadPage.aspx.cs" Inherits="Hotel_Management_System.GHeadPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        .dropbtn {
            color: white;
            border: 0;
            background: none;
            font-size: 12px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            margin: 15px;
        }

        .dropdown {
            display: inline-block;
        }
        .sin {
            margin-left: 760px;
            display: inline-block;
          
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 65px;
            box-shadow: 0px 8px 9px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 7px 5px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        
        #ida {
            color: white;
            border: 0;
            background: none;
            font-size: 12px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            margin: 15px;
        }
        h1 {
            text-align: center;
            color: white;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            
        }
        .divbtn {
            float: right;
            
        }
        .divf {
            margin-inline: 555px;
            padding: 15px;
            position: relative;
            display: inline-block;
        }
        #idA {
            margin: 5px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            color: white;
        }
        #idD {
            margin: 5px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            color: white;
        }
        #idAU {
            margin: 5px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            color: white;
        }
        
        
            
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>&nbsp;
                    <div class="dropdown">
            <button class="dropbtn"><b>EN ▼</b></button>
            <div class="dropdown-content">
                <a href="#">English</a>
                <a href="#">العربيـة</a>
            </div>
        </div>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
