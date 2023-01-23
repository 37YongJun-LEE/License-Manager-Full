<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>

</head>
<script>
function orderDelAction(orderInfoIdx){
	
	var URL = "/order_del_ajax.do"
	$.ajax({
		type 	: "post",
		url 	: "/order_del_ajax.do",
		data 	: {orderInfoIdx : orderInfoIdx},
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data) 
		{
			if(data=="success"){//주문식당 다르면 체크필요
				window.location.href='/order.do';
			}
		}
	});
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
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi small">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>주문상세내역</h2></div>				
			</div>
			<div class="order_list view">
			<!-- 개발:: 주문상태 클래스 정리
			빨간색
			label01 - 주문취소 버튼
			검정색
			label02 - 승인대기중
			label02 - 조리중
			label02 - 배달중
			label02 - 포장완료 
			회색
			label03 - 배달완료 
			label03 - 포장완료 
			label03 - 픽업완료 
			label03 - 취소완료 -->
				<ul>
					<li>
						<p class="date"><span><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${orderInfo.regDate }"/></span></p>
						<div class="info">
							<p class="img"><img alt="메뉴정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/food01.jpg')no-repeat 50% 50% / cover;"></p>
							<div class="text">
								<p class="store"><a href="food_view.html">${orderInfo.restName }</a></p>
								<p class="b">${orderInfo.deliveryMethod }</p>
								<p class="label02">${orderInfo.orderState }</p>
							</div><!-- //text -->
						</div><!-- //info -->
					</li>
				</ul>
				<ul class="cart_list">
					<c:forEach var="orderMenu" items="${orderMenuList }">
						<li>
							<p class="tit"><span>${orderMenu.menuName}</span></p>
							<div class="info">
								<!-- <p class="img"><img alt="메뉴정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/menu01.png')no-repeat 50% 50% / cover;"></p> -->
								<div class="text">
									<p class="option">기본 : <fmt:formatNumber value="${orderMenu.menuPrice }" type="number"/>원</p>
									<c:set var="addMenuName" value="${fn:split(orderMenu.addMenu,',')}" />	
									<c:set var="addMenuPrice" value="${fn:split(orderMenu.addMenuPrice,',')}" />					
									<c:forEach var="result" items="${orderMenu.addMenu}" varStatus="status">
										<p class="option">추가 선택: ${addMenuName[status.index]}<%-- (${addMenuPrice[status.index]}원) --%></p>
									</c:forEach>
									<p class="price">수량${orderMenu.menuCnt}개</p>
								</div><!-- //text -->
							</div><!-- //info -->
							<p class="num"><fmt:formatNumber value="${orderMenu.menuTotalPrice }" type="number"/>원</p>
						</li>
					</c:forEach> 
				</ul>
			</div>

			<div class="order_info">
				<ul class="info">
					<c:if test="${orderInfo.deliveryMethod eq '배달'}">
					<li>
						<p class="b">배달주소</p>
						${orderInfo.address }
						${orderInfo.addressDetailed }
					</li>
					</c:if>
					<li>
						<p class="b">요청사항</p>
						<c:if test="${orderInfo.disposableYn eq 'Y'}">
							일회용 수저, 포크 필요 없어요<br>
						</c:if>
						<c:if test="${orderInfo.disposableYn eq 'N'}">
							일회용 수저, 포크 필요해요<br>
						</c:if>
						${orderInfo.orderRequestDes }
					</li>
				</ul>
				<ul class="amount">
					<li class="number"><span class="tt">${orderInfo.payOption }</span><span class="price"><!-- 계좌번호? --></span></li>
					<li>
						<span class="tt">총 주문금액</span>
						<span class="price" id="finalTotal"><fmt:formatNumber value="${orderInfo.menuTotalPrice }" type="number"/>원</span>
					</li>
					<li class="discount">
						<span class="tt">회원할인(3%)</span>
						<span class="price" id="discountPrice"></span>
					</li>
					<li class="total">
						<span class="tt">총 금액</span>
						<span class="price" id="discountedPrice"><fmt:formatNumber value="${orderInfo.payPrice }" type="number"/>원</span>
					</li>
				</ul>
				<input type="hidden" id="mtp" value="${orderInfo.menuTotalPrice }"> 
			</div>
		 	<c:if test="${orderInfo.orderState eq '승인대기중'}">
				<div class="order_btn"><p class="btn" class="btn"><a href='/menu_view.do?orderInfoIdx=${orderInfo.orderInfoIdx}' class="line">주문취소</a></p></div>
			</c:if> 
			<c:if test="${orderInfo.orderState ne '승인대기중'}">
				<div class="order_btn"><p class="btn" class="btn"><a href="javascript:layer_open('delPop','del_Pop');" class="line">주문내역 삭제</a></p></div>
			</c:if> 
			<%@include file="../../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<!-- 주문내역 삭제 확인 팝업 -->
	<div class="layer" id="del_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delPop">
			<div class="pop_cont text">
				<p class="tit c">주문내역 삭제</p>
				<p class="mb20 c">
					주문내역 삭제 후에는 복구할 수 없습니다.<br />해당 주문내역을 삭제하시겠습니까?
				</p>
				<p class="two_btn btn">
					<a href="" onclick="orderDelAction('${orderInfo.orderInfoIdx}')">확인</a><a
							href="#" class="bt_red cbtn">취소</a>
				</p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
<script>
var discountPrice = $('#mtp').val() * 0.03;
$("#discountPrice").text("- "+numFormat(discountPrice));

function numFormat(num){
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원"; 
}

</script>
</html>