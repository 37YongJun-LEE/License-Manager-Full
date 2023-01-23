<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>
<script>
function report(){
	var para = document.location.href.split("/");
/* 	var parmeee = "reportPageurl"+para[3]; */
	var parm ="/declar.do?reportBoardIdx=${taxiInfo.taxiIdx}&reportTblCode=3";
	
	location.href=parm;
}
function dateChange(date , type){ 
	var dateString = date;
	var date = dateString.split(' ');
	var time = date[1].split(':');

	if(type=="writedate")
		document.write(date[0])
	else if (type=="writehour")
		document.write(time[0]+":"+time[1])
}

function apply(id){
	if(id=="apply"){
		layer_open('sendPop1','send_Pop1');
		$("#popContOne").show();
		$("#popContTwo").hide();
		$("#popContThree").hide();
	} else if(id=="confirm"){
		$.ajax({
			type: "POST",
			url:"/taxi_apply.do?taxiIdx=${taxiInfo.taxiIdx}",
			data:{
			},
			success: function(msg) {
				if (msg == "error") {
					layer_open('sendPop1','send_Pop1');
					$("#popContOne").hide();
					$("#popContTwo").show();
					$("#popContThree").hide();
				} else {
					layer_open('sendPop1','send_Pop1');
					$("#popContOne").hide();
					$("#popContTwo").hide();
					$("#popContThree").show();
				}
			}
		})
	}
}

function cancle(id){
	if(id=="cancle"){
		layer_open('sendPop2','send_Pop2');
		$("#popContFour").show();
		$("#popContFive").hide();
		$("#popContSix").hide();
	} else if(id=="confirm"){
		$.ajax({
			type: "POST",
			url:"/taxi_cancle.do?taxiIdx=${taxiInfo.taxiIdx}",
			data:{
			},
			success: function(msg) {
				if (msg == "error") {
					layer_open('sendPop2','send_Pop2');
					$("#popContFour").hide();
					$("#popContFive").show();
					$("#popContSix").hide();
				} else {	
					layer_open('sendPop2','send_Pop2');
					$("#popContFour").hide();
					$("#popContFive").hide();
					$("#popContSix").show();
				}
			}
		})
	}
}

function change(id){
	if(id=="change"){
		layer_open('sendPop3','send_Pop3');
		$("#popContSeven").show();
		$("#popContEight").hide();
		$("#popContNine").hide();
	} else if(id=="confirm"){
		$.ajax({
			type: "POST",
			url:"/taxi_close.do?taxiIdx=${taxiInfo.taxiIdx}",
			data:{
			},
			success: function(msg) {
				if (msg == "error") {
					layer_open('sendPop3','send_Pop3');
					$("#popContSeven").hide();
					$("#popContEight").show();
					$("#popContNine").hide();
				} else {	
					layer_open('sendPop3','send_Pop3');
					$("#popContSeven").hide();
					$("#popContEight").hide();
					$("#popContNine").show();
				}
			}
		})
	}
}


/* 채팅관련 */
function uuidv4() {
	  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
	    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
	    return v.toString(16);
	  });
	}

function chatSubmit(usrIdx){
	//ajax로 이미 존재하는지 검사하고, 방을 만듬
	
	let uuid = uuidv4();
	
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




</script>

<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->
	
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi small">
				<div class="top_navi"><a href="/taxi.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>택시 합승</h2></div>
			</div>
			<div class="bbs_view">
				<div class="view_top">
					<div class="writer"> 
						<a href="#" class="photo">
							<span>
								<!-- 기본이미지 -->
								<c:if test="${writerInfo.usrSrvprofilepic eq null }">
									<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
								</c:if>
								<!-- 이미지 예시 : 권장이미지 225 * 225-->
								<c:if test="${writerInfo.usrSrvprofilepic ne null }">
									<img src="/_img/_img/cont/photo_bg.png" style="background:url('/upload/mypage/${writerInfo.usrSrvprofilepic }')no-repeat 50% 50% /cover" width="85">
								</c:if>
							</span>
						</a>
						<div class="info" >
							<a href="/friendView.do?usrIdx=${writerInfo.usrIdx}" class="name">${writerInfo.usrNickname }</a>
							<p class="depart"><span>${writerInfo.usrMajor }</span></p>
							<p><span><script>dateChange("${taxiInfo.taxiWritedate}", "writedate");</script></span><span><script>dateChange("${taxiInfo.taxiWritedate}", "writehour");</script></span><span>조회수 ${taxiInfo.taxiViewnum}</span></p>
						<p class="declar"><a href="#" onclick="report()">신고</a></p>
						</div>
					</div>
				</div>
			</div>
			<div class="w_box no_line pb0">
				<div class="line_box">
					<ul class="info_list">
						<li>
							<p class="gray">출발지</p>
							<p class="black">${taxiInfo.taxiDepartureplace }</p>
						</li>
						<li>
							<p class="gray">도착지</p>
							<p class="black">${taxiInfo.taxiArrivalplace }</p>
						</li>
						<li>
							<p class="gray">출발 일시</p>
							<p class="black">${taxiInfo.taxiDeparturetime }</p>
						</li>
						<li>
							<p class="gray">작성자성별</p>
							<p class="black">${taxiInfo.taxiWritergender }</p>
						</li>
						<li>
							<p class="gray">모집성별</p>
							<p class="black">${taxiInfo.taxiGender }</p>
						</li>
						<li>
							<p class="gray">모집인원</p>
							<p class="black">${taxiInfo.taxiMembers }명</p>
							<p class="label">
								<span>현재인원 </span>${taxiInfo.taxiApplied}/${taxiInfo.taxiMembers}
							</p>
						</li>
						<c:if test="${taxiInfo.taxiRequest ne null and taxiInfo.taxiRequest ne ''}">
							<li>
								<p class="gray">요청사항</p>
								<p class="black">${taxiInfo.taxiRequest}</p>
							</li>
						</c:if>
						<!-- 
						<li>
							<p class="gray">비고</p>
							<p class="black">연수동에 일 있으신분들 같이 타고 가요!</p>
						</li>
						 -->
					</ul>
				</div>
				
				<c:if test="${taxiApplicantList[0] ne null }">
				<div class="line_box mt30">
					<ul class="fm_list wait taxt_view_box">
						<c:forEach var="applicant" items="${taxiApplicantList}">
						<li>
							<div class="fm_profile" onclick="location.href='/friendView.do?usrIdx=${applicant.applicantUsridx}'">	
								<c:if test="${applicant.profile eq null }">
									<p class="img"><img alt="내 친구" src="/_img/_img/cont/photo_bg.png" style="background: url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover;"></p>
								</c:if>
								<c:if test="${applicant.profile ne null }">
									<p class="img"><img alt="내 친구" src="/_img/_img/cont/photo_bg.png" style="background: url('/upload/mypage/${applicant.profile }')no-repeat 50% 50% / cover;"></p>
								</c:if>
							</div>
							<div class="info">
								<p class="tt">${applicant.applicantUsrnickname}</p>
							</div>
							<p class="right_btn">
								<!-- 접속자의 프로필이 아닌 경우 표시 --> 
								<!-- 게시자와 채팅하기로 변경   -->
								<c:if test="${usrIdx eq writerInfo.usrIdx}">
									<a href="#" class="sbtn_mini bt_green" onclick="javascript:chatSubmit(${applicant.applicantUsridx });">채팅하기</a>
								</c:if> 
								<c:if test="${applicant.applicantUsridx eq usrIdx}">
									<a href="#" class="sbtn_mini bt_green" onclick="javascript:chatSubmit(${writerInfo.usrIdx});">채팅하기</a>
								</c:if>
								<form name="chat" id="chat" autocomplete="off" method="get" >
									<input type="hidden" name="roomId" id="roomId"/>
								</form>									
								
								<%-- <!-- 접속자의 프로필인 경우 표시 -->
								<c:if test="${usrIdx eq applicant.applicantUsridx}">
									<a href="#" class="sbtn_mini bt_white" id="cancle" onclick="cancle(this.id)">신청취소</a>
								</c:if> --%>
							</p>
						</li>
						</c:forEach>
					
					</ul>
				</div>
				</c:if>
				
				<p class="btn nk_btn mt15">
					<a href="/taxi.do" class="bt_greenL">목록</a>
					<!-- 게시물 상태가 마감이 아닐 경우 -->
					<c:if test="${taxiInfo.taxiState eq 1 && taxiInfo.taxiApplied < taxiInfo.taxiMembers}">
						<!-- 작성자 일 경우 -->
						<c:if test="${usrIdx eq writerInfo.usrIdx}">
							<a href="#" id="change" onclick="change(this.id)">신청마감하기</a>
						</c:if>
						<!-- 신청자 일 경우 -->
						<c:if test="${usrIdx ne writerInfo.usrIdx}">
							<!-- 이미 신청한 경우 -->
							<c:if test="${fn:contains(usrList, usrIdx)}"> <!-- 신청한 유저들의 usrIdx만을 list로 가져옴  -->
								<a href="#" class="sbtn_mini bt_white" id="cancle" onclick="cancle(this.id)">신청취소</a>
							</c:if>
							<!-- 접속자의 프로필인 경우 표시 -->
								<%-- <c:if test="${usrIdx eq applicant.applicantUsridx}">
									<a href="#" class="sbtn_mini bt_white" id="cancle" onclick="cancle(this.id)">신청취소</a>
								</c:if> 
								
								<!-- 이미 신청한 경우 -->
							<c:if test="${fn:contains(usrList, usrIdx)}"> <!-- 신청한 유저들의 usrIdx만을 list로 가져옴  -->
								<a href="#" class="bt_grayL">신청완료</a>
							</c:if>
								
								--%>
							<!-- 신청 안한 경우 -->
							<c:if test="${fn:contains(usrList, usrIdx) eq false}">
								<a href="#" id="apply" onclick="apply(this.id)">신청하기</a>
							</c:if>
						</c:if>
					</c:if>
					<!-- 게시물 상태가 마감일 경우 -->
					<c:if test="${taxiInfo.taxiState eq 0 || taxiInfo.taxiApplied == taxiInfo.taxiMembers}">
						<a href="#" class="bt_grayL">신청마감</a>
					</c:if> 
				</p>
			</div>
				
		<%@include file="../_inc/footer.jsp" %>
		<%@include file="../_inc/bottom_menu.jsp" %>
		
	<!-- CONTENTS END -->
	<div class="layer" id="send_Pop1">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop1">
			<div class="pop_cont text" id="popContOne">
				<p class="tit c"></p>
				<p class="mb20 c">택시합승을 신청하시겠습니까?</p>
				<p class="two_btn btn"><a href="#" id="confirm" onclick="apply(this.id)">확인</a><a href="#" class="bt_red cbtn">취소</a></p>
			</div> 
			<div class="pop_cont text" id="popContTwo">
				<p class="tit c">신청 실패</p>
				<p class="mb20 c">신청이 마감 되었습니다.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">확인</a></p>
			</div>
			<div class="pop_cont text" id="popContThree">
				<p class="mb20 c">합승 신청이 완료되었습니다.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">확인</a></p>
			</div>
		</div>
	</div>
	
	<div class="layer" id="send_Pop2">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop2">
			<div class="pop_cont text" id="popContFour">
				<p class="tit c"></p>
				<p class="mb20 c">택시합승 신청을 취소하시겠습니까?</p>
				<p class="two_btn btn"><a href="#" id="confirm" onclick="cancle(this.id)">확인</a><a href="#" class="bt_red cbtn">취소</a></p>
			</div> 
			<div class="pop_cont text" id="popContFive">
				<p class="tit c">취소 실패</p>
				<p class="mb20 c">잠시 후 다시 시도해주세요.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">확인</a></p>
			</div>
			<div class="pop_cont text" id="popContSix">
				<p class="mb20 c">합승 신청 취소가 완료되었습니다.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">확인</a></p>
			</div>
		</div>
	</div>
	
	<div class="layer" id="send_Pop3">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop3">
			<div class="pop_cont text" id="popContSeven">
				<p class="tit c"></p>
				<p class="mb20 c">신청을 마감하시겠습니까?</p>
				<p class="two_btn btn"><a href="#" id="confirm" onclick="change(this.id)">확인</a><a href="#" class="bt_red cbtn">취소</a></p>
			</div>
			<div class="pop_cont text" id="popContEight">
				<p class="mb20 c">잠시후 다시 시도해주세요.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">확인</a></p>
			</div>
			<div class="pop_cont text" id="popContNine">
				<p class="mb20 c">신청 마감 완료.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">확인</a></p>
			</div>
		</div>
	</div>
</body>
</html>