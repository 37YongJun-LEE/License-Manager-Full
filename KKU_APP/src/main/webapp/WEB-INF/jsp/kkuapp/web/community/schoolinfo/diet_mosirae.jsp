<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<script src="/_js/_js/slick.min.js" type="text/javascript" charset="utf-8"></script>
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<!-- <div class="tab">
				<ul>
					<li><a href="board.do">자유게시판</a></li>
					<li><a href="themeboard_list.do">주제별 게시판</a></li>
					<li><a href="school_info.do" class="on">학교 정보</a></li>
				</ul>
			</div> -->
			<div class="navi small">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>학식 정보</h2></div>
			</div>
			<div class="w_box top no_line">
				<div class="list_top mt0">
					<p class="left sub_tab">
						<a href="diet_haeoreum.do" class="btn_mini state">해오름 학사</a>
						<a href="diet_mosirae.do" class="btn_mini state on">모시래학사</a> <!-- 해당 버튼에 클래스 on을 넣어주세요 -->
					</p>
					<!-- <a href="https://dorm.kku.ac.kr/main.do" class="btn_mini bt_greenL">식단 전체보기</a> -->
				</div>
				<p style="font-size:15px;">최근 업데이트일 ${update}</p>
				<p class="diet_top">※ 식단정보은 모시래학사 홈페이지에 업로드 되는 주간메뉴 자료로 제공됩니다.</p>
				
				<div class="diet_wrap">
					<p class="date">
						<fmt:parseDate value="${today}" var='today' pattern='yyyy-M-d'/>
						<fmt:formatDate value="${today}" pattern="M월 d일 식단"/>
						<span class="label today">오늘</span></p>
					<div class="diet_slide01 ds">
					<c:choose>
						<c:when test="${not empty todayDietInfo}">
						<c:forEach var="dietInfo" items="${todayDietInfo}">
							<div>
								<div class="tt"><p>${dietInfo.weekmenuCategory }</p><span>${dietInfo.weekmenuCalory}</span></div>
								<ul class="food_list">
								<c:choose>
									<c:when test="${not empty dietInfo.menuList}">
										<li>${dietInfo.menuList}</li>
									</c:when>
									<c:otherwise>
										<li>식단 정보가 없습니다.</li>
									</c:otherwise>
								</c:choose>
								</ul>
							</div>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<div>
								<div class="tt"><p>아침</p><span></span></div>
								<ul class="food_list">
									<li>식단 정보가 없습니다.</li>
								</ul>
							</div>
							<div>
								<div class="tt"><p>점심</p><span></span></div>
								<ul class="food_list">
									<li>식단 정보가 없습니다.</li>
								</ul>
							</div>
							<div>
								<div class="tt"><p>저녁</p><span></span></div>
								<ul class="food_list">
									<li>식단 정보가 없습니다.</li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
					</div>
				</div><!-- //diet_wrap -->
				
				
				<div class="diet_wrap">
					<p class="date">
						<fmt:parseDate value="${tomorrow}" var='tomorrow' pattern='yyyy-M-d'/>
						<fmt:formatDate value="${tomorrow}" pattern="M월 d일 식단"/>
						<span class="label tomorrow">내일</span></p>
					<div class="diet_slide02 ds">
					<c:choose>
						<c:when test="${not empty tomorrowDietInfo}">
						<c:forEach var="dietInfo" items="${tomorrowDietInfo}">
							<div>
								<div class="tt"><p>${dietInfo.weekmenuCategory }</p><span>${dietInfo.weekmenuCalory}</span></div>
								<ul class="food_list">
								<c:choose>
									<c:when test="${not empty dietInfo.menuList}">
										<li>${dietInfo.menuList}</li>
									</c:when>
									<c:otherwise>
										<li>식단 정보가 없습니다.</li>
									</c:otherwise>
								</c:choose>
								</ul>
							</div>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<div>
								<div class="tt"><p>아침</p><span></span></div>
								<ul class="food_list">
									<li>식단 정보가 없습니다.</li>
								</ul>
							</div>
							<div>
								<div class="tt"><p>점심</p><span></span></div>
								<ul class="food_list">
									<li>식단 정보가 없습니다.</li>
								</ul>
							</div>
							<div>
								<div class="tt"><p>저녁</p><span></span></div>
								<ul class="food_list">
									<li>식단 정보가 없습니다.</li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
					</div>
				</div><!-- //diet_wrap -->
				 
				<div class="g_box">
					<p class="tt">비고</p>
					<ul>
						<li>- 식단은 구매 사정상 변경 될 수 있습니다.</li>
						<li>- 열량은 섭취량이 아니라 발주량입니다.<br/>(성인남자 20세기준±30%)</li>
						<li>- 여학생의 열량은 밥양으로 조절하세요.</li>
					</ul>
				</div>
				<!-- <a href="diet_mosirae_crawler.do" class="btn_mini state">모시래학사 주간 메뉴 불러오기</a>
				<a href="diet_haeoreum_crawler.do" class="btn_mini state">해오름학사 주간 메뉴 불러오기</a> -->

			</div>
				
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	


</div>
<!-- //wrap -->

</body>
</html>

<script>
$(document).ready(function(){
	let today = new Date();   
	let hours = today.getHours(); // 시
	
	var init = 0;
	if(hours >= 0 && hours < 9 ){
		/* console.log('goodmorning'); */
		init = 0;
	}
	if(hours >= 9 && hours < 13){
		/* console.log('goodafternoon'); */
		init = 1;
	}
	if(hours >= 13 && hours < 24){
		/* console.log('goodevening'); */
		init = 2;
	}
	
	//아침 점심 저녁 슬라이드
	$('.diet_slide01').slick({
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
		initialSlide: init,
	});

	$('.diet_slide02').slick({	
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
});

</script>