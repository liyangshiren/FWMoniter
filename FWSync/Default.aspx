<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>首页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    </div>
        这里是选择哪个设备，以后需要换为地图的api
        <br />
        <br />
        <asp:Button ID="btnDevice1" runat="server" Text="设备1" 
        onclick="btnDevice1_Click" />
        <asp:Button ID="btnDevice2" runat="server" Text="设备2" 
        onclick="btnDevice2_Click" />
        <br />
        <br />
        <br />
        这里需要根据列表选择哪个参数，通过repeater点击某一行然后刷新并绑定数据来实现
     
        <br />
        <asp:Repeater ID="rpt" runat="server" >
            <HeaderTemplate>
                <table>
                    <tr>
                        <td>
                            设备名称
                        </td>
                        <td>
                            设备值
                        </td>
                        <td>
                            采集时间
                        </td>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td >
                        <asp:Label ID = "lblName" runat ="server" Text='<%# DataBinder.Eval(Container.DataItem, "ParamDesc") %>'></asp:Label>

                    </td>
                    <td >
                        <asp:Label ID = "lblValue" runat ="server" Text='<%# DataBinder.Eval(Container.DataItem, "ParamValue") %>'></asp:Label>

                    </td>
                     <td >
                        <asp:Label ID = "lblTime" runat ="server" Text='<%# DataBinder.Eval(Container.DataItem, "InsertTime") %>'></asp:Label>

                    </td>
                </tr>
                

            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>
        
        
        </asp:Repeater>
        <br />
        <br />
        这里需要有图像，折线图什么的。
    </form>
</body>
</html>

