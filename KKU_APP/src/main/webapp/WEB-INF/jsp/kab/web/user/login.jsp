 <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="utf-8">
	<head>
		<%@include file="../_inc/tit.jsp" %>
		<script>
			var userInputId = getCookie("userInputId");
			var IdSaveYn = getCookie("IdSaveYn");
			$(document).ready(function(){
				$("#orgId").val(userInputId);
				if(IdSaveYn != null && IdSaveYn == "Y"){
					$("#idSaveChk").attr("checked","checked");
				}
				if($("#orgId").val()!=''){
					$("#orgPw").focus();
				}
			});
			
			
			
			function login(){
				if(isCheck()){
					//아이디 저장 
					if($("#idSaveChk").is(":checked")){
						var userInputId = $("#orgId").val();
						setCookie("userInputId",userInputId,60);
						setCookie("IdSaveYn","Y",60);
					}else{
						delCookie("userInputId");
						delCookie("IdSaveYn");
					}
					
					$("#frm").attr("action","/web/loginAction.do");
					$("#frm").submit();
				}
			}
			function isCheck(){
				var isPass = true;
				if($("#orgId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#orgId").focus();
					return isPass = false;
				}
				if($("#orgPw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#orgPw").focus();
					return isPass = false;
				}
				return isPass;
			}
			//아이디 저장 > 쿠키 함수
			function setCookie(cookieName, value, exdays){
				var exdate = new Date();
				exdate.setDate(exdate.getDate()+exdays);
				var cookieValue = escape(value) + ((exdays==null)? "":"; expires="+ exdate.toUTCString());
				document.cookie = cookieName +"="+ cookieValue;
			}
			
			function getCookie(cookieName){
				cookieName = cookieName + '=';
				var cookieData = document.cookie;
				var start = cookieData.indexOf(cookieName);
				var cookieValue = "";
				if(start != -1){
					start += cookieName.length;
					var end = cookieData.indexOf(';',start);
					if(end == -1){
						end = cookieData.length;
					}
					cookieValue = cookieData.substring(start, end);
				}
				return unescape(cookieValue);
			}
			
			function delCookie(cookieName){
				var exdate = new Date();
				exdate.setDate(exdate.getDate() - 1);
				document.cookie = cookieName +"="+ "; expires="+exdate.toUTCString();
			}
			
			
		</script>
	</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp" %>
		<p class="top_line"></p>
		<div class="cont_view">
			<div class="cont_top">
				 <h2>로그인</h2>
				 <ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>로그인</li>
				</ol>
			</div> 
			<form id="frm" method="post">
				<div class="user_box">
					<h1 class="login_logo"><img src="/_img/web/cont/login_center.png" alt="한국인정지원센터 스마트인증 관리시스템"></h1><!--최대 340px*130px-->
					<div class="lg_wrap">
						<p class="lg_input">
							<input type="text" name="orgId" id="orgId" placeholder="아이디">
							<input class="mt10" type="password" name="orgPw" id="orgPw" placeholder="비밀번호" onkeypress="if( event.keyCode==13 ){login();}">
						</p>
					</div>
					<p><a href="javascript:login();" class="btn_login">로그인</a></p>
	
					<p class="save_id">
						<input class="checkbox" type="checkbox" id="idSaveChk">
						<label for="idSaveChk">아이디 기억하기</label>		
					</p>
						
					<p class="login_etc">
						<a href="/web/findIdPw.do">아이디/비밀번호 찾기</a>
						<a href="/web/joinAgree.do" class="join">회원가입</a>
					</p>
				</div>
			</form>
		</div><!-- cont_view 끝 -->
	</div>
	<%@include file="../_inc/footer.jsp" %>

</body>

</html>