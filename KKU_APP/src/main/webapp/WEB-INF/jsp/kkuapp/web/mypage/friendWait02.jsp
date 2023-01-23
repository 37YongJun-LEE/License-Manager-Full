<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script>
var frdIdx = 0;
function frdSet(idx){
	frdIdx = idx;
	layer_open('okPop','ok_Pop');
}

var check = 0;
function cancle(){
	
	$.ajax({
		type: "POST",
		url: "/mypage/cancleFriend.do",
		data: {
			frdIdx : frdIdx
		},
		success: function(data) {
			check = data; // check  0:삭제실패 1:삭제성공
			if(check == '1') { // 유효한 닉네임일 때
				layer_open('ok2Pop','ok2_Pop');
			} else{
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
				<div class="top_navi"><a href="/mypage/myFriend.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>신청대기목록</h2></div>
			</div>
			<div class="tab">
				<ul>
					<li><a href="/mypage/wait01.do">신청 받은 목록</a></li>
					<li><a href="#" class="on">내가 신청한 목록</a></li>
				</ul>
			</div>
			<div class="w_box top no_line">
				<ul class="fm_list wait">
				<c:forEach var="friend" items="${friendList}">
					<c:if test="${friend.friendStatus == '0' }">
						<li>
							<div class="fm_profile">				
								<c:if test="${friend.usrSrvprofilepic != null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/upload/mypage/${friend.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p></c:if>
								<c:if test="${friend.usrSrvprofilepic == null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/_img/_img/cont/no_photo.png')no-repeat 50% 50% / cover;"></p></c:if>
								<p class="border blue"></p></div>
							<div class="info">
								<p class="tt">${friend.usrNickname }<%--수락 전까지 정보 비공개 (${friend.usrName })</p>
								<span>${friend.usrMajor }</span>${friend.hackbun }학번</span> --%>
							</div>
							<p class="right_btn">
								<a href="#" class="sbtn_mini bt_white" onclick="javascript:frdSet(${friend.usrIdx });">요청취소</a>
							</p>
						</li>   
					</c:if>
				</c:forEach>
				</ul>
			</div>
			<%@include file="../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->

	
	<!-- POPUP BEGIN -->
	<!--  요청취소버튼 선택 시 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="mb20 c">친구 요청을 취소하시겠습니까?</p>
				<p class="two_btn btn"><a href="#" onclick="javascript:cancle();" class="cbtn">네</a><a href="#" class="bt_red cbtn">아니오</a></p>
			</div> 
		</div>
	</div>
	
	<!--  요청취소 완료 시   -->
	<div class="layer" id="ok2_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok2Pop">
			<div class="pop_cont text">
				<p class="mb20 c">요청이 취소되었습니다.</p>
				<p class="btn"><a href="/mypage/wait02.do">확인</a></p>
			</div> 
		</div>
	</div>
	
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>

