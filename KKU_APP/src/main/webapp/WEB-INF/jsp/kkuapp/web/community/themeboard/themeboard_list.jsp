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
		<div id="sub_contents" class="board head_mg  mb140">
			<div class="tab">
				<ul>
					<li><a href="board.do">자유게시판</a></li>
					<li><a href="themeboard_list.do" class="on">주제별 게시판</a></li>
					<!-- <li><a href="school_info.do">학교 정보</a></li> -->
				</ul>
			</div>
			<div class="w_box no_line">
				<div class="search">
					<p class="input_box one">
						<input type="text" placeholder="게시판 검색">
						<a href="#"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
				
				<div class="tit_box flex  mt20">
					<p class="b_tit left pt5"> </p>
					<div class="right">
						<div class="question">
							<a href="#none" class="quest_btn">?</a>
							<div class="quest_cont">
								<span class="shape">게시판 만들기</span>
								<p class="mb10">양식 제출 후 관리자 확인을 거쳐 최종 생성이 완료됩니다.</p>
								<span class="shape">게시판 수정/삭제</span>
								<p class="mb10">게시판 수정/삭제 관련 문의는 관리자이메일로 문의바랍니다.</p>
								<b>관리자이메일</b>
								<a href="mailto:﻿'shkim@withsystem.com' class="mail">shkim@withsystem.com</a>
							</div>
						</div>
						<a href="#" class="btn_mini bt_greenL ml5">게시판 만들기</a>
					</div>
				</div>

				<ul class="board_list mt15" >
					<li><a href="/totalFamousList.do">전체 인기글 게시판 </a></li>
					<c:forEach var="theme" items="${themeBoardList}">
						<li><a href="/themeboard.do?bthemeName=${theme.bthemeName }">${theme.bthemeName }</a></li>
					</c:forEach>
				</ul>

			</div>
				
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@ include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
</div>
<!-- //wrap -->

</body>
</html>


<script>
//안내 팝업 띄우기
$(document).ready(function() {  
	$(".question .quest_btn").click(function(){    
		$(this).next(".quest_cont").fadeToggle();

	});

	$('html').click(function(e){
	if($(e.target).parents(".question").length < 1){
    	$(".quest_cont").fadeOut();
		}
	});

});
</script>