<%@ page language="C#" masterpagefile="~/master/NewFrame.master" autoeventwireup="true" inherits="AlarmmoniterPlus, App_Web_um3uhlng" title="��������" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">

    <script src="./JS/Calendar5.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    var c = new Calendar("c");
    document.write(c);
    </script>



    <table width="100%">
        <tr>
            <td style="width:16%">
                ����:<asp:DropDownList ID="MonitorDropDownList" runat="server"></asp:DropDownList>
            </td> 
            <td style="width:28%">
                ��ʼʱ��:<asp:TextBox ID="TB_Timebegin" runat="server"></asp:TextBox>
            </td>
            <td style="width:28%">
                ����ʱ��:<asp:TextBox ID="TB_Timeend" runat="server"></asp:TextBox>
            </td>
            <td style="width:20%">
                ��������:<asp:DropDownList ID="AlarmDropDownList" runat="server"></asp:DropDownList>
            </td>
            <td style="width:8%">
                <asp:Button ID="BT_Submit" runat="server" Width="100%" Text="��ѯ" OnClick="BT_Submit_Click" />
            </td>
        </tr>
    </table>
    
    <br />


    <table cellspacing="0"  rules="all" border="1" style="width:100%;border-collapse:collapse;text-align:center; margin:auto">
    <asp:Repeater ID="rpt" runat="server">
        <HeaderTemplate>
            <tr style="width:98%">
                <th style="width:14%">��������</th>
                <th style="width:14%">����ʱ��</th>
                <th style="width:14%">������</th>
                <th style="width:14%">��������</th>
                <th style="width:14%">��������</th>
                <th style="width:14%">��������</th>
                <th style="width:14%">������</th>
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
        <asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="lbtnFirstPage_Click">ҳ��</asp:LinkButton>
        <asp:LinkButton ID="lbtnpritPage" runat="server" OnClick="lbtnpritPage_Click">��һҳ</asp:LinkButton>
        <asp:Label ID="Label1" runat="server" Text="Label">��ת��</asp:Label>
        <asp:TextBox ID="num" runat="server" Width="25px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Label">ҳ</asp:Label>
        <asp:LinkButton ID="JumptoPage" runat="server" OnClick="JumptoPage_Click">GO</asp:LinkButton>
        <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="lbtnNextPage_Click">��һҳ</asp:LinkButton>
        <asp:LinkButton ID="lbtnDownPage" runat="server" OnClick="lbtnDownPage_Click">ҳβ</asp:LinkButton>
        
    </div>
                        
    <div style="text-align:center">
        <span>��</span><asp:Label ID="labPage" runat="server" Text="Label"></asp:Label><span>ҳ/��</span><asp:Label ID="LabCountPage" runat="server" Text="Label"></asp:Label><span>ҳ</span>
    </div>
        



</asp:Content>