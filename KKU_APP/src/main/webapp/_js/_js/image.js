
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
	

	
	