<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
</head>
<script>

function submitForm(){
	
	if($("#textarea").val() != ""){
		layer_open('okPop','ok_Pop');
	} else
		layer_open('failPop','fail_Pop');
}

function submit(){
	$("#frm").submit();
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
			<c:if test="${review.subNum != null }">
				<div class="top_navi"><a href="/lectureInfo_view.do?lectureSubnum=${review.subNum }"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>신고하기</h2></div>
			</c:if>
			<c:if test="${review.subNum == null }">
				<div class="top_navi"><a href="/main.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>신고하기</h2></div>
			</c:if>
			</div>

			<form name="frm" id="frm" action="/reportProcess.do" autocomplete="off" method="post">
			<div class="bbs_write w_box top no_line">
				<p class="path mb10">신고 대상자 닉네임 : <b>${usrNick }</b></p>
				<input type="hidden" name=subNum id="subNum" value="${review.subNum }"/>
				<input type="hidden" name=usrNick id="usrNick" value="${usrNick }"/>
				<input type="hidden" name=reporterIdx id="reporterIdx" value="${review.writer }"/>
				<input type="hidden" name=reportBoardIdx id="reportBoardIdx" value="${review.reviewIdx }"/>
				<textarea id="textarea" name="content" rows="10" placeholder="신고 사유를 입력해주세요"></textarea>

				<p class="btn mt35"><a href="#" onclick="javascript:submitForm();">제출</a></p>
			</div>
				
			<%@include file="../../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<!-- 작성완료 선택 시 노출 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="tit c">신고 접수 완료</p>
				<p class="mb20 c">
					작성된 글 확인 후</br>
					조치가 이루어집니다.
				</p>
				<p class="btn"><a href="#" onclick="javascript:submit();">확인</a></p>
			</div> 
		</div>
	</div>
	
	
		<div class="layer" id="fail_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="failPop">
			<div class="pop_cont text">
				<p class="tit c"></p>
				<p class="mb20 c">
					내용을 입력해주세요</br>
				</p>
				<p class="btn"><a href="#" class="cbtn" '>확인</a></p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->
	


</div>
<!-- //wrap -->

</body>
</html>

