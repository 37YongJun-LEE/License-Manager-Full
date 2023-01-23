<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>

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
				<div class="top_navi"><a href="/main.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>원룸 정보</h2></div>
			</div>
			<div class="w_box no_line">
				<div class="search">
					<p class="input_box one">
						<input type="text" placeholder="원룸 검색">
						<a href="#"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
				<div class="list_top sub_tab">
					<p> <!-- 해당되는 메뉴에 클래스 on을 붙여주세요 -->
						<a href="#" class="on">모시래마을</a>
						<a href="#">신촌마을</a>
						<a href="#">단월동</a>
					</p>
				</div>
				<ul class="room_list">
					<li onclick="location.href='/tempRoomView.do'">
						<p class="img">
							<img alt="원룸정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/room01.jpg')no-repeat 50% 50% / cover;">
						</p>
						<div>
							<div>
								<p class="tit">연세 300만원</p>
							</div>
							<p class="bottom">
								<span class="info"><b>원름 이름</b>모시래원룸</span>
								<span class="info"><b>면적 구분</b>분리형 원룸</span>
								<span class="label">계약가능</span>
							</p>
						</div>
					</li>
					<li onclick="location.href='/tempRoomView.do'">
						<p class="img">
							<img alt="원룸정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/room02.jpg')no-repeat 50% 50% / cover;">
						</p>
						<div>
							<div>
								<p class="tit">월세 3,000/40</p>
							</div>
							<p class="bottom">
								<span class="info"><b>원름 이름</b>모시래원룸</span>
								<span class="info"><b>면적 구분</b>분리형 원룸</span>
								<span class="label">계약가능</span>
							</p>
						</div>
					</li>
					<li onclick="location.href='/tempRoomView.do'">
						<p class="img">
							<img alt="원룸정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/room03.jpg')no-repeat 50% 50% / cover;">
						</p>
						<div>
							<div>
								<p class="tit">전세 1억 7,000</p>
							</div>
							<p class="bottom">
								<span class="info"><b>원름 이름</b>모시래원룸</span>
								<span class="info"><b>면적 구분</b>분리형 원룸</span>
								<span class="label">계약가능</span>
							</p>
						</div>
					</li>
					<li onclick="location.href='/tempRoomView.do'">
						<p class="img">
							<img alt="원룸정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/room04.jpg')no-repeat 50% 50% / cover;">
						</p>
						<div>
							<div>
								<p class="tit">월세 3,000/40</p>
							</div>
							<p class="bottom">
								<span class="info"><b>원름 이름</b>모시래원룸</span>
								<span class="info"><b>면적 구분</b>분리형 원룸</span>
								<span class="label">계약가능</span>
							</p>
						</div>
					</li>
					<li onclick="location.href='/tempRoomView.do'">
						<p class="img">
							<img alt="원룸정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/room05.jpg')no-repeat 50% 50% / cover;">
						</p>
						<div>
							<div>
								<p class="tit">전세 1억 7,000</p>
							</div>
							<p class="bottom">
								<span class="info"><b>원름 이름</b>모시래원룸</span>
								<span class="info"><b>면적 구분</b>분리형 원룸</span>
								<span class="label">계약가능</span>
							</p>
						</div>
					</li>
					<li onclick="location.href='/tempRoomView.do'">
						<p class="img">
							<img alt="원룸정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/room06.jpg')no-repeat 50% 50% / cover;">
						</p>
						<div>
							<div>
								<p class="tit">연세 300만원</p>
							</div>
							<p class="bottom">
								<span class="info"><b>원름 이름</b>모시래원룸</span>
								<span class="info"><b>면적 구분</b>분리형 원룸</span>
								<span class="label">계약가능</span>
							</p>
						</div>
					</li>
					<!-- <li class="nodata">등록된 게시글이 없습니다.</li> -->
				</ul>
				<!-- 페이지 최대 5까지 노출 -->
				<p class="paging">
					<a href="#" class="prev end">처음으로</a>
					<a href="#" class="prev">이전</a>
					<a href="#" class="on">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#" class="next">다음</a>
					<a href="#" class="next end">마지막으로</a>
				</p>

			</div>
				
		<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
	<!-- CONTENTS END -->

</body>
</html>