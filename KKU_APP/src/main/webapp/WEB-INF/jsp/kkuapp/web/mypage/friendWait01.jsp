<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>

<script>

var frdIdx = 0;
var usrEmail = "";

function YSet(idx, email){
	frdIdx = idx;
	usrEmail = email;
	layer_open('okPop','ok_Pop');
}
function NSet(idx, email){
	frdIdx = idx;
	usrEmail = email;
	layer_open('rjPop','rj_Pop');
}
function waitFriend(mode){


	$.ajax({
		type: "POST",
		url: "/mypage/waitFriend.do",
		data: {
			mode : mode,
			frdIdx : frdIdx,
			usrEmail : usrEmail
		},
		success: function(data) {
			check = data; // check  1:수락완료    2:거절완료   0:에러
			if(check == '1') { // 유효한 닉네임일 때
				layer_open('accPop','acc_Pop');
			} else if(check == '2'){
				layer_open('rejPop','rej_Pop');
			} else
				alret("에러발생");
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
				<div class="top_navi"><a href="/mypage/myFriend.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>신청대기목록</h2></div>
			</div>
			<div class="tab">
				<ul>
					<li><a href="#" class="on">신청 받은 목록</a></li>
					<li><a href="/mypage/wait02.do">내가 신청한 목록</a></li>
				</ul>
			</div>
			<div class="w_box top no_line">
				<ul class="fm_list wait">
					<c:forEach var="friend" items="${waitList }">
					<li>
						<div class="fm_profile" onclick="location.href='../friend.html'">				
								<c:if test="${friend.usrSrvprofilepic != null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/upload/mypage/${friend.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p></c:if>
								<c:if test="${friend.usrSrvprofilepic == null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/_img/_img/cont/no_photo.png')no-repeat 50% 50% / cover;"></p></c:if>
								<p class="border blue"></p>
						</div>
						<div class="info">
							<p class="tt">${friend.usrNickname }(${friend.usrName })</p>
							<span>${friend.usrMajor }</span><span>${friend.hackbun }학번</span>
						</div>
						<p class="right_btn">
							<a href="#" class="sbtn_mini bt_green" onclick="javascript:YSet(${friend.usrIdx },'${friend.usrEmail }');">수락</a>
							<a href="#" class="sbtn_mini bt_white" onclick="javascript:NSet(${friend.usrIdx },'${friend.usrEmail }');">거절</a>
						</p>
					</li>
					</c:forEach>
				</ul>
			</div>
			</div>
			<%@include file="../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->

	
	<!-- POPUP BEGIN -->
	<!--  수락버튼 선택 시 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="mb20 c">친구 신청을 수락하시겠습니까?</p>
				<p class="two_btn btn"><a href="#" onclick="javascript:waitFriend('Y');" class="cbtn">네</a><a href="#" class="bt_red cbtn">아니오</a></p>
			</div> 
		</div>
	</div>

	<!--  거절버튼 선택 시   -->
	<div class="layer" id="rj_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="rjPop">
			<div class="pop_cont text">
				<p class="mb20 c">친구 신청을 거절하시겠습니까?</p>
				<p class="two_btn btn"><a href="#" onclick="javascript:waitFriend('N');" class="cbtn">네</a><a href="#" class="bt_red cbtn">아니오</a></p>
			</div> 
		</div>
	</div>
	
	<!--  수락완료 시  -->
	<div class="layer" id="acc_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="accPop">
			<div class="pop_cont text">
				<p class="mb20 c">수락되었습니다</p>
				<p class="btn"><a href="/mypage/wait01.do">확인</a></p>
			</div> 
		</div>
	</div>
	<!--  신청거절 완료 시  -->
	<div class="layer" id="rej_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="rejPop">
			<div class="pop_cont text">
				<p class="mb20 c">친구신청을 거절하였습니다.</p>
				<p class="btn"><a href="/mypage/wait01.do">확인</a></p>
			</div> 
		</div>
	</div>
	
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>

