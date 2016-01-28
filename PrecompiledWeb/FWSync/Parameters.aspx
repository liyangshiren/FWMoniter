<%@ page language="C#" masterpagefile="~/master/NewFrame.master" autoeventwireup="true" inherits="Parametersplus, App_Web_um3uhlng" title="����������" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">

    <table cellspacing="0" rules="all" border="1" style="width:100%;border-collapse:collapse;text-align:center">
    <asp:Repeater ID="rpt" runat="server"  OnItemDataBound="rpt_ItemDataBound" OnItemCommand="rpt_ItemCommand">
        <HeaderTemplate>
            <tr style="width:100%">
                <th style="width:14%">��������</th>
                <th style="width:14%">������λ</th>
                <th style="width:14%">��������</th>
                <th style="width:14%">��������</th>
                <th style="width:14%">��������</th>
                <th style="width:14%">��������</th>
                <th colspan="2" style="width:16%">����</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Panel ID="plItem" runat="server">
                <tr>
                    <td><asp:Label ID="LblPName_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ParamName") %>'></asp:Label></td>
                    <td><asp:Label ID="LblPUnit_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ParamUnit") %>'></asp:Label></td>
                    <td><asp:Label ID="LblPDesc_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ParamDesc") %>' ></asp:Label></td>
                    <td><asp:Label ID="LblAMax_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmMax") %>'></asp:Label></td>
                    <td><asp:Label ID="LblAMin_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmMin") %>'></asp:Label></td>
                    <td><asp:Label ID="LblAId_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmTypeID") %>'></asp:Label></td>
                    <td><asp:Button runat="server" ID="lbtEdit" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ParamID")%>'
                         CommandName="Edit" Text="�༭"></asp:Button></td>
                    <td><asp:Button runat="server" ID="lbtDelete" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ParamID")%>'
                         CommandName="Delete" Text="ɾ��" OnClientClick="return confirm('ȷ��ɾ��ô��');"></asp:Button></td>
                </tr>
            </asp:Panel>
            <asp:Panel ID="plEdit" runat="server">
                <tr>
                    <td><asp:TextBox ID="TBPName_Edit" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "ParamName") %>'></asp:TextBox></td>
                    <td><asp:TextBox ID="TBPUnit_Edit" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "ParamUnit") %>'></asp:TextBox></td>
                    <td><asp:TextBox ID="TBPDesc_Edit" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "ParamDesc") %>'></asp:TextBox></td>
                    <td><asp:TextBox ID="TBAMax_Edit" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmMax") %>'></asp:TextBox></td>
                    <td><asp:TextBox ID="TBAMin_Edit" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmMin") %>'></asp:TextBox></td>
                    <td><asp:TextBox ID="TBAId_Edit" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "AlarmTypeID") %>'></asp:TextBox></td>
                    <td><asp:Button runat="server" ID="lbtUpdate" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ParamID")%>'
                         CommandName="Update" Text="����"></asp:Button></td>
                    <td><asp:Button runat="server" ID="lbtCancel" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ParamID")%>'
                         CommandName="Cancel" Text="ȡ��"></asp:Button></td>
                </tr>
            </asp:Panel>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
    
<%--    <tr>
        <td><asp:TextBox ID="TBPName_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" Text="*" ErrorMessage="�������Ʋ���Ϊ��" ControlToValidate="TBPName_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
        <td><asp:TextBox ID="TBPUnit_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" Text="*" ErrorMessage="������λ����Ϊ��" ControlToValidate="TBPUnit_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
        <td><asp:TextBox ID="TBPDesc_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" Text="*" ErrorMessage="������������Ϊ��" ControlToValidate="TBPDesc_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
        <td><asp:TextBox ID="TBAMax_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" Text="*" ErrorMessage="�������޲���Ϊ��" ControlToValidate="TBAMax_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="��������ӦΪ��ֵ" Type="Double" Text="*" Display="Dynamic" ControlToValidate="TBAMax_Insert" ValidationGroup="Insert"></asp:CompareValidator></td>
        <td><asp:TextBox ID="TBAMin_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" Text="*" ErrorMessage="�������޲���Ϊ��" ControlToValidate="TBAMin_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="��������ӦΪ��ֵ" Type="Double" Text="*" Display="Dynamic" ControlToValidate="TBAMin_Insert" ValidationGroup="Insert"></asp:CompareValidator></td>
        <td><asp:TextBox ID="TBAId_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" Text="*" ErrorMessage="�������Ͳ���Ϊ��" ControlToValidate="TBAId_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
        <td colspan="2"><asp:LinkButton runat="server" ID="lbInsert" Text="����" OnClick="lbInsert_Click" ValidationGroup="Insert"></asp:LinkButton></td>
    </tr>--%>
    
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
    
    
    <table cellspacing="0" style="width:100%;">
        <tr>
            <td style="width:12%"><asp:Button ID="BT_InsertVisible" runat="server" Width="100%" Text="����������" OnClick="BT_InsertVisible_Click" /></td>
            <td style="width:8%"><asp:Button ID="BT_InsertCancel" runat="server" Width="100%" Text="ȡ��" OnClick="BT_InsertCancel_Click" /></td>
            <td style="width:80%"></td>
        </tr>
    </table>
        
        
    <div>
        <table id="Table_Insert" runat="server" visible="false">
            <tr>
                <td>��������:<asp:TextBox ID="TBPName_Insert" runat="server"></asp:TextBox></td>
                <td>������λ:<asp:TextBox ID="TBPUnit_Insert" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">��������:<asp:TextBox ID="TBPDesc_Insert" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>��������:<asp:TextBox ID="TBAMax_Insert" runat="server"></asp:TextBox></td>
                <td>��������:<asp:TextBox ID="TBAMin_Insert" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">��������:<asp:TextBox ID="TBAId_Insert" runat="server"></asp:TextBox></td>
            </tr>
        
        </table>
        <table width="100%" id="Table_InsertButton" runat="server" visible="false">
            <tr>
                <td style="width:8%"><asp:Button runat="server" ID="lbInsert" Text="����" OnClick="lbInsert_Click"></asp:Button></td>
                <td style="width:92%"></td>
            </tr>
        </table>
        
    </div>
    <br />
    <asp:Label ID="LblMessage" runat="server" Font-Size="12pt" ForeColor="Red"></asp:Label>



</asp:Content>


