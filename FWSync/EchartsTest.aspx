<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EchartsTest.aspx.cs" Inherits="EchartsTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="./JS/echarts.common.min.js"></script>

    


</head>
<body>
    <form id="form1" runat="server">
        <div id="container" style="width: 600px;height:400px;">
        </div>
    </form>

     <script type="text/javascript">
         var dom = document.getElementById("container");
         var myChart = echarts.init(dom); var app = {}; option = null; 
         var base = +new Date(2014, 9, 3);
         var oneDay = 24 * 3600 * 1000;
         var date = [];

         var data = [Math.random() * 150];
         var now = new Date(base);

         function addData(shift) {
             now = [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('-');
             date.push(now);
             data.push((Math.random() - 0.4) * 10 + data[data.length - 1]);
             if (shift) {
                 date.shift();
                 data.shift();
             }
             now = new Date(Date.parse(now) + 24 * 3600 * 1000);
         }

         for (var i = 1; i < 100; i++) {
             addData();
         }

         option = {
             xAxis: {
                 type: 'category',
                 boundaryGap: false,
                 data: date
             },
             yAxis: {
                 boundaryGap: [0, '50%'],
                 type: 'value'
             },
             series: [
        {
            name: '成交',
            type: 'line',
            smooth: true,
            symbol: 'none',
            stack: 'a',
            areaStyle: {
                normal: {}
            },
            data: data
        }
    ]
         };

         app.timeTicket = setInterval(function () {
             addData(true);
             myChart.setOption({
                 xAxis: {
                     data: date
                 },
                 series: [{
                     name: '成交',
                     data: data
                 }]
             });
         }, 500); ;
         if (option && typeof option === "object") 
         {
             var startTime = +new Date(); myChart.setOption(option, true);
             var endTime = +new Date();
             var updateTime = endTime - startTime; console.log("Time used:", updateTime); 
          }
    </script>

</body>
</html>
