<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>

<body>
	
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="club head_mg mb140">
			<div class="navi small">
				<div class="top_navi flex_top_navi">
					<div class="left">
						<a href="/clubList.do?clubCategory=all"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>${clubDetailVO.clubName}(${clubDetailVO.clubCategory }동아리)</h2>
					</div>

					<!-- 동아리 관리자만 사용가능하게  -->
					<c:if test="${currectUserInfo.clubUserLev > 0}">
					<p class="mt10">					
						<a href="#none" class="del" onclick="layer_open('morePop','more_Pop')">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M495.9 166.6C499.2 175.2 496.4 184.9 489.6 191.2L446.3 230.6C447.4 238.9 448 247.4 448 256C448 264.6 447.4 273.1 446.3 281.4L489.6 320.8C496.4 327.1 499.2 336.8 495.9 345.4C491.5 357.3 486.2 368.8 480.2 379.7L475.5 387.8C468.9 398.8 461.5 409.2 453.4 419.1C447.4 426.2 437.7 428.7 428.9 425.9L373.2 408.1C359.8 418.4 344.1 427 329.2 433.6L316.7 490.7C314.7 499.7 307.7 506.1 298.5 508.5C284.7 510.8 270.5 512 255.1 512C241.5 512 227.3 510.8 213.5 508.5C204.3 506.1 197.3 499.7 195.3 490.7L182.8 433.6C167 427 152.2 418.4 138.8 408.1L83.14 425.9C74.3 428.7 64.55 426.2 58.63 419.1C50.52 409.2 43.12 398.8 36.52 387.8L31.84 379.7C25.77 368.8 20.49 357.3 16.06 345.4C12.82 336.8 15.55 327.1 22.41 320.8L65.67 281.4C64.57 273.1 64 264.6 64 256C64 247.4 64.57 238.9 65.67 230.6L22.41 191.2C15.55 184.9 12.82 175.3 16.06 166.6C20.49 154.7 25.78 143.2 31.84 132.3L36.51 124.2C43.12 113.2 50.52 102.8 58.63 92.95C64.55 85.8 74.3 83.32 83.14 86.14L138.8 103.9C152.2 93.56 167 84.96 182.8 78.43L195.3 21.33C197.3 12.25 204.3 5.04 213.5 3.51C227.3 1.201 241.5 0 256 0C270.5 0 284.7 1.201 298.5 3.51C307.7 5.04 314.7 12.25 316.7 21.33L329.2 78.43C344.1 84.96 359.8 93.56 373.2 103.9L428.9 86.14C437.7 83.32 447.4 85.8 453.4 92.95C461.5 102.8 468.9 113.2 475.5 124.2L480.2 132.3C486.2 143.2 491.5 154.7 495.9 166.6V166.6zM256 336C300.2 336 336 300.2 336 255.1C336 211.8 300.2 175.1 256 175.1C211.8 175.1 176 211.8 176 255.1C176 300.2 211.8 336 256 336z"/></svg>
						</a>
					</p>
					</c:if>
				</div>
			</div>
			<div class="w_box">

				<!-- 공지사항 -->
				<div class="club_box">
					<div class="tit_btn">
						<p class="club_tit">공지사항</p>
						<!-- 동아리 관리자만 사용가능하게  -->
						<c:if test="${currectUserInfo.clubUserLev > 0}">
							<a href="/club_notice_write.do?clubIdx=${clubDetailVO.clubIdx }" class="sbtn_mini bt_green mb15">작성하기</a>
						</c:if>
						
					</div>
				
					<ul class="club_notice">
					<c:if test="${fn:length(clubViewDetail) eq 1}">
						<c:if test="${result.clubBoardType eq 'NOTICE'}">
								<li>
									<div class="club_user">
										<div class="fm_profile" onclick="location.href='.html'">				
											<p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('./_img/cont/ex_chat.jpg')no-repeat 50% 50% / cover;"></p>
										</div>
										<div>
											<p class="user_name">유저닉네임</p>
											<p class="club_text">
												${result.clubBoardContent}
											</p>
										</div>
									</div>
								</li>

					
							</c:if>
					</c:if>
						<c:forEach var="result" items="${clubViewDetail }">
							<c:if test="${result.clubBoardType eq 'NOTICE'}">
								<li>
									<div class="club_user">
										<div class="fm_profile" onclick="location.href='.html'">				
											<p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('./_img/cont/ex_chat.jpg')no-repeat 50% 50% / cover;"></p>
										</div>
										<div>
											<p class="user_name">유저닉네임</p>
											<p class="club_text">
												${result.clubBoardContent}
											</p>
										</div>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				
				</div>
		
			</div>

			<div class="tab tab_club">
				<ul>
					<li><a href="/club_view.do?clubIdx=${clubDetailVO.clubIdx}&category=board" <c:if test="${state eq 'board' }"> class="on"</c:if> >자유게시판</a></li>
					<li><a href="/club_view.do?clubIdx=${clubDetailVO.clubIdx}&category=gal" <c:if test="${state eq 'gal' }"> class="on"</c:if> >갤러리</a></li>
				</ul>
				<p class="more">
				<c:if test="${state eq 'board' }"> <a href="/club_board.do?clubIdx=${clubVO.clubIdx }">더보기<span></span><span></span></a></c:if>
				<c:if test="${state eq 'gal' }"> <a href="/club_gallery.do?clubIdx=${clubVO.clubIdx }">더보기<span></span><span></span></a></c:if>
				<!-- <a href="#">더보기<span></span><span></span></a> --></p>
			</div>

			<div class="w_box no_line">
			<c:if test="${state eq 'board' }"> <!-- 자유게시판 내용 표시 -->
				<ul class="best_list basic">
					<c:forEach var="result" items="${clubViewDetail }">
						<c:if test="${result.clubBoardType eq 'BOARD'}">
							<li onclick="location.href='/club_board_view.do?clubIdx=${result.clubIdx}&clubBoardIdx=${result.clubBoardIdx}'">
								<div>
									<div>
										<p class="tit">${result.clubBoardTitle}</p>
										<p class="con">${result.clubBoardContent}</p>
									</div>
									<p class="bottom">
										<span>${result.usrName }</span>
										<!-- <span>
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"></path></svg>
											3 
										</span> -->
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M256 32C114.6 32 .0272 125.1 .0272 240c0 49.63 21.35 94.98 56.97 130.7c-12.5 50.37-54.27 95.27-54.77 95.77c-2.25 2.25-2.875 5.734-1.5 8.734C1.979 478.2 4.75 480 8 480c66.25 0 115.1-31.76 140.6-51.39C181.2 440.9 217.6 448 256 448c141.4 0 255.1-93.13 255.1-208S397.4 32 256 32z"></path></svg>
											3
										</span>
										<span>1분전</span>
										<span>조회수 0</span>
									</p>
								</div>
								<p class="img">
									<img alt="자유게시판" src="/_img/_img/cont/best_bg.png" style="background: url('/upload/clubBoard/${result.servFile}')no-repeat 50% 50% / cover;">
								</p>
							</li>
						</c:if>
					</c:forEach>
				
					
					<!-- <li class="nodata">등록된 게시글이 없습니다.</li> -->
						</ul>
					
					</c:if>
					<c:if test="${state eq 'gal'}">
						<ul class="club_gall_list">
						<c:forEach var="result" items="${clubViewDetail }">
							<c:if test="${result.clubBoardType eq 'GALLERY'}">
							<li onclick="location.href='/club_gallery_view.do?clubIdx=${result.clubIdx}&clubBoardIdx=${result.clubBoardIdx}'">
								<p class="img">
								<img alt="자유게시판" src="/_img/_img/cont/best_bg.png" style="background: url('/upload/clubBoard/${result.servFile}')no-repeat 50% 50% / cover;"> 
								</p>
								<p class="txt">${result.clubBoardTitle }</p>
							</li>
							</c:if>
							</c:forEach>
						</ul>
					</c:if>
			
				

				<!-- <p><a href="club_write.html" class="add_btn"></a></p> -->
			</div>
				
		<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
	<!-- CONTENTS END -->
<!-- POPUP BEGIN -->
	<!--  동아리 관리 버튼을 눌렀을 시  -->
	<div class="layer" id="more_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="morePop">
			<div class="pop_cont club_list">
				<ul>
					<li href="#" onclick="location.href='/club_join_view.do?clubIdx=${clubVO.clubIdx}'">
						<p>가입신청 보기</p>
						<a href="#" class="arrow"><img src="/_img/_img/comn/next.png"></a>
					</li>
					<li onclick="location.href='/club_mem.do?clubIdx=${clubVO.clubIdx}'">					
						<p>회원관리</p>
						<a href="#" class="arrow"><img src="/_img/_img/comn/next.png"></a>
					</li>
					<li onclick="location.href='/club_setting.do?clubIdx=${clubVO.clubIdx}'">
						<p>동아리 정보 관리</p>
						<a href="#" class="arrow"><img src="/_img/_img/comn/next.png"></a>
					</li>
				</ul>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->
</body>
</html>

<script>
// 공지사항 슬라이드
$('.club_notice').slick({	
	infinite : true, 	
	slidesToShow : 1,		
	slidesToScroll : 1,		
	speed : 1000,	 
	arrows : false, 		
	dots : true, 		
	autoplay : true,			
	pauseOnHover : true,		
	vertical : false,		
	draggable : true, 	
	centerPadding: '0px',
	 centerMode: true,
});

</script>