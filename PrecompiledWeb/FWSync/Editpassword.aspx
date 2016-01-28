<%@ page language="C#" autoeventwireup="true" inherits="Editpassword, App_Web_um3uhlng" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" align="center" >
        <tr>
            <td colspan="2" align="center" style="height: 18px">水质监测系统密码修改</td>
        </tr>
        <tr>
            <td align="center" style="width: 118px" >旧密码</td>
            <td style="width: 401px" ><asp:TextBox ID="oldpassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="oldPassword" ErrorMessage="旧密码不能为空" ValidationGroup="aa"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 118px" >密码</td>
            <td style="width: 401px" ><asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="密码不能为空" ValidationGroup="aa"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 118px; height: 26px" >确认密码</td>
             <td style="width: 401px; height: 26px" ><asp:TextBox ID="password2" runat="server" TextMode="Password"></asp:TextBox>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="password2" ErrorMessage="密码不一致"></asp:CompareValidator>
             </td>
        </tr>
        <tr>
            <td align="center" style="width: 118px; height: 30px">
                <asp:Button ID="OK" runat="server" Text="确认" ValidationGroup="aa" OnClick="submit_Click"/></td><td style="width: 401px; height: 30px" >
                <asp:Button ID="back" runat="server" Text="返回" OnClick="back_Click" />
            </td>
        </tr>
    </table>
    <table align="center">
        <tr>
            <td><asp:Label ID="mess" runat="server" align="center" Text=""></asp:Label></td>
        </tr>            
    </table>                
    </div>
    </form>
</body>
</html>
