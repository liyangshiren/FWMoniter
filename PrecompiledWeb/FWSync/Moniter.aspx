<%@ page language="C#" masterpagefile="~/master/NewFrame.master" autoeventwireup="true" inherits="Moniter, App_Web_um3uhlng" title="各点监测数据" %>
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
                
            <td style="width:8%">
                <asp:Button ID="BT_Submit" runat="server" Width="100%" Text="查询" OnClick="BT_Submit_Click" />
            </td>
        </tr>
    </table>
    
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="8" RepeatDirection="Horizontal" >
        </asp:CheckBoxList>
    

    <table cellspacing="0"  rules="all" border="1" style="width:100%;border-collapse:collapse;text-align:center; margin:auto">
        <tr style="width:100%">
            <th>监测时间</th>
            <th runat="server" id="th1">pH</th>
            <th runat="server" id="th2">温度</th>
            <th runat="server" id="th3">电导率</th>
            <th runat="server" id="th4">浊度</th>
            <th runat="server" id="th5">溶解氧</th>
            <th runat="server" id="th6">氨氮</th>
            <th runat="server" id="th7">硝氮</th>
            <th runat="server" id="th8">亚硝氮</th>
            <th colspan="2">操作</th>
            </tr>
    <asp:Repeater ID="rpt" runat="server"  OnItemDataBound="rpt_ItemDataBound" OnItemCommand="rpt_ItemCommand">
        <HeaderTemplate>
 
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Panel ID="plItem" runat="server">
                <tr>
                    <td><asp:LinkButton ID="LblMT_Item" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>'
                         CommandName="Search" Text='<%# DataBinder.Eval(Container.DataItem, "Monitertime") %>'></asp:LinkButton></td>
                    <td runat="server" id="pv1"><asp:Label ID="LblPV1_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue1")),2).ToString(("0.00")) %>'></asp:Label></td>
                    <td runat="server" id="pv2"><asp:Label ID="LblPV2_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue2")),1).ToString(("0.0")) %>'></asp:Label></td>
                    <td runat="server" id="pv3"><asp:Label ID="LblPV3_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue3")),0).ToString(("0")) %>'></asp:Label></td>
                    <td runat="server" id="pv4"><asp:Label ID="LblPV4_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue4")),0).ToString(("0")) %>'></asp:Label></td>
                    <td runat="server" id="pv5"><asp:Label ID="LblPV5_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue5")),2).ToString(("0.00")) %>'></asp:Label></td>
                    <td runat="server" id="pv6"><asp:Label ID="LblPV6_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue6")),2).ToString(("0.00")) %>'></asp:Label></td>
                    <td runat="server" id="pv7"><asp:Label ID="LblPV7_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue7")),2).ToString(("0.00")) %>'></asp:Label></td>
                    <td runat="server" id="pv8"><asp:Label ID="LblPV8_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue8")),2).ToString(("0.00")) %>'></asp:Label></td>
                    <td><asp:Button runat="server" ID="lbtEdit" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>'
                         CommandName="Edit" Text="编辑"></asp:Button></td>
                    <td><asp:Button runat="server" ID="lbtDelete" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>'
                         CommandName="Delete" Text="删除" OnClientClick="return confirm('确认删除么？');"></asp:Button></td>
                </tr>
            </asp:Panel>
            <asp:Panel ID="plEdit" runat="server">
                <tr>
                    <td><asp:Label ID="LblMT_Edit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Monitertime") %>'></asp:Label></td>
                    <td runat="server" id="pve1"><asp:TextBox ID="LblPV1_Edit" runat="server" Width="100%" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue1")),2).ToString(("0.00")) %>'></asp:TextBox></td>
                    <td runat="server" id="pve2"><asp:TextBox ID="LblPV2_Edit" runat="server" Width="100%" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue2")),1).ToString(("0.0")) %>'></asp:TextBox></td>
                    <td runat="server" id="pve3"><asp:TextBox ID="LblPV3_Edit" runat="server" Width="100%" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue3")),0).ToString(("0")) %>'></asp:TextBox></td>
                    <td runat="server" id="pve4"><asp:TextBox ID="LblPV4_Edit" runat="server" Width="100%" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue4")),0).ToString(("0")) %>'></asp:TextBox></td>
                    <td runat="server" id="pve5"><asp:TextBox ID="LblPV5_Edit" runat="server" Width="100%" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue5")),2).ToString(("0.00")) %>'></asp:TextBox></td>
                    <td runat="server" id="pve6"><asp:TextBox ID="LblPV6_Edit" runat="server" Width="100%" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue6")),2).ToString(("0.00")) %>'></asp:TextBox></td>
                    <td runat="server" id="pve7"><asp:TextBox ID="LblPV7_Edit" runat="server" Width="100%" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue7")),2).ToString(("0.00")) %>'></asp:TextBox></td>
                    <td runat="server" id="pve8"><asp:TextBox ID="LblPV8_Edit" runat="server" Width="100%" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue8")),2).ToString(("0.00")) %>'></asp:TextBox></td>
                    
                    <td><asp:Button runat="server" ID="lbtUpdate" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>'
                         CommandName="Update" Text="更新" ></asp:Button></td>
                    <td><asp:Button runat="server" ID="lbtCancel" Width="100%" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>'
                         CommandName="Cancel" Text="取消"></asp:Button></td>
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
        <asp:LinkButton ID="JumptoPage" runat="server" OnClick="lbJumptoPage_Click">GO</asp:LinkButton>
        <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="lbtnNextPage_Click">下一页</asp:LinkButton>
        <asp:LinkButton ID="lbtnDownPage" runat="server" OnClick="lbtnDownPage_Click">页尾</asp:LinkButton>
        
    </div>
                        
    <div style="text-align:center">
        <span>第</span><asp:Label ID="labPage" runat="server" Text="Label"></asp:Label><span>页/共</span><asp:Label ID="LabCountPage" runat="server" Text="Label"></asp:Label><span>页</span>
    </div>
    
    <div>
        <asp:Label ID="LblMessage" runat="server" Font-Size="12pt" ForeColor="Red"></asp:Label>
    </div>
    
    
    
    
    
        <table cellspacing="0"   rules="all" border="1" style="width:100%;border-collapse:collapse;text-align:center; margin:auto">
        <tr style="width:100%">
            <th>监测时间</th>
            <th runat="server" id="th9">pH</th>
            <th runat="server" id="th10">温度</th>
            <th runat="server" id="th11">电导率</th>
            <th runat="server" id="th12">浊度</th>
            <th runat="server" id="th13">溶解氧</th>
            <th runat="server" id="th14">氨氮</th>
            <th runat="server" id="th15">硝氮</th>
            <th runat="server" id="th16">亚硝氮</th>
            </tr>
    <asp:Repeater ID="omrpt" runat="server" OnItemDataBound="omrpt_ItemDataBound">
        <HeaderTemplate>
 
        </HeaderTemplate>
        <ItemTemplate>
                <tr>
                    <td><asp:Label ID="OMLblMT_Item" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MoniterTime") %>'></asp:Label></td>
                    <td runat="server" id="pv9"><asp:Label ID="OMLblPV1_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue1")),2).ToString(("0.00")) %>'></asp:Label></td>
                    <td runat="server" id="pv10"><asp:Label ID="OMLblPV2_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue2")),1).ToString(("0.0")) %>'></asp:Label></td>
                    <td runat="server" id="pv11"><asp:Label ID="OMLblPV3_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue3")),0).ToString(("0")) %>'></asp:Label></td>
                    <td runat="server" id="pv12"><asp:Label ID="OMLblPV4_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue4")),0).ToString(("0")) %>'></asp:Label></td>
                    <td runat="server" id="pv13"><asp:Label ID="OMLblPV5_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue5")),2).ToString(("0.00")) %>'></asp:Label></td>
                    <td runat="server" id="pv14"><asp:Label ID="OMLblPV6_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue6")),2).ToString(("0.00")) %>'></asp:Label></td>
                    <td runat="server" id="pv15"><asp:Label ID="OMLblPV7_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue7")),2).ToString(("0.00")) %>'></asp:Label></td>
                    <td runat="server" id="pv16"><asp:Label ID="OMLblPV8_Item" runat="server" Text='<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "Paramvalue8")),2).ToString(("0.00")) %>'></asp:Label></td>

                </tr>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
    </table>
    
   
    <div style="text-align:center">
        <asp:LinkButton ID="OMlbtnFirstPage" runat="server" OnClick="OMlbtnFirstPage_Click">页首</asp:LinkButton>
        <asp:LinkButton ID="OMlbtnpritPage" runat="server" OnClick="OMlbtnpritPage_Click">上一页</asp:LinkButton>
                <asp:Label ID="Label3" runat="server" Text="Label">跳转至</asp:Label>
        <asp:TextBox ID="num2" runat="server" Width="25px"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="Label">页</asp:Label>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="OMlbtnJumptoPage_Click">GO</asp:LinkButton>
        <asp:LinkButton ID="OMlbtnNextPage" runat="server" OnClick="OMlbtnNextPage_Click">下一页</asp:LinkButton>
        <asp:LinkButton ID="OMlbtnDownPage" runat="server" OnClick="OMlbtnDownPage_Click">页尾</asp:LinkButton>
        
    </div>
                        
    <div style="text-align:center">
        <span>第</span><asp:Label ID="OMlabPage" runat="server" Text="?"></asp:Label><span>页/共</span><asp:Label ID="OMLabCountPage" runat="server" Text="1"></asp:Label><span>页</span>
    </div>
    
    <div>
        <asp:Label ID="OMLblMessage" runat="server" Font-Size="12pt" ForeColor="Red"></asp:Label>
    </div>
    
    
        
</asp:Content>

