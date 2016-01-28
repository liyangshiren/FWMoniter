<%@ page language="C#" masterpagefile="~/master/NewFrame.master" autoeventwireup="true" inherits="Parametersplus, App_Web_um3uhlng" title="监测参数设置" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">

    <table cellspacing="0" rules="all" border="1" style="width:100%;border-collapse:collapse;text-align:center">
    <asp:Repeater ID="rpt" runat="server"  OnItemDataBound="rpt_ItemDataBound" OnItemCommand="rpt_ItemCommand">
        <HeaderTemplate>
            <tr style="width:100%">
                <th style="width:14%">参数名称</th>
                <th style="width:14%">参数单位</th>
                <th style="width:14%">参数描述</th>
                <th style="width:14%">报警上限</th>
                <th style="width:14%">报警下限</th>
                <th style="width:14%">报警类型</th>
                <th colspan="2" style="width:16%">操作</th>
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
                         CommandName="Edit" Text="编辑"></asp:Button></td>
                    <td><asp:Button runat="server" ID="lbtDelete" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ParamID")%>'
                         CommandName="Delete" Text="删除" OnClientClick="return confirm('确认删除么？');"></asp:Button></td>
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
                         CommandName="Update" Text="更新"></asp:Button></td>
                    <td><asp:Button runat="server" ID="lbtCancel" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ParamID")%>'
                         CommandName="Cancel" Text="取消"></asp:Button></td>
                </tr>
            </asp:Panel>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
    
<%--    <tr>
        <td><asp:TextBox ID="TBPName_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" Text="*" ErrorMessage="参数名称不能为空" ControlToValidate="TBPName_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
        <td><asp:TextBox ID="TBPUnit_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" Text="*" ErrorMessage="参数单位不能为空" ControlToValidate="TBPUnit_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
        <td><asp:TextBox ID="TBPDesc_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" Text="*" ErrorMessage="参数描述不能为空" ControlToValidate="TBPDesc_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
        <td><asp:TextBox ID="TBAMax_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" Text="*" ErrorMessage="报警上限不能为空" ControlToValidate="TBAMax_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="报警上限应为数值" Type="Double" Text="*" Display="Dynamic" ControlToValidate="TBAMax_Insert" ValidationGroup="Insert"></asp:CompareValidator></td>
        <td><asp:TextBox ID="TBAMin_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" Text="*" ErrorMessage="报警下限不能为空" ControlToValidate="TBAMin_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="报警下限应为数值" Type="Double" Text="*" Display="Dynamic" ControlToValidate="TBAMin_Insert" ValidationGroup="Insert"></asp:CompareValidator></td>
        <td><asp:TextBox ID="TBAId_Insert" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" Text="*" ErrorMessage="报警类型不能为空" ControlToValidate="TBAId_Insert" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
        <td colspan="2"><asp:LinkButton runat="server" ID="lbInsert" Text="插入" OnClick="lbInsert_Click" ValidationGroup="Insert"></asp:LinkButton></td>
    </tr>--%>
    
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
    
    
    <table cellspacing="0" style="width:100%;">
        <tr>
            <td style="width:12%"><asp:Button ID="BT_InsertVisible" runat="server" Width="100%" Text="插入新数据" OnClick="BT_InsertVisible_Click" /></td>
            <td style="width:8%"><asp:Button ID="BT_InsertCancel" runat="server" Width="100%" Text="取消" OnClick="BT_InsertCancel_Click" /></td>
            <td style="width:80%"></td>
        </tr>
    </table>
        
        
    <div>
        <table id="Table_Insert" runat="server" visible="false">
            <tr>
                <td>参数名称:<asp:TextBox ID="TBPName_Insert" runat="server"></asp:TextBox></td>
                <td>参数单位:<asp:TextBox ID="TBPUnit_Insert" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">参数描述:<asp:TextBox ID="TBPDesc_Insert" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>报警上限:<asp:TextBox ID="TBAMax_Insert" runat="server"></asp:TextBox></td>
                <td>报警下限:<asp:TextBox ID="TBAMin_Insert" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">报警类型:<asp:TextBox ID="TBAId_Insert" runat="server"></asp:TextBox></td>
            </tr>
        
        </table>
        <table width="100%" id="Table_InsertButton" runat="server" visible="false">
            <tr>
                <td style="width:8%"><asp:Button runat="server" ID="lbInsert" Text="插入" OnClick="lbInsert_Click"></asp:Button></td>
                <td style="width:92%"></td>
            </tr>
        </table>
        
    </div>
    <br />
    <asp:Label ID="LblMessage" runat="server" Font-Size="12pt" ForeColor="Red"></asp:Label>



</asp:Content>


