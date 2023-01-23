<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
<script>
function report(reviewIdx){
	var para = document.location.href.split("/");
/* 	var parmeee = "reportPageurl"+para[3]; */
	var parm ="/declar.do?reportBoardIdx="+reviewIdx+"&reportTblCode=2";
	
	location.href=parm;
}
function delReview(subNum, reviewIdx){
	$("#delY").attr("href", "/reviewDelete.do?subNum="+subNum+"&reviewIdx="+reviewIdx);
	layer_open('ok1Pop','ok1_Pop');
}

function addTimetable(){
	var num = document.getElementById('lectNum').textContent;
	var name = document.getElementById('lectName').textContent;
	
	$.ajax({
		type: "POST",
		url:"/addTimetable2.do",
		data:{
			subnum: num,
			subname: name
		},
		success: function(msg) {
			if (msg == "error") {
				layer_open('addPop','add_Pop');
				$("#pop_cont1").show();
				$("#pop_cont2").hide();
			} else if(msg == "error2"){
				alert("error")
			} else {
				layer_open('addPop','add_Pop');
				$("#pop_cont1").hide();
				$("#pop_cont2").show();
			}
		}
	})
	
}
</script>

</head>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../../_inc/header.jsp" %>
		</header>
		
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="info head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="javascript:history.back();"><img src="_img/_img/cont/navi_arrow.png"></a><h2 id="lectName">${lectureInfo.lectureName}</h2></div>
			</div>
			
			<div class="w_box no_line pb0">
				<div class="top_tit">
					<p class="tit">강의 정보</p>
					<p><a href="#" class="btn_mini bt_greenL" onclick="addTimetable()">시간표 추가</a></p>
					
				</div>
				<div class="line_box">
					<ul class="info_list">
						<li>
							<p class="gray">과목번호</p>
							<p class="black" id="lectNum">${lectureInfo.lectureSubnum}</p>
						</li>
						<li>
							<p class="gray">담당교수</p>
							<p class="black">${lectureInfo.lectureProfname}</p>
						</li>
						<li>
							<p class="gray">수강학년</p>
							<p class="black">${lectureInfo.lectureStdgrade}</p>
						</li>
						<li>
							<p class="gray">이수구분</p>
							<p class="black">${lectureInfo.lectureCategory}</p>
						</li>
						<li>
							<p class="gray">학점</p>
							<p class="black">${lectureInfo.lectureCredit}</p>
						</li>
						<li>
							<p class="gray">수강학과</p>
							<p class="black" style="word-break: break-all;">${lectureInfo.lectureMajor}</p>
						</li>
						<li>
							<p class="gray">강의시간</p>
							<p class="black">${Time}</p>
						</li>
						<li>
							<p class="gray">강의실</p>
							<p class="black">${Place}</p>
						</li>
					</ul>
				</div>
			</div>
			<div class="w_box no_line info_list_box">
				<div class="top_tit">
					<p class="tit">강의 참고 자료 공유하기</p>
					<p><a href="/lectureReview.do?subNum=${lectureInfo.lectureSubnum}" class="btn_mini bt_greenL">자료 공유하기</a></p>
				</div>
				
			<!--reviewList, fileList  -->
			<c:choose>
			<c:when test="${reviewList[0] ne null }">
				<c:forEach var="review" items="${reviewList }">
					<div class="line_box">
						<p class="tit">${review.selecter }</p>
						<p class="dot_tt"><span>${review.usrNickname }</span><span>${review.usrMajor } ${review.hackbun }학번</span>
						
	                    <fmt:parseDate value="${review.writedate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
	                    <fmt:formatDate value="${dateValue }" var="date" pattern="M월 dd일 HH:mm"/>
						
						<span>${date }</span></p>
						<p class="text">${review.content }</p>	
						<c:forEach var="file" items="${fileList }">	
							<c:if test="${file.fileTblIdx == review.reviewIdx }">
							<div class="bottom">
								<p class="file"><a href="/download.do?srvFile=${file.fileSrvFile }&usrFile=${fn:split(file.fileUsrFile,'|')[0]}&folder=lecture" class="name">${file.fileUsrFile }</a></p>
							</div>
							</c:if>
						</c:forEach>
						
						<div class="bottom">
							<p></p>
							<p class="right">
								<c:if test="${review.writer == sessionIdx }"><!-- 글쓴이 = 세션idx : 수정 삭제 뜸  -->
									<a href="/lectureReview.do?subNum=${lectureInfo.lectureSubnum}&reviewIdx=${review.reviewIdx }">수정</a>
									<a href="#" onclick="javascript:delReview('${lectureInfo.lectureSubnum}', '${review.reviewIdx }');">삭제</a>
								</c:if>
								<c:if test="${review.writer != sessionIdx }"> <!-- 아니면 신고뜸 -->
									<a href="#" onclick="report('${review.reviewIdx }')">신고</a>
								</c:if>
							</p>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<div class="line_box">
				<li class="nodata">등록된 게시글이 없습니다.</li>
				<br>
			</div>
			</c:otherwise>
			</c:choose>
			
			</div>
			
			<%@ include file="../../_inc/footer.jsp" %>
			<%@include file="../../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->

	<div class="layer" id="ok1_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok1Pop">
			<div class="pop_cont text">
				<p class="mb20 c">글을 삭제하시겠습니까?</p>
				<p class="two_btn btn"><a href="#"  class="cbtn">아니요</a><a id="delY"href="#" class="bt_red">네</a></p>
			</div> 
		</div>
	</div>
	
	<div class="layer" id="add_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="addPop">
			<div class="pop_cont text" id="pop_cont1">
				<p class="mb20 c">선택한 강의는 시간표 중복 입니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
			<div class="pop_cont text" id="pop_cont2">
				<p class="mb20 c">시간표 추가가 완료되었습니다.</p>
				<p class="two_btn btn"><a href="/timetable.do" class="bt_grayL">시간표로 이동</a><a href="#" class="cbtn">확인</a></p>
			</div> 
		</div>
	</div>

</div>
<!-- //wrap -->

</body>
</html>