<%@ page language="C#" masterpagefile="~/master/NewFrame.master" autoeventwireup="true" inherits="MoniterPlaceplus, App_Web_um3uhlng" title="��������" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">


    <table cellspacing="0" rules="all" border="1" style="width:100%;border-collapse:collapse;text-align:center">
    <asp:Repeater ID="rpt" runat="server"  OnItemDataBound="rpt_ItemDataBound" OnItemCommand="rpt_ItemCommand">
        <HeaderTemplate>
            <tr style="width:100%">
                <th style="width:17%">��������</th>
                <th style="width:17%">��������</th>
                <th style="width:17%">����X����</th>
                <th style="width:17%">����Y����</th>
                <th style="width:17%">�Ƿ���ʾ</th>
                <th colspan="2" style="width:15%">����</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Panel ID="plItem" runat="server">
                <tr>
                    <td><asp:Label ID="LblMPName_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceName") %>'></asp:Label></td>
                    <td><asp:Label ID="LblMPDesc_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceDesc") %>'></asp:Label></td>
                    <td><asp:Label ID="LblMPX_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceX") %>' ></asp:Label></td>
                    <td><asp:Label ID="LblMPY_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceY") %>'></asp:Label></td>
                    <td><asp:Label ID="LblMPV_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceVisible") %>'></asp:Label></td>
                    <td><asp:Button runat="server" ID="lbtEdit" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceID")%>'
                         CommandName="Edit" Text="�༭"></asp:Button></td>
                    <td><asp:Button runat="server" ID="lbtDelete" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceID")%>'
                         CommandName="Delete" Text="ɾ��" OnClientClick="return confirm('ȷ��ɾ��ô��');"></asp:Button></td>
                </tr>
            </asp:Panel>
            <asp:Panel ID="plEdit" runat="server">
                <tr>
                    <td><asp:TextBox ID="TBMPName_Edit" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceName") %>'></asp:TextBox></td>
                    <td><asp:TextBox ID="TBMPDesc_Edit" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceDesc") %>'></asp:TextBox></td>
                    <td><asp:TextBox ID="TBMPX_Edit" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceX") %>' ></asp:TextBox></td>
                    <td><asp:TextBox ID="TBMPY_Edit" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceY") %>'></asp:TextBox></td>
                    <td><asp:DropDownList ID="DDLMPV_Edit" runat="server" Width="100%"></asp:DropDownList></td>
                    <td><asp:Button runat="server" ID="lbtUpdate" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceID")%>'
                         CommandName="Update" Text="����"></asp:Button></td>
                    <td><asp:Button runat="server" ID="lbtCancel" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MoniterPlaceID")%>'
                         CommandName="Cancel" Text="ȡ��"></asp:Button></td>
                </tr>
            </asp:Panel>
        </ItemTemplate>
        <FooterTemplate>
            
        </FooterTemplate>
    </asp:Repeater>
    </table>
<%--    <tr>
        <td><asp:TextBox ID="TBMPName_Insert" runat="server"></asp:TextBox></td>
        <td><asp:TextBox ID="TBMPDesc_Insert" runat="server"></asp:TextBox></td>
        <td><asp:TextBox ID="TBMPX_Insert" runat="server"></asp:TextBox></td>
        <td><asp:TextBox ID="TBMPY_Insert" runat="server"></asp:TextBox></td>
        <td><asp:DropDownList ID="DDLMPV_Insert" runat="server">
                <asp:ListItem>--��ѡ��--</asp:ListItem>
                <asp:ListItem Value="True">��</asp:ListItem>
                <asp:ListItem Value="False">��</asp:ListItem>
            </asp:DropDownList></td>
        <td colspan="2"><asp:LinkButton runat="server" ID="lbInsert" Text="����" OnClick="lbInsert_Click"></asp:LinkButton></td>
    </tr>--%>
    
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
    
    
    <table cellspacing="0" style="width:100%;">
        <tr>
            <td style="width:12%; height: 31px;"><asp:Button ID="BT_InsertVisible" runat="server" Width="100%" Text="����������" OnClick="BT_InsertVisible_Click" /></td>
            <td style="width:8%; height: 31px;"><asp:Button ID="BT_InsertCancel" runat="server" Width="100%" Text="ȡ��" OnClick="BT_InsertCancel_Click" /></td>
            <td style="width:80%; height: 31px;"></td>
        </tr>
    </table>
    
    <div>
        <table id="Table_Insert" runat="server" visible="false">
            <tr>
                <td>��������:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TBMPName_Insert" runat="server"></asp:TextBox></td>
                <td>��������:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TBMPDesc_Insert" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>����X����:<asp:TextBox ID="TBMPX_Insert" runat="server"></asp:TextBox></td>
                <td>����Y����:<asp:TextBox ID="TBMPY_Insert" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">�Ƿ���ʾ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DDLMPV_Insert" runat="server">
                        <asp:ListItem>--��ѡ��--</asp:ListItem>
                        <asp:ListItem Value="True">��</asp:ListItem>
                        <asp:ListItem Value="False">��</asp:ListItem>
                    </asp:DropDownList>
                 </td>
             </tr>   

        </table>
    
        <table width="100%" id="Table_InsertButton" runat="server" visible="false">
            <tr>
                <td style="width:8%"><asp:Button runat="server" ID="Button1" Text="����" Width="100%" OnClick="lbInsert_Click"></asp:Button></td>
                <td style="width:92%"></td>
            </tr>
        </table>
    
    </div>
    <br />
    <asp:Label ID="LblMessage" runat="server" Font-Size="12pt" ForeColor="Red"></asp:Label>
    
   

</asp:Content>

