<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>

</head>
<script>
var originalPrice = '${resultMap.menuPrice}' ;
originalPrice = originalPrice.replace(/,/gi,"");
originalPrice *= 1;
var changedPrice = 0;
var totalPrice = originalPrice;
var menucnt = 0;
var addMenuPrice = 0;
$(function(){
	
	menucnt = $("#menuCnt").val() *1 ; //초기화 
	if(menucnt == 1 ){
		console.log("disabled");
		$(".minus").prop('disabled',true);
		$(".minus").addClass('disabled');
		
	   }
   $(".options").change(function(){
	  
	   if($(this).is(":checked")){
		   totalPrice += ($(this).val()*1) * menucnt;
		   addMenuPrice += ($(this).val()*1) ;
       }else{
    	   totalPrice -= ($(this).val()*1) * menucnt;
    	   addMenuPrice -= ($(this).val()*1) ;
       }

	   var newPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";	   
	   $("p.price").text(newPrice);
   });
   $(".plus").click(function() {
	    menucnt += 1 ;
	   $("#menuCnt").val(menucnt); 
	   totalPrice += originalPrice ;
	   totalPrice += addMenuPrice ;

	   $("p.price").text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");
	   $(".minus").removeClass('disabled');
	   $(".minus").prop('disabled',false);
   });
   $(".minus").click(function() {
		   menucnt -= 1 ;
		   $("#menuCnt").val(menucnt);
		   totalPrice -= originalPrice ;
		   totalPrice -= addMenuPrice ;
		   
		   $("p.price").text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");
		   if(menucnt == 1 ){
			   $(this).prop('disabled',true);
			   $(this).addClass('disabled');
			   }
   });
});

function submit(){
	var addMenuList = [];
	$("input[type='checkbox']:checked").each(function() {

		   var a= $(this).next().text();
		   addMenuList.push(a);

		});
	
	// 추가 선택 메뉴  가격
	//var addMenuPrice = 

	var formData = new FormData();
	formData.append("regIdx",'${resultMap.regIdx}');
 	formData.append("restIdx",'${resultMap.restIdx}');
 	formData.append("restName",'${resultMap.restName}');
	formData.append("menuIdx",'${resultMap.menuIdx}');
	formData.append("menuName",'${resultMap.menuName}');
	formData.append("menuDesc",'${resultMap.menuDesc}');
	formData.append("addMenu", addMenuList);
	formData.append("addMenuPrice", addMenuPrice);
	formData.append("menuCnt", menucnt);
	formData.append("menuPrice",originalPrice);
	formData.append("menuTotalPrice", totalPrice);
	
	var URL = "/cart_add_ajax.do"
	$.ajax({
		type 	: "post",
		url 	: URL,
		async 	: false, 
		data 	: formData,
		contentType : false,
		processData : false,
		success : function(data) 
		{
			if(data=="success"){//주문식당 다르면 체크필요
				layer_open('okPop','ok_Pop');
			}else if(data=="fail"){
				layer_open('chPop','ch_Pop');
			}
			
		}, 
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function cartNewAction(){ //다른 가게의 메뉴 선택해서 기존 메뉴 삭제하고, 새로운 식당의 메뉴로 추가하는 기능
	alert("cartNewAction");

	var addMenuList = [];
	$("input[type='checkbox']:checked").each(function() {

		   var a= $(this).next().text();
		   addMenuList.push(a);

		});

	var formData = new FormData();
	formData.append("regIdx",'${resultMap.regIdx}');
 	formData.append("restIdx",'${resultMap.restIdx}');
 	formData.append("restName",'${resultMap.restName}');
	formData.append("menuIdx",'${resultMap.menuIdx}');
	formData.append("menuName",'${resultMap.menuName}');
	formData.append("menuDesc",'${resultMap.menuDesc}');
	formData.append("addMenu", addMenuList);
	formData.append("addMenuPrice", addMenuPrice);
	formData.append("menuCnt", menucnt);
	formData.append("menuPrice",originalPrice);
	formData.append("menuTotalPrice", totalPrice);
	
	$.ajax({
		type 	: "post",
		url 	: "/cart_new_ajax.do",
		async 	: false, 
		data 	: formData,
		contentType : false,
		processData : false,
		success : function(data) 
		{
			if (data == "success") {
				layer_open('okPop','ok_Pop');
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
			<div class="navi">
				<div class="top_navi" style="display:flex;justify-content: space-between;">
					<span><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>음식 정보</h2></span>
					<span>
						<a href="cart.do" class="btn_mini bt_green" style="width:75px; text-align: center;">장바구니</a>
					</span>
					<!-- <button onclick="location.href='/cart.do'" style="width: 20%; float:right;">장바구니</button> -->
				</div>
			</div>
			<div class="slide_wrap">
				<span class="pagingInfo"></span>
				<ul class="photo_slide">
					<li><a href="javascript:void(0);" onclick="food_prev_slick(this)" src="/_img/_img/cont/menu01.png"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/menu01.png)no-repeat 50% 50%/cover" alt="메뉴정보"></a></li>
					<li><a href="javascript:void(0);" onclick="food_prev_slick(this)" src="/_img/_img/cont/menu02.png"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/menu02.png)no-repeat 50% 50%/cover" alt="메뉴정보"></a></li>
					<li><a href="javascript:void(0);" onclick="food_prev_slick(this)" src="/_img/_img/cont/menu03.png"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/menu03.png)no-repeat 50% 50%/cover" alt="메뉴정보"></a></li>
				</ul>
			</div>
			
			<div class="menu_info">
				<div class="top">
					<p class="menu_tit">${resultMap.menuName}</p>
					<p class="menu_text">${resultMap.menuDesc}</p>
				</div>
				<ul class="bottom">
					<li class="price"><span class="b">가격</span><b>${resultMap.menuPrice}원</b></li>
					<li>
						<span class="b">추가 선택</span>
						
						<ul class="option">
							<c:set var="price" value="${fn:split(resultMap.addMenuPrice,',')}" />
							<c:forEach var="result" items="${resultMap.addMenu}" varStatus="status">
								<li>
									<input type="checkbox" id="option0${status.index}" value="${price[status.index]}" class="options"><label for="option0${status.index}">${result }</label>
									
									<span class="price"> <fmt:formatNumber value="${price[status.index]}" pattern="#,###"/> 원</span>
								</li>
								
							</c:forEach>

						</ul>
					</li>
					<li class="stock_num">
						<span class="b">수량</span>
						<div class="ch_num">
							<!-- 개발 :: 수량이 1일때는 상품수량 제거버튼 비활성화 시켜주세요 :: button 클래스에 disabled 추가하면 됩니다. -->
							<button class="minus ">상품수량 1개 제거</button>
							<!-- 제거버튼 활성화일때 -->
							<!-- <button class="minus">상품수량 1개 제거</button> -->
							<input id="menuCnt" type="number" class="number" value="1" name="menuCnt"><label for="">구매수량</label>
							<button class="plus">상품수량 1개 추가</button>
						</div>
					</li>
					<li class="total">
						<span class="b">총 주문금액</span>
						<p class="price">${resultMap.menuPrice}원</p>
					</li>
				</ul>
			</div>
			<div class="bottom_btn">
				<p class="btn"><a href="javascript:submit();">장바구니 담기</a></p>
			</div>
			</div>
	<!-- CONTENTS END -->
	
		<!-- POPUP BEGIN -->
	<div class="mo_room_pop mo_food_pop">
		<div class="pop_area">
			<!-- NAV BEGIN -->
			<a href="javascript:void(0);" id="btn_cancel" class="close btn_pop_close"><img src="../_img/cont/photo_close.png" width="20"></a>
			<span class="custom_paging"></span>
			<!-- :: 사진확대 가능하도록 해주세요 -->
			<div class="food_img_pop room_img_pop"></div>
		</div>
	</div>
	<!-- POPUP END -->
	
	<!-- POPUP BEGIN -->
	<!-- 주문하기 선택 시 노출 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="mb20 c">장바구니에 추가되었습니다.</p>
				<p class="btn"><a href="javascript:history.back();">확인</a></p>
			</div> 
		</div>
	</div>
	
	<div class="layer" id="ch_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="chPop">
			<div class="pop_cont text">
				<p class="tit c">장바구니 새로 담기</p>
				<p class="mb20 c">
					장바구니에 같은 가게의 메뉴만 담을 수 있습니다.<br />이전에 담은 메뉴를 삭제하고 새로 담으시겠습니까?
				</p>
				<p class="two_btn btn">
					<a href="javascript:history.back();" onclick="cartNewAction()">확인</a><a
							href="#" class="bt_red cbtn">취소</a>
				</p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->

	</div>
	<!-- //wrap -->
			
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
		</div>
	


</div>
<!-- //wrap -->

</body>
<script>
jQuery.noConflict();
//사진 슬라이드
var $status = $('.pagingInfo');
var $slickElement = $('.photo_slide');

$slickElement.on('init reInit afterChange', function(event, slick, currentSlide, nextSlide){
    var i = (currentSlide ? currentSlide : 0) + 1;
    $status.text(i + '/' + slick.slideCount);
});



$slickElement.slick({
    slide: 'li',		
	infinite : true, 	
	slidesToShow : 1,		
	slidesToScroll : 1,		
	speed : 100,	 
	arrows : false, 		
	dots : false, 		
	autoplay : false,			
	pauseOnHover : true,		
	vertical : false,		
	draggable : true, 	
});


//이미지 확대 팝업 
	function food_pre(e) {
		var obj = e;
		obj.setAttribute('id','fo');
		$('.food_img_pop').hide();
		document.getElementById('pfood').setAttribute('src',obj.getAttribute('src'));
		$('.mo_food_pop').show();
		$('html, body').addClass('fix');
	}
	function food_prev_slick(e) {
		if ($('.food_img_pop img').length > 0) {
			jQuery('.food_img_pop').slick('slickRemove', null, null, true);
			jQuery('.food_img_pop').slick('unslick');
			$('.food_img_pop').empty();
		}
		$('#pfood').hide();
		var obj = e;
		obj.setAttribute('id','fo');
		var $el = $(obj);
		var $food_img_list = $el.closest('.photo_slide').find('.slick-slide:not(.slick-cloned) a');
		var img_index = 0;
		$food_img_list.each(function(idx) {
			if ($el.attr('src') == $(this).attr('src')) img_index = idx;
			$('.food_img_pop').append('<div><img src="'+ $(this).attr('src') +'" style="width:100%;" /></div>');
		});

		$('.mo_food_pop').show();
		
		jQuery(".food_img_pop").slick({
			infinite: true,
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows : false, 	
			initialSlide : img_index,
			dots: true,
			dotsClass: 'custom_paging',
			customPaging: function (slider, i) {
			    console.log(slider);
			    return  (i + 1) + '/' + slider.slideCount;
			}
		});

		$(".food_img_pop").not('.slick-initialized').slick()

		$('html, body').addClass('fix');
	}
	$('#btn_cancel').click(function() {
		$('.mo_food_pop').hide();
		$('html, body').removeClass('fix');
		$('#fo').focus();
		var obj = document.getElementById("fo");
		obj.removeAttribute('id');
	});
	$('#btn_cancel')


//메뉴 슬라이드업
$(".menu_tit").click(function () {
	$(this).next('.menu_list').slideToggle();
	$(this).toggleClass('on');
		
    })

</script>
</html>
