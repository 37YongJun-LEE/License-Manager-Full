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
	<script src="/_js/_js/slick.min.js" type="text/javascript" charset="utf-8"></script>
	<!-- HEADER END -->
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi">
				<div class="top_navi" style="display:flex;justify-content: space-between;">
					<span><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>음식점 정보</h2></span>
					<span>
						<a href="cart.do" class="btn_mini bt_green" style="width:75px; text-align: center;">장바구니</a>
					</span>
					<!-- <button onclick="location.href='/cart.do'" style="width: 20%; float:right;">장바구니</button> -->
				</div>
			</div>
			<div class="slide_wrap">
				<span class="pagingInfo"></span>
				<ul class="photo_slide">
					<!-- <li><a href="javascript:void(0);" onclick="food_prev_slick(this)" src="/_img/_img/cont/food01.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/food01.jpg)no-repeat 50% 50%/cover" alt="음식정 정보"></a></li>
					<li><a href="javascript:void(0);" onclick="food_prev_slick(this)" src="/_img/_img/cont/food02.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/food02.jpg)no-repeat 50% 50%/cover" alt="음식정 정보"></a></li>
					<li><a href="javascript:void(0);" onclick="food_prev_slick(this)" src="/_img/_img/cont/food03.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/food03.jpg)no-repeat 50% 50%/cover" alt="음식정 정보"></a></li> -->
					<c:forEach var="file" items="${fileList }">
						<c:if test="${file.bfType == 'img' }">
							<li><a href="javascript:void(0);" onclick="food_prev_slick(this)" src="/upload/restaurant/${file.fileSrvFile}"><img src="/_img/_img/cont/view_img.png" style="background:url(/upload/restaurant/${file.fileSrvFile})no-repeat 50% 50%/cover"  alt="음식점정보"></a></li>					
						</c:if>					
					</c:forEach>
					<c:if test="${fn:length(fileList) == 0 }">
						<li><a href="javascript:void(0);" src='/_img/_img/cont/eye-slash-solid.png'><img src="/_img/_img/cont/view_img.png" style="background:url('/_img/_img/cont/eye-slash-solid.png')no-repeat 50% 50%/cover"alt="음식점정보" ></a></li>		
					</c:if>
				</ul>
			</div>
			<div class="room_wrap01">
				<p class="tit">${restaurantInfo.restName}  ${(restaurant.deliveryYn eq 'Y')?' <span class="label">배달 가능</span> ': '<span class="label">배달 불가능</span>' }</p>
				<p class="bottom">
					<span class="info"><b>영업시간</b>${restaurantInfo.restOpentime}</span>
					<span class="info"><b>메뉴구분</b>${restaurantInfo.restMenucategory}</span>
					<span class="info"><b>주소</b>${restaurantInfo.restAddr}</span>
					<span class="info"><b>연락처</b>${restaurantInfo.restContact}</span>
				</p>
			</div>
			<div class="room_wrap02">
				<p class="info_tit">사장님 한마디</p>
				<div class="ceo_talk">
				<!-- <p><span class="event">이벤트 진행중</span></p>-->
					${restaurantInfo.restDescription}
				</div>
			</div>
			<div class="room_wrap02 no_line">
				<p class="info_tit">메뉴</p>
				<div class="menu_bx">
					<!--<p class="menu_tit">대표 메뉴</p>--><p class="menu_tit on">대표 메뉴</p>
					<ul class="room_list menu_list">

						<c:forEach var="result" items="${resultList }">
							<c:if test="${result.mainYn eq 'Y'}">
								<li onclick="location.href='/menu_view.do?restIdx=${restaurantVO.restIdx}&menuIdx=${result.menuIdx}'">
									<c:if test="${result.filUsrname ne null || result.filSrvname ne null}">
										<p class="img"><img alt="메뉴정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/menu01.png')no-repeat 50% 50% / cover;"></p>
									</c:if>
									<div>
										<div>
											<p class="tit">${result.menuName }</p>
										</div>
										<p class="bottom">
											<span class="info">${result.menuDesc }</span>
											<b class="price">${result.menuPrice }원</b>
										</p>
									</div>
								</li>							
							</c:if>
						</c:forEach> 
					</ul>

					<p class="menu_tit">사이드 메뉴</p>
					<ul class="room_list menu_list">
						<c:forEach var="result" items="${resultList }">
							<c:if test="${result.mainYn eq 'N'}">
								<li onclick="location.href='/menu_view.do?restIdx=${restaurantVO.restIdx}&menuIdx=${result.menuIdx}'">
									<c:if test="${result.filUsrname ne null || result.filSrvname ne null}">
										<p class="img"><img alt="메뉴정보" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/menu01.png')no-repeat 50% 50% / cover;"></p>
									</c:if>
									<div>
										<div>
											<p class="tit">${result.menuName }</p>
										</div>
										<p class="bottom">
											<span class="info">${result.menuDesc }</span>
											<b class="price">${result.menuPrice }원</b>
										</p>
									</div>
								</li>							
							</c:if>
						</c:forEach> 
					</ul>
				</div>
			</div>

			<div class="bottom_btn"><p class="btn"><a href="/cart.do">장바구니 보기</a></p></div>
				
				
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@ include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<div class="mo_room_pop mo_food_pop">
	<div class="pop_area">
		<!-- NAV BEGIN -->
		<a href="javascript:void(0);" id="btn_cancel" class="close btn_pop_close"><img src="/_img/_img/cont/photo_close.png" width="20"></a>
		<span class="custom_paging"></span>
		<!-- :: 사진확대 가능하도록 해주세요 -->
		<div class="food_img_pop room_img_pop"></div>
	</div>
</div>
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>


<script>

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




</script>