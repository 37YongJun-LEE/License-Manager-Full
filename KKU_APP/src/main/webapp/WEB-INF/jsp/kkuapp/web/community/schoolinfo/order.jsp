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
			<div class="navi small">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>주문내역</h2></div>				
			</div>
			<div class="order_list">
			<p class="tit">진행중인 내역<p>

			<!-- 개발:: 주문상태 클래스 정리
			검정색
			label02 - 승인대기중
			label02 - 조리중
			label02 - 배달중
			label02 - 포장완료 
			회색
			label03 - 배달완료 
			label03 - 포장완료 
			label03 - 픽업완료 
			빨간색
			label01 - 취소완료 -->
			<ul>
				<c:forEach var="result" items="${resultList }">
					<c:if test="${result.orderState eq '승인대기중' || result.orderState eq '조리중' || result.orderState eq '배달중' || result.orderState eq '포장완료'}">
						<li>
							<p class="date"><span><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${result.regDate }"/></span>
							<a href="order_view.do?orderInfoIdx=${result.orderInfoIdx}" class="view">주문상세</a></p>
							<div class="info">
								<p class="img"><img alt="메뉴정보" src="/_img/_img/cont/best_bg.png" style="background:url('/_img/_img/cont/food01.jpg')no-repeat 50% 50% / cover;"></p>
								<div class="text">
									<p class="store"><a href="restaurant_view.do?restIdx=${result.restIdx}">${result.restName }</a></p> <!-- 가게 상세로 이동 -->
									<p class="b">${result.deliveryMethod }</p>
									<p class="label02">${result.orderState }</p>
								</div><!-- //text -->
							</div><!-- //info -->
						</li>
					</c:if>
				</c:forEach> 
			</ul>
			<p class="tit">과거 주문 내역<p>
			<ul>
				<c:forEach var="result" items="${resultList }">
					<c:if test="${result.orderState eq '배달완료' || result.orderState eq '취소완료'}">
						<li>
							<p class="date"><span><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${result.regDate }"/></span>
							<a href="order_view.do?orderInfoIdx=${result.orderInfoIdx}" class="view">주문상세</a></p>
							<div class="info">
								<p class="img"><img alt="메뉴정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/food02.jpg')no-repeat 50% 50% / cover;"></p>
								<div class="text">
									<p class="store"><a href="restaurant_view.do?restIdx=${result.restIdx }">${result.restName }</a></p>
									<c:if test="${result.orderState eq '배달완료' || result.orderState eq '포장완료'|| result.orderState eq '픽업완료'}">
									<p class="label03">${result.orderState }</p>
									</c:if>
									<c:if test="${result.orderState eq '취소완료'}">
									<p class="label01">취소완료</p>
									</c:if>
								</div><!-- //text -->
							</div><!-- //info -->
						</li>
					</c:if>
				</c:forEach> 
			</ul>
			</div>
			<%@include file="../../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<!-- 주문하기 선택 시 노출 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="mb20 c">주문이 완료되었습니다.</p>
				<p class="btn"><a href="order.html">확인</a></p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>