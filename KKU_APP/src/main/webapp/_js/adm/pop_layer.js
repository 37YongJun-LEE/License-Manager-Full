function layer_open(el){

		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		}else{
			temp.fadeIn();
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}	



function layer_open(layer_id, tl_pop) {
	var temp = $('#' + layer_id);
	var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수
	
	var layer = ".layer";
	if(tl_pop) layer = "#" + tl_pop;

	if(bg){
		$(layer).fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		$('body').addClass("not_scroll");	// 배경의 스크롤 없앤다.
	}else{
		temp.fadeIn();
	}

	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	else temp.css('left', '0px');

	temp.find('a.cbtn').click(function(e){
		
		if(bg){
			$(layer).fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			$('body').removeClass("not_scroll");
		}else{
			temp.fadeOut();
		}
		e.preventDefault();

	});

	$(layer + ' .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		$(layer).fadeOut();
		e.preventDefault();
	});

	$('p.cbtn').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		$(layer).fadeOut();
		e.preventDefault();
	});
}

