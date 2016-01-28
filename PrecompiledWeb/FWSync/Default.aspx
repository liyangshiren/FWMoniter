<%@ page language="C#" masterpagefile="~/master/NewFrame.master" autoeventwireup="true" inherits="Default2, App_Web_um3uhlng" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpmain" Runat="Server">
 
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="./js/dist/echarts.js"></script>


    <script type="text/javascript">
	    document.write("<link type='text/css' href='style/test1_1.css?version=" + new Date().getTime() + "' rel='stylesheet' />");
    </script>
    <script type="text/javascript" src="js/webVideoCtrl.js"></script>
    <script charset="gb2312" language="javascript" type="text/javascript" src="js/test1_1.js"></script>

    <style type="text/css">
        #poorMap {display:bolck; max-width:675px; width: expression(this.width > 675 ? "675px" : true); height:675px; align:top;background:url(images/室外水池-02.png) no-repeat; background-size:675px 675px; position:relative; margin:0 auto 2em auto;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/室外水池-02.png', sizingMethod='scale')\9;}
        #poorMap a {color:#000; font-family:arial, sans-serif; font-size:1.2em; font-weight:bold; text-transform:uppercase;}
        a#v1_4 {display:block; width:16px; height:0; padding-top:8px; overflow:hidden; position:absolute; left:238px; top:55px;}
        a#v1_4:hover {overflow:visible;}
        a#v1_2 {display:block; width:16px; height:0; padding-top:8px; overflow:hidden; position:absolute; left:449px; top:55px;}
        a#v1_2:hover {overflow:visible;}
        a#v5_6 {display:block; width:16px; height:0; padding-top:8px; overflow:hidden; position:absolute; left:19px; top:216px;}
        a#v5_6:hover {overflow:visible;}
        a#v7_6 {display:block; width:16px; height:0; padding-top:8px; overflow:hidden; position:absolute; left:19px; top:359px;}
        a#v7_6:hover {overflow:visible;}
        a#gh {display:block; width:138px; height:0; padding-top:116px; overflow:hidden; position:absolute; left:500px; top:416px;}
        a#gh:hover {overflow:visible;}
    </style>


<table style="width:1180px;height:500px;text-align:center">
    <tr>
        <!--池塘图片-->
        <td rowspan="2" style="width: 800px">
            
            <dl id="poorMap">
		        <dd><a id="v1_4" title="1-4" href="javascript:void(0);" onclick="initVideoSys('5');"></a></dd>
		        <dd><a id="v1_2" title="1-2" href="javascript:void(0);" onclick="initVideoSys('6');"></a></dd>
		        <dd><a id="v5_6" title="5-6" href="javascript:void(0);" onclick="initVideoSys('7');"></a></dd>		
		        <dd><a id="v7_6" title="7-6" href="javascript:void(0);" onclick="initVideoSys('8');"></a></dd>
		        <dd><a id="gh" title="温室" href="javascript:void(0);" onclick="window.location.href = 'Default1.aspx';"></a></dd>
	        </dl>
	        
            <!--
            <asp:ImageMap ID="Mpp" runat="server" ImageUrl="images/default(11).jpg" OnClick="Mpp_Click" Height="707" Width="800">
                <asp:CircleHotSpot Radius="13" X="279" Y="23" HotSpotMode="PostBack" PostBackValue="a" />
                <asp:CircleHotSpot Radius="13" X="508" Y="27" HotSpotMode="PostBack" PostBackValue="b" />
                <asp:CircleHotSpot Radius="13" X="39" Y="176" HotSpotMode="PostBack" PostBackValue="c" />
                <asp:CircleHotSpot Radius="13" X="42" Y="300" HotSpotMode="PostBack" PostBackValue="d" />  
	        </asp:ImageMap>
	        -->
	    </td>
	    <!--参数表格-->
        <td id="chart" style="width: 402px; height: 403px;" align="center"> 
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
            <asp:Label ID="Label30" runat="server" Text=""></asp:Label>
        </td>
        <!--播放器及其控制面板-->
        <td id="webVideo" class="none" style="width: 402px; height: 403px;" >
            <table >
                <tr>
                   <td colspan="20"> 
                       <div id="plugin">
                       </div> 
                   </td> 
                </tr>
				<tr>
					<td>
						<a href="javascript:void(0);" onclick="showWebVideoCtrl();">打开/关闭 操作台</a>
					</td>
				</tr>
                <tr>
					<td>
						<table id="webVideoCtrl" class="none">

							<tr>
								<td colspan="20">
									<input id = "login" type="button" class="btn" value="  登录  " onclick="clickLogin();" />
									<input id = "preView"type="button" class="btn" value="开始预览"  onclick="clickStartRealPlay();" />  
									
									<br/>
									<input id = "playBack"type="button" class="btn" value="开始回放"  onclick="clickStartPlayback();" />
									<input type="button" class="btn" value="暂停" onclick="clickPause();" />
									<input type="button" class="btn" value="恢复" onclick="clickResume();" />
									<input type="button" class="btn" value="慢放" onclick="clickPlaySlow();" />
									<input type="button" class="btn" value="快放" onclick="clickPlayFast();" />
								</td>
							</tr>
							<tr class = "contrl">
								<td>开</td>
								<td>始</td>
								
								<td>:</td>
								<td>
									<select id="year_begin" onchange = "fillDay('begin')">
										
									</select>
								</td>
								<td>
									<select id="month_begin" onchange = "fillDay('begin')"></select>
								</td>
								<td>
									<select id="day_begin"></select>
								</td>
								<td>
									<select id="hour_begin" onchange = "timeChange()"></select>
								</td>
								<td>
									<select id="min_begin" onchange = "timeChange()"></select>
								</td>
								<td>
									<select id="sec_begin" onchange = "timeChange()"></select>
								</td>
							</tr>
							<tr class = "contrl">
								<td>结</td>
								<td>束</td>
								
								<td>:</td>
								<td>
									<select id="year_end" onchange = "fillDay('end')"></select>
								</td>
								<td>
									<select id="month_end" onchange = "fillDay('end')"></select>
								</td>
								<td>
									<select id="day_end"></select>
								</td>
								<td>
									<select id="hour_end" onchange = "timeChange()"></select>
								</td>
								<td>
									<select id="min_end" onchange = "timeChange()"></select>
								</td>
								<td>
									<select id="sec_end" onchange = "timeChange()"></select>
								</td>
							</tr>

						</table>
					</td>
				</tr>
            </table> 
        </td>
    </tr>
    
    <!--pH历史曲线及预测-->
    <tr id="curve">
        <td colspan="2" align="top" style="width: 375px; height: 315px">
            <div id="container" style="text-align:left; width: 100%; height: 315px; margin: 0 auto">
            </div>
        </td>
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

            myChart.setOption(options);
        }

    </script>

     </asp:Content>

