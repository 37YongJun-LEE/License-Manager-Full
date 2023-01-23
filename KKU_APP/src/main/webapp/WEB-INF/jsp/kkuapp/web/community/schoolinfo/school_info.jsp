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
			<div class="tab">
				<ul>
					<!-- <li><a href="board.do">자유게시판</a></li>
					<li><a href="themeboard_list.do">주제별 게시판</a></li> -->
					<li><a href="school_info.do" class="on">학교 정보</a></li>
				</ul>
			</div>
			<div class="w_box top no_line">
				<ul class="school_info">
					<li><a href="http://www.kku.ac.kr/user/boardList.do?boardId=1489&siteId=wwwkr&id=wwwkr_070102000000"><img src="/_img/_img/cont/sinfo01.png" width="34"><span>학교공지</span></a></li>
					<li><a href="majorNotice.do?usrIdx=${usrIdx}"><img src="/_img/_img/cont/sinfo02.png" width="34"><span>학과공지</span></a></li>
					<li><a href="schedule_annual1.do"><img src="/_img/_img/cont/sinfo06.png" width="34"><span>학사일정</span></a></li>
					<li><a href="diet_mosirae.do"><img src="/_img/_img/cont/sinfo05.png" width="34"><span>학식정보</span></a></li>
					<li><a href="schedule_bus.do"><img src="/_img/_img/cont/sinfo07.png" width="34"><span>버스시간표</span></a></li>
					<li><a href="restaurant.do"><img src="/_img/_img/cont/sinfo04.png" width="34"><span>음식점정보</span></a></li>
					<!-- <li><a href="room.do"><img src="/_img/_img/cont/sinfo03.png" width="34"><span>원룸정보</span></a></li> -->
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