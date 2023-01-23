<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_inc/title.jsp" %>

</head>
<script>
//내친구 팝업
$(document).ready(function() {  
	$(".tit_small_gray").click(function(){    
		$(".tit_small_pop").fadeToggle();
	});

	$(".menu").click(function(){    
		$(".tit_small_pop").hide();
	});
});

function displayedAt(createdAt) {
		
	  const milliSeconds = new Date() - Date.parse(createdAt)
	  
	  const seconds = milliSeconds / 1000
	  if (seconds < 60) return document.write( "방금 전");
	  
	  const minutes = seconds / 60
	  if (minutes < 60) return document.write(Math.floor(minutes)+"분 전");
	  
	  const hours = minutes / 60
	  if (hours < 24) return document.write(Math.floor(hours)+"시간 전");
	  const days = hours / 24
	  if (days < 7) return document.write(Math.floor(days)+"일 전");
	  const weeks = days / 7

	  if (weeks < 5) return document.write(Math.floor(weeks)+"주 전");
	  const months = days / 30
	  if (months < 12) return document.write(Math.floor(months)+"개월 전");
	  const years = days / 365
	  return document.write(Math.floor(years)+"년 전");
	};

</script>
<body>

	<header class="sub">
	<%@include file="../_inc/header.jsp" %>
	</header>


	<div id="wrap">
	<!-- HEADER BEGIN -->
		<div class="navi">
			<div class="top_navi flex">
				<div class="left">
					<a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a>
					<h2>알림</h2>
				</div>
				<p class="right">
					<a href="#" class="r_btn bt_black" onclick="layer_open('delPop','del_Pop')">선택 삭제</a>
				</p>
			</div>
		</div>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents">
			<ul class="alarm_list check">
				<li class="comment on">
					<p><input type="checkbox" id="a_list01" class="fs0"/><label for="a_list01"></label></p>
					<div>
						<p class="alarm">
							<span class="icon">
								<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="13"><path d="M256 32V51.2C329 66.03 384 130.6 384 208V226.8C384 273.9 401.3 319.2 432.5 354.4L439.9 362.7C448.3 372.2 450.4 385.6 445.2 397.1C440 408.6 428.6 416 416 416H32C19.4 416 7.971 408.6 2.809 397.1C-2.353 385.6-.2883 372.2 8.084 362.7L15.5 354.4C46.74 319.2 64 273.9 64 226.8V208C64 130.6 118.1 66.03 192 51.2V32C192 14.33 206.3 0 224 0C241.7 0 256 14.33 256 32H256zM224 512C207 512 190.7 505.3 178.7 493.3C166.7 481.3 160 464.1 160 448H288C288 464.1 281.3 481.3 269.3 493.3C257.3 505.3 240.1 512 224 512z"/></svg>
							</span>
							새 댓글이 달렸어요
						</p>
						<p class="tt">도서관 레스티오는 어디에요?</p>
						<p class="bottom"><span class="source">자유게시판</span><span class="date">05월 09일 12:30</span></p>
					</div>
				</li>

				<li class="fd on">
					<p><input type="checkbox" id="a_list02" class="fs0"/><label for="a_list02"></label></p>
					<div>
						<p class="alarm">
							<span class="icon">
								<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="17"><path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3c-95.73 0-173.3 77.6-173.3 173.3C0 496.5 15.52 512 34.66 512H413.3C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM479.1 320h-73.85C451.2 357.7 480 414.1 480 477.3C480 490.1 476.2 501.9 470 512h138C625.7 512 640 497.6 640 479.1C640 391.6 568.4 320 479.1 320zM432 256C493.9 256 544 205.9 544 144S493.9 32 432 32c-25.11 0-48.04 8.555-66.72 22.51C376.8 76.63 384 101.4 384 128c0 35.52-11.93 68.14-31.59 94.71C372.7 243.2 400.8 256 432 256z"/></svg>
							</span>
							새 친구요청이 왔어요
						</p>
						<p class="tt">닉네임(이준영) 컴퓨터공학과 16학번</p>
						<p class="bottom"><span class="date">05월 09일 12:30</span></p>
					</div>
				</li>

				<li class="comment">
					<p><input type="checkbox" id="a_list03" class="fs0"/><label for="a_list03"></label></p>
					<div>
						<p class="alarm">
							<span class="icon">
								<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="13"><path d="M256 32V51.2C329 66.03 384 130.6 384 208V226.8C384 273.9 401.3 319.2 432.5 354.4L439.9 362.7C448.3 372.2 450.4 385.6 445.2 397.1C440 408.6 428.6 416 416 416H32C19.4 416 7.971 408.6 2.809 397.1C-2.353 385.6-.2883 372.2 8.084 362.7L15.5 354.4C46.74 319.2 64 273.9 64 226.8V208C64 130.6 118.1 66.03 192 51.2V32C192 14.33 206.3 0 224 0C241.7 0 256 14.33 256 32H256zM224 512C207 512 190.7 505.3 178.7 493.3C166.7 481.3 160 464.1 160 448H288C288 464.1 281.3 481.3 269.3 493.3C257.3 505.3 240.1 512 224 512z"/></svg>
							</span>
							새 댓글이 달렸어요
						</p>
						<p class="tt">오늘 학식 먹을만 한가요? 그냥 사먹을 고민중 요즘 학식 진짜</p>
						<p class="bottom"><span class="source">자유게시판</span><span class="date">05월 09일 12:30</span></p>
					</div>
				</li>
			</ul>
			
				</div>
	<!-- CONTENTS END -->

	<!-- POPUP BEGIN -->
	<!-- 삭제 선택 시 노출 -->
	<div class="layer" id="del_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delPop">
			<div class="pop_cont text">
				<p class="mb20 c">선택된 알림을 삭제하시겠습니까?</p>
				<p class="two_btn btn"><a href="/alarmList.do">확인</a><a href="#" class="bt_red cbtn">취소</a></p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->


</div>
	
	
	

</div><!-- main END -->
<%@ include file="../_inc/bottom_menu.jsp" %>
<%@ include file="../_inc/footer.jsp" %>
</body>
</html>