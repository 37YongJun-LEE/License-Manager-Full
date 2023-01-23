<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script>

function withdrawal() {

	var password = $("#password").val();
	
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type: "POST",
		url: "/mypage/withdrawalCheck.do",
		data: {
			password : password
		},
		success: function(data) {
			memCnt = data;
			if(memCnt != '0') { 
				isNicknamechked = true;
				layer_open('confirmPop','confirm_Pop');
				$("#contOne").show();
				$("#contTwo").hide(); 
			}
			else {
				isNicknamechked = false;
				layer_open('confirmPop','confirm_Pop');
				$("#contOne").hide();
				$("#contTwo").show();
				$("#nickname").focus();
			}
		}
	});
	
	//탈퇴성공시
	layer_open('ok3Pop','ok3_Pop');
}

</script>
</head>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
			
	
		</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="my_main head_mg">
			<div class="navi">
				<div class="top_navi"><a href="/mypage.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>회원 탈퇴</h2></div>
			</div>
			<div class="w_box no_line">
				<ul class="form">
					<li>
						<p class="input_t">계정 비밀번호</p>
						<input type="password" id="password" placeholder="비밀번호를 입력해 주십시오." class="mb5"/>
						<p class="tip">* 탈퇴 후 30일간 재가입 할 수 없습니다.</p>
						<p class="tip">* 자세한 내용은 개인정보 처리방침을 확인해주세요.</p>
					</li>
				</ul>
				<p class="btn mt35"><a href="#" class="bt_red" onclick="layer_open('ok1Pop','ok1_Pop')">회원탈퇴</a></p>
			</div>
			<%@include file="../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->

	<!-- POPUP BEGIN -->
	<!--  옳은 비밀번호를 입력한 후 회원탈퇴 버튼 선택 시 노출 -->
	<div class="layer" id="ok1_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok1Pop">
			<div class="pop_cont text">
				<p class="mb20 c">정말로 탈퇴하시겠습니까?<br/>탈퇴 후 30일 동안 재가입할 수 없습니다.</p>
				<p class="two_btn btn"><a href="#"  class="cbtn">아니요</a><a href="#" class="bt_red" onclick="javascript:withdrawal();">네</a></p>
			</div> 
		</div>
	</div>
	
	<div class="layer" id="confirm_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="confirmPop">
			<!-- 01. 비밀번호 일치할 시 -->
			<div class="pop_cont text" id="contOne">
				<p class="mb20 c">탈퇴되었습니다.</p>
				<p class="btn"><a href="/member/login.do" >확인</a></p>
			</div> 

			<!-- 02. 비밀번호 틀렸을 시 -->
			 <div class="pop_cont text" id="contTwo">
				<p class="mb20 c">비밀번호를 확인하세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
		</div>
	</div>
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>