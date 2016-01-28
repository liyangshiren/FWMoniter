<%@ page language="C#" masterpagefile="~/master/NewFrame.master" autoeventwireup="true" inherits="main, App_Web_um3uhlng" title="Ö÷½çÃæ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">

    <table style="padding-left:20px;width:100%; text-align:center" >
        <tr>
    <% 
        foreach (FWSync.Model.MenuInfo mi in mis)
        {
            if (mi.ParentMenuID == 0)
            {
                %>
                <td style="vertical-align:top">
                  <table > 
                        <tr style="background-color:Blue" >
                            <td style="width:120px; height:50px;background-color:#96ACC5"><%= mi.MenuName %></td>
                        </tr>
                                    <%  
                                        System.Collections.Generic.List<FWSync.Model.MenuInfo> miis = (System.Collections.Generic.List<FWSync.Model.MenuInfo>)FWSync.Web.MenuDataProxy.GetMenusByParentMenuID(mi.MenuID);
                                        foreach (FWSync.Model.MenuInfo mii in miis)
                                        { 
                                    %>
                                            <tr>
                                                <td style="width:120px; height:50px; padding-left:5px; border: solid 1px Green" >
                                                    <a href="<%= mii.MenuURL %>"><%= mii.MenuName %></a>
                                                </td>
                                            </tr>
                                    <% 
                                        }
                                    %>

                  </table>
                </td>
                <%
            }
        }
    %>
    </tr>
    </table>

</asp:Content>

