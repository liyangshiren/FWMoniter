<%@ page language="C#" autoeventwireup="true" inherits="Adduser, App_Web_y57fbrjm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>水质监测系统添加用户</title>
</head>
<body>
    <form id="form1" runat="server" >
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 347px; height: 180px" align="center">
        <tr>
            <td colspan="2" align="center">水质监测系统添加用户</td>
        </tr>
        <tr>
            <td align="center" style="width: 68px">用户名</td>
            <td style="width: 283px"><asp:TextBox ID="userName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="userName" ErrorMessage="用户名不能为空" ValidationGroup="aa"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td align="center" style="width: 68px">单位名称</td>
            <td style="width: 283px"><asp:TextBox ID="companyName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 68px">密码</td>
            <td style="width: 283px"><asp:TextBox ID="password" runat="server" TextMode="Password" Width="148px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="密码不能为空" ValidationGroup="aa"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 68px">确认密码</td>
             <td style="width: 283px"><asp:TextBox ID="password2" runat="server" TextMode="Password" Width="149px"></asp:TextBox>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="password2" ErrorMessage="相同"></asp:RequiredFieldValidator>--%>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="password2" ErrorMessage="密码不一致"></asp:CompareValidator>
             </td>
        </tr>
        <tr>
            <td align="center" style="width: 68px">联系电话</td>
            <td style="width: 283px"><asp:TextBox ID="tel" runat="server"></asp:TextBox></td>
        </tr>
        <tr> 
            <td align="center" style="width: 68px">角色</td> 
            <td style="width: 283px">
                <asp:DropDownList ID="userRole" runat="server">
                <asp:ListItem  Value="0">系统管理员</asp:ListItem>
                <asp:ListItem Value="1">一般用户</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
       
        <tr>
            <td align="center" style="width: 68px">
                <asp:Button ID="submit" runat="server" Text="确定" ValidationGroup="aa" OnClick="submit_Click"/></td><td style="width: 283px">
                <asp:Button ID="back" runat="server" Text="取消"  OnClick="back_Click"/>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
