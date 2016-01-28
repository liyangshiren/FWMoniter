<%@ page language="C#" autoeventwireup="true" inherits="Registersuccess, App_Web_um3uhlng" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>水质监测系统新用户注册成功</title>
    <script type="text/javascript">
      var i = 10;
      window.onload=function page_cg()
      { 
          document.getElementById("time").innerText = i;
          i--;
          if(i==0)
          {
             window.location.href("Login.aspx");
          }
          setTimeout(page_cg,1000);
       }
     </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        恭喜您！注册成功！10秒后跳到登陆页面，或者<span id="time"></span><a href="<%--Login.aspx--%>">点此跳转到登陆页面</a><br />
      </div> 
    </form>
</body>
</html>
