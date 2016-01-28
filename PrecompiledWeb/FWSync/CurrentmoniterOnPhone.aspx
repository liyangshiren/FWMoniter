<%@ page language="C#" autoeventwireup="true" inherits="MapOnPhone, App_Web_um3uhlng" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>监测点地图</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
	<script type="text/javascript" src="js/locate.js"></script>
	<script type="text/javascript" src="js/rec.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>    
    <form runat="server">
    <div>
        <img alt="监测点地图,请打开有图模式" id="image_map" src="images/untitled.jpg"  style="width:100%" />
    </div>
    </form>
    
<script type="text/javascript">
		var t = "#image_map";
		h = "./AllMessageOnPhone.aspx?MoniterPlaceName=";
		var imageMap = new ImageMap(t,h,472,805);
		imageMap.bind();
	</script>

</body>
</html>
