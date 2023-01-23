<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
//레프트메뉴
$(function(){
	$(".depth").hide();
	$(".depth02").hide();
	$('ul.left_menu li:has(.depth)').children('a').addClass('more');
	$('ul.depth li:has(.depth02)').children('a').addClass('more');

	//서브메뉴 조작
	$("ul.left_menu > li > a").on("click",function() {
		$("ul.left_menu > li > a").removeClass("on");
		$(this).addClass("on");
		$(this).next("ul.depth").slideToggle();
	});

	//서브메뉴2 조작
//	$("ul.depth > li > a.more").on("click",function() {
//		var depth02 = $(this).data("depth02");
//		if($(this).hasClass("on")) {
//			$(this).removeClass("on");
//			$(".depth02").hide();
//		} else {
//			$("ul.depth li a").removeClass("on");
//			$(this).addClass("on");
//			$(".depth02").show();
//		}
//	});

	//서브메뉴2 조작
	$("ul.depth > li > a").on("click",function() {
		$("depth02").hide();
		$("ul.depth > li > a").removeClass("on");
		$(this).addClass("on");
		$(this).next("depth02").slideToggle();
	});
	

	  //펼침 유지부분 
	if("<?=$page_num_depth_02 ?>" != ""){
      $(".depth").show();
     } 

 	if("<?=$page_num_depth_03 ?>" != ""){
      $(".depth02").show();
     } 
});
</script>


<script type="text/javascript">
//레프트메뉴
$(function(){
	$(".depth").hide();
	$(".depth02").hide();


	$("ul.left_menu > li > a").on("click",function() {
		$(".depth").hide();
		$("ul.left_menu li a").removeClass("on");
		$(this).addClass("on");
		if ($(this).hasClass('on')) {
			$(this).next("ul.depth").show();
		};
	});

	$('ul.depth li:has(.depth02)').children('a').addClass('more');


	$("ul.depth li a.more").on("click",function() {
//		var depth02 = $(this).data("depth02");
		if($(this).hasClass("on")) {
			$(this).removeClass("on");
			$(".depth02").hide();
		} else {
			$("ul.depth li a").removeClass("on");
			$(this).addClass("on");
			$(".depth02").show();
		
		}
	});


	
});
</script>


<div id="left">
	<ul class="left_menu">
		<li>
			<a href="#"> <!-- <?if($page_num_depth_01 == "1"){?>class="on"<?}?>> -->회원관리</a>
		</li>
		<li>
			<a href="/ics/orglist.html"> <!-- <?if($page_num_depth_01 == "2"){?>class="on"<?}?>> -->기관관리</a>
		</li>
		<li>
			<a href="#"> <!-- <?if($page_num_depth_01 == "3"){?>class="on"<?}?>> -->인정평가관리</a>		
			<ul class="depth">
				<li><a href="/ics/project01.html"> <!-- <?if($page_num_depth_02 == "1"){?>class="on"<?}?>> -->프로젝트관리</a></li>
				<li><a href="/ics/schedule.html"> <!-- <?if($page_num_depth_02 == "2"){?>class="on"<?}?>> -->스케줄관리</a></li>
				<li><a href="/ics/plan01.html"> <!-- <?if($page_num_depth_02 == "3"){?>class="on"<?}?>> -->계획관리</a></li>
				<li><a href="#"> <!-- <?if($page_num_depth_02 == "4"){?>class="on"<?}?>> -->보고관리</a></li>
				<li><a href="#"> <!-- <?if($page_num_depth_02 == "5"){?>class="on"<?}?>> -->평가사관리</a>
					<ul class="depth02">
						<li><a href="/ics/appraiser01.html"> <!-- <?if($page_num_depth_03 == "1"){?>class="on"<?}?>> -->평가사정보등록</a></li>
					</ul>
				</li>
				</li>
			</ul>
			

		</li>
		<li>
			<a href="#"> <!-- <?if($page_num_depth_01 == "4"){?>class="on"<?}?>> -->통계관리</a>
		</li>

		<li>
			<a href="#"> <!-- <?if($page_num_depth_01 == "5"){?>class="on"<?}?>> -->기타관리</a>
		</li>

	</ul>
</div>
