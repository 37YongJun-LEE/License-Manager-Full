<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>

<body>

<div id="wrap">
	<header class="sub">
		<%@include file="../_inc/header.jsp" %>
	</header>

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="/tempRoom.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>모시래마을</h2></div>
			</div>
			<div class="slide_wrap">
				<span class="pagingInfo"></span>
				<ul class="photo_slide">
					<li><a href="javascript:void(0);" onclick="room_prev_slick(this)" src="/_img/_img/cont/room01.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/room01.jpg)no-repeat 50% 50%/cover"  alt="원룸정보"></a></li>
					<li><a href="javascript:void(0);" onclick="room_prev_slick(this)" src="/_img/_img/cont/room02.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/room02.jpg)no-repeat 50% 50%/cover"  alt="원룸정보"></a></li>
					<li><a href="javascript:void(0);" onclick="room_prev_slick(this)" src="/_img/_img/cont/room03.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/room03.jpg)no-repeat 50% 50%/cover"  alt="원룸정보"></a></li>
					<li><a href="javascript:void(0);" onclick="room_prev_slick(this)" src="/_img/_img/cont/room04.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/room04.jpg)no-repeat 50% 50%/cover"  alt="원룸정보"></a></li>
					<li><a href="javascript:void(0);" onclick="room_prev_slick(this)" src="/_img/_img/cont/room05.jpg"><img src="/_img/_img/cont/view_img.png" style="background:url(/_img/_img/cont/room05.jpg)no-repeat 50% 50%/cover"  alt="원룸정보"></a></li>
				</ul>
			</div>
			<div class="room_wrap01">
				<p class="tit">연세 300만원<span class="label">계약가능</span></p>
				<p class="bottom">
					<span class="info"><b>원름 이름</b>모시래원룸</span>
					<span class="info"><b>면적 구분</b>분리형 원룸</span>
				</p>
			</div>
			<div class="room_wrap02">
				<p class="info_tit">옵션정보</p>
				<ul class="room_option">
					<li><img src="/_img/_img/cont/room_desk.png" alt="책상" width="33"><span>책상</span></li>
					<li><img src="/_img/_img/cont/room_closet.png" alt="옷장" width="33"><span>옷장</span></li>
					<li><img src="/_img/_img/cont/room_bed.png" alt="침대" width="33"><span>침대</span></li>
					<li><img src="/_img/_img/cont/room_shoes.png" alt="신발장" width="33"><span>신발장</span></li>
					<li><img src="/_img/_img/cont/room_hanger.png" alt="행거" width="33"><span>행거</span></li>
				</ul>
			</div>
			<div class="room_wrap02 no_line">
				<p class="info_tit">정보</p>
				<ul class="text_info">
					<li><span>주소</span> 모시래마을</li>
					<li><span>연락처</span> <a href="tel:010-0000-0000" class="tel">010-5984-8284</a></li>
				</ul>
			</div>
		<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
	</div>
	<!-- CONTENTS END -->
</div>
</body>
<script>
$.noConflict();

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
	function room_pre(e) {
		var obj = e;
		obj.setAttribute('id','fo');
		$('.room_img_pop').hide();
		document.getElementById('proom').setAttribute('src',obj.getAttribute('src'));
		$('.mo_room_pop').show();
		$('html, body').addClass('fix');
	}
	function room_prev_slick(e) {
		if ($('.room_img_pop img').length > 0) {
			jQuery('.room_img_pop').slick('slickRemove', null, null, true);
			jQuery('.room_img_pop').slick('unslick');
			$('.room_img_pop').empty();
		}
		$('#proom').hide();
		var obj = e;
		obj.setAttribute('id','fo');
		var $el = $(obj);
		var $room_img_list = $el.closest('.photo_slide').find('.slick-slide:not(.slick-cloned) a');
		var img_index = 0;
		$room_img_list.each(function(idx) {
			if ($el.attr('src') == $(this).attr('src')) img_index = idx;
			$('.room_img_pop').append('<div><img src="'+ $(this).attr('src') +'" style="width:100%;" /></div>');
			
		});

		$('.mo_room_pop').show();
		
		jQuery(".room_img_pop").slick({
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

		$(".room_img_pop").not('.slick-initialized').slick()

		$('html, body').addClass('fix');
	}
	
	$('#btn_cancel').click(function() {
		$('.mo_room_pop').hide();
		$('html, body').removeClass('fix');
		$('#fo').focus();
		var obj = document.getElementById("fo");
		obj.removeAttribute('id');
	});
	$('#btn_cancel')




</script>
</html>