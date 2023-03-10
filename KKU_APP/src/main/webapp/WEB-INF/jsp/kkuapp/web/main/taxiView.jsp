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


/* ???????????? */
function uuidv4() {
	  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
	    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
	    return v.toString(16);
	  });
	}

function chatSubmit(usrIdx){
	//ajax??? ?????? ??????????????? ????????????, ?????? ??????
	
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
            alert('????????? ?????? ???????????????.');
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
				<div class="top_navi"><a href="/taxi.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>?????? ??????</h2></div>
			</div>
			<div class="bbs_view">
				<div class="view_top">
					<div class="writer"> 
						<a href="#" class="photo">
							<span>
								<!-- ??????????????? -->
								<c:if test="${writerInfo.usrSrvprofilepic eq null }">
									<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
								</c:if>
								<!-- ????????? ?????? : ??????????????? 225 * 225-->
								<c:if test="${writerInfo.usrSrvprofilepic ne null }">
									<img src="/_img/_img/cont/photo_bg.png" style="background:url('/upload/mypage/${writerInfo.usrSrvprofilepic }')no-repeat 50% 50% /cover" width="85">
								</c:if>
							</span>
						</a>
						<div class="info" >
							<a href="/friendView.do?usrIdx=${writerInfo.usrIdx}" class="name">${writerInfo.usrNickname }</a>
							<p class="depart"><span>${writerInfo.usrMajor }</span></p>
							<p><span><script>dateChange("${taxiInfo.taxiWritedate}", "writedate");</script></span><span><script>dateChange("${taxiInfo.taxiWritedate}", "writehour");</script></span><span>????????? ${taxiInfo.taxiViewnum}</span></p>
						<p class="declar"><a href="#" onclick="report()">??????</a></p>
						</div>
					</div>
				</div>
			</div>
			<div class="w_box no_line pb0">
				<div class="line_box">
					<ul class="info_list">
						<li>
							<p class="gray">?????????</p>
							<p class="black">${taxiInfo.taxiDepartureplace }</p>
						</li>
						<li>
							<p class="gray">?????????</p>
							<p class="black">${taxiInfo.taxiArrivalplace }</p>
						</li>
						<li>
							<p class="gray">?????? ??????</p>
							<p class="black">${taxiInfo.taxiDeparturetime }</p>
						</li>
						<li>
							<p class="gray">???????????????</p>
							<p class="black">${taxiInfo.taxiWritergender }</p>
						</li>
						<li>
							<p class="gray">????????????</p>
							<p class="black">${taxiInfo.taxiGender }</p>
						</li>
						<li>
							<p class="gray">????????????</p>
							<p class="black">${taxiInfo.taxiMembers }???</p>
							<p class="label">
								<span>???????????? </span>${taxiInfo.taxiApplied}/${taxiInfo.taxiMembers}
							</p>
						</li>
						<c:if test="${taxiInfo.taxiRequest ne null and taxiInfo.taxiRequest ne ''}">
							<li>
								<p class="gray">????????????</p>
								<p class="black">${taxiInfo.taxiRequest}</p>
							</li>
						</c:if>
						<!-- 
						<li>
							<p class="gray">??????</p>
							<p class="black">???????????? ??? ??????????????? ?????? ?????? ??????!</p>
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
									<p class="img"><img alt="??? ??????" src="/_img/_img/cont/photo_bg.png" style="background: url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover;"></p>
								</c:if>
								<c:if test="${applicant.profile ne null }">
									<p class="img"><img alt="??? ??????" src="/_img/_img/cont/photo_bg.png" style="background: url('/upload/mypage/${applicant.profile }')no-repeat 50% 50% / cover;"></p>
								</c:if>
							</div>
							<div class="info">
								<p class="tt">${applicant.applicantUsrnickname}</p>
							</div>
							<p class="right_btn">
								<!-- ???????????? ???????????? ?????? ?????? ?????? --> 
								<!-- ???????????? ??????????????? ??????   -->
								<c:if test="${usrIdx eq writerInfo.usrIdx}">
									<a href="#" class="sbtn_mini bt_green" onclick="javascript:chatSubmit(${applicant.applicantUsridx });">????????????</a>
								</c:if> 
								<c:if test="${applicant.applicantUsridx eq usrIdx}">
									<a href="#" class="sbtn_mini bt_green" onclick="javascript:chatSubmit(${writerInfo.usrIdx});">????????????</a>
								</c:if>
								<form name="chat" id="chat" autocomplete="off" method="get" >
									<input type="hidden" name="roomId" id="roomId"/>
								</form>									
								
								<%-- <!-- ???????????? ???????????? ?????? ?????? -->
								<c:if test="${usrIdx eq applicant.applicantUsridx}">
									<a href="#" class="sbtn_mini bt_white" id="cancle" onclick="cancle(this.id)">????????????</a>
								</c:if> --%>
							</p>
						</li>
						</c:forEach>
					
					</ul>
				</div>
				</c:if>
				
				<p class="btn nk_btn mt15">
					<a href="/taxi.do" class="bt_greenL">??????</a>
					<!-- ????????? ????????? ????????? ?????? ?????? -->
					<c:if test="${taxiInfo.taxiState eq 1 && taxiInfo.taxiApplied < taxiInfo.taxiMembers}">
						<!-- ????????? ??? ?????? -->
						<c:if test="${usrIdx eq writerInfo.usrIdx}">
							<a href="#" id="change" onclick="change(this.id)">??????????????????</a>
						</c:if>
						<!-- ????????? ??? ?????? -->
						<c:if test="${usrIdx ne writerInfo.usrIdx}">
							<!-- ?????? ????????? ?????? -->
							<c:if test="${fn:contains(usrList, usrIdx)}"> <!-- ????????? ???????????? usrIdx?????? list??? ?????????  -->
								<a href="#" class="sbtn_mini bt_white" id="cancle" onclick="cancle(this.id)">????????????</a>
							</c:if>
							<!-- ???????????? ???????????? ?????? ?????? -->
								<%-- <c:if test="${usrIdx eq applicant.applicantUsridx}">
									<a href="#" class="sbtn_mini bt_white" id="cancle" onclick="cancle(this.id)">????????????</a>
								</c:if> 
								
								<!-- ?????? ????????? ?????? -->
							<c:if test="${fn:contains(usrList, usrIdx)}"> <!-- ????????? ???????????? usrIdx?????? list??? ?????????  -->
								<a href="#" class="bt_grayL">????????????</a>
							</c:if>
								
								--%>
							<!-- ?????? ?????? ?????? -->
							<c:if test="${fn:contains(usrList, usrIdx) eq false}">
								<a href="#" id="apply" onclick="apply(this.id)">????????????</a>
							</c:if>
						</c:if>
					</c:if>
					<!-- ????????? ????????? ????????? ?????? -->
					<c:if test="${taxiInfo.taxiState eq 0 || taxiInfo.taxiApplied == taxiInfo.taxiMembers}">
						<a href="#" class="bt_grayL">????????????</a>
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
				<p class="mb20 c">??????????????? ?????????????????????????</p>
				<p class="two_btn btn"><a href="#" id="confirm" onclick="apply(this.id)">??????</a><a href="#" class="bt_red cbtn">??????</a></p>
			</div> 
			<div class="pop_cont text" id="popContTwo">
				<p class="tit c">?????? ??????</p>
				<p class="mb20 c">????????? ?????? ???????????????.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">??????</a></p>
			</div>
			<div class="pop_cont text" id="popContThree">
				<p class="mb20 c">?????? ????????? ?????????????????????.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">??????</a></p>
			</div>
		</div>
	</div>
	
	<div class="layer" id="send_Pop2">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop2">
			<div class="pop_cont text" id="popContFour">
				<p class="tit c"></p>
				<p class="mb20 c">???????????? ????????? ?????????????????????????</p>
				<p class="two_btn btn"><a href="#" id="confirm" onclick="cancle(this.id)">??????</a><a href="#" class="bt_red cbtn">??????</a></p>
			</div> 
			<div class="pop_cont text" id="popContFive">
				<p class="tit c">?????? ??????</p>
				<p class="mb20 c">?????? ??? ?????? ??????????????????.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">??????</a></p>
			</div>
			<div class="pop_cont text" id="popContSix">
				<p class="mb20 c">?????? ?????? ????????? ?????????????????????.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">??????</a></p>
			</div>
		</div>
	</div>
	
	<div class="layer" id="send_Pop3">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop3">
			<div class="pop_cont text" id="popContSeven">
				<p class="tit c"></p>
				<p class="mb20 c">????????? ?????????????????????????</p>
				<p class="two_btn btn"><a href="#" id="confirm" onclick="change(this.id)">??????</a><a href="#" class="bt_red cbtn">??????</a></p>
			</div>
			<div class="pop_cont text" id="popContEight">
				<p class="mb20 c">????????? ?????? ??????????????????.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">??????</a></p>
			</div>
			<div class="pop_cont text" id="popContNine">
				<p class="mb20 c">?????? ?????? ??????.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxiView.do?taxiIdx=${taxiInfo.taxiIdx}'" class="cbtn">??????</a></p>
			</div>
		</div>
	</div>
</body>
</html>