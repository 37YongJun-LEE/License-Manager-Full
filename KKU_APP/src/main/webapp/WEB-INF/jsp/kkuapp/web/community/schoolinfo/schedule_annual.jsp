<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	<!-- HEADER END -->

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
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>학사일정</h2></div>
			</div>
			<div class="w_box top no_line">
				<div class="list_top mt0">
					<p class="left sub_tab" var="onOff" items="${onOff}">
						<a href="schedule_annual.do?crawlerCategory=semester1" <c:if test="${vo.crawlerCategory eq 'semester1'}">class="on"</c:if>>1학기</a> <!-- 해당 버튼에 클래스 on을 넣어주세요 -->
						<a href="schedule_annual.do?crawlerCategory=semester2" <c:if test="${vo.crawlerCategory eq 'semester2'}">class="on"</c:if>>2학기</a>
					</p>
					<!-- 
					<a href="https://www.kku.ac.kr/mbshome/mbs/wwwkr/subview.do?id=wwwkr_050104010000" class="btn_mini bt_greenL">학사 일정 자세히 보기</a>
					 -->
				</div>
				<p style="font-size:15px;">최근 업데이트 ${update}</p>
				<p class="diet_top">※ 학사일정의 내용은 홈페이지 연간주요일정안내에 있는 정보로 제공됩니다.</p>
				${content.crawlerContent}
 
			</div>
				<!-- 관리자페이지 작업 전 크롤러 업데이트용 임시 버튼 -->
				<!-- <button onclick="location.href='scheduleAnnualCrawlerReload1.do'">1학기 업데이트</button>
				<button onclick="location.href='scheduleAnnualCrawlerReload2.do'">2학기 업데이트</button> -->
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@ include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
</div>
<!-- //wrap -->

</body>
</html>

