<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="../_inc/title.jsp" %>

</head>
<script>
var timeoutId = 0;


var mouseTimer;
var li = document.getElementById('alarm');
function execMouseDown() { 
	/* alert(id);
	  var li = document.getElementById(this.id); */

	  document.body.addEventListener("mouseup", mouseUp);  //listen for mouse up event on body, not just the element you originally clicked on
	  location.href="/alarm_edit.do";
	}
function mouseDown() { 
    mouseUp();
    mouseTimer = window.setTimeout(execMouseDown,2000); //set timeout to fire in 2 seconds when the user presses mouse button down
}

function mouseUp() { 
    if (mouseTimer) window.clearTimeout(mouseTimer);  //cancel timer when mouse button is released

}

function onRead(alarmIdx){
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		url : "/alarmRead.do",
		data : {
				alarmIdx : alarmIdx
			},
			success: function(tmp) {
				if(tmp == "success"){
					setTimeout(function() {
						location.reload();
						}, 1000);
				}

			}
			 
	});
}
function alarmReadDelete(type){
	 	$.ajax({
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
			url : "/alarmReadDelete.do",
			data : {
					Type : type
				},
				success: function(tmp) {
					if(tmp == "deleted"){
						layer_open('confirmPop','confirm_Pop')
						$("#popContThree").show();
						$("#popContFour").hide();
						setTimeout(function() {
							location.reload();
							}, 1000);
					}
					else if(tmp=="read"){
						layer_open('confirmPop','confirm_Pop')
						$("#popContThree").hide();
						$("#popContFour").show();
						setTimeout(function() {
							location.reload();
							}, 1000);
					}
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

		<div class="navi">
			<div class="top_navi flex">
				<div class="left">
					<a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a>
					<h2>알림</h2>
				</div>
				<p class="right">
					<a href="#" class="r_btn bt_black" id ="delete" onClick="alarmReadDelete(this.id)">알림 모두 삭제</a>
					<a href="#" class="r_btn bt_black ml5" id ="read" onClick="alarmReadDelete(this.id)">알림 모두 읽음</a>
				</p>
			</div>
		</div>
	<!-- HEADER END -->
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents">
			<ul class="alarm_list">
				<!-- 댓글알림 : 알림 확인 하기전 상태에는 li 클래스에 on을 붙여주세요-->
				
				<c:forEach var="result" items="${alarmList}">
				

					<c:choose>
					
					<c:when test="${result.alarmType eq 0 }">
						<c:choose>
							<c:when  test="${result.readYn eq 0}">
							<!--onclick="location.href='/board_view.do?boardIdx=${result.boardIdx}&boardName=${result.boardName}'  -->
								<li id="alarm" class="comment on" onclick="location.href='/board_view.do?boardIdx=${result.boardIdx}&boardName=${result.boardName}'; onRead('${result.alarmIdx}');">
							</c:when>
							<c:otherwise> 
								<li id="alarm" class="comment" onclick="location.href='/board_view.do?boardIdx=${result.boardIdx}&boardName=${result.boardName}'; onRead('${result.alarmIdx}');"><!-- 해당 리스트를 꾹 누를시 edit창으로 넘어감 -->
							</c:otherwise>
						</c:choose>
					 
						<p class="alarm">
							<span class="icon">
								<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="13"><path d="M256 32V51.2C329 66.03 384 130.6 384 208V226.8C384 273.9 401.3 319.2 432.5 354.4L439.9 362.7C448.3 372.2 450.4 385.6 445.2 397.1C440 408.6 428.6 416 416 416H32C19.4 416 7.971 408.6 2.809 397.1C-2.353 385.6-.2883 372.2 8.084 362.7L15.5 354.4C46.74 319.2 64 273.9 64 226.8V208C64 130.6 118.1 66.03 192 51.2V32C192 14.33 206.3 0 224 0C241.7 0 256 14.33 256 32H256zM224 512C207 512 190.7 505.3 178.7 493.3C166.7 481.3 160 464.1 160 448H288C288 464.1 281.3 481.3 269.3 493.3C257.3 505.3 240.1 512 224 512z"/></svg>
							</span>
							새 댓글이 달렸어요
						</p>
						<p class="tt">${result.boardTitle }</p>
						<p class="bottom"><span class="source">${result.boardDetailname }</span><span class="date">${result.alarmTime }</span></p> <!-- 05월 09일 12:30 -->
						</li>
					</c:when>
					<c:when test="${result.alarmType eq 2 }">
						<c:choose>
							<c:when  test="${result.readYn eq 0}">
							<!--onclick="location.href='/board_view.do?boardIdx=${result.boardIdx}&boardName=${result.boardName}'  -->
								<li id="alarm" class="comment on" onclick="location.href='/themeboard_view.do?tboardIdx=${result.tboardIdx}&tboardDetailname=${result.tboardName}'; onRead('${result.alarmIdx}');">
							</c:when>
							<c:otherwise> 
								<li id="alarm" class="comment" onclick="location.href='/themeboard_view.do?tboardIdx=${result.tboardIdx}&tboardDetailname=${result.tboardName}'; onRead('${result.alarmIdx}');"><!-- 해당 리스트를 꾹 누를시 edit창으로 넘어감 -->
							</c:otherwise>
						</c:choose>
					 
						<p class="alarm">
							<span class="icon">
								<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="13"><path d="M256 32V51.2C329 66.03 384 130.6 384 208V226.8C384 273.9 401.3 319.2 432.5 354.4L439.9 362.7C448.3 372.2 450.4 385.6 445.2 397.1C440 408.6 428.6 416 416 416H32C19.4 416 7.971 408.6 2.809 397.1C-2.353 385.6-.2883 372.2 8.084 362.7L15.5 354.4C46.74 319.2 64 273.9 64 226.8V208C64 130.6 118.1 66.03 192 51.2V32C192 14.33 206.3 0 224 0C241.7 0 256 14.33 256 32H256zM224 512C207 512 190.7 505.3 178.7 493.3C166.7 481.3 160 464.1 160 448H288C288 464.1 281.3 481.3 269.3 493.3C257.3 505.3 240.1 512 224 512z"/></svg>
							</span>
							새 댓글이 달렸어요
						</p>
						<p class="tt">${result.tboardContent }</p>
						<p class="bottom"><span class="source">${result.tboardDetailname }</span><span class="date">${result.alarmTime }</span></p> <!-- 05월 09일 12:30 -->
						</li>
					</c:when>
					<c:otherwise>
						
						<c:choose>
							<c:when  test="${result.readYn eq 0}">
								<li class="fd on" onclick="location.href='/mypage/wait01.do'; onRead('${result.alarmIdx}');"> 
							</c:when>
							<c:otherwise> 
								<li class="fd" onclick="location.href='/mypage/wait01.do'; onRead('${result.alarmIdx}');"> <!-- 해당 리스트를 꾹 누를시 edit창으로 넘어감 -->
							</c:otherwise>
						</c:choose>
					
	
						<p class="alarm">
						<span class="icon">
							<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="17"><path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3c-95.73 0-173.3 77.6-173.3 173.3C0 496.5 15.52 512 34.66 512H413.3C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM479.1 320h-73.85C451.2 357.7 480 414.1 480 477.3C480 490.1 476.2 501.9 470 512h138C625.7 512 640 497.6 640 479.1C640 391.6 568.4 320 479.1 320zM432 256C493.9 256 544 205.9 544 144S493.9 32 432 32c-25.11 0-48.04 8.555-66.72 22.51C376.8 76.63 384 101.4 384 128c0 35.52-11.93 68.14-31.59 94.71C372.7 243.2 400.8 256 432 256z"/></svg>
						</span>
						새 친구요청이 왔어요
						</p>
						<p class="tt">${result.usrNickname }(${result.usrName}) ${result.usrMajor } ${result.usrStdnum}학번</p>
						<p class="bottom"><span class="date">05월 09일 12:30</span></p>
							
						</li>
					</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- <li class="nodata">
					도착한 알림이 없습니다.
				</li> -->
			</ul>
			</div>
	<!-- CONTENTS END -->
</div>

<!-- 알림 모두 읽기 / 삭제 버튼 클릭시 노출  -->
	<div class="layer" id="confirm_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="confirmPop">
			
			<!-- 01.모두 삭제 완료시 노출 -->
			<div class="pop_cont text" id="popContThree">
				<p class="mb20 c">알림이 모두 삭제 되었습니다.<br/></p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>

			<!-- 02. 모두 읽음 완료시 노출 -->
			<div class="pop_cont text" id="popContFour">
				<p class="mb20 c">모두 읽음 완료.<br/></p>
				<p class="btn"><a href="/alarmList.do" class="cbtn">확인</a></p>
			</div>

		</div>
	</div>
	<!-- POPUP END -->

<%@ include file="../_inc/bottom_menu.jsp" %>
</body>
</html>