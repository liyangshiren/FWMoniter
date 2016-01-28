<%@ page language="C#" masterpagefile="~/master/OutdoorSensorMasterPage.master" autoeventwireup="true" inherits="OutdoorForecast, App_Web_y57fbrjm" title="水质监测系统预测报警（历史即时）" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">
   
   
    <script src="./JS/Calendar5.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    var c = new Calendar("c");
    document.write(c);
    </script>

    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="./js/dist/echarts.js"></script>
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
                    show : true,
                    orient: 'horizontal',      // 布局方式，默认为水平布局，可选为：
                                               // 'horizontal' ¦ 'vertical'
                    x: 'right',                // 水平安放位置，默认为全图右对齐，可选为：
                                               // 'center' ¦ 'left' ¦ 'right'
                                               // ¦ {number}（x坐标，单位px）
                    y: 'top',                  // 垂直安放位置，默认为全图顶端，可选为：
                                               // 'top' ¦ 'bottom' ¦ 'center'
                                               // ¦ {number}（y坐标，单位px）
                    color : ['#1e90ff','#22bb22','#4b0082','#d2691e'],
                    backgroundColor: 'rgba(0,0,0,0)', // 工具箱背景颜色
                    borderColor: '#ccc',       // 工具箱边框颜色
                    borderWidth: 0,            // 工具箱边框线宽，单位px，默认为0（无边框）
                    padding: 5,                // 工具箱内边距，单位px，默认各方向内边距为5，
                    showTitle: true,
                    feature : {       
                        dataZoom : {
                            show : true,
                            title : {
                                dataZoom : '区域缩放',
                                dataZoomReset : '区域缩放-后退'
                            }
                        },
                        restore : {
                            show : true,
                            title : '还原',
                            color : 'black'
                        },
                        saveAsImage : {
                            show : true,
                            title : '保存为图片',
                            type : 'jpeg',
                            lang : ['点击本地保存'] 
                        }
                    }
                },
                calculable: true,
                dataZoom: {
                    show: true,
                    start : 30
                },
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
                            
                            for (i = 0; i <= 1 ; i++) 
                              {
                                    if(i == 0)
                                    {
                                            data.push([
                                                 now.setTime(jsonData.rows[0].time1),
                                                 
                                                 jsonData.rows[0].price 
                                            ]);

                                    }
                                    else
                                    {
             
                                           data.push([
                                                         now.setTime(jsonData_2.rows[0].time1),
                                                         
                                                         jsonData_2.rows[0].price 
                                           ]);
                                           
                                           data.push([
                                                         now.setTime(jsonData_3.rows[0].time1),
                                                        
                                                         jsonData_3.rows[0].price 
                                           ]);
                                   
                                   }
                                   
                               }
                               
                               return data;
                        })()
                        
                    }
                    ]

            };

            myChart.setOption(options);
        }

    </script>

    <table style="width:100%">
        <tr>
        
        
            <td style="width:16%">
                监测点:<asp:DropDownList ID="DDLMoniter" runat="server">
                </asp:DropDownList>
            </td>
            <td style="width:20%">
                参数名称:<asp:DropDownList ID="DDLParamName" runat="server">
                </asp:DropDownList>
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
    
<%--    <br />
        <asp:Button ID="Btn_big" runat="server" Text="图像放大" OnClick="Btn_big_Click" />
    <br />
        <asp:Button ID="Btn_small" runat="server" Text="图像缩小" OnClick="Btn_small_Click" />
    <br />--%>
    
    <div id="container" style="width:1080px;height:470px;margin: 0 auto"></div>

</asp:Content>


