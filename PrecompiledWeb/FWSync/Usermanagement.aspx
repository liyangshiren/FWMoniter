<%@ page language="C#" masterpagefile="~/master/NewFrame.master" autoeventwireup="true" inherits="Usermanagement, App_Web_um3uhlng" title="用户管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">

    <script src="./JS/Calendar5.js" type="text/javascript"></script>
    <div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
        <tr>
            <td colspan="8" align="center">水质监测系统用户管理</td>
        </tr>
        <tr>
            <td style="height: 19px; width: 83px;">用户名</td>
            <td><asp:TextBox ID="userName" runat="server"></asp:TextBox></td>
             <td style="height: 19px; width: 83px;">单位名称</td>
            <td><asp:TextBox ID="companyName" runat="server"></asp:TextBox></td>
             <td style="height: 19px; width: 83px;">联系电话</td>
            <td><asp:TextBox ID="telephone" runat="server"></asp:TextBox></td>
             <td style="height: 19px; width: 83px;">审核</td>
            <td>
                <asp:DropDownList ID="selectFlag" runat="server">
                <asp:ListItem  Value=""> </asp:ListItem>
                <asp:ListItem  Value="true">是</asp:ListItem>
                <asp:ListItem Value="false">否</asp:ListItem>
                </asp:DropDownList>
           </td>
           <td style="width: 83px" align="right">
                <asp:Button ID="search" runat="server" Text="查询" OnClick="search_Click" /></td>
        
            <td align="center"><asp:Button ID="Add" runat="server" Text="添加" OnClick="Add_Click" /></td>
        </tr>       
            
    </table>
    <table align="center" width="100%">
        <asp:Repeater ID="Usermanage" runat="server" OnItemCommand="Usermanage_ItemCommand" >
        <HeaderTemplate>
            <tr>
                <th>用户名</th>
                <th>单位名称</th>
                <th>联系电话</th>
                <th>是否通过审核</th>
                <th>操作</th>
                <th>操作</th>
                <th>操作</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                    <td align="center"><asp:Label ID="LblUN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UserName") %>'></asp:Label></td>
                    <td align="center"><asp:Label ID="LblCN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CompanyName") %>'></asp:Label></td>
                    <td align="center"><asp:Label ID="LblTe" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Telephone") %>' ></asp:Label></td>
                    <td align="center"><asp:Label ID="LblIV" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IsValid") %>'></asp:Label></td>
                    <td align="center"><asp:LinkButton ID="select" CommandName="select" CommandArgument='<%# Eval("UserName") %>' runat="server">通过审核</asp:LinkButton></td>
                    <td align="center"><asp:LinkButton ID="modify" CommandName="modify" CommandArgument='<%# Eval("UserName") %>' runat="server">修改密码</asp:LinkButton></td>
                    <td align="center"><asp:LinkButton ID="edit" CommandName="edit" CommandArgument='<%# Eval("UserName") %>' runat="server">修改资料</asp:LinkButton></td>
            </tr>      
        </ItemTemplate>
        </asp:Repeater>
      </table>  
        <div style="text-align:center">
        <asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="lbtnFirstPage_Click">页首</asp:LinkButton>
        <asp:LinkButton ID="lbtnpritPage" runat="server" OnClick="lbtnpritPage_Click">上一页</asp:LinkButton>
        <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="lbtnNextPage_Click">下一页</asp:LinkButton>
        <asp:LinkButton ID="lbtnDownPage" runat="server" OnClick="lbtnDownPage_Click">页尾</asp:LinkButton>
        
    </div>
                        
    <div style="text-align:center">
        <span>第</span><asp:Label ID="labPage" runat="server" Text="Label"></asp:Label><span>页/共</span><asp:Label ID="LabCountPage" runat="server" Text="Label"></asp:Label><span>页</span>
    </div>  
        
    </div>

</asp:Content>