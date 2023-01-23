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
				<div class="top_navi" style="display:flex;justify-content: space-between;">
					<span><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>음식점 정보</h2></span>
					<span>
						<a href="cart.do" class="btn_mini bt_green" style="width:75px; text-align: center;">장바구니</a>
						<a href="order.do" class="btn_mini bt_green" style="width:75px; text-align: center;">주문내역</a>
					</span>
				</div>
			</div>
			<div class="w_box no_line">
				<form name="schFrm" id="schFrm" method="post" autocomplete="off" action="<c:url value='/restaurant.do?restMenucategory=${restaurantVO.restMenucategory}'/>">
					<input type="hidden" name="pageIndex" id="pageIndex" value="${restaurantVO.pageIndex}" />
				<div class="search">
					<p class="input_box one">
						<input name="searchKeyword" value="${restaurantVO.searchKeyword}" type="text" placeholder="음식점 이름 검색">
						<a href="#" id="schButton"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
				</form>
				<div class="list_top sub_tab" >
					<p> <!-- 해당되는 메뉴에 클래스 on을 붙여주세요 -->
						<a href="restaurant.do" id="schButton" <c:if test="${restaurantVO.restMenucategory eq null || restaurantVO.restMenucategory == '' }">class="on"</c:if>>모두보기</a>
						<a href="restaurant.do?restMenucategory=한식" id="schButton" <c:if test="${restaurantVO.restMenucategory eq '한식'}">class="on"</c:if>>한식</a>
						<a href="restaurant.do?restMenucategory=중식" id="schButton" <c:if test="${restaurantVO.restMenucategory eq '중식'}">class="on"</c:if>>중식</a>
						<a href="restaurant.do?restMenucategory=일식" id="schButton" <c:if test="${restaurantVO.restMenucategory eq '일식'}">class="on"</c:if>>일식</a>
						<a href="restaurant.do?restMenucategory=분식" id="schButton" <c:if test="${restaurantVO.restMenucategory eq '분식'}">class="on"</c:if>>분식</a>
						<a href="restaurant.do?restMenucategory=치킨" id="schButton" <c:if test="${restaurantVO.restMenucategory eq '치킨'}">class="on"</c:if>>치킨</a>
						<a href="restaurant.do?restMenucategory=피자" id="schButton" <c:if test="${restaurantVO.restMenucategory eq '피자'}">class="on"</c:if>>피자</a>
						<a href="restaurant.do?restMenucategory=패스트푸드" id="schButton" <c:if test="${restaurantVO.restMenucategory eq '패스트푸드'}">class="on"</c:if>>패스트푸드</a>
					</p>
				</div>
				<ul class="room_list">
					<c:forEach var="restaurant" items="${restaurantList}">
					<li onclick="location.href='restaurant_view.do?restIdx=${restaurant.restIdx}';">
						<p class="img">
							<img alt="음식정 정보" src="/_img/_img/cont/best_bg.png" style="background: url('/upload/restaurant/${restaurant.first}')no-repeat 50% 50% / cover;">
						</p>
						<div>
							<div>
								<p class="tit">${restaurant.restName}</p>
							</div>
							<p class="bottom">
								<span class="info"><b>영업시간</b>${restaurant.restOpentime}</span>
								<span class="info"><b>메뉴구분</b>${restaurant.restMenucategory}</span>
								 ${(restaurant.deliveryYn eq 'Y')?' <span class="label">배달 가능</span> ': '<span class="label">배달 불가능</span>' }
						<%-- 		<c:if test="${restaurant.deliveryYn == 1}">
									<span class="label">배달가능</span>
								</c:if> --%>
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