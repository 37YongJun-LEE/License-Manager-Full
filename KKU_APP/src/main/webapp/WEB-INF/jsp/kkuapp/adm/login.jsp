<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html lang="utf-8">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="editplus">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<title>KKU APP ADMIN</title>
<link rel="stylesheet" type="text/css" href="/_css/adm/default.css">
<!-- <link rel="shortcut icon" href="/_img/web/favicon.ico"> -->

<script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/_js/adm/pop_layer.js"></script>
<script src="/_js/adm/common.js"></script>
<script src="/_js/adm/frmCheck.js"></script>
<script src="/_js/adm/jw-strCheck-15.12.7.js"></script>

<link href="/_css/adm/jquery-ui.css" type="text/css" rel="stylesheet" media="screen"/>
<script src="/_js/adm/jquery-ui.js" language="JavaScript" type="text/javascript"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$("input[type='text']").keyup(function(e) {
			if(e.keyCode == "13") {
				login();
			}
		});
		
		$("input[type='password']").keyup(function(e) {
			if(e.keyCode == "13") {
				login();
			}
		});
		
		readCookie();	
	});

	function login() {
		if ($("#loginId").val() == "") {
			alert("아이디를 입력하세요.");
			$("#loginId").focus();
			return;
		}
		if ($("#loginPass").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#loginPass").focus();
			return;
		}

		if (checkChecked("save_id", "checkbox")) {
			setCookie("idCook", $("#loginId").val(), 10);
		} else {
			deleteCookie("idCook");
		}

		$.ajax({
			/* contentType: "application/x-www-form-urlencoded; charset=UTF-8", */
			dataType : "text",
			type : "POST",
			url : "/admin/loginAction.do",
			data : {
					usrEmail : $("#loginId").val(),
					usrPassword : $("#loginPass").val()
				},
				success: function(tmp) {
					if(tmp == "success"){
						location.href="/admin/userList.do";

					}
					else{
						alert("not success");
					}
				}
				 
		});
	}
	
	function fnInit(val) {
		var message = val;
		if (message != "" && message != null) {
	        alert(message);
		}
	}

	//-------------------- 아이디 저장 쿠키-----------------------------//
	function getCookie(cookieName){
		var search = cookieName + "=";
		var cookie = document.cookie;

		if( cookie.length > 0 ){
		startIndex = cookie.indexOf( cookieName );

		 	if( startIndex != -1 ){
				startIndex += cookieName.length;
				endIndex = cookie.indexOf( ";", startIndex );
		
				if( endIndex == -1) endIndex = cookie.length;
				return unescape( cookie.substring( startIndex + 1, endIndex ) );
		  	}else{
				return false;
		  	}
		}else{
			return false;
		}
	}

	function setCookie(cookieName, cookieValue, expireDate){
		var today = new Date();
		today.setDate( today.getDate() + parseInt( expireDate ) );
		document.cookie = cookieName + "=" + escape( cookieValue ) + "; path=/; expires=" + today.toGMTString() + ";";
	}

	function readCookie(){
		if(getCookie("idCook")!=false){
			$("input:checkbox[id='save_id']").attr("checked", true);
			$("input:checkbox[id='save_id']").parent().addClass("checked");
			$("#loginId").val(getCookie("idCook"));
			$("#loginPass").focus();
		}else{
			$("#loginId").focus();
		}
	}

	function deleteCookie(cookieName){
		var expireDate = new Date();
		expireDate.setDate( expireDate.getDate() - 1 );
		document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
	}
</script>
</head>
<body>
	<div class="login_bg">
		<form name="login_frm" >
			<div class="login">
				<h2 class="login_logo">
					<!-- <img src="/_img/adm/cont/login_logo.png" alt="KPC-CEO 관리시스템" /> -->
					슬기로운 대학생활 관리페이지
				</h2>
				<!--최대 340px*130px-->
				<p class="lg_wrap">
					<input type="text" id="loginId" name="loginId"  placeholder="아이디">
					<input class="mt10" type="password" id="loginPass" name="loginPass" placeholder="비밀번호">
				</p>
				<p>
					<a href="javascript:login();" class="btn_login">로그인</a>
				</p>
				<p class="save_id">
					<input class="checkbox" type="checkbox" id="save_id"  name="save_id"> 
					<label for="save_id">아이디 기억하기</label>
				</p>
				<p class="copy">
					COPYRIGHT(C) KuKuTeam <br/>ALL RIGHTS RESERVED.
				</p>
			</div>
		</form>	
	</div>
</body>

</html>