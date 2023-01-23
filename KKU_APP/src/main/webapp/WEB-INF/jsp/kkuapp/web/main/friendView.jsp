<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="../_inc/title.jsp" %>

</head>
<script>
//내친구 팝업
$(document).ready(function() {  
	$(".tit_small_gray").click(function(){    
		$(".tit_small_pop").fadeToggle();
	});

	$(".menu").click(function(){    
		$(".tit_small_pop").hide();
	});
});

function displayedAt(createdAt) {
		
	  const milliSeconds = new Date() - Date.parse(createdAt)
	  
	  const seconds = milliSeconds / 1000
	  if (seconds < 60) return document.write( "방금 전");
	  
	  const minutes = seconds / 60
	  if (minutes < 60) return document.write(Math.floor(minutes)+"분 전");
	  
	  const hours = minutes / 60
	  if (hours < 24) return document.write(Math.floor(hours)+"시간 전");
	  const days = hours / 24
	  if (days < 7) return document.write(Math.floor(days)+"일 전");
	  const weeks = days / 7

	  if (weeks < 5) return document.write(Math.floor(weeks)+"주 전");
	  const months = days / 30
	  if (months < 12) return document.write(Math.floor(months)+"개월 전");
	  const years = days / 365
	  return document.write(Math.floor(years)+"년 전");
	};

function stdNumparsing(stdnum){
	document.write(stdnum.substring(2,4));

}

/* 채팅관련 */
function uuidv4() {
	  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
	    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
	    return v.toString(16);
	  });
	}

function chatSubmit(){
	//ajax로 이미 존재하는지 검사하고, 방을 만듬
	
	let uuid = uuidv4();
	var usrIdx = ${usrInfo.usrIdx }; //  
	
    $.ajax({
    	type: "POST",
        url: "/chat/makeRoom.do",
        data: {
        	roomId : uuid,
        	trdUsrIdx : usrIdx
        },
        success: function (roomId) {
            //$("#like").load(location.href+' #like');
            
        	$('#roomId').val(roomId);
        	$("#chat").attr("action", "/chat/room.do");
        	$("#chat").submit();
        },
        error: function (xhr, desc, err) {
            alert('에러가 발생 하였습니다.');
            return;
        }
    });
	
}

/* 친구 신청 */

function addFriendCheck(){
	var check = 0;
	var name = "${usrInfo.usrName }";
	var phoneNumber = "${usrInfo.phoneNumber }";
	
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
function cancle(){

	var usrIdx = ${usrInfo.usrIdx }
	
	$.ajax({
		type: "POST",
		url: "/mypage/cancleFriend.do",
		data: {
			frdIdx : usrIdx
		},
		success: function(data) {
			check = data; // check  0:삭제실패 1:삭제성공
			if(check == '1') { // 유효한 닉네임일 때
				layer_open('ok4Pop','ok4_Pop');
			} else{
			}
		}				
	});
}
</script>
<body>
<header class="sub">
			<%@include file="../_inc/header.jsp" %>
		</header>



	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="my_main head_mg">
			<div class="navi">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>친구프로필</h2></div>
			</div>
			<div class="w_box no_line">
				<div class="profile"> 
					<p class="photo">
						<span>
							<c:if test="${usrInfo.usrSrvprofilepic != null}">
								<img src="/_img/_img/cont/photo_bg.png" style="background:url('/upload/mypage/${usrInfo.usrSrvprofilepic }')no-repeat 50% 50% /cover" width="85">
								<img src="" alt="" style="width: 80px; height: 80px; object-fit: cover; object-position: top; border-radius: 50%;" />		
							</c:if>
							<!-- 기본이미지 -->
							<c:if test="${userInfo.usrSrvprofilepic == null}">	
								<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
							</c:if>
						</span>
					</p>

					<p class="info">
						<span class="name">${usrInfo.usrNickname }<c:if test="${friendStatus eq 1}">(${usrInfo.usrName })</c:if></span>
						<span class="mail"><c:if test="${friendStatus eq 1}">${usrInfo.usrEmail }</c:if></span>
						<span class="depart">${usrInfo.usrMajor }</span>
						<span class="depart"><script> stdNumparsing ("${usrInfo.usrStdnum }")</script>학번</span>
					
					</p>
				</div>
			
				<ul class="my_data">
					<c:forEach var="result" items="${friendCNt}">
					<li onclick="location.href='#'"><span>게시물</span><p> ${boardCnt}<b>건</b></p></li>
					<li onclick="location.href='#'"><span>판매내역</span><p>${result.tradeCNT}<b>건</b></p></li>
					<li onclick="location.href='#'"><span>친구</span><p>${result.friendCNT}<b>명</b></p></li>
					</c:forEach>
				</ul>
			<form name="chat" id="chat" autocomplete="off" method="get" >
				<input type="hidden" name="roomId" id="roomId"/>
			</form>					
			
			</div>
			<ul class="fd_menu">
			<c:if test="${friendStatus eq null}">
				<li class="f_admin state01"><a href="#" onclick="javascript:addFriendCheck()">친구신청</a></li>
			</c:if>
			<c:if test="${friendStatus eq 0}">
				<li class="f_admin state02"><a href="#" onclick="javascript:cancle()">친구취소</a></li>
			</c:if>
			
			<c:if test="${friendStatus eq 1}">
				<!-- <li class="f_admin state03"><a href="#" onclick="javascript:cancle()">친구사이</a></li> -->
				<li class="f_admin timetable"><a href="/friendTimetable.do?timetableUsridx=${usrInfo.usrIdx }">시간표보기</a></li>
			</c:if>
			<c:if test="${usrInfo.usrIdx != myIdx }">
				<li class="chat" onclick="javascript:chatSubmit();"><a href="#">채팅하기</a></li>
			</c:if>
			<c:if test="${usrInfo.usrIdx == myIdx }">
				<li class="chat off" ><a href="javascript:return false;">채팅하기</a></li>
			</c:if>
				<li class="report"><a href="/report.do?reviewIdx=${usrInfo.usrIdx }&usrNick=${usrInfo.usrNickname}">신고하기</a></li>
			</ul>
			
		</div>
		
	<!-- POPUP BEGIN -->
	<!--  닉네임 없을 시 -->
	<div class="layer" id="ok1_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok1Pop">
			<div class="pop_cont text">
				<p class="mb20 c">유효하지 않은 사용자입니다.</p>
				<p class="btn"><a href="#" onclick="location.reload();" class="btn">확인</a></p>
			</div> 
		</div>
	</div>

	<!--  친구신청 완료 시   -->
	<div class="layer" id="ok2_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok2Pop">
			<div class="pop_cont text">
				<p class="mb20 c">친구 신청되었습니다.</p>
				<p class="btn"><a href="#" onclick="location.reload();" class="btn">확인</a></p>
			</div> 
		</div>
	</div>
	
	<!--  이미 신청한 상대일 시   -->
	<div class="layer" id="ok3_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok3Pop">
			<div class="pop_cont text">
				<p class="mb20 c">이미 신청한 상태입니다.</p>
				<p class="btn"><a href="#" onclick="location.reload();" class="cbtn" >확인</a></p>
			</div> 
		</div>
	</div>
	
	<!--  요청 취소 시   -->
	<div class="layer" id="ok4_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok4Pop">
			<div class="pop_cont text">
				<p class="mb20 c">요청 취소되었습니다.</p>
				<p class="btn"><a href="#" onclick="location.reload();" class="cbtn" >확인</a></p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->		
			
<%@ include file="../_inc/bottom_menu.jsp" %>
<%@ include file="../_inc/footer.jsp" %>
</body>
</html>