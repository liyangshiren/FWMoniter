// ��ʼ�����
// ȫ�ֱ��浱ǰѡ�д���
var LoginIP = "58.215.212.242";		//�Ѿ���¼��IP
var viewPage = 0;		//0----����ҳ�棬1----��Ƶҳ��
var LoginState = 0;		//0����δ��¼��1�����Ѿ���¼
var PreViewState = 0;	//0����û��Ԥ����1��������Ԥ��
var PlayBackState = 0;	//0����û�лطţ�1�������ڻط�
var ChannelID = "";		//����� ͨ����
var DayStr = "";

/*************��Ƶϵͳ�ĳ�ʼ��****************/
function initVideoSys(channelid){
    if(viewPage == 0){//���������ҳ�棬�϶��Ǵ���Ƶҳ�����
        openWebVideo();
    }else{//�������Ƶҳ�棬�ж��Ƿ���ϴε������ͬһ������ͷ
		if(ChannelID == channelid){//�����ͬһ������ͷ����ֹͣ���ţ��л� ������/��Ƶ�� ҳ��
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
	
	// ������Ƿ��Ѿ���װ��
	if (-1 == WebVideoCtrl.I_CheckPluginInstall()) {
		alert("����δ��װ����������Ȱ���ָʾ���ز����������ˢ�º����ԣ���");
		url= "http://202.195.144.147/fwm/file/WebComponents.exe";
����	location.href=url;
		return;
	}
	// ��ʼ�����������������
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
/********��¼/�˳���ť*********/
function clickLogin(){
	if(LoginState == 0){
		login(LoginIP);
	} else {
		stopPlay();
        PreViewState = 0;
		PlayBackState = 0
		$("#preView").val("��ʼԤ��");
		$("#playBack").val("��ʼ�ط�");
		logout();
	}
	
}

/********��ʼԤ��/����Ԥ��*********/
function clickStartRealPlay() {
	
	if ((PreViewState == 1) && (PlayBackState == 0)) {
		// ����Ԥ������ֹͣԤ��
        stopPlay();
		PreViewState = 0;
		PlayBackState = 0
		$("#preView").val("��ʼԤ��");
		$("#playBack").val("��ʼ�ط�");
	} else if((PreViewState == 0) && (PlayBackState == 1)){
		//���ڻط�	---> ����Ԥ��
        stopPlay()
		logout();
		login(LoginIP);
	} else if((PreViewState == 0) && (PlayBackState == 0)){
		//���������� ---> ����Ԥ��
		logout();
		login(LoginIP);
	} else {
		alert("δ֪״̬������ԣ�");
	}

}
/********��ʼ�ط�/���ڻط�*********/
function clickStartPlayback(){
//	alert("PreViewState == " + PreViewState + ",PlayBackState == " + PlayBackState);
	if((PreViewState == 0) && (PlayBackState == 1)){
		// ���ڻطţ���ֹͣ
        stopPlay()
        PlayBackState = 0;
		PreViewState = 0;
		$("#preView").val("��ʼԤ��");
		$("#playBack").val("��ʼ�ط�");
	} else if((PreViewState == 1) && (PlayBackState == 0)){
		//����Ԥ�� ----> ���ڻط�
        stopPlay()
		startPlayBack();
		PlayBackState = 1;
		PreViewState = 0;
		$("#preView").val("��ʼԤ��");
		$("#playBack").val("���ڻط�");
		
	} else if((PreViewState == 0) && (PlayBackState == 0)){
		alert("PreViewState == " + PreViewState + ",PlayBackState == " + PlayBackState);
	}
}
/********��ͣ*********/
function clickPause() {
	var oWndInfo = WebVideoCtrl.I_GetWindowStatus(0),
		szInfo = "";

	if ((oWndInfo != null) && (PreViewState == 0) && (PlayBackState == 1)) {
		var iRet = WebVideoCtrl.I_Pause();
		if (0 == iRet) {
			szInfo = "��ͣ�ɹ���";
		} else {
			szInfo = "��ͣʧ�ܣ�";
		}
	//	showOPInfo(oWndInfo.szIP + " " + szInfo);
	}
}

/********�ָ�*********/
function clickResume() {
	var oWndInfo = WebVideoCtrl.I_GetWindowStatus(0),
		szInfo = "";

	if ((oWndInfo != null) && (PreViewState == 0) && (PlayBackState == 1)) {
		var iRet = WebVideoCtrl.I_Resume();
		if (0 == iRet) {
			szInfo = "�ָ��ɹ���";
		} else {
			szInfo = "�ָ�ʧ�ܣ�";
		}
	//	showOPInfo(oWndInfo.szIP + " " + szInfo);
	}
}

/********����*********/
function clickPlaySlow() {
	var oWndInfo = WebVideoCtrl.I_GetWindowStatus(0),
		szInfo = "";

	if ((oWndInfo != null) && (PreViewState == 0) && (PlayBackState == 1)) {
		var iRet = WebVideoCtrl.I_PlaySlow();
		if (0 == iRet) {
			szInfo = "���ųɹ���";
		} else {
			szInfo = "����ʧ�ܣ�";
		}
	//	showOPInfo(oWndInfo.szIP + " " + szInfo);
	}
}

/********���*********/
function clickPlayFast() {
	var oWndInfo = WebVideoCtrl.I_GetWindowStatus(0),
		szInfo = "";

	if ((oWndInfo != null) && (PreViewState == 0) && (PlayBackState == 1)) {
		var iRet = WebVideoCtrl.I_PlayFast();
		if (0 == iRet) {
			szInfo = "��ųɹ���";
		} else {
			szInfo = "���ʧ�ܣ�";
		}
	//	showOPInfo(oWndInfo.szIP + " " + szInfo);
	}
}
//�õ���һҳ�洫�����Ĳ���
function getParas(){
	var url=location.search;
	var Request = new Object();
	if(url.indexOf("?")!=-1){
����	var str = url.substr(1)��//ȥ��?��
����	var strs= str.split("&");
����	for(var i=0;i<strs.length;i++){
���� ��		Request[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
		}
	} else {
		alert("û�еõ�����");
		return;
	}
	IPCam = Request["IPCam"];
	IPDVR = Request["IPDVR"];
	ChannelID = Request["ChannelID"];
}
//���Ļط�ʱ��
function timeChange(){
	if((PreViewState == 0) && (PlayBackState == 1)){
		stopPlay();
		if(0 != startPlayBack()){
			alert("��ʼ�ط�ʧ��");
		}
	}
}
//��¼
function login(szIP){
	var szPort = "7000",
		szUsername = "admin",
		szPassword = "12345";

	var iRet = WebVideoCtrl.I_Login(szIP, 1, szPort, szUsername, szPassword, {
		success: function (xmlDoc) {
			$("#login").val(LoginIP);
			LoginState = 1;
			setTimeout(function () {//��ʼԤ��

				if(0 == startRealPlay()){
					PreViewState = 1;
					PlayBackState = 0;
					$("#preView").val("����Ԥ��");
					$("#playBack").val("��ʼ�ط�");
				} else {
					alert("��ʼԤ��ʧ��");
				}
				
	        }, 200);
		},
		error: function () {
			alert("Login Failed !");
		}
	});
};
// �˳�
function logout() {
	var iRet = WebVideoCtrl.I_Logout(LoginIP);
	if (0 == iRet) {
		LoginState = 0;
        $("#login").val("��¼");
	} else {
		
	}
}
//��ʼԤ��
function startRealPlay(){
	var iRet = WebVideoCtrl.I_StartRealPlay(LoginIP, {
		iStreamType: 1,
		iChannelID: ChannelID,
		bZeroChannel: false
	});
    return iRet;
}

//ֹͣ����
function stopPlay(){
	PreViewState = 0;
	PlayBackState = 0
	$("#preView").val("��ʼԤ��");
	$("#playBack").val("��ʼ�ط�");
	return  WebVideoCtrl.I_Stop();
}
// ��ʼ�ط�
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

//��俪ʼʱ��������
function fillTime(){
    var begin_year = "",
        begin_month = "",
        begin_day = "";
    var end_year = "",
        end_month = "",
        end_day = "";
    var date = new Date();
    
    //��俪ʼ��
    var begin_year_set = $("#year_begin").empty();
    for(var i = date.getFullYear() - 1;i <= date.getFullYear();i++){
        begin_year += "<option value=" +i+">"+i+"��</option>"; 
    }
    begin_year_set.append(begin_year);
    $("#year_begin").val("" + date.getFullYear());
    //��俪ʼ��
    var begin_month_set = $("#month_begin").empty();
    for(var i = 1;i <= 12;i++){
        if(i < 10){
            begin_month += "<option value=" +0+i+">"+0+i+"��</option>"; 
        } else {
            begin_month += "<option value=" +i+">"+i+"��</option>"; 
        }
    }
    begin_month_set.append(begin_month);
    if((date.getMonth()+1) < 10){
		$("#month_begin").val("0" + (date.getMonth()+1));
	} else {
		$("#month_begin").val("" + (date.getMonth()+1));
	}
	//��俪ʼ��
    var begin_day_set = $("#day_begin").empty();
    for(var i = 1;i <= date.getDate();i++){
        if(i < 10){
            begin_day += "<option value=" +0+i+">"+0+i+"��</option>";
        } else {
            begin_day += "<option value=" +i+">"+i+"��</option>"; 
        }
    }
    begin_day_set.append(begin_day);
    if(date.getDate() < 10){
		$("#day_begin").val("0" + date.getDate());
	} else {
		$("#day_begin").val("" + date.getDate());
	}     
     //��������
    var end_year_set = $("#year_end").empty();
    for(var i = date.getFullYear() - 1;i <= date.getFullYear();i++){
        end_year += "<option value=" +i+">"+i+"��</option>"; 
    }
    end_year_set.append(end_year);
    $("#year_end").val("" + date.getFullYear());
    //��������
    var end_month_set = $("#month_end").empty();
    for(var i = 1;i <= 12;i++){
        if(i < 10){
            end_month += "<option value=" +0+i+">"+0+i+"��</option>";
        } else {
            end_month += "<option value=" +i+">"+i+"��</option>";
        }
         
    }
    end_month_set.append(end_month);
    if((date.getMonth()+1) < 10){
		$("#month_end").val("0" + (date.getMonth() + 1));
	} else {
		$("#month_end").val("" + (date.getMonth() + 1));
	}
	
    //��������
    var end_day_set = $("#day_end").empty();
    for(var i = 1;i <= date.getDate();i++){
        if(i < 10){
            end_day += "<option value=" +i+">"+0+i+"��</option>";
        } else {
            end_day += "<option value=" +i+">"+i+"��</option>"; 
        }
    }
    end_day_set.append(end_day);
	if(date.getDate() < 10){
		$("#day_end").val("0" + date.getDate());
	} else {
		$("#day_end").val("" + date.getDate());
	}       
    //���ʱ����
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
//�������
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
                dayStr += "<option value=" +i+">"+i+"��</option>"; 
            }
            daySet.append(dayStr);
            break;
        case 2:
            for(var i = 1;i <= 28 + isLeap();i++){
                dayStr += "<option value=" +i+">"+i+"��</option>"; 
            }
            daySet.append(dayStr);
            break;
        default:
            for(var i = 1;i <= 30;i++){
                dayStr += "<option value=" +i+">"+i+"��</option>"; 
            }
            daySet.append(dayStr);
            break;       
    }
}
//�ж�ƽ���꺯��
function isLeap(year){
    if (year % 100 == 0) {
����  if (year % 400 == 0) {
��������return 1;
����  }
    } else {
����  if (year % 4 == 0) {
��������return 1;
����  }
    }
    return 0;
}

// ����̨����������ʾ
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
        
        //clicktext.innerText="�򿪿���̨";


    } else {
        webVideoCtrl.style.display="block";
       
        //clicktext.innerText='�رտ���̨';
    }
   
}