﻿<%@ page language="C#" masterpagefile="~/master/IndoorMasterPage.master" autoeventwireup="true" inherits="_Default, App_Web_y57fbrjm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">
 
 
  <script src="js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="./js/dist/echarts.js"></script>
    





<table style="margin:0 auto;width:1180px;height:500px;text-align:center">
    <tr>
    
    
        <td rowspan="6" style="width: 50%"><asp:ImageMap ID="Mpp" runat="server" Height="675px" Width="675px" ImageUrl="~/images/室内水池-01.png" OnClick="Mpp_Click" > 
	</asp:ImageMap></td>
        <td style="width: 50%; height: 63px;" align="center"> 
            <table style="width: 388px; height: 291px;border-collapse:collapse;text-align:center" border="1">
                <tr align="center">
                    <td style="width: 66px; background-color:#F0F0F0">测量时间</td>
                    <td style="width: 52px">项目</td>
                    <td style="width: 68px; background-color:#F0F0F0">测量值</td>
                    <td style="width: 65px">测量情况</td>
                    <td style="width: 70px">标准</td>
                </tr>
                <tr align="center">
                    <td rowspan="8" style="width: 66px; background-color:#F0F0F0">
                        <asp:Label ID="Label1" runat="server" Height="60px" Width="72px"></asp:Label></td>
                    <td style="width: 52px"><asp:LinkButton ID="LinkButton1" CommandName="lph" runat="server" OnClick="LinkButton1_Click">pH</asp:LinkButton></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 52px"><asp:LinkButton ID="LinkButton2" CommandName="ltemp" runat="server" OnClick="LinkButton2_Click">温度</asp:LinkButton></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label5" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label6" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label7" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 52px"><%--<asp:LinkButton ID="LinkButton3" CommandName="lcon" runat="server" OnClick="LinkButton3_Click">电导率</asp:LinkButton>--%>
                        <asp:Label ID="lblvalue3" runat="server" Text="电导率"></asp:Label></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label8" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label9" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label10" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 52px"><%--<asp:LinkButton ID="LinkButton4" CommandName="ltur" runat="server" OnClick="LinkButton4_Click">浊度</asp:LinkButton>--%>
                        <asp:Label ID="lblvalue4" runat="server" Text="浊度"></asp:Label></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label11" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label12" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label13" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 52px"><asp:LinkButton ID="LinkButton5" CommandName="ldo" runat="server" OnClick="LinkButton5_Click">溶解氧</asp:LinkButton></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label14" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label15" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label16" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 52px"><%--<asp:LinkButton ID="LinkButton6" CommandName="lamm" runat="server" OnClick="LinkButton6_Click">氨氮</asp:LinkButton>--%>
                        <asp:Label ID="lblvalue6" runat="server" Text="氨氮"></asp:Label></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label17" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label18" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label19" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 52px"><%--<asp:LinkButton ID="LinkButton7" CommandName="lsal" runat="server" OnClick="LinkButton7_Click">硝氮</asp:LinkButton>--%>
                        <asp:Label ID="lblvalue7" runat="server" Text="硝氮"></asp:Label></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label20" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label21" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label22" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 52px"><%--<asp:LinkButton ID="LinkButton8" CommandName="lnit" runat="server" OnClick="LinkButton8_Click">亚硝氮</asp:LinkButton>--%>
                        <asp:Label ID="lblvalue8" runat="server" Text="亚硝氮"></asp:Label></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label23" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label24" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label25" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 66px; background-color:#F0F0F0">池塘名称</td>
                    <td colspan="4">
                        <asp:Label ID="Label26" runat="server" Width="62px"></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 66px; background-color:#F0F0F0">池塘情况</td>
                    <td colspan="4">
                        <asp:Label ID="Label27" runat="server" Width="69px"></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 66px; background-color:#F0F0F0">池塘介绍</td>
                    <td colspan="4">
                        <asp:Label ID="Label28" runat="server" Text="" Width="226px"></asp:Label></td>
                </tr>
            </table>
            <asp:Label ID="Label29" runat="server" Visible="False"></asp:Label>
                   <asp:Label ID="Label30" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td align="left" style="width: 375px; height: 229px"><div id="container" style="text-align:left; width: 100%; height: 315px; margin: 0 auto"></div></td>
        <td align="left" style="height: 229px"></td>
    </tr>
</table>

<script type="text/javascript">
        require.config({
            paths: {
                echarts: './js/dist'
            }
        });

        require(
            [
                'echarts',
                'echarts/chart/line'
                
            ],
                DrawEChart //异步加载的回调函数绘制图表                    
            );

        var myChart;

       
        //创建ECharts图表方法
        function DrawEChart(ec) {
            //--- 折柱 ---
            myChart = ec.init(document.getElementById('container'));

            //定义图表options
            var options = {
                tooltip: {
                    trigger: 'item',
                    formatter: function (params) {

                            var date = new Date(params.value[0]);
                            date = date.getFullYear() + '-'
                                   + (date.getMonth() + 1) + '-'
                                   + date.getDate() + ' '
                                   + date.getHours() + ':'
                                   + date.getMinutes();
                            
                            return   '时间:'
                                   + date +  '<br/>'+ '参数值: '
                                   + params.value[1] ;
                    }
                },
                legend: {
                    data: ["参数值","预测值"]
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: false
                    }
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'time',
                        
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        
                        scale:true
                    }
                ],
              
                series : [
                    {
                        name:'参数值',
                        type:'line',
                        smooth: true,
                        data:(function (){
                            var res = [];
                            var jsonData = <%= jsonstr %>;
                            var i;
                            var now = new Date();
                            for (i = 0; i <  jsonData.j; i++) 
                           {
                               res.push([
                                        now.setTime(jsonData.rows[ jsonData.j - i-1].time1),
                                        jsonData.rows[ jsonData.j - i-1].price
                                        ]);
                               
                           }
                            return res;
                        })()
                       
                    },
                    {
                        name:'预测值',
                        type:'line',
                        smooth: true,
                        data:(function (){
                            var data = [];
                            var i;
                            var now = new Date();
                            var jsonData = <%= jsonstr %>;
                            var jsonData_2 = <%= HarfAnHourstr %>;
                            var jsonData_3 = <%= TwoHourstr %>;
                            
                            for (i = 0; i <jsonData_2.j ; i++) 
                              {
                                    if(i == 0)
                                    {
                                            data.push([
                                                 now.setTime(jsonData.rows[0].time1),
                                                 
                                                 jsonData.rows[0].price 
                                            ]);

                                    }
                                    else if(i == 1)
                                    {
             
                                           data.push([
                                                         now.setTime(jsonData_2.rows[0].time1),
                                                         
                                                         jsonData_2.rows[1].price 
                                           ]);
                                           
                                           data.push([
                                                         now.setTime(jsonData_3.rows[0].time1),
                                                        
                                                         jsonData_3.rows[1].price 
                                           ]);
                                   
                                   }
                                   
                               }
                               
                               return data;
                        })()
                        
                    }
                    ]
//                series: [
//                {
//                    name: "参数值",
//                    smooth: true,
//                    type: "line",
//                    data:[1,2,3,4,5]
//                    
////                    (function (){
////                        var res = [];
////                        var jsonData = <%= jsonstr %>;
////                        var i;
////                        for (i = 0; i <  jsonData.j; i++) 
////                       {
////                           res.push({
////                                         x:jsonData.rows[ jsonData.j - i-1].time1,
////                                         y:jsonData.rows[ jsonData.j - i-1].price
////                           });
////                           
////                       }
////                        
////                        return res;
////                    })()
//                },
//                {
//                    name: "预测值",
//                    smooth: true,
//                    type: "line",
//                    data:[1,2,3,4,5,7,7,6,5]
//                    
////                    (function (){
////                        var res = [];
////                        var len = 10;
////                        while (len--) {
////                            res.push(Math.round(Math.random() * 1000));
////                        }
////                        return res;
////                    })()
//                    
//                    
//                }]
            };

            //选择一个空图表
            myChart.setOption(options);
        }

    </script>

     </asp:Content>