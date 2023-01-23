<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../_inc/title.jsp" %>


</head>
<script>

var jdata= "";
var userIDchk = false;
var userPASSchk = false;
$(document).ready(function() {


	
	var userID = getCookie("idCook");
	$("#usrEmail").focus();

	$("input[type='text']").keyup(function(e) {
		if(e.keyCode == "13") {
			login();
		}
	});

	$("input[type='text'], input[type='password']").keyup(function(e) {
		if(e.keyCode == "13") {
			login();
		}
	});
	
	readCookie();
	

});
function onLoginSuccess() {
}

function onLoginFailure() {
}

function login() { 

	
	var varUA = navigator.userAgent.toLowerCase(); //userAgent 값 얻기
	 
    if ( varUA.indexOf('android') > -1) {
    	var StringJson = "{ 'autoLogin' : 'y' }";
    	window.Android.IDandPass($("#usrEmail").val(),$("#usrPassword").val());
    } else if ( varUA.indexOf("iphone") > -1||varUA.indexOf("ipad") > -1||varUA.indexOf("ipod") > -1 ) {
        //IOS
    	
    } else {
        //아이폰, 안드로이드 외
        
    }
	/* if (mobile) { 
		
		} */
	
	//jdata= window.Android.doEchoTest()
	if ($("#usrEmail").val() == "") {
		layer_open('confirmPop','confirm_Pop');
		$("#contOne").show();
		$("#contTwo").hide(); 
		$("#contThree").hide(); 
		$("#usrEmail").focus();		userIDchk = false;
		userPASSchk = false;
		return;
	}
	else if ($("#usrPassword").val() == "") {
		layer_open('confirmPop','confirm_Pop');
		$("#contOne").hide();
		$("#contTwo").show();
		$("#contThree").hide(); 
		$("#usrPassword").focus();
		userIDchk = false;
		userPASSchk = false;
		return;
	}
	else if(($("#usrPassword").val() != "") &&($("#usrEmail").val() != "")  ){
		userIDchk = true;
		userPASSchk = true;
	}


	if($('#save').is(':checked')) {
		setCookie("idCook", $("#usrEmail").val(), 10);
	}else{
		deleteCookie("idCook");
	}
	
	if(userIDchk == true && userPASSchk == true){
		//var deviceid = "${deviceID}";
		var userID = $("#usrEmail").val();
		var userPass = $("#usrPassword").val();
		
		var userDeviceId = "";
		var deviceId = $("#deviceId");
		if (deviceId != null) {
			userDeviceId = deviceId.val();
		}
			
	 $.ajax({
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			type:"POST",
			url:"/member/actionLogin.do",
			data: { 
				usrEmail : userID, 
				usrPassword : userPass,
				deviceId : userDeviceId,
				deviceUpdateYn : "N"
			},
			success : function(data ) {
				console.log(data);
				if(data=="N"){
					onLoginFailure();
					layer_open('confirmPop','confirm_Pop');
					$("#contOne").hide();
					$("#contTwo").hide();
					$("#contThree").show();
				}
				else{
					onLoginSuccess();
					location.href="/main.do"; 
					/*  if ( varUA.indexOf('android') > -1) {						
				    	var StringJson = "{ autoLogin : true , usrEmail : "+userID+ " , usrPassword:" + userPass+"}";
				    	window.Android.saveInformation(StringJson);
				    	location.href="/main.do";
				    }
					 else{
						 console.log("@@@@@@@@@@@@@@@@@@@@@");
						 location.href="/main.do"; 
					 } */
					
				}
			},
			error : function() {
				alert("error");
			} 
		}) 
	}
}

/**
 * 로그인 페이지에 디바이스 아이디를 삽입하는 함수 및 주어진 디바이스 아이디를 통해서 자동 로그인
 *
 * @details 
 *	해당 함수는 모바일 디바이스 전용 함수로 로그인 form에 device id를 hidden input 형식으로 삽입한다.
 *
 * @param deviceId 삽입할 디바이스 아이디
 */
function insertDeviceId(deviceId) {
    if (!window.location.pathname === "/" || window.location.pathname === "/member/login.do") {
        return;
    }
    
    var form = $("form[name='login_frm']")
    if (form == null) {
        return;
    }
    
    var input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("id", "deviceId");
    input.setAttribute("name", "deviceId");
    input.setAttribute("value", deviceId);
    
    form.append(input);
    
    $.ajax({
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		url:"/member/deviceUpdate.do",
		data: { 
			deviceId: deviceId
		},
		dataType: "json",
		success : function(data) {
			if (data.success) {
				location.href = data.location;
			}
		},
		error : function() {
			alert("error");
		} 
	}) 
}
</script>
<body>

<div style="height:100vh">
<div class="login center">
	<div class="input_box">
		<p>
			<form name="login_frm" id="login_frm"  autocomplete="off">
				<input type="text" placeholder="Email"  name="usrEmail" id="usrEmail">
				<input type="password" placeholder="비밀번호" name="usrPassword" id="usrPassword">
			</form>
		</p>
	</div>
	<input type="checkbox" id="save"><label for="save">이메일 저장</label>

	<p class="btn"><a href="javascript:login()" >로그인</a></p>
	<p class="bottom">
		<a href="/member/certificate.do">비밀번호 찾기</a>
		<a href="/member/join01.do">회원가입</a>
	</p>
</div><!-- login END -->
</div>
<!--  <p class="btn"><a href="javascript:window.Android.showToast()">test</a></p> -->
<%@ include file="../_inc/footer.jsp" %>

<!-- POPUP BEGIN -->
	<!-- 아아디/비밀번호 입력칸 공백시 노출 -->
	<div class="layer" id="confirm_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="confirmPop">
			
			<!-- 01. 아이디 입력칸 공백 -->
			<div class="pop_cont text" id="contOne">
				<p class="mb20 c">아이디 입력을 확인해주세요</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 

			<!-- 02. 비밀번호 입력칸 공백 -->
			 <div class="pop_cont text" id="contTwo">
				<p class="mb20 c">비밀번호 입력을 확인해주세요</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
			
			 <div class="pop_cont text" id="contThree">
				<p class="mb20 c"> 아이디 혹은 비밀번호를 다시 확인해주세요</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
		</div>
	</div>
	
	
	<!-- POPUP END -->
</body>
</html>

