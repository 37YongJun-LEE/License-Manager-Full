<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
</head>

<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->













<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="head_mg search_wrap mb140">
			<div class="w_box">
				<div class="search">
					<select>
						<option>통합검색</option>
						<option>강의정보</option>
						<option>커뮤니티</option>
						<option>학교정보</option>
						<option>중고거래</option>
					</select>
					<p class="input_box">
						<input type="text" placeholder="게시물 검색" value="과제">
						<a href="#"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
				
				<p class="total">"<span class="word">과제</span>"에 대한 검색결과는 <span class="num">총 <b>8</b>건</span>입니다.</p>
				<p class="sb_tit">강의정보 총 <b>0</b>건</p>
				<div class="no_result">검색결과가 없습니다.</div>
			</div>	

			<div class="w_box">
				<p class="sb_tit">커뮤니티 총 <b>8</b>건</p>
				<div class="search_list">
					<p class="ss_tit"><span>자유게시판 총 <b>3</b>건</span><a href="/konkuk/html/community/board.html" class="more">더보기</a></p>
					<ul>
						<li><a href="#">과제 하기 싫다</a></li>
						<li><a href="#">과제 너무 많다</a></li>
						<li><a href="#">과제 드디어 다 했다</a></li>
					</ul>
				</div>
				<div class="search_list">
					<p class="ss_tit"><span>컴공 게시판 총 <b>5</b>건<span class="source">주제별게시판</span></span><a href="#" class="more">더보기</a></p>
					<ul> <!-- 최신 등록순으로 게시물 5개 노출 -->
						<li><a href="#"><span class="tt">운영체제 과제 worksheet</span><span class="date">2022-05-16</span></a></li>
						<li><a href="#"><span class="tt">자바 프로그래밍 2 관련 과제</span><span class="date">2022-05-15</span></a></li>
						<li><a href="#"><span class="tt">겜프 로봇팔 구현 관련 과제</span><span class="date">2022-05-13</span></a></li>
						<li><a href="#"><span class="tt">DB 텀프 과제</span><span class="date">2022-05-11</span></a></li>
						<li><a href="#"><span class="tt">안녕하세요! 컴공 과제 고민중입니다. 컴공과 선배들 조언부탁드립니다.</span><span class="date">2022-05-06</span></a></li>
					</ul>
				</div>
			</div>

			<div class="w_box">
				<p class="sb_tit">학교정보 총 <b>0</b>건</p>
				<div class="no_result">검색결과가 없습니다.</div>
			</div>

			<div class="w_box no_line">
				<p class="sb_tit">중고거래 총 <b>0</b>건</p>
				<div class="no_result">검색결과가 없습니다.</div>
			</div>

			
</div>		</div>
	<!-- CONTENTS END -->

			<%@include file="../_inc/bottom_menu.jsp" %>
			<%@ include file="../_inc/footer.jsp" %>
		
	<!-- CONTENTS END -->



	</div>
<!-- //wrap -->

</body>
</html>