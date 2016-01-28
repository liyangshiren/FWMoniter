<%@ page language="C#" autoeventwireup="true" inherits="Editprofile, App_Web_y57fbrjm" %>
<%--<%@ Import Namespace="FWSync.Model.UserInfo" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>水质监测系统用户资料修改</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--<%UserInfo user = (UserInfo)request.getAttribute("user");%>  --%>       
    <%-- <input type="hidden" name="id" value="<%=user.UserID%>" /> --%>
      <table border="0" cellpadding="0" cellspacing="0" width="480" align="center">
        <tr>
            <td colspan="2" align="center">水质监测系统用户资料修改</td>
        </tr>
        <tr>
            <td style="height: 19px; width: 78px;" align="center">用户名</td>
            <td><asp:TextBox ID="userName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="userName" ErrorMessage="可以注册" ValidationGroup="aa"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 42px; width: 78px;" align="center">密码</td>
            <td style="height: 42px"><asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="密码不能为空" ValidationGroup="aa"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 19px; width: 78px;" align="center">确认密码</td>
             <td><asp:TextBox ID="password2" runat="server" TextMode="Password"></asp:TextBox>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="password2" ErrorMessage="相同"></asp:RequiredFieldValidator>--%>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="password2" ErrorMessage="密码不一致"></asp:CompareValidator>
             </td>
        </tr>
        <tr>
            <td style="height: 19px; width: 78px;" align="center">联系电话</td>
            <td><asp:TextBox ID="telephone" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="aa" ControlToValidate="telephone" ValidationExpression="^[1]+[3,5,8]+\d{9}$"  ErrorMessage="号码输入错误！"></asp:RegularExpressionValidator></td>
        </tr>
        <tr> 
            <td style="height: 19px; width: 78px;" align="center">角色</td> 
            <td>
                <asp:DropDownList ID="userRole" runat="server">
                <asp:ListItem Value="0">系统管理员</asp:ListItem>
                <asp:ListItem Value="1">一般用户</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
       
        <tr>
            <td style="width: 78px" align="center">
                <asp:Button ID="submit" runat="server" Text="确定" ValidationGroup="aa" OnClick="submit_Click"  /></td>
            <td style="width: 9px" align="center">
                <asp:Button ID="back" runat="server" Text="取消" OnClick="back_Click"  />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
