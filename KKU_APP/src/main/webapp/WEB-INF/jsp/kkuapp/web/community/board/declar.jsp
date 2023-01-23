<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
</head>
<script>

function submitForm(){
	var reportReason = $("#reason").val();
	var selectValue = $("#selectBox").val();
	var reportPageurl = '${reportPageurl}';
	var reportTblCode = '${ReportTblCode}';
	var boardWriter = "";
	var reportBoardIdx = "";
	 if(reportTblCode == "1"){
			boardWriter='${BoardListVO.boardWriter}';
			reportBoardIdx='${BoardListVO.boardIdx}';
			if(reportPageurl.trim() != ''){
				reportPageurl ="reply";
			}
			else{
				reportPageurl = null;
			}
			
	}
	 else{
		 if(reportTblCode == '0'){
				boardWriter='${BoardListVOO.trdWriter}';
				reportBoardIdx='${BoardListVOO.trdIdx}';

			}
		 else if(reportTblCode == "2"){
				boardWriter='${LectureBoardListVO.writer}';
				reportBoardIdx='${LectureBoardListVO.reviewIdx}';

				
			}
		else if(reportTblCode == "3"){
			boardWriter='${TaxiBoardListVO.taxiWriteridx}';
				reportBoardIdx='${TaxiBoardListVO.taxiIdx}';

		}
		else if(reportTblCode == "4"){
				boardWriter='${lostInfo.lostWriter}';
				reportBoardIdx='${lostInfo.lostIdx}';
				if(reportPageurl.trim() != ''){
					reportBoardIdx='${reportIdx}';
					reportPageurl ="reply";
				}
				else{
					reportPageurl = null;
				}
		}else if(reportTblCode == "10"){
			boardWriter='${LicenseVO.boardWriter}';
			reportBoardIdx='${LicenseVO.boardIdx}';
			if(reportPageurl.trim() != ''){
				reportPageurl ="reply";
			}
			else{
				reportPageurl = null;
			}
	}
	 }
	
	 $.ajax({
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			type:"POST",
			url:"/declarAction.do",
			data: { 
				boardWriter : boardWriter,
				content : reportReason,
				reportTblCode : '${ReportTblCode}',
				reportBoardIdx : reportBoardIdx,
				reportCategory : selectValue,
				reportPageurl : reportPageurl
			},
			success : function(data ) {
				if(data == "success"){
					layer_open('okPop','ok_Pop');
				}
			
			},
			error : function() {
				alert("error");
			} 
		}) 
}

</script>
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
				<div class="top_navi"><a href="javascript:history.back(-1)"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>신고하기</h2></div>
			</div>
 
			<div class="w_box no_line">
			<ul class="form">
				<li>
					<p class="input_t">신고 사유를 선택해주세요</p>
					<select id="selectBox">
						<option>게시판 성격에 부적절함</option>
						<option>상업적 광고 및 판매</option>
						<option>욕설/비하</option>
						<option>정당/정치인 비하 및 선거운동</option>
						<option>음란물/불건전 만남 및 대화</option>
						<option>유출/사칭/사기</option>
						<option>낚시/놀람/도배</option>
					</select>
				</li>
				<li>

				<p class="input_t">
				<c:if test="${reportPageurl eq \"reply\" }">
					<b class="tt">댓글을 신고하는 이유를 적어주세요!</b>
				</c:if>
				<c:if test="${reportPageurl ne \"reply\" }">
					<c:choose>
						<c:when test="${ReportTblCode eq '0' }"><b class="tt">“${BoardListVOO.trdTitle }” </b> 게시글을 신고하는 이유를 적어주세요</p></c:when>
						<c:when test="${ReportTblCode eq '1' }"><b class="tt">“${BoardListVO.boardTitle }” </b> 게시글을 신고하는 이유를 적어주세요</p></c:when>
						<c:when test="${ReportTblCode eq '2' }"><b class="tt"> 게시글을 신고하는 이유를 적어주세요</p></c:when>
						<c:when test="${ReportTblCode eq '3' }"><b class="tt">“${TaxiBoardListVO.taxiDepartureplace } -> ${TaxiBoardListVO.taxiArrivalplace } ” </b> 게시글을 신고하는 이유를 적어주세요</p></c:when>
						<c:when test="${ReportTblCode eq '4' }"><b class="tt">“${lostInfo.lostTitle} ” </b> 게시글을 신고하는 이유를 적어주세요</p></c:when>
						<c:when test="${ReportTblCode eq '10' }"><b class="tt">“${LicenseVO.boardTitle} ” </b> 게시글을 신고하는 이유를 적어주세요</p></c:when>
					</c:choose>
				</c:if>
					
					 <!-- 글 제목  -->
					<textarea rows="8" id="reason"></textarea>
				</li>
				<p class="btn mt35"><a href="#" onclick="submitForm()">제출</a></p>
			</ul>
			</div>


	
				
		<%@include file="../../_inc/bottom_menu.jsp" %>
		<%@include file="../../_inc/footer.jsp" %>
	</div>
	<!-- CONTENTS END -->
	<!-- 작성완료 선택 시 노출
	layer_open('okPop','ok_Pop')
	
	 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="tit c">신고가 성공적으로 접수되었습니다!</p>
				<p class="mb20 c">마이페이지 > 신고결과보기 페이지에서</br> 신고 처리 결과를 보실수 있습니다</p>
				<p class="btn"><a class="cbtn" href="#" onclick="location.href='/mypage.do'">확인</a></p>
			</div> 
		</div>
	</div>
</div>
<!-- //wrap -->

</body>
</html>