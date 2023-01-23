<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
<script>
$(document).on("click", "#schButton", function() {
	$("#pageIndex").val('1');
	$("#schFrm").submit();
});
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
		<div id="sub_contents" class="board head_mg mb140">
			<!-- <div class="tab">
				<ul>
					<li><a href="board.do">자유게시판</a></li>
					<li><a href="themeboard_list.do">주제별 게시판</a></li>
					<li><a href="school_info.do" class="on">학교 정보</a></li>
				</ul>
			</div> -->
			<div class="navi small">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>원룸 정보</h2></div>
			</div>
			<div class="w_box no_line">
				<form name="schFrm" id="schFrm" method="get" autocomplete="off" action="room.do">
					<input type="hidden" name="pageIndex" id="pageIndex" value="${roomVO.pageIndex}" />
				<div class="search">
					<p class="input_box one">
						<input name="searchKeyword" value="${roomVO.searchKeyword}" type="text" placeholder="원룸 검색">
						<a href="#" id="schButton"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
				</form>
				<div class="list_top sub_tab" var="onOff" items="${onOff}">
					<p> <!-- 해당되는 메뉴에 클래스 on을 붙여주세요 -->
						<a href="room.do" id="schButton" class="${onOff.All}">모두보기</a>
						<a href="room.do?roomLocation=모시래마을" id="schButton" class="${onOff.M}">모시래마을</a>
						<a href="room.do?roomLocation=신촌마을" id="schButton" class="${onOff.S}">신촌마을</a>
						<a href="room.do?roomLocation=단월동" id="schButton" class="${onOff.D}">단월동</a>
					</p>
				</div>
				<ul class="room_list">
					<c:forEach var="room" items="${roomList}">
					<li onclick="location.href='room_view.do?roomIdx=${room.roomIdx}';">
						<p class="img">
							<img alt="원룸정보" src="/_img/_img/cont/best_bg.png" style="background: url(/upload/room/${room.first})no-repeat 50% 50% / cover;">
						</p>
						<div>
							<div>
								<p class="tit">${room.roomName}</p>
							</div>
							<p class="bottom">
								<span class="info"><b>원름 가격</b>${room.roomPricecategory} ${room.roomPrice}만원</span>
								<span class="info"><b>면적 구분</b>${room.roomSpacecategory}</span>
								<c:if test="${room.roomContractyn == 1}">
									<span class="label">계약가능</span>
								</c:if>
							</p>
						</div>
					</li>
					</c:forEach>
				</ul>
				<!-- 페이지 최대 5까지 노출 -->
				<p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p>

			</div>
				
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@ include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
</div>
<!-- //wrap -->

</body>
</html>