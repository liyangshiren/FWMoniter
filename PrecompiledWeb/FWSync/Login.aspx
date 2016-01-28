<%@ page language="C#" autoeventwireup="true" inherits="Login, App_Web_um3uhlng" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>水质预测预警系统</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" align="center">
             <tr>
            <td colspan="2" align="center"><h1>水质监测系统登陆</h1></td>
        </tr>
        <tr>
            <td style="width: 83px" align="center">用户名</td>
            <td style="width: 250px"><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 19px; width: 83px;" align="center">密码</td>
            <td style="width: 250px"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="149px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 19px; width: 83px;" align="center">校验码</td>
             <td style="width: 250px"><asp:TextBox ID="txtCheckCode" runat="server" Width="112px"></asp:TextBox><img src="CheckImage.aspx" alt="校验码" />
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCheckCode" ErrorMessage="校验码必填"></asp:RequiredFieldValidator>--%>
             </td>
        </tr>
        <tr>
            <td style="width: 83px" align="center">
                <asp:Button ID="btnLogin" runat="server" Text="登陆" OnClick="btnLogin_Click" /></td>
            <td style="width: 250px" align="center">  
                <asp:Button ID="Button1" runat="server" Text="清除" OnClick="Button1_Click" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="display" runat="server"></asp:Label></td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>
