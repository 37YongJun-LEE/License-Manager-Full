<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
</head>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
	<header class="sub">
	<%@include file="../../_inc/header.jsp" %>
	</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>게시판 만들기</h2></div>
			</div>
			<div class="bbs_write w_box top no_line">
				<input type="text" placeholder="게시물 이름 입력" class="mb10"/>
				<textarea rows="10" placeholder="* 하단 양식에 맞게 내용을 작성해주세요
				&#13;&#10;게시판 사용 목적: 
				&#13;&#10;게시판 사용 단체명: 
				&#13;&#10;담당자 이름 및 연락처:
				&#13;&#10;담당자 이메일:"></textarea>
				<p class="btn mt25"><a href="#" onclick="layer_open('okPop','ok_Pop')">제출</a></p>
			</div>
			
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@ include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<!-- 작성완료 선택 시 노출 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="tit c">양식 제출 완료</p>
				<p class="mb20 c">관리자 확인 후<br/>게시판 생성이 완료됩니다.</p>
				<p class="btn"><a href="topic_board.html">확인</a></p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>


