﻿<%@ page language="C#" masterpagefile="~/master/IndoorMasterPage.master" autoeventwireup="true" inherits="IndoorHPool, App_Web_y57fbrjm" title="概况" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">

<asp:DataList ID="dlPools" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" OnItemDataBound="dlPools_ItemDataBound" HorizontalAlign="Center" >
        <ItemTemplate>
        <div style="background-image:url(images/pools_r4_c3.gif); width:181px;height:226px;" class="bodyfont">
            
                <asp:Literal ID="ltInTable" runat="server"></asp:Literal>
            </div>
        </ItemTemplate>
       
    </asp:DataList>


</asp:Content>
