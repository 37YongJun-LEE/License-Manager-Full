<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

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

function Dorm(Type){
	if(Type == 'mo'){
		var cd = 1;
	}
	else if(Type =="hae"){
		var cd = 2
	}
	target = "https://dormmgr.kku.ac.kr/KKU/stdModule/stdOutRegSearch.jsp";
	newWin = 'newWin6';
	
	var frm = document.createElement("form");
	frm.setAttribute("charset", "UTF-8");
	frm.setAttribute("method", "Post"); // Get 또는 Post 입력
	frm.setAttribute("action", target);
	frm.setAttribute("target", newWin);
	
	var hiddenField = document.createElement('input');
	hiddenField.setAttribute('type', 'hidden');
	hiddenField.setAttribute('name', 'DORM_CD');
	hiddenField.setAttribute('value', cd);
	frm.appendChild(hiddenField);
	document.body.appendChild(frm);
	
	//window.open('',newWin,'toolbar=no , location=no , status=no , menubar=no , scrollbars=yes , resizable=yes, width=700 , height=750')
	frm.submit();
	
}
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
	<script src="/_js/_js/slick.min.js" type="text/javascript" charset="utf-8"></script>
	
	<div class="main head_mg">
		<!-- 내친구 -->
		<div class="pd_box pb0">
			<div class="top_tit">
				<p class="tit">내 친구<span class="tit_small_gray"><a href="#">?</a></span></p>
				<div class="tit_small_pop">
					<p class="blue">공강</p>
					<p class="green">현재 수업 없음</p>
					<p class="red">수업중</p>
				</div>
	
				<p class="more"><a href="/mypage/myFriend.do">더보기<span></span><span></span></a></p>
			</div>
		</div>
		
		<div class="friend">
		
		
			<ul class="top"> <!-- 즐겨찾기 되어 있을때  -->
			<c:forEach var="result" items="${friendList}">
				<c:if test="${result.friendIsfav eq 1}">
					<li onclick="location.href='friendView.do?usrIdx=${result.usrIdx}'">
					<span class="star">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>
					</span>
					<c:if test="${result.usrSrvprofilepic != null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/upload/mypage/${result.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p></c:if>
					<c:if test="${result.usrSrvprofilepic == null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/_img/_img/cont/no_photo.png')no-repeat 50% 50% / cover;"></p></c:if>
	
					<c:if test="${result.nowstatus == 'N' }"><p class="border blue"></p></c:if> 
					<c:if test="${result.nowstatus == 'A' }"><p class="border red"></p></c:if>
					<c:if test="${result.nowstatus == 'B' }"><p class="border green"></p></c:if>
					
					<p class="list"> ${result.usrName}</p> <%--시연후 교체 ${result.usrNickname} --%>
					
				</li>
				</c:if>
			</c:forEach>
			</ul>
		
			<ul> 
			<c:forEach var="result" items="${friendList}">
				<c:if test="${result.friendIsfav eq 0}">
					<li onclick="location.href='friendView.do?usrIdx=${result.usrIdx}'">
					<c:if test="${result.usrSrvprofilepic != null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/upload/mypage/${result.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p></c:if>
					<c:if test="${result.usrSrvprofilepic == null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/_img/_img/cont/no_photo.png')no-repeat 50% 50% / cover;"></p></c:if>
					
					<c:if test="${result.nowstatus == 'N' }"><p class="border blue"></p></c:if> 
					<c:if test="${result.nowstatus == 'A' }"><p class="border red"></p></c:if>
					<c:if test="${result.nowstatus == 'B' }"><p class="border green"></p></c:if>
					
					<p class="list"> ${result.usrName}</p> <%--시연후 교체 ${result.usrNickname} --%>
					
				</li>
				</c:if>
			</c:forEach>
			</ul>
		</div>
		<!-- 내친구 END -->
		
		<!-- 학교정보 -->
		<div class="pd_box gray_box">
			<ul class="info_box">
			<!-- location.href='school_info.do'  -->
				<li onclick="location.href='/notice.do'">
					<p class="icon"></p>
					<p>학교 공지</p>
				</li>
				<li onclick="location.href='/majorNotice.do'">
					<p class="icon"></p>
					<p>우리과 공지</p>
				</li>
				<li onclick="location.href='/schedule_annual.do'">
					<p class="icon"></p>
					<p>학사일정</p>
				</li>
				<li onclick="location.href='/campusReport.do'">
					<p class="icon"></p>
					<p>학교시설<br>고장신고</p>
				</li>
				<li onclick="location.href='/diet_haeoreum.do'">
					<p class="icon"></p>
					<p>오늘의 학식</p>
				</li>
				<li onclick="location.href='/restaurant.do'">
					<p class="icon"></p>
					<p>음식점 정보</p>
				</li>
				<li onclick="location.href='/normal_bus.do'">
					<p class="icon"></p>
					<p>버스 시간표</p>
				</li>
				<li onclick="location.href='/taxi.do'">
					<p class="icon"></p>
					<p>택시합승</p>
				</li>
				<li onclick="location.href='/stay.do'">
					<p class="icon"></p>
					<p>기숙사<br>외박신청</p>
				</li>
	 			<li onclick="location.href='/trade/tradeList.do'">
					<p class="icon"></p>
					<p>중고거래</p>
				</li> 	 	
				<!-- <li onclick="location.href='/dormitory.do?type=mo'">
					<p class="icon"></p>
					<p>모시래<br> 기숙사</p>
				</li> -->
				<li onclick="location.href='/librarySeat.do'">
					<p class="icon"></p>
					<p>도서관<br>좌석 현황</p>
				</li>
				<li onclick="location.href='/lost.do'">
					<p class="icon"></p>
					<p>분실물 게시판</p>
				</li>			
	 			<li onclick="location.href='/timetable.do'">
					<p class="icon"></p>
					<p>시간표</p>
				</li> 			
	 			<li onclick="location.href='/board.do'">
					<p class="icon"></p>
					<p>커뮤니티</p>
				</li> 			
	 					
<!-- 			<li onclick="alert('준비중입니다.'); location.href='/tempRoom.do'">
					<p class="icon"></p>
					<p>원룸 정보</p>
				</li> 	  -->
				<li onclick="location.href='/licenseMain.do'">
					<p class="icon"></p>
					<p>자격증 매니저</p>
				</li> 		
				<!-- 추후 추가 -->
	 			<li onclick="location.href='/clubList.do?clubCategory=all'">
					<p class="icon"></p>
					<p>동아리</p>
				</li> 			
	
			</ul
		</div>
		<!-- 학교정보 END -->
	</div>
	
	<div class="notice_box">
		<div class="top_tit">
			<p class="tit">슬대 공지사항</p>
			<p class="more"><a href="#">더보기<span></span><span></span></a></p>
		</div>
		<div class="notice_slide">
			<div onclick="location.href='.html'">
				<p class="writer">학사지원팀</p>
				<p class="tt">2022학년도 2학기 조기졸업 신청안내</p>
				<p class="date">22.08.19</p>
			</div>
			<div onclick="location.href='.html'">
				<p class="writer">대학교육현신원</p>
				<p class="tt">2022학년도 1학기 수강신청 일정, 강의시간표 조회 안내</p>
				<p class="date">22.08.19</p>
			</div>
			<div onclick="location.href='.html'">
				<p class="writer">학사지원팀</p>
				<p class="tt">2022년 8월 교원자격 무시험검정 신청 안내</p>
				<p class="date">22.08.19</p>
			</div>
		</div>
	</div>
	
		<!-- 실시간 인기글 -->
		<div class="pd_box">
			<div class="top_tit">
				<p class="tit">실시간 인기글</p>
				<p class="more"><a href="/boardTop.do" >더보기<span></span><span></span></a></p>
			</div>
	
			<ul class="best_list">
			
				<c:forEach var="result" items="${boardList}">
					<li onclick="location.href='board_view.do?boardIdx=${result.boardIdx}&boardName=${result.boardName}'">
						<div>
							<div>
								<p class="blue">#${result.boardDetailname}</p>
								<p class="tit">${result.boardTitle}</p>
							</div>
								<p class="bottom">
									<span>
								<svg class="luv" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg>
								${result.boardLike}
							</span>
							<span>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M256 32C114.6 32 .0272 125.1 .0272 240c0 49.63 21.35 94.98 56.97 130.7c-12.5 50.37-54.27 95.27-54.77 95.77c-2.25 2.25-2.875 5.734-1.5 8.734C1.979 478.2 4.75 480 8 480c66.25 0 115.1-31.76 140.6-51.39C181.2 440.9 217.6 448 256 448c141.4 0 255.1-93.13 255.1-208S397.4 32 256 32z"/></svg>
								${result.replyNum}
							</span>
							
							<span id ="writeDate">  <script> displayedAt("${result.boardWritedate}") </script>    </span>
							<span>조회수 ${result.boardViewnum}</span>
							
								</p>
						</div>
						<p class="img">
										<c:if test="${result.first != null}">									
												<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url(/upload/board/${result.first })no-repeat 50% 50% / cover;">
										</c:if>
										<c:if test="${result.first == null}">
												<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/best_bg.png')no-repeat 50% 50% / cover;">
										  </c:if>	
										</p>
					</li>
				</c:forEach>
		</div>
		<!-- 배너 -->
		<p class="banner">
			<img alt="배너" src="/_img/_img/cont/main_banner.jpg">
		</p>
		<!-- 배너 END -->
	
		<%@ include file="../_inc/bottom_menu.jsp" %>
		<%@ include file="../_inc/footer.jsp" %>
	<!-- main END -->
</body>
<script>
//공지사항 슬라이스


	
	$('.notice_slide').slick({	
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
		centerPadding: '30px',
		centerMode: true,
	});


</script>
</html>
