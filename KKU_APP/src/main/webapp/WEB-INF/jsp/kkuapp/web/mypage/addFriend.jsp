<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script>
function replacePnum(obj){
	$("#phoneNumber").val($("#phoneNumber").val().replace(/-/g,"")) 
}


function addFriendCheck(){
	var check = 0;
	var name = $("#name").val();
	var phoneNumber = $("#phoneNumber").val().replace(/-/g,"");
	
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type: "POST",
		url: "/mypage/addFriendCheck.do",
		data: {
			usrName : name,
			phoneNumber : phoneNumber
		},
		success: function(data) {
			check = data; // check  0:닉네임정보없음   1:신청성공   2:이미신청한상대 
			if(check == '1') { // 유효한 닉네임일 때
				layer_open('ok2Pop','ok2_Pop');
			} else if(check == '0') {
				layer_open('ok1Pop','ok1_Pop');
			} else {
				layer_open('ok3Pop','ok3_Pop');
			}
		}
	});
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
		<div id="sub_contents" class="head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="/mypage/myFriend.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>친구추가</h2></div>
			</div>
			<div class="w_box no_line">
				<ul class="form">
					<li>
						<p class="overflow mb15"><input type="text" id="name" placeholder="친구 실명"/>
						<p class="overflow mb15"><input type="text" id="phoneNumber" placeholder="친구 핸드폰 번호 (숫자만 입력)" />
						<a href="#" class="btn" onclick="javascript:addFriendCheck();">추가</a></p>
					</li>
				</ul>
			</div>

			</div>
			<%@include file="../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->

	
	<!-- POPUP BEGIN -->
	<!--  닉네임 없을 시 -->
	<div class="layer" id="ok1_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok1Pop">
			<div class="pop_cont text">
				<p class="mb20 c">유효하지 않은 사용자입니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
		</div>
	</div>

	<!--  친구신청 완료 시   -->
	<div class="layer" id="ok2_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok2Pop">
			<div class="pop_cont text">
				<p class="mb20 c">친구 신청되었습니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
		</div>
	</div>
	
	<!--  이미 신청한 상대일 시   -->
	<div class="layer" id="ok3_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok3Pop">
			<div class="pop_cont text">
				<p class="mb20 c">이미 신청한 상태입니다.</p>
				<p class="btn"><a href="#" class="cbtn" >확인</a></p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>

