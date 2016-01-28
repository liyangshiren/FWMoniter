<%@ page language="C#" autoeventwireup="true" inherits="register, App_Web_um3uhlng" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>水质预测预警系统</title>
<%--<script language="javascript" type="text/javascript"> 
    function ClientValidate(source,args)
    {
        if(args.)
    }
</script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1 align="center">水质预测预警系统-注册页面</h1>
       <table align="center" >
            <tr>
            <td>
                <asp:Label ID="USERnameaa" runat="server" Text="用户名"></asp:Label></td>
            <td>
                <asp:TextBox ID="userName" runat="server" AutoPostBack="True" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="userName" ErrorMessage="用户名不能为空" SetFocusOnError="true"></asp:RequiredFieldValidator>&nbsp;<asp:Label ID="Label6" runat="server"></asp:Label>
                <asp:CustomValidator ID="cvUserName" ControlToValidate="userName" runat="server" ErrorMessage="用户名存在！" OnServerValidate="cvUserName_ServerValidate"  Display="Dynamic"></asp:CustomValidator>
                </td>
            </tr>
             <tr>
            <td>
                <asp:Label ID="PASSworddd" runat="server" Text="密码"></asp:Label></td>
            <td>
                <asp:TextBox ID="password" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="密码不能为空" ValidationGroup="aa"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="确认密码"></asp:Label></td>
            <td>
                <asp:TextBox ID="password2" runat="server" TextMode="Password" Width="149px"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="password2" ErrorMessage="密码不一致"></asp:CompareValidator></td>
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="password2" ErrorMessage="密码不一致"></asp:RequiredFieldValidator>--%>
            </tr>            
             <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="单位名称"></asp:Label></td>
            <td>
                <asp:TextBox ID="companyName" runat="server"></asp:TextBox></td>
            </tr> 
            <tr>
            <td style="height: 18px">
                <asp:Label ID="Label5" runat="server" Text="联系电话"></asp:Label></td>
            <td style="height: 18px">
                <asp:TextBox ID="tel" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="aa" ControlToValidate="tel" ValidationExpression="^[1]+[3,5,8]+\d{9}$"  ErrorMessage="号码输入错误！"></asp:RegularExpressionValidator></td>
            </tr> 
            <tr>
            <td align="center">
                <asp:Button ID="submit" runat="server" Text="提交" ValidationGroup="aa" OnClick="submit_Click" /></td>
            <td align="center">
                <asp:Button ID="reset" runat="server" Text="重置" OnClick="reset_Click" /></td>
            </tr>            
       </table>
        &nbsp;&nbsp;
    </div>
    </form>
</body>
</html>
