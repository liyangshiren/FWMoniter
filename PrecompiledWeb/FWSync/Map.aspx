<%@ page language="C#" masterpagefile="~/master/NewFrameOutside.master" autoeventwireup="true" inherits="Map, App_Web_um3uhlng" title="地图" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">
 
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
                'echarts/chart/map'
            ],
            function(ec) {
                var myChart = ec.init(document.getElementById('chinaMap'));
                var option = {
                     title : {
                    text: '各地区情况',
                    subtext: '单击获取详细信息'
                    },
                    tooltip: {
                        trigger: 'item',
                    },
                    dataRange: {
                        show: false,
                        min: 0,
                        max: 1,
                        calculable: true,
                        color: ['red', 'blue']
                    },
                    toolbox: {
                        show: true,
                        orient: 'vertical',
                        x: 'right',
                        y: 'center',
                        feature: {
                            restore: { show: true }
                        }
                    },
                    series: [
                        {
                            name: '水质预测',
                            type: 'map',
                            mapType: 'china',
                            hoverable: false,
                            roam: true,
                            itemStyle: {
                                normal: {
                                    borderWidth:2,
                                    borderColor:'black',
                                    color: 'lightblue',
                                    label: {
                                        show: false
                                    }
                                }
                                
                            },
                            data: [
                                    {
                                         name: '广东',
                                         itemStyle: {
                                            normal: {
                                                color: '#32cd32'
                                                
                                            }
                                        }
                                    },
                                    {
                                         name: '广西',
                                         itemStyle: {
                                            normal: {
                                                color: '#32cd32'
                                                
                                            }
                                        }
                                    },
                                    {
                                         name: '云南',
                                         itemStyle: {
                                            normal: {
                                                color: '#32cd32'
                                                
                                            }
                                        }
                                    },
                                    {
                                         name: '海南',
                                         itemStyle: {
                                            normal: {
                                                color: '#32cd32'
                                                
                                            }
                                        }
                                    },
                                    {
                                         name: '福建',
                                         itemStyle: {
                                            normal: {
                                                color: '#32cd32'
                                                
                                            }
                                        }
                                    },
                                    {
                                         name: '北京',
                                         itemStyle: {
                                            normal: {
                                                color: '#32cd32'
                                                
                                            }
                                        }
                                    }
                            
                            
                            ],
                            
                            markPoint: {
                                clickable: true,
                                //这里是标注是否超标
                                tooltip: {
                                    formatter: function(param, ticket, callback) {
                                        var res = param.name + '水质情况 : <br/>';
                                        
                                        if (param.value == "1") {
                                            res += "异常";
                                        }
                                        else {
                                            res += "正常";
                                        }
                                    

                                        setTimeout(function() {
                                            // 仅为了模拟异步回调
                                            callback(ticket, res);
                                        }, 10)
                                        return 'loading';
                                    }


                                },
                                symbolSize: 15,       // 标注大小，半宽（半径）参数，当图形为方向或菱形则总宽度为symbolSize * 2
                                itemStyle: {
                                    normal: {
                                        borderColor: '#87cefa',
                                        borderWidth: 1,            // 标注边线线宽，单位px，默认为1
                                        label: {
                                            show: false
                                        }
                                    },
                                    emphasis: {
                                        borderColor: '#1e90ff',
                                        borderWidth: 5,
                                        label: {
                                            show: false
                                        }
                                    }
                                },
                                data: [
                                    
                                    { name: "无锡", value: 0 },
                                    
                                    { name: "南宁", value: 0 }
                                ]
                            },
                            geoCoord: {
                                
                                "无锡": [120.29, 31.59],
                                
                                "南宁": [108.479,23.1152]
                            }
                        }
//                        {
//                            name: 'Top1',
//                            type: 'map',
//                            mapType: 'china',
//                            data: [],
//                            markPoint: {
//                                clickable: true,
//                                //这里是标注是否超标
//                                tooltip: {
//                                    formatter: function(param, ticket, callback) {
//                                        var res = param.name + '水质情况 : <br/>';
//                                        
//                                        if (param.value == "1") {
//                                            res += "异常";
//                                        }
//                                        else {
//                                            res += "正常";
//                                        }
//                                    

//                                        setTimeout(function() {
//                                            // 仅为了模拟异步回调
//                                            callback(ticket, res);
//                                        }, 10)
//                                        return 'loading';
//                                    }


//                                },
//                                symbol: 'emptyCircle',
//                                symbolSize: function(v) {
//                                    return 10 + v / 100
//                                },
//                                effect: {
//                                    show: true,
//                                    shadowBlur: 0
//                                },
//                                itemStyle: {
//                                    normal: {
//                                        label: { show: false }
//                                    }
//                                },
//                                data: [
//                                    { name: "大庆", value: 1 }
//                                ]
//                            }
//                        }
                    ]
                };
                myChart.setOption(option);

                var ecConfig = require('echarts/config');
                function clickAble(param) {
                    var name = param.name;
                    if (name == "无锡") {
                        window.location.href = 'Default.aspx';
                    }
                    if(name=="南宁"){
                        window.location.href='NanNingDefault.aspx';
                    }
                }

                myChart.on(ecConfig.EVENT.CLICK, clickAble);
            }

        );
        
    </script>


<table style="width:1180px;height:600px;text-align:center">
    <tr>
        <td rowspan="6" style="width: 415px">
        <div id="chinaMap" style="height:600px;width:1180px">
            
        </div>
        <%--    <asp:ImageMap ID="Mpp" runat="server" ImageUrl="images/default(11).jpg" OnClick="Mpp_Click" Height="707" Width="800">
             <asp:CircleHotSpot Radius="13" X="279" Y="23" HotSpotMode="PostBack" PostBackValue="a" />
            <asp:CircleHotSpot Radius="13" X="508" Y="27" HotSpotMode="PostBack" PostBackValue="b" />
            <asp:CircleHotSpot Radius="13" X="39" Y="176" HotSpotMode="PostBack" PostBackValue="c" />
            <asp:CircleHotSpot Radius="13" X="42" Y="300" HotSpotMode="PostBack" PostBackValue="d" />  
	        </asp:ImageMap>--%>
	    </td>
<%--        <td style="width: 375px; height: 63px;" align="center"> 
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
                    <td style="width: 52px"><asp:LinkButton ID="LinkButton3" CommandName="lcon" runat="server" OnClick="LinkButton3_Click">电导率</asp:LinkButton></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label8" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label9" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label10" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 52px"><asp:LinkButton ID="LinkButton4" CommandName="ltur" runat="server" OnClick="LinkButton4_Click">浊度</asp:LinkButton></td>
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
                    <td style="width: 52px"><asp:LinkButton ID="LinkButton6" CommandName="lamm" runat="server" OnClick="LinkButton6_Click">氨氮</asp:LinkButton></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label17" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label18" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label19" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 52px"><asp:LinkButton ID="LinkButton7" CommandName="lsal" runat="server" OnClick="LinkButton7_Click">硝氮</asp:LinkButton></td>
                    <td style="width: 68px; background-color:#F0F0F0">
                        <asp:Label ID="Label20" runat="server" Text=""></asp:Label></td>
                    <td style="width: 65px">
                        <asp:Label ID="Label21" runat="server" Text=""></asp:Label></td>
                    <td style="width: 70px">
                        <asp:Label ID="Label22" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr align="center">
                    <td style="width: 52px"><asp:LinkButton ID="LinkButton8" CommandName="lnit" runat="server" OnClick="LinkButton8_Click">亚硝氮</asp:LinkButton></td>
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
--%>    </tr>
<%--    <tr>
        <td align="left" style="width: 375px; height: 229px"><div id="container" style="text-align:left; width: 100%; height: 315px; margin: 0 auto"></div></td>
        <td align="left" style="width: 200px; height: 229px"></td>
    </tr>--%>
</table>


</asp:Content>

