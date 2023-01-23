<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
<script>
function nullBasketAction(){ 
	alert("장바구니가 비었습니다."); 
		window.location.href='/restaurant.do';
} 

var originalTotalPrice = ${totalPrice};
originalTotalPrice *= 1;
var discountPrice = originalTotalPrice * 0.03;
var discountedPrice = originalTotalPrice - discountPrice;
$(function(){			//초기 세팅 
	$("#discountPrice").text("- "+numFormat(discountPrice));
	$("#discountedPrice").text(numFormat(discountedPrice));
	$("#finalTotal").text(numFormat(originalTotalPrice));
	
});

function numFormat(num){
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원"; 
}

function plusNum(count){
	var current = $("#menuCnt"+count).val()*1; //현재 메뉴 갯수 가져오기
	$("#menuCnt"+count).val(current + 1); //메뉴 갯수 증가
	changePrice(count); //가격 변경 함수 실행
	originalTotalPrice += $("#price"+count).val()*1; //최종 가격 변경
	formatPrice();//총 가격 포맷팅
	if($("#menuCnt"+count).val() <= 1){ 
		$("#minus"+count).addClass("disabled"); //메뉴 갯수가 1이하면 minus버튼 비활성화
	}else{
		$("#minus"+count).removeClass("disabled"); //minus버튼 활성화
	}
}

function minusNum(count){
	var current = $("#menuCnt"+count).val()*1; //현재 메뉴 갯수 가져오기
	if(current <= 1){ //메뉴 갯수가 1이하면 반환
		return false;
	}else{
		$("#menuCnt"+count).val(current - 1); //메뉴 갯수 감소
		changePrice(count); //가격 변경 함수 실행
		originalTotalPrice -= $("#price"+count).val(); //최종 가격 변경
		formatPrice();//총 가격 포맷팅
		if($("#menuCnt"+count).val() <= 1){
			$("#minus"+count).addClass("disabled"); //메뉴 갯수가 1이하면 minus버튼 비활성화
		}else{
			$("#minus"+count).removeClass("disabled"); //minus버튼 활성화
		}
	}
}

function changePrice(count){
	var price = $("#price"+count).val()*1; //원가
	var totalPrice = price * $("#menuCnt"+count).val(); //메뉴 가격 계산
	
	$("#menuPrice"+count).text(numFormat(totalPrice)); //가격 formatting
	
}

function formatPrice(){
	discountPrice = originalTotalPrice * 0.03;
	discountedPrice = originalTotalPrice - discountPrice;
	
	$("#discountPrice").text("- "+numFormat(discountPrice));
	$("#discountedPrice").text(numFormat(discountedPrice));
	$("#finalTotal").text(numFormat(originalTotalPrice));
}

function cartDelAction(basketIdx){
	$.ajax({
		type 	: "post",
		url 	: "/cart_del_ajax.do",
		data 	: {basketIdx : basketIdx},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data) 
		{
			if (data == "success") {
				window.location.reload();
			}
		}
	});
} 

//전달 방법 선택
var deliMethod = "배달";
function deliveryMethodSelected(value) {
	deliMethod = value;
	if(deliMethod=="배달"){
		$("#deliveryDiv").show();
		$("#notDeliveryDiv").show();
	}else{
		$("#deliveryDiv").hide();
		$("#notDeliveryDiv").show();
	}
}

//결제 방식 선택
var payOption = "";
function payOptionSelected(value) {
	payOption = value;
}


function submit(){

	//주문번호 생성
	function rand() {
		  return Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000;
	}
	//주소
	var address = document.getElementById('address_kakao').value;
	//상세 주소
	var addressDetailed = document.getElementById('address_detail').value;
	//일회용품 유무 선택
	var dispYn = 'Y'
    if ($('#disposableYn').is(":checked")) {
    	dispYn = 'Y';
    }else{
    	dispYn = 'N';
    }
	//요청사항 
	var orderRequestDes = document.getElementById('orderRequestDes').value;
	
	//주문 메뉴 종류 수 
 	var orderListSize = document.getElementById('orderListSize').value;

	//ORDER_INFO, ORDER_MENU 테이블 데이터 
	var formData = new FormData();
	formData.append("regIdx",'${resultList[0].regIdx}');
	formData.append("orderNum",rand());
 	formData.append("restIdx",'${resultList[0].restIdx}');
 	formData.append("restName",'${resultList[0].restName}');
 	formData.append("menuTotalPrice", originalTotalPrice);
	formData.append("deliveryMethod", deliMethod);
	formData.append("address", address);
	formData.append("addressDetailed", addressDetailed);
	formData.append("disposableYn", dispYn);
	formData.append("orderRequestDes", orderRequestDes);
	formData.append("payPrice", discountedPrice);
	formData.append("payOption", payOption);
	formData.append("orderState", "주문완료 (결제대기중)"); 
	formData.append("orderListSize", orderListSize); 
 	
	//ORDER_MENU 테이블 데이터 
  	for(i=1;i<=orderListSize;i++){
  	 	var orderMenuIdx = document.getElementById('menuIdx'+i).value; 
  	 	orderMenuName = document.getElementById('menuName'+i).value;
  	 	orderAddMenu = document.getElementById('addMenu'+i).value;
  	 	orderAddMenuPrice = document.getElementById('addMenuPrice'+i).value;
  	 	orderMenuCnt = document.getElementById('menuCnt'+i).value;
  	 	orderMenuPrice = document.getElementById('menuPrice'+i).value;
  	 	
		formData.append("menuIdx"+i, orderMenuIdx); 
		formData.append("menuName"+i, orderMenuName); 
		formData.append("addMenu"+i, orderAddMenu); 
		formData.append("addMenuPrice"+i, orderAddMenuPrice); 
		formData.append("menuCnt"+i, orderMenuCnt); 
		formData.append("menuPrice"+i, orderMenuPrice); 
	}  
	
	if(deliMethod == "배달"){
		if(address == ""){
			layer_open('sendPop','send_Pop');
			$("#popContOne").show();
			$("#popContTwo").hide();
			return false;
		} 
	}
	if(payOption == ""){
		layer_open('sendPop','send_Pop');
		$("#popContOne").hide();
		$("#popContTwo").show();
		return false;
	}
	
	var URL = "/order_add_ajax.do"
	$.ajax({
		type 	: "post",
		url 	: URL,
		async 	: false, 
		data 	: formData,
		contentType : false,
		processData : false,
		success : function(data) 
		{
			if(data=="success"){
				layer_open('okPop','ok_Pop');
			}
		}, 
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
}


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
			
		<div class="navi small">
			<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>장바구니</h2></div>				
		</div>
			
			<div class="cart_box">
			
				<!-- 가게이름 -->
				<p class="store">${resultList[0].restName }</p>
				
				<!-- DB에 들어있는 장바구니 메뉴 종류 수(현재 페이지에서 수량 변경 가능) -->
				<input type="hidden" id="orderListSize" value="${fn:length(resultList)}"> 
				
				<!-- {menuName=닭떡이, menuDesc=각무+콘샐러드+부추전+공기밥1+콜라500ml, menuPrice=20000, menuCnt=1, menuTotalPrice=26000, addMenu=김말이,튀김만두,주먹밥, filPath=null, filSrvname=null, filUsrname=null, restName=짱돌}  -->
				<ul class="cart_list">
				<c:choose>
				    <c:when test="${fn:length(resultList) == 0}">
				    	<script>
							nullBasketAction();
						</script>
				    </c:when>
			    	<c:otherwise>
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<li>
								<p class="tit"><span>${result.menuName }</span>
									<a href="#" class="cancle" id="delete" onclick="cartDelAction('${result.basketIdx}')">취소</a></p>
								<div class="info">
								<c:if test="${fn:length(result.filSrvname) gt 0 }">
									<p class="img"><img alt="메뉴정보" src="/_img/_img/cont/best_bg.png" style="background: url('/upload/${result.filPath}/${result.filSrvname }')no-repeat 50% 50% / cover;"></p>
								</c:if>							
								<div class="text">
									<p class="option">${result.menuDesc }</p>
									<p class="option">추가 메뉴 : ${result.addMenu }</p>
									<input class="price" id="price${status.count }" type="hidden" value="${result.menuTotalPrice/result.menuCnt }" /> <!-- 메뉴 1개 당 가격 -->
									<%-- <input class="calPrice" type="hidden" value="${result.menuTotalPrice }" /> --%>
									<p class="price"><fmt:formatNumber value="${result.menuTotalPrice }" type="number"/>원</p>
								</div><!-- //text -->
							</div><!-- //info -->
							<div class="ch_num">
								<!-- 개발 :: 수량이 1일때는 상품수량 제거버튼 비활성화 시켜주세요 :: button 클래스에 disabled 추가하면 됩니다. -->
								<button class="minus <c:if test="${result.menuCnt eq '1'}">disabled</c:if>" id="minus${status.count }" onclick="minusNum('${status.count}')">상품수량 1개 제거</button>
								<input id="menuCnt${status.count }" type="number" class="number" value="${result.menuCnt }"><label for="">구매수량</label>
								<button class="plus" id="plus${status.count }" onclick="plusNum('${status.count}')">상품수량 1개 추가</button>
							</div>
							</li>
							<!-- formData에 넣을 hidden -->
							<input type="hidden" id="menuIdx${status.count }" value="${result.menuIdx }"> 
							<input type="hidden" id="menuName${status.count }" value="${result.menuName }"> 
							<input type="hidden" id="addMenu${status.count }" value="${result.addMenu }"> 
							<input type="hidden" id="addMenuPrice${status.count }" value="${result.addMenuPrice }"> 
							<input type="hidden" id="menuPrice${status.count }" value="${result.menuPrice }"> 
							
						</c:forEach>
					</c:otherwise> 
				</c:choose>
					
					<li>
					
					</li>
				</ul>

				<div class="chart_ch order">
					<input onclick="deliveryMethodSelected(this.value);" type="radio" id="order01" name="order" value="배달" checked>
						<label for="order01">배달</label>
					<input onclick="deliveryMethodSelected(this.value);" type="radio" id="order02" name="order" value="포장" >
						<label for="order02">포장</label>
					<input onclick="deliveryMethodSelected(this.value);" type="radio" id="order03" name="order" value="매장" >
						<label for="order03" class="mr0">매장</label>
				</div>
                  
				<div id="contents" class="taxi">
					<div class="line_box mt20" id="deliveryDiv">
						<p class="tit">주소 검색</p><br>
	               		<div class="search">
	               		<p class="input_box" style="width: 100%;">
							<input type="text" id="address_kakao" name="address_kakao" placeholder="주소 검색하기" readonly>
							<a href="javascript:void(0);" id="schButton"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
						</p>
						</div>
						
						<p class="tit">상세 주소</p>
	               		<input type="text" value="" id="address_detail"/>
	               	
	            	</div>
	            	<div class="line_box mt20" id="notDeliveryDiv">
	               		<p class="tit">요청 사항</p>
	               		<input type="checkbox" id="disposableYn" name="disposableYn">
	               			<label for="disposableYn">일회용 수저, 포크  안 주셔도 돼요</label>

	               		<input type="text" value="" id="orderRequestDes" placeholder="ex)단무지 빼주세요"/>
	            	</div>
	            </div>
				<div class="chart_ch">
					<p class="b">결제방식 선택</p>
					<input onclick="payOptionSelected(this.value);" type="radio" id="pay01" name="pay" value="계좌이체">
						<label for="pay01">계좌이체</label>
					<input onclick="payOptionSelected(this.value);" type="radio" id="pay02" name="pay" value="현장카드결제">
						<label for="pay02">현장카드결제</label>
					<input onclick="payOptionSelected(this.value);" type="radio" id="pay03" name="pay" value="카카오페이">
						<label for="pay03">카카오페이</label>
				</div>

				<ul class="amount">
					<li>
						<span class="tt">총 주문금액</span>
						<span class="price" id="finalTotal">${totalPrice}</span>
					</li>
					<li class="discount">
						<span class="tt">회원할인(3%)</span>
						<span class="price" id="discountPrice"></span>
					</li>
					<li class="total">
						<span class="tt">총 금액</span>
						<span class="price" id="discountedPrice"></span>
					</li>
				</ul>
			</div>

			<div class="bottom_btn"><p class="btn"><a href="javascript:submit();">주문하기</a></p></div>
			
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
<!-- POPUP BEGIN -->

   <div class="layer" id="send_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop">
			<div class="pop_cont text" id="popContOne">
				<p class="mb20 c">주소를 입력해주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
 			<div class="pop_cont text" id="popContTwo">
				<p class="mb20 c">결제 수단을 선택해주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
		</div>
	</div>
	
	<!-- 주문하기 선택 시 노출 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="mb20 c">주문이 완료되었습니다.</p>
				<p class="btn"><a href="order.do">확인</a></p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                //document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
                window.open('','_self').close(); 
            }
        }).open();
    });
}
</script>

</html>