<%@ page language="C#" masterpagefile="~/master/NewFrameOutside.master" autoeventwireup="true" inherits="Choose, App_Web_um3uhlng" title="请选择环境" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">



    <div>
        
        <table style=" margin:auto">
            <tr>
                <td>
                    
                </td>
                <td>
                    
                </td>
                <td>
                    
                </td>                
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:Button ID="btnindoor" runat="server" Text="室外" Height="360px" OnClick="btnindoor_Click" Width="360px" Font-Size="60pt" />
        <asp:Button ID="btnoutdoor" runat="server" Height="360px" Text="温室"  OnClick="btnoutdoor_Click" Width="360px" Font-Size="60pt" Font-Underline="False" />
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    
                </td>
                <td>
                    
                </td>
            </tr>
        </table>
    </div>
        
</asp:Content>


