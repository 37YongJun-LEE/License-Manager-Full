<%@page pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

			
<script>

function sendSearch(){
	var searchVal = $("#search").val();
	if (searchVal != null && window.event.keyCode == 13) {
			location.href="/searchResult.do?searchVal="+searchVal;
		        }
	
	
} 
</script>
<div class="head">
	<h1><a href="/main.do"><img src="/_img/_img/comn/logo.png" alt="건국대학교 커뮤니티 앱"></a></h1>
	<div class="right">
		<p>
			<!-- <a href="#" class="search">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"/></svg>
			</a> -->
			<a href="/alarmList.do " class="bell">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M256 32V51.2C329 66.03 384 130.6 384 208V226.8C384 273.9 401.3 319.2 432.5 354.4L439.9 362.7C448.3 372.2 450.4 385.6 445.2 397.1C440 408.6 428.6 416 416 416H32C19.4 416 7.971 408.6 2.809 397.1C-2.353 385.6-.2883 372.2 8.084 362.7L15.5 354.4C46.74 319.2 64 273.9 64 226.8V208C64 130.6 118.1 66.03 192 51.2V32C192 14.33 206.3 0 224 0C241.7 0 256 14.33 256 32H256zM224 512C207 512 190.7 505.3 178.7 493.3C166.7 481.3 160 464.1 160 448H288C288 464.1 281.3 481.3 269.3 493.3C257.3 505.3 240.1 512 224 512z"/></svg>
				<span>${loginVO.alarmNum }</span>
			</a>
			<a href="/mypage.do" class="my">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304z"/></svg>
			</a>
			<a href="#" class="menu">
				<span></span>
				<span></span>
				<span></span>
			</a>
		</p>
	</div>
<!-- <form id="frm" action="/serachResult.do" method="post"></form> -->
	<!-- <div class="search_box">
		
		
		<a href="#" class="icon">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg>
		</a>
		<input type="text" placeholder="검색어를 입력해주세요" name = "search" id="search" onkeyup="sendSearch();">
		<a href="#" class="x">
			<span></span>
			<span></span>
		</a>
		
		
	</div> -->
	
</div>



<div class="menu_box">
	<ul class="dep1 top">
		<li>
			<div>
				<p class="tit">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304z"/></svg>
					마이페이지
				</p>
				<p class="down_btn">
					<a href="#">
						<span></span>
						<span></span>
					</a>
				</p>
			</div>
			<ul class="dep2">
				<li onclick="location.href='/mypage.do'"><p>내정보 관리</p></li>
				<li onclick="location.href='#'"></li>
			</ul>
		</li>
	</ul>

	<ul class="dep1">
		<li>
			<div>
				<p class="tit">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M160 32V64H288V32C288 14.33 302.3 0 320 0C337.7 0 352 14.33 352 32V64H400C426.5 64 448 85.49 448 112V160H0V112C0 85.49 21.49 64 48 64H96V32C96 14.33 110.3 0 128 0C145.7 0 160 14.33 160 32zM0 192H448V464C448 490.5 426.5 512 400 512H48C21.49 512 0 490.5 0 464V192zM328.1 304.1C338.3 295.6 338.3 280.4 328.1 271C319.6 261.7 304.4 261.7 295 271L200 366.1L152.1 319C143.6 309.7 128.4 309.7 119 319C109.7 328.4 109.7 343.6 119 352.1L183 416.1C192.4 426.3 207.6 426.3 216.1 416.1L328.1 304.1z"/></svg>
					시간표 · 강의
				</p>
				<p class="down_btn">
					<a href="#">
						<span></span>
						<span></span>
					</a>
				</p>
			</div>
			<ul class="dep2">
				<li onclick="location.href='/timetable.do'"><p>시간표 보기</p></li>
				<li onclick="location.href='/lectureInfo.do?lectureMajor=first'"><p>강의정보</p></li>
			</ul>
		</li>
	</ul>

	<ul class="dep1">
		<li>
			<div>
				<p class="tit">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><path d="M416 176C416 78.8 322.9 0 208 0S0 78.8 0 176c0 39.57 15.62 75.96 41.67 105.4c-16.39 32.76-39.23 57.32-39.59 57.68c-2.1 2.205-2.67 5.475-1.441 8.354C1.9 350.3 4.602 352 7.66 352c38.35 0 70.76-11.12 95.74-24.04C134.2 343.1 169.8 352 208 352C322.9 352 416 273.2 416 176zM599.6 443.7C624.8 413.9 640 376.6 640 336C640 238.8 554 160 448 160c-.3145 0-.6191 .041-.9336 .043C447.5 165.3 448 170.6 448 176c0 98.62-79.68 181.2-186.1 202.5C282.7 455.1 357.1 512 448 512c33.69 0 65.32-8.008 92.85-21.98C565.2 502 596.1 512 632.3 512c3.059 0 5.76-1.725 7.02-4.605c1.229-2.879 .6582-6.148-1.441-8.354C637.6 498.7 615.9 475.3 599.6 443.7z"/></svg>
					커뮤니티
				</p>
				<p class="down_btn">
					<a href="#">
						<span></span>
						<span></span>
					</a>
				</p>
			</div>
			<ul class="dep2">
				<li onclick="location.href='/board.do'"><p>자유게시판</p></li>
				<!-- <li onclick="location.href='/themeboard_list.do'"><p>주제별게시판</p></li> -->
				<li><p></p></li>
			</ul>
		</li>
	</ul>

	<ul class="dep1">
		<li>
			<div>
				<p class="tit">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><path d="M320 128C328.8 128 336 135.2 336 144V160H352C360.8 160 368 167.2 368 176C368 184.8 360.8 192 352 192H320C311.2 192 304 184.8 304 176V144C304 135.2 311.2 128 320 128zM476.8 98.06L602.4 125.1C624.4 130.9 640 150.3 640 172.8V464C640 490.5 618.5 512 592 512H48C21.49 512 0 490.5 0 464V172.8C0 150.3 15.63 130.9 37.59 125.1L163.2 98.06L302.2 5.374C312.1-1.791 327-1.791 337.8 5.374L476.8 98.06zM256 512H384V416C384 380.7 355.3 352 320 352C284.7 352 256 380.7 256 416V512zM96 192C87.16 192 80 199.2 80 208V272C80 280.8 87.16 288 96 288H128C136.8 288 144 280.8 144 272V208C144 199.2 136.8 192 128 192H96zM496 272C496 280.8 503.2 288 512 288H544C552.8 288 560 280.8 560 272V208C560 199.2 552.8 192 544 192H512C503.2 192 496 199.2 496 208V272zM96 320C87.16 320 80 327.2 80 336V400C80 408.8 87.16 416 96 416H128C136.8 416 144 408.8 144 400V336C144 327.2 136.8 320 128 320H96zM496 400C496 408.8 503.2 416 512 416H544C552.8 416 560 408.8 560 400V336C560 327.2 552.8 320 544 320H512C503.2 320 496 327.2 496 336V400zM320 88C271.4 88 232 127.4 232 176C232 224.6 271.4 264 320 264C368.6 264 408 224.6 408 176C408 127.4 368.6 88 320 88z"/></svg>
					학교정보
				</p>
				<p class="down_btn">
					<a href="#">
						<span></span>
						<span></span>
					</a>
				</p>
			</div>
			<ul class="dep2">
				<li onclick="location.href='/notice.do'"><p>학교공지</p></li>
				<li onclick="location.href='/majorNotice.do'"><p>학과공지</p></li>
				<li onclick="location.href='/restaurant.do'"><p>음식점정보</p></li>
				<li onclick="location.href='/diet_mosirae.do'"><p>학식정보</p></li>
				<li onclick="location.href='/schedule_annual1.do'"><p>학사일정</p></li>
				<li onclick="location.href='/schedule_bus.do'"><p>버스시간표</p></li>
			</ul>
		</li>
	</ul>

	<ul class="dep1">
		<li>
			<div>
				<p class="tit">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M575.8 255.5C575.8 273.5 560.8 287.6 543.8 287.6H511.8L512.5 447.7C512.5 450.5 512.3 453.1 512 455.8V472C512 494.1 494.1 512 472 512H456C454.9 512 453.8 511.1 452.7 511.9C451.3 511.1 449.9 512 448.5 512H392C369.9 512 352 494.1 352 472V384C352 366.3 337.7 352 320 352H256C238.3 352 224 366.3 224 384V472C224 494.1 206.1 512 184 512H128.1C126.6 512 125.1 511.9 123.6 511.8C122.4 511.9 121.2 512 120 512H104C81.91 512 64 494.1 64 472V360C64 359.1 64.03 358.1 64.09 357.2V287.6H32.05C14.02 287.6 0 273.5 0 255.5C0 246.5 3.004 238.5 10.01 231.5L266.4 8.016C273.4 1.002 281.4 0 288.4 0C295.4 0 303.4 2.004 309.5 7.014L564.8 231.5C572.8 238.5 576.9 246.5 575.8 255.5L575.8 255.5z"/></svg>
					원룸정보
				</p>
				<p class="down_btn">
					<a href="#">
						<span></span>
						<span></span>
					</a>
				</p>
			</div>
			<ul class="dep2">
				<!-- <li onclick="location.href='room.do?roomLocation=모시래마을'"><p>모시래마을</p></li>
				<li onclick="location.href='room.do?roomLocation=신촌마을'"><p>신촌마을</p></li>
				<li onclick="location.href='room.do?roomLocation=단월동'"><p>단월동</p></li>
				<li onclick="location.href='#'"><p></p></li> -->
				<li onclick="location.href='/tempRoom.do'"><p>모시래마을</p></li>
				<li onclick="location.href='/tempRoom.do'"><p>신촌마을</p></li>
				<li onclick="location.href='/tempRoom.do'"><p>단월동</p></li>
				<li onclick="location.href='#'"><p></p></li>
			</ul>
		</li>
	</ul>

	<ul class="dep1">
		<li>
			<div>
				<p class="tit">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M511.1 63.1v287.1c0 35.25-28.75 63.1-64 63.1h-144l-124.9 93.68c-7.875 5.75-19.12 .0497-19.12-9.7v-83.98h-96c-35.25 0-64-28.75-64-63.1V63.1c0-35.25 28.75-63.1 64-63.1h384C483.2 0 511.1 28.75 511.1 63.1z"/></svg>
					채팅
				</p>
				<p class="down_btn">
					<a href="#">
						<span></span>
						<span></span>
					</a>
				</p>
			</div>
			<ul class="dep2">
				<li onclick="location.href='/chat/chatList.do'"><p>채팅목록</p></li>
				<li onclick="location.href='#'"><p></p></li>
			</ul>
		</li>
	</ul>
	
	<ul class="dep1">
		<li>
			<div>
				<p class="tit">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304z"/></svg>
					개발자소개
				</p>
				<p class="down_btn">
					<a href="#">
						<span></span>
						<span></span>
					</a>
				</p>
			</div>
			<ul class="dep2">
				<li onclick="location.href='/niceGuy.do'"><p>개발자 소개</p></li>
				<li onclick="location.href='#'"></li>
			</ul>
		</li>
	</ul>
	
	
	
 </div>

<script>
// 메뉴 오픈
$(document).ready(function() {  
	$(".menu").click(function(){    
		$(".head").toggleClass("active");
		$(".head_mg").toggleClass("active");
		$(".menu_box").toggleClass("active");
	});
});

// 메뉴 슬라이드 업 다운
$(document).ready(function() {  
	$(".menu_box .down_btn").click(function(){    
		$(this).parent().next(".dep2").slideToggle(300);
		$(this).parent().parent("li").toggleClass("active");
	});
});

// 검색 오픈
$(document).ready(function() {  
	$("header .search").click(function(){    
		$(".search_box").slideToggle(200);
		$(".search_box").toggleClass("active");
	});
});

// 검색 닫기
$(document).ready(function() {  
	$(".search_box .x, .search_box a.icon").click(function(){    
		$(".search_box").slideUp(200);
		$(".search_box").removeClass("active");
	});
});
</script>		