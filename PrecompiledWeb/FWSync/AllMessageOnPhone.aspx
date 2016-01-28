<%@ page language="C#" autoeventwireup="true" inherits="AllMessageOnPhone, App_Web_um3uhlng" %>

<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>监测点详细数据</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <script type="text/javascript" src="JS/jquery.min.js"></script>
    <script type="text/javascript" src="JS/highcharts.js"></script>
    <script type="text/javascript" src="JS/exporting.js"></script>
  
    <script type="text/javascript">
   $(function () {
   var alarmMax = <%= alarm_Max %>;
   var alarmMin = <%= alarm_Min %>;
   var alarmMax2 = alarmMax + 940;
   var alarmRange = <%= AlarmRange %>;
   
   Highcharts.theme = {
	xAxis: {
		lineColor: '#000',
		lineWidth: 1,
	},
	yAxis: {

		lineColor: '#000',
		lineWidth: 1,

	}
};

// Apply the theme
var highchartsOptions = Highcharts.setOptions(Highcharts.theme);
   
       $(document).ready(function () {
           Highcharts.setOptions({
               global: {
                   useUTC: false
               }
           });
           var chart;
           chart = new Highcharts.Chart({
               chart: {
                   renderTo: 'container',
                   type: 'spline',
                   marginRight: 10,
                   
           },
           title: {
               text: '曲线图'
           },
           credits: {
            enabled: false
           },
           exporting: {
            enabled: false
           },
           xAxis: {
                        title: {
                                text: '时间'
                            },
               type: 'datetime',
               tickPixelInterval: 150, //两坐标之间的宽度
//                        //设置横轴坐标的显示样式
                        labels:{formatter:function(){   //格式化
                            var vDate = new Date(this.value);
                            return vDate.getMonth()+1+"."+vDate.getDate();
                        }}
           },
           yAxis: {
               max:alarmMax + alarmRange,
               min:alarmMin - alarmRange,
               title: {
                   text: '参数值'
               },
               plotLines: [{
                   value: 0,
                   width: 1,
                   color: '#808080'
               }],
                plotBands: [{ 
                    from: -100,
                    to: alarmMin,
                    color: 'rgba(255, 0, 0, 0.3)',
                    label: {
                        text: '预警下限',
                        style: {
                            color: '#606060'
                        }
                    }
                },{ 
                    from: alarmMax,
                    to: alarmMax2,
                    color: 'rgba(255, 0, 0, 0.3)',
                    label: {
                        text: '预警上限',
                        style: {
                            color: '#606060'
                        }
                    }
                }]
           },
           tooltip: {
               formatter: function () {
                   return '<b>' + this.series.name + '</b><br/>' +
                        Highcharts.dateFormat('%Y/%m/%d %H:%M:%S', this.x) + '<br/>' +
//                        Highcharts.dateFormat('%Y/%m/%d 10:00:00', this.x) + '<br/>' +
                        Highcharts.numberFormat(this.y, 2);
               }
           },
           legend: {
               enabled: false
           },
           exporting: {
               enabled: false
           },
           credits: {
            enabled: false
           },                              
           series: [{
               name: '参数值',
               data: (function () {
                   var data = [],
                            i;
                            var jsonData = <%= jsonstr %>;
                           var time = new Date();
                           
                   for (i = 0; i <= jsonData.j - 1; i++) {

                       data.push({
                                     x:jsonData.rows[ jsonData.j - 1 - i].time1 * 1,
                                     y:jsonData.rows[ jsonData.j - 1 - i].price * 1
                       });
                       
                   }
                   
                                    
                   return data;
               })()
           },
           
           {
               name: '预测值',
               dashStyle: 'longdash',
               data: (function () {
                   var data = [],
                            i;
                            var jsonData = <%= jsonstr %>;
                            var jsonData_2 = <%= HarfAnHourstr %>;
                            var jsonData_3 = <%= TwoHourstr %>;
                            var time = new Date();
                           
                  for (i = 0; i <= 1 ; i++) {
                        if(i == 0)
                        {
                                               data.push({
                                     x:jsonData.rows[0].time1 * 1,
                                     y:jsonData.rows[0].price * 1
                       });

                        }
                        else{
                       data.push({
                                     x:jsonData_2.rows[0].time1 * 1,
                                     y:jsonData_2.rows[0].price * 1
                       });
                       data.push({
                                     x:jsonData_3.rows[0].time1 * 1,
                                     y:jsonData_3.rows[0].price * 1
                       });
                       }
                       
                   }     
                   return data;
               })()
           }
           ]
       });
       
   });
});
   </script>



</head>
<body>

    <form id="form1" runat="server">
        <div>
            <img alt="标题" id="image_title" width="100%" src="images/title_2.jpg"/>
            <br />
        </div>
    
        <div>
 <%--           <table width="100%" cellspacing="0" cellpadding="0" class="tablestyle" id="TABLE1" onclick="return TABLE1_onclick()">
                <tr>
                    <td colspan="5" style="width:100%" align="center">
                        <asp:Label ID="LblMPName" runat="server" Text="Label" Width="100%"  ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width:24%" >测量时间</td>
                    <td colspan="4" style="width:76%"><asp:Label ID="LblTime" runat="server" Width="50%"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width:24%" rowspan="4" >
                        测量项目</td>
                    <td style="width:23%">溶解氧</td>
                    <td><asp:Label ID="Lblrongjieyang" runat="server"></asp:Label></td>
                    <td style="width:23%">浊度</td>
                    <td><asp:Label ID="Lblzhuodu" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width:23%">PH值</td>
                    <td><asp:Label ID="Lblphzhi" runat="server"></asp:Label></td>
                    <td style="width:23%">氨氮</td>
                    <td><asp:Label ID="Lblandan" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width:23%">电导率</td>
                    <td><asp:Label ID="Lbldiandaolv" runat="server"></asp:Label></td>
                    <td style="width:23%">亚硝氮</td>
                    <td><asp:Label ID="Lblyaxiaodan" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width:23%">温度</td>
                    <td><asp:Label ID="Lblwendu" runat="server"></asp:Label></td>
                    <td style="width:23%">硝氮</td>
                    <td><asp:Label ID="Lblxiaodan" runat="server"></asp:Label></td>
                </tr>
            </table>--%>
            
            <center>
            <table style="width: 98%;border-collapse:collapse;text-align:center"  border="1">
                <tr align="center">
                    <td style="width: 17%; background-color:#F0F0F0">测量时间</td>
                    <td style="width: 13.4%">项目</td>
                    <td style="width: 17.5%; background-color:#F0F0F0">测量值</td>
                    <td style="width: 16.7%">测量情况</td>
                    <%--<td style="width: 18%">标准</td>--%>
                </tr>
                <tr align="center">
                    <td rowspan="8" style="width: 17%; background-color:#F0F0F0">
                        <asp:Label ID="Label1" runat="server" Height="60px" Width="72px"></asp:Label></td>
                    <td style="width: 13.4%"><asp:Label ID="LinkButton1" runat="server" >PH</asp:Label></td>
                    <td style="width: 17.5%; background-color:#F0F0F0">
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                    <td style="width: 16.7%">
                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
                    <%--<td style="width: 18%">
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>--%>
                </tr>
                <tr align="center">
                    <td style="width: 13.4%"><asp:Label ID="LinkButton2" runat="server">温度</asp:Label></td>
                    <td style="width: 17.5%; background-color:#F0F0F0">
                        <asp:Label ID="Label5" runat="server" Text=""></asp:Label></td>
                    <td style="width: 16.7%">
                        <asp:Label ID="Label6" runat="server" Text=""></asp:Label></td>
                   <%-- <td style="width: 18%">
                        <asp:Label ID="Label7" runat="server" Text=""></asp:Label></td>--%>
                </tr>
                <tr align="center">
                    <td style="width: 13.4%"><asp:Label ID="LinkButton3" runat="server" >电导率</asp:Label></td>
                    <td style="width: 17.5%; background-color:#F0F0F0">
                        <asp:Label ID="Label8" runat="server" Text=""></asp:Label></td>
                    <td style="width: 16.7%">
                        <asp:Label ID="Label9" runat="server" Text=""></asp:Label></td>
                    <%--<td style="width: 18%">
                        <asp:Label ID="Label10" runat="server" Text=""></asp:Label></td>--%>
                </tr>
                <tr align="center">
                    <td style="width: 13.4%"><asp:Label ID="LinkButton4"  runat="server" >浊度</asp:Label></td>
                    <td style="width: 17.5%; background-color:#F0F0F0">
                        <asp:Label ID="Label11" runat="server" Text=""></asp:Label></td>
                    <td style="width: 16.7%">
                        <asp:Label ID="Label12" runat="server" Text=""></asp:Label></td>
                    <%--<td style="width: 18%">
                        <asp:Label ID="Label13" runat="server" Text=""></asp:Label></td>--%>
                </tr>
                <tr align="center">
                    <td style="width: 13.4%"><asp:Label ID="LinkButton5"  runat="server" >溶解氧</asp:Label></td>
                    <td style="width: 17.5%; background-color:#F0F0F0">
                        <asp:Label ID="Label14" runat="server" Text=""></asp:Label></td>
                    <td style="width: 16.7%">
                        <asp:Label ID="Label15" runat="server" Text=""></asp:Label></td>
                   <%-- <td style="width: 18%">
                        <asp:Label ID="Label16" runat="server" Text=""></asp:Label></td>--%>
                </tr>
                <tr align="center">
                    <td style="width: 13.4%"><asp:Label ID="LinkButton6"  runat="server" >氨氮</asp:Label></td>
                    <td style="width: 17.5%; background-color:#F0F0F0">
                        <asp:Label ID="Label17" runat="server" Text=""></asp:Label></td>
                    <td style="width: 16.7%">
                        <asp:Label ID="Label18" runat="server" Text=""></asp:Label></td>
                    <%--<td style="width: 18%">
                        <asp:Label ID="Label19" runat="server" Text=""></asp:Label></td>--%>
                </tr>
                <tr align="center">
                    <td style="width: 13.4%"><asp:Label ID="LinkButton7"  runat="server" >硝氮</asp:Label></td>
                    <td style="width: 17.5%; background-color:#F0F0F0">
                        <asp:Label ID="Label20" runat="server" Text=""></asp:Label></td>
                    <td style="width: 16.7%">
                        <asp:Label ID="Label21" runat="server" Text=""></asp:Label></td>
                    <%--<td style="width: 18%">
                        <asp:Label ID="Label22" runat="server" Text=""></asp:Label></td>--%>
                </tr>
                <tr align="center">
                    <td style="width: 13.4%"><asp:Label ID="LinkButton8"  runat="server" >亚硝氮</asp:Label></td>
                    <td style="width: 17.5%; background-color:#F0F0F0">
                        <asp:Label ID="Label23" runat="server" Text=""></asp:Label></td>
                    <td style="width: 16.7%">
                        <asp:Label ID="Label24" runat="server" Text=""></asp:Label></td>
                   <%-- <td style="width: 18%">
                        <asp:Label ID="Label25" runat="server" Text=""></asp:Label></td>--%>
                </tr>
                <tr align="center">
                    <td style="width: 17%; background-color:#F0F0F0">池塘名称</td>
                    <td colspan="3">
                        <asp:Label ID="Label26" runat="server" Width="62px"></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 17%; background-color:#F0F0F0">池塘情况</td>
                    <td colspan="3">
                        <asp:Label ID="Label27" runat="server" Width="69px"></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 17%; background-color:#F0F0F0">池塘介绍</td>
                    <td colspan="3">
                        <asp:Label ID="Label28" runat="server" Text="" Width="226px"></asp:Label></td>
                </tr>
            </table>
            </center>

            
            <br />
        </div>
        
        <div>
            <span>根据</span>
                <asp:DropDownList ID="ParamDropDownList" runat="server" AutoPostBack="True" Width="25%" OnSelectedIndexChanged="ParamDropDownList_SelectedIndexChanged1" ></asp:DropDownList><span>生成曲线</span>
        </div>
                 
        <div id="container" style="width: 100%; margin: 0 auto"></div>
        
        
        <div style="text-align:right">
            <asp:HyperLink ID="HltoForecastOnPhone" Font-Size="Large" runat="server" NavigateUrl="~/CurrentmoniterOnPhone.aspx">点此返回</asp:HyperLink>
            <br />
            <br />
        </div>
        
        
<%--        <br />
        
        <div>
            <table border="1" width="100%" cellspacing="0" cellpadding="0" class="tablestyle">
                <tr>
                    <td colspan="4">
                        <asp:Label ID="Lblparamnow" runat="server" Text="Label" Width="50%"></asp:Label>
                    </td>
                </tr>
                <asp:Repeater ID="rpt" runat="server" >
                    <HeaderTemplate>
        	                <tr>
        		                <th style="width:25%;">监测点名称</th>
        		                <th style="width:40%">监测时间</th>
        		                <th style="width:20%">参数名称</th>
        		                <th style="width:15%">参数值</th>
        	                 </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="width:25%"><asp:Label ID="Label1" runat="server" ForeColor="red" Text='<%# DataBinder.Eval(Container.DataItem, "Moniterplacename") %>'></asp:Label></td>
                            <td style="width:40%"><asp:Label ID="Label2" runat="server" ForeColor="red" Text='<%# DataBinder.Eval(Container.DataItem, "Monitertime") %>'></asp:Label></td>
                            <td style="width:20%"><asp:Label ID="Label3" runat="server" ForeColor="red" Text='<%# DataBinder.Eval(Container.DataItem, "Paramname") %>' ></asp:Label></td>
                            <td style="width:15%"><asp:Label ID="Label4" runat="server" ForeColor="red" Text='<%# DataBinder.Eval(Container.DataItem, "Paramvalue") %>'></asp:Label></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>
            </table>
        </div>
        
        
        <div>
            <table width="100%">
                <tr>
                    <td align="center"> 
                        <asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="lbtnFirstPage_Click" >页首</asp:LinkButton>
                        <asp:LinkButton ID="lbtnpritPage" runat="server" OnClick="lbtnpritPage_Click" >上一页</asp:LinkButton> 
                        <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="lbtnNextPage_Click">下一页</asp:LinkButton>
                        <asp:LinkButton ID="lbtnDownPage" runat="server" OnClick="lbtnDownPage_Click" >页尾</asp:LinkButton><br />
                        <span >第</span><asp:Label ID="labPage" runat="server" Text="Label" ></asp:Label><span >页/共</span><asp:Label ID="LabCountPage" runat="server" Text="Label"></asp:Label><span>页</span>
                     </td>
                 </tr>
             </table>
        </div>--%>
        
    </form>
</body>
</html>
