<%@ page language="C#" autoeventwireup="true" inherits="ForecastOnPhone, App_Web_y57fbrjm" %>

<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>预测图像</title>
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
               text: '历史及预测曲线'
           },
           xAxis: {
                        title: {
                                text: '时间'
                            },
               type: 'datetime',
//               tickPixelInterval: 300, //两坐标之间的宽度
//                        //设置横轴坐标的显示样式
                        labels:{formatter:function(){   //格式化
                            var vDate = new Date(this.value);
                            return vDate.getMonth()+"月"+vDate.getDate()+"日";
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
                           
                   for (i = 0; i <= jsonData.j - 1 ; i++) {
//                                var ctime = new Date();
//                                ctime.setTime(parseInt(jsonData.rows[i+9].time1));

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
                           var time = new Date();
                           
                  
//                                var ctime = new Date();
//                                ctime.setTime(parseInt(jsonData.rows[i+9].time1));

//                       data.push({
//                                     x:jsonData.rows[ 9 ].time1 * 1,
//                                     y:jsonData.rows[ 9 ].price * 1
//                       });
                       

                  for (i = 0; i <=1 ; i++) {
//                                var ctime = new Date();
//                                ctime.setTime(parseInt(jsonData.rows[i+9].time1));
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
        
        <div id="container" style="width:100%; margin: 0 auto">
        </div>
        <br />
        
        <div style="text-align:right">
            <asp:HyperLink ID="HltoMapOnPhone" runat="server" NavigateUrl="~/CurrentMoniterOnPhone.aspx">回到选择监测点页面</asp:HyperLink>
        </div>

    </form>
</body>
</html>
