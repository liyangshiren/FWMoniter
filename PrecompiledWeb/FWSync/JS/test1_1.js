// 初始化插件
// 全局保存当前选中窗口
var LoginIP = "58.215.212.242";		//已经登录的IP
var viewPage = 0;		//0----数据页面，1----视频页面
var LoginState = 0;		//0——未登录，1——已经登录
var PreViewState = 0;	//0——没有预览，1——正在预览
var PlayBackState = 0;	//0——没有回放，1——正在回放
var ChannelID = "";		//摄像机 通道号
var DayStr = "";

/*************视频系统的初始化****************/
function initVideoSys(channelid){
    if(viewPage == 0){//如果是数据页面，肯定是打开视频页面操作
        openWebVideo();
    }else{//如果是视频页面，判断是否和上次点击的是同一个摄像头
		if(ChannelID == channelid){//如果是同一个摄像头，这停止播放，切换 【数据/视频】 页面
            closeWebVideo();
			if (webVideoCtrl.style.display=="block"){
				webVideoCtrl.style.display="none";
			}
			return;
        }
		stopPlay();
		logout();
		LoginState = 0;
    }
	ChannelID = channelid;
	
	// 检查插件是否已经安装过
	if (-1 == WebVideoCtrl.I_CheckPluginInstall()) {
		alert("您还未安装过插件，请先按照指示下载播放器插件！刷新后重试！！");
		url= "http://202.195.144.147/fwm/file/WebComponents.exe";
　　	location.href=url;
		return;
	}
	// 初始化插件参数及插入插件
	WebVideoCtrl.I_InitPlugin(388, 291, {
        iWndowType: 1,
	});
	WebVideoCtrl.I_InsertOBJECTPlugin("plugin");

	fillTime();
	if(LoginState == 0){
		login(LoginIP);
		LoginState = 1;
	} else {
		startRealPlay();
	}
	
}
/********登录/退出按钮*********/
function clickLogin(){
	if(LoginState == 0){
		login(LoginIP);
	} else {
		stopPlay();
        PreViewState = 0;
		PlayBackState = 0
		$("#preView").val("开始预览");
		$("#playBack").val("开始回放");
		logout();
	}
	
}

/********开始预览/正在预览*********/
function clickStartRealPlay() {
	
	if ((PreViewState == 1) && (PlayBackState == 0)) {
		// 正在预览，则停止预览
        stopPlay();
		PreViewState = 0;
		PlayBackState = 0
		$("#preView").val("开始预览");
		$("#playBack").val("开始回放");
	} else if((PreViewState == 0) && (PlayBackState == 1)){
		//正在回放	---> 正在预览
        stopPlay()
		logout();
		login(LoginIP);
	} else if((PreViewState == 0) && (PlayBackState == 0)){
		//播放器空闲 ---> 正在预览
		logout();
		login(LoginIP);
	} else {
		alert("未知状态，请调试！");
	}

}
/********开始回放/正在回放*********/
function clickStartPlayback(){
//	alert("PreViewState == " + PreViewState + ",PlayBackState == " + PlayBackState);
	if((PreViewState == 0) && (PlayBackState == 1)){
		// 正在回放，先停止
        stopPlay()
        PlayBackState = 0;
		PreViewState = 0;
		$("#preView").val("开始预览");
		$("#playBack").val("开始回放");
	} else if((PreViewState == 1) && (PlayBackState == 0)){
		//正在预览 ----> 正在回放
        stopPlay()
		startPlayBack();
		PlayBackState = 1;
		PreViewState = 0;
		$("#preView").val("开始预览");
		$("#playBack").val("正在回放");
		
	} else if((PreViewState == 0) && (PlayBackState == 0)){
		alert("PreViewState == " + PreViewState + ",PlayBackState == " + PlayBackState);
	}
}
/********暂停*********/
function clickPause() {
	var oWndInfo = WebVideoCtrl.I_GetWindowStatus(0),
		szInfo = "";

	if ((oWndInfo != null) && (PreViewState == 0) && (PlayBackState == 1)) {
		var iRet = WebVideoCtrl.I_Pause();
		if (0 == iRet) {
			szInfo = "暂停成功！";
		} else {
			szInfo = "暂停失败！";
		}
	//	showOPInfo(oWndInfo.szIP + " " + szInfo);
	}
}

/********恢复*********/
function clickResume() {
	var oWndInfo = WebVideoCtrl.I_GetWindowStatus(0),
		szInfo = "";

	if ((oWndInfo != null) && (PreViewState == 0) && (PlayBackState == 1)) {
		var iRet = WebVideoCtrl.I_Resume();
		if (0 == iRet) {
			szInfo = "恢复成功！";
		} else {
			szInfo = "恢复失败！";
		}
	//	showOPInfo(oWndInfo.szIP + " " + szInfo);
	}
}

/********慢放*********/
function clickPlaySlow() {
	var oWndInfo = WebVideoCtrl.I_GetWindowStatus(0),
		szInfo = "";

	if ((oWndInfo != null) && (PreViewState == 0) && (PlayBackState == 1)) {
		var iRet = WebVideoCtrl.I_PlaySlow();
		if (0 == iRet) {
			szInfo = "慢放成功！";
		} else {
			szInfo = "慢放失败！";
		}
	//	showOPInfo(oWndInfo.szIP + " " + szInfo);
	}
}

/********快放*********/
function clickPlayFast() {
	var oWndInfo = WebVideoCtrl.I_GetWindowStatus(0),
		szInfo = "";

	if ((oWndInfo != null) && (PreViewState == 0) && (PlayBackState == 1)) {
		var iRet = WebVideoCtrl.I_PlayFast();
		if (0 == iRet) {
			szInfo = "快放成功！";
		} else {
			szInfo = "快放失败！";
		}
	//	showOPInfo(oWndInfo.szIP + " " + szInfo);
	}
}
//得到上一页面传过来的参数
function getParas(){
	var url=location.search;
	var Request = new Object();
	if(url.indexOf("?")!=-1){
　　	var str = url.substr(1)　//去掉?号
　　	var strs= str.split("&");
　　	for(var i=0;i<strs.length;i++){
　　 　		Request[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
		}
	} else {
		alert("没有得到参数");
		return;
	}
	IPCam = Request["IPCam"];
	IPDVR = Request["IPDVR"];
	ChannelID = Request["ChannelID"];
}
//更改回放时间
function timeChange(){
	if((PreViewState == 0) && (PlayBackState == 1)){
		stopPlay();
		if(0 != startPlayBack()){
			alert("开始回放失败");
		}
	}
}
//登录
function login(szIP){
	var szPort = "7000",
		szUsername = "admin",
		szPassword = "12345";

	var iRet = WebVideoCtrl.I_Login(szIP, 1, szPort, szUsername, szPassword, {
		success: function (xmlDoc) {
			$("#login").val(LoginIP);
			LoginState = 1;
			setTimeout(function () {//开始预览

				if(0 == startRealPlay()){
					PreViewState = 1;
					PlayBackState = 0;
					$("#preView").val("正在预览");
					$("#playBack").val("开始回放");
				} else {
					alert("开始预览失败");
				}
				
	        }, 200);
		},
		error: function () {
			alert("Login Failed !");
		}
	});
};
// 退出
function logout() {
	var iRet = WebVideoCtrl.I_Logout(LoginIP);
	if (0 == iRet) {
		LoginState = 0;
        $("#login").val("登录");
	} else {
		
	}
}
//开始预览
function startRealPlay(){
	var iRet = WebVideoCtrl.I_StartRealPlay(LoginIP, {
		iStreamType: 1,
		iChannelID: ChannelID,
		bZeroChannel: false
	});
    return iRet;
}

//停止播放
function stopPlay(){
	PreViewState = 0;
	PlayBackState = 0
	$("#preView").val("开始预览");
	$("#playBack").val("开始回放");
	return  WebVideoCtrl.I_Stop();
}
// 开始回放
function startPlayBack() {
	var iRet = -1;
	iRet =  WebVideoCtrl.I_StartPlayback(LoginIP, {
		iChannelID : ChannelID,
		szStartTime : $("#year_begin").val() + "-" + $("#month_begin").val() + "-" + $("#day_begin").val() +" "
						+$("#hour_begin").val() + ":" + $("#min_begin").val() + ":" + $("#sec_begin").val(),
		szEndTime : $("#year_end").val() + "-" + $("#month_end").val() + "-" + $("#day_end").val() + " "
						+$("#hour_end").val()+ ":" + $("#min_end").val() + ":" + $("#sec_end").val(),
		
		
	});
	/*
    alert($("#year_begin").val() + "-" + $("#month_begin").val() + "-" + $("#day_begin").val() +" "
						+$("#hour_begin").val() + ":" + $("#min_begin").val() + ":" + $("#sec_begin").val());
    */
	return iRet;
}

//填充开始时间下拉单
function fillTime(){
    var begin_year = "",
        begin_month = "",
        begin_day = "";
    var end_year = "",
        end_month = "",
        end_day = "";
    var date = new Date();
    
    //填充开始年
    var begin_year_set = $("#year_begin").empty();
    for(var i = date.getFullYear() - 1;i <= date.getFullYear();i++){
        begin_year += "<option value=" +i+">"+i+"年</option>"; 
    }
    begin_year_set.append(begin_year);
    $("#year_begin").val("" + date.getFullYear());
    //填充开始月
    var begin_month_set = $("#month_begin").empty();
    for(var i = 1;i <= 12;i++){
        if(i < 10){
            begin_month += "<option value=" +0+i+">"+0+i+"月</option>"; 
        } else {
            begin_month += "<option value=" +i+">"+i+"月</option>"; 
        }
    }
    begin_month_set.append(begin_month);
    if((date.getMonth()+1) < 10){
		$("#month_begin").val("0" + (date.getMonth()+1));
	} else {
		$("#month_begin").val("" + (date.getMonth()+1));
	}
	//填充开始日
    var begin_day_set = $("#day_begin").empty();
    for(var i = 1;i <= date.getDate();i++){
        if(i < 10){
            begin_day += "<option value=" +0+i+">"+0+i+"日</option>";
        } else {
            begin_day += "<option value=" +i+">"+i+"日</option>"; 
        }
    }
    begin_day_set.append(begin_day);
    if(date.getDate() < 10){
		$("#day_begin").val("0" + date.getDate());
	} else {
		$("#day_begin").val("" + date.getDate());
	}     
     //填充结束年
    var end_year_set = $("#year_end").empty();
    for(var i = date.getFullYear() - 1;i <= date.getFullYear();i++){
        end_year += "<option value=" +i+">"+i+"年</option>"; 
    }
    end_year_set.append(end_year);
    $("#year_end").val("" + date.getFullYear());
    //填充结束月
    var end_month_set = $("#month_end").empty();
    for(var i = 1;i <= 12;i++){
        if(i < 10){
            end_month += "<option value=" +0+i+">"+0+i+"月</option>";
        } else {
            end_month += "<option value=" +i+">"+i+"月</option>";
        }
         
    }
    end_month_set.append(end_month);
    if((date.getMonth()+1) < 10){
		$("#month_end").val("0" + (date.getMonth() + 1));
	} else {
		$("#month_end").val("" + (date.getMonth() + 1));
	}
	
    //填充结束日
    var end_day_set = $("#day_end").empty();
    for(var i = 1;i <= date.getDate();i++){
        if(i < 10){
            end_day += "<option value=" +i+">"+0+i+"日</option>";
        } else {
            end_day += "<option value=" +i+">"+i+"日</option>"; 
        }
    }
    end_day_set.append(end_day);
	if(date.getDate() < 10){
		$("#day_end").val("0" + date.getDate());
	} else {
		$("#day_end").val("" + date.getDate());
	}       
    //填充时分秒
    var hour_set_begin = $("#hour_begin").empty();
	var hour_set_end = $("#hour_end").empty();
	var hour_str = "";
	for(var i = 0;i <= 23;i++){
		if(i < 10){
            hour_str += "<option value=" +0+i+">"+ "0" + i+"</option>";
        } else {
            hour_str += "<option value=" +i+">"+i+"</option>"; 
        }
	}
	hour_set_begin.append(hour_str);
	hour_set_end.append(hour_str);
	$("#hour_end").val("23");

	var min_set_begin = $("#min_begin").empty();
	var sec_set_begin = $("#sec_begin").empty();
	var min_set_end = $("#min_end").empty();
	var sec_set_end = $("#sec_end").empty();
	var min_sec_str = "";
	for(var i = 0;i <= 59;i++){
		if(i < 10){
            min_sec_str += "<option value=" +0+i+">"+ "0" + i+"</option>";
        } else {
            min_sec_str += "<option value=" +i+">"+i+"</option>"; 
        }
	}
	min_set_begin.append(min_sec_str);
	min_set_end.append(min_sec_str);
	$("#min_end").val("59");
	sec_set_begin.append(min_sec_str);
	sec_set_end.append(min_sec_str);
	$("#sec_end").val("59");

}
//填充日期
function fillDay(type){
    var year = "";
    var month = "";
    var dayStr = "";
    var daySet = "";
    if('begin' == type){
        year  = $("#year_begin").val();
        month = $("#month_begin").val();
        daySet = $("#day_begin").empty();
    } else {
        year  = $("#year_end").val();
        month = $("#month_end").val();
        daySet = $("#day_end").empty();
    }

    switch (parseInt(month)){
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            for(var i = 1;i <= 31;i++){
                dayStr += "<option value=" +i+">"+i+"日</option>"; 
            }
            daySet.append(dayStr);
            break;
        case 2:
            for(var i = 1;i <= 28 + isLeap();i++){
                dayStr += "<option value=" +i+">"+i+"日</option>"; 
            }
            daySet.append(dayStr);
            break;
        default:
            for(var i = 1;i <= 30;i++){
                dayStr += "<option value=" +i+">"+i+"日</option>"; 
            }
            daySet.append(dayStr);
            break;       
    }
}
//判断平闰年函数
function isLeap(year){
    if (year % 100 == 0) {
　　  if (year % 400 == 0) {
　　　　return 1;
　　  }
    } else {
　　  if (year % 4 == 0) {
　　　　return 1;
　　  }
    }
    return 0;
}

// 控制台的隐藏与显示
function openWebVideo(){
    var others=document.getElementById("chart");
    var webVideo=document.getElementById("webVideo");
    webVideo.style.display="block";
    others.style.display="none"
    viewPage = 1;
}
function closeWebVideo(){
    var others=document.getElementById("chart");
    var webVideo=document.getElementById("webVideo");
    webVideo.style.display="none";
    others.style.display="block"
    viewPage = 0;
}
function showWebVideoCtrl(){
   
    var webVideoCtrl=document.getElementById("webVideoCtrl");

    if (webVideoCtrl.style.display=="block"){
        webVideoCtrl.style.display="none";
        
        //clicktext.innerText="打开控制台";


    } else {
        webVideoCtrl.style.display="block";
       
        //clicktext.innerText='关闭控制台';
    }
   
}