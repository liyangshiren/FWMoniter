<%@ page language="C#" masterpagefile="~/master/NewFrame.master" autoeventwireup="true" inherits="AlarmmoniterPlus, App_Web_um3uhlng" title="报警数据" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">

    <script src="./JS/Calendar5.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    var c = new Calendar("c");
    document.write(c);
    </script>



    <table width="100%">
        <tr>
            <td style="width:16%">
                监测点:<asp:DropDownList ID="MonitorDropDownList" runat="server"></asp:DropDownList>
            </td> 
            <td style="width:28%">
                开始时间:<asp:TextBox ID="TB_Timebegin" runat="server"></asp:TextBox>
            </td>
            <td style="width:28%">
                结束时间:<asp:TextBox ID="TB_Timeend" runat="server"></asp:TextBox>
            </td>
            <td style="width:20%">
                报警类型:<asp:DropDownList ID="AlarmDropDownList" runat="server"></asp:DropDownList>
            </td>
            <td style="width:8%">
                <asp:Button ID="BT_Submit" runat="server" Width="100%" Text="查询" OnClick="BT_Submit_Click" />
            </td>
        </tr>
    </table>
    
    <br />


    <table cellspacing="0"  rules="all" border="1" style="width:100%;border-collapse:collapse;text-align:center; margin:auto">
    <asp:Repeater ID="rpt" runat="server">
        <HeaderTemplate>
            <tr style="width:98%">
                <th style="width:14%">监测点名称</th>
                <th style="width:14%">报警时间</th>
                <th style="width:14%">监测参数</th>
                <th style="width:14%">报警类型</th>
                <th style="width:14%">报警上限</th>
                <th style="width:14%">报警下限</th>
                <th style="width:14%">报警量</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Panel ID="plItem" runat="server">
                <tr style="height:28px">
                    <td><asp:Label ID="LblMPN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Moniterplacename") %>'></asp:Label></td>
                    <td><asp:Label ID="LblTime" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmTime") %>'></asp:Label></td>
                    <td><asp:Label ID="LblPN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Paramname") %>' ></asp:Label></td>
                    <td><asp:Label ID="LblAT" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmTypeName") %>'></asp:Label></td>
                    <td><asp:Label ID="LblAMax" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmMax") %>'></asp:Label></td>
                    <td><asp:Label ID="LblAMin" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmMin") %>'></asp:Label></td>
                    <td><asp:Label ID="LblPV" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmValue") %>'></asp:Label></td>
                </tr>
            </asp:Panel>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
    </table>
    
    <div style="text-align:center">
        <asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="lbtnFirstPage_Click">页首</asp:LinkButton>
        <asp:LinkButton ID="lbtnpritPage" runat="server" OnClick="lbtnpritPage_Click">上一页</asp:LinkButton>
        <asp:Label ID="Label1" runat="server" Text="Label">跳转至</asp:Label>
        <asp:TextBox ID="num" runat="server" Width="25px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Label">页</asp:Label>
        <asp:LinkButton ID="JumptoPage" runat="server" OnClick="JumptoPage_Click">GO</asp:LinkButton>
        <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="lbtnNextPage_Click">下一页</asp:LinkButton>
        <asp:LinkButton ID="lbtnDownPage" runat="server" OnClick="lbtnDownPage_Click">页尾</asp:LinkButton>
        
    </div>
                        
    <div style="text-align:center">
        <span>第</span><asp:Label ID="labPage" runat="server" Text="Label"></asp:Label><span>页/共</span><asp:Label ID="LabCountPage" runat="server" Text="Label"></asp:Label><span>页</span>
    </div>
        



</asp:Content>