<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../_inc/title.jsp" %>
<body>
<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
		<%@include file="../_inc/header.jsp" %>
		</header>
<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi small">
				<div class="top_navi flex_top_navi">
					<div class="left">
						<a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>닷컴온</h2>
					</div>
					<p>
						<a class="btn_mini bt_green" href="/club_join.do?clubIdx=${clubDetailVO.clubIdx }">가입신청</a>
					</p>
				</div>
			</div>

			<div class="w_box no_line">
				<div class="club_name">
					<p class="img">
						<img src="/_img/_img/cont/best_bg.png" style="background:url('/_img/_img/cont/club_img01.jpg')no-repeat 50% 50% / cover" width="100">
					</p>
					<div class="info">
						<p class="tit">${clubDetailVO.clubName }</p>
		<!-- 				<p class="con"><span>현재 인원수 4명</span></p> -->
					</div>
				</div>
			</div>

			<div class="slide_wrap">
				<span class="pagingInfo"></span>
				<ul class="photo_slide">
					<li><a href="javascript:void(0);" onclick="food_prev_slick(this)" src="/_img/_img/cont/club01.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/club01.jpg)no-repeat 50% 50%/cover" alt="동아리 홍보"></a></li>
					<li><a href="javascript:void(0);" onclick="food_prev_slick(this)" src="/_img/_img/cont/club02.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/club02.jpg)no-repeat 50% 50%/cover" alt="동아리 홍보"></a></li>
					<li><a href="javascript:void(0);" onclick="food_prev_slick(this)" src="/_img/_img/cont/club03.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/club03.jpg)no-repeat 50% 50%/cover" alt="동아리 홍보"></a></li>
				</ul>
			</div>
			<div class="room_wrap02">
				<p class="info_tit">소개글</p>
				<div class="ceo_talk">
					<p>${clubDetailVO.clubComment }</p>
				</div>
			</div>
			<div class="room_wrap02 no_line">
				<p class="info_tit">문의</p>
				<ul class="text_info">
					<li><span>김경태</span><a href="tel:010-0000-0000" class="tel">010-0000-0000</a></li>
				</ul>
			</div>
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
</body>
<%@include file="../_inc/bottom_menu.jsp" %>
<%@include file="../_inc/footer.jsp" %>
</html>
<script>

//사진 슬라이드
$.noConflict();
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