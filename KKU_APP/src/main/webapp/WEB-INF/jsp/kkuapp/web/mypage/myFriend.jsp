<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>

<script>
$(document).on("click", "#schButton", function() {
	$("#schFrm").submit();
});
$(document).on("click", "#no", function() {
    location.reload();
}); 
function fav(mode, idx){
	var check = 0;
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type: "POST",
		url: "/mypage/updateFav.do",
		data: {
			mode : mode,
			idx : idx
		},
		success: function(data) {
			if(data != 0){
				check = data;
				/* layer_open('confirmPop','confirm_Pop');
				$("#contOne").show();
				$("#contTwo").hide();  */
				location.reload();
			}
		}
	});
}
var frdIdx = 0;
function delSet(idx){
	frdIdx = idx;
	layer_open('delPop','del_Pop') 
}
function delFrd(){
	var check = 0;
	$.ajax({
		type: "POST",
		url: "/mypage/deleteFrd.do",
		data: {
			idx : frdIdx
		},
		success: function(data) {
			check = data;
			if(check != 0){
				/* layer_open('confirmPop','confirm_Pop');
				$("#contOne").show();
				$("#contTwo").hide();  */
				location.reload();
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
				<div class="top_navi"><a href="/mypage.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>친구목록</h2></div>
			</div>
			<div class="fm_top">
				<form name="schFrm" id="schFrm" method="get" autocomplete="off" action="/mypage/myFriend.do">
					<div class="search">
						<p class="input_box">
							<input name="searchKeyword" type="text" value="${friendVO.searchKeyword }" placeholder="친구 검색">
							<a href="#" id="schButton"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
						</p>
				</form>
					<a href="/mypage/addFriend.do" class="more_fd">친구추가<svg width="22" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3C77.61 304 0 381.6 0 477.3C0 496.5 15.52 512 34.66 512h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM616 200h-48v-48C568 138.8 557.3 128 544 128s-24 10.75-24 24v48h-48C458.8 200 448 210.8 448 224s10.75 24 24 24h48v48C520 309.3 530.8 320 544 320s24-10.75 24-24v-48h48C629.3 248 640 237.3 640 224S629.3 200 616 200z"></path></svg></a>
				</div>
			</div>






			<div class="w_box top no_line fm_bottom">
				<a class="waiting" href="/mypage/wait01.do">신청 대기 목록을 확인해보세요! &emsp;&emsp; <c:if test="${waitCnt != 0}">${waitCnt }명</c:if></a>
				<p class="num">친구 ${friendCnt.frdCnt }명</p>
				
				<ul class="fm_list">
				<c:forEach var="friend" items="${friendList}">
					<c:if test="${friend.friendStatus == '1' }">
						<li>
							<div class="fm_profile" onclick="location.href='/friendView.do?usrIdx=${friend.usrIdx }'">
							<c:if test="${friend.friendIsfav eq 1}">
								<span class="star">
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"></path></svg>
								</span>
							</c:if>
								<c:if test="${friend.usrSrvprofilepic != null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/upload/mypage/${friend.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p></c:if>
								<c:if test="${friend.usrSrvprofilepic == null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/_img/_img/cont/no_photo.png')no-repeat 50% 50% / cover;"></p></c:if>
								<p class="border blue"></p>
							</div>
							<div class="info" onclick="location.href='/friendView.do?usrIdx=${friend.usrIdx }'">
								<p class="tt">${friend.usrNickname }(${friend.usrName })</p>
								<span>${friend.usrMajor }</span><span>${friend.hackbun }학번</span>
							</div>
							<a href="#none" class="more${friend.usrIdx }" onclick="layer_open('morePop${friend.usrIdx }','more_Pop${friend.usrIdx }')"><img src="/_img/_img/cont/fm_more.png" width="2" alt="친구관리"></a>
						</li>
						<!-- POPUP BEGIN -->
						<!--  친구관리 버튼을 눌렀을 시  -->
						<div class="layer" id="more_Pop${friend.usrIdx }">
							<div class="bg"></div>
							<div class="pop-layer" id="morePop${friend.usrIdx }">
								<div class="pop_cont friend_list">
									<p class="name">${friend.usrNickname }(${friend.usrName })</p>
									<ul>
										<c:if test="${friend.friendIsfav == 1}">
											<li><a href="#" onclick="javascript:fav('favDel', ${friend.friendFrdIdx})">즐겨찾기 삭제</a></li>
										</c:if>
										<c:if test="${friend.friendIsfav != 1}">
											<li><a href="#" onclick="javascript:fav('favAdd', ${friend.friendFrdIdx})">즐겨찾기</a></li>
										</c:if>
										<li><a href="/friendTimetable.do?timetableUsridx=${friend.friendFrdIdx} ">시간표 보기</a></li>
										<li><a href="#" onclick="javascript:delSet(${friend.friendFrdIdx})">친구 삭제</a></li>
									</ul>
								</div> 
							</div>
						</div>
						<!-- POPUP END -->		
					</c:if>			
				</c:forEach>
				</ul>
			</div>
			<%@include file="../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->
	

	<!-- POPUP BEGIN -->
	<!--  친구삭제 눌렀을시 노출 -->
	<div class="layer" id="del_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delPop">
			<div class="pop_cont text">
				<p class="mb20 c">정말로 친구를 삭제하시겠습니까?<br/></p>
				<p class="two_btn btn"><a href="#"  class="bt_red" id="no">아니요</a><a href="#" onclick="javascript:delFrd();">네</a></p>
			</div> 
		</div>
	</div>


</div>
<!-- //wrap -->

</body>
</html>

