<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>
<c:set var="today" value="<%=new java.util.Date()%>" />
<!-- 현재날짜 -->
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm" /></c:set>
<script>
$(document).on("click", "#schButton", function() {
	$("#pageIndex").val('1');
	$("#schFrm").submit();
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

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
		<%@include file="../_inc/header.jsp" %>
	</header>
	<!-- HEADER END -->
	
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi small">
				<div class="top_navi"><a href="/main.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>택시 합승</h2></div>
			</div>
			<div class="w_box no_line">
				<form name="schFrm" id="schFrm" method="get" autocomplete="off" action="/taxi.do">
					<input type="hidden" name="pageIndex" id="pageIndex" value="${taxiVO.pageIndex}" />
					<div class="search">
						<select name="searchCondition">
							<option value="All" selected="">전체</option>
							<option value="departurePlace" <c:if test="${taxiVO.searchCondition == 'departurePlace'}">selected="selected"</c:if>>출발지</option>
							<option value="arrivalPlace" <c:if test="${taxiVO.searchCondition == 'arrivalPlace'}">selected="selected"</c:if>>도착지</option>
						</select>
						<p class="input_box">
							<input name="searchKeyword" value="${taxiVO.searchKeyword}"type="text" placeholder="게시물 검색">
							<a href="#" id="schButton"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
						</p>
					</div>
				</form>
				<div class="list_top">
					<div class="right">
						<a href="/taxiAlarm.do" class="taxi_alarm">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M256 32V51.2C329 66.03 384 130.6 384 208V226.8C384 273.9 401.3 319.2 432.5 354.4L439.9 362.7C448.3 372.2 450.4 385.6 445.2 397.1C440 408.6 428.6 416 416 416H32C19.4 416 7.971 408.6 2.809 397.1C-2.353 385.6-.2883 372.2 8.084 362.7L15.5 354.4C46.74 319.2 64 273.9 64 226.8V208C64 130.6 118.1 66.03 192 51.2V32C192 14.33 206.3 0 224 0C241.7 0 256 14.33 256 32H256zM224 512C207 512 190.7 505.3 178.7 493.3C166.7 481.3 160 464.1 160 448H288C288 464.1 281.3 481.3 269.3 493.3C257.3 505.3 240.1 512 224 512z"></path></svg>
							<span>0</span>
						</a>
					<a href="/taxiAlarm.do" class="btn_mini bt_greenL" style="margin-left:auto">알림 설정</a>	
					<a href="/taxiWrite.do" class="btn_mini bt_greenL" style="margin-left:auto">게시물 작성</a>
					</div>
				</div>
				<ul class="best_list basic taxi">
				<c:choose>
					<c:when test="${taxiList[0] ne null}">
						<c:forEach var="taxi" items="${taxiList}">
							<li onclick="location.href='/taxiView.do?taxiIdx=${taxi.taxiIdx}'">
								<div>
									<div class="place">
										<p><span class="b">출발지</span><span>${taxi.taxiDepartureplace }</span></p><p><span class="b">도착지</span>${taxi.taxiArrivalplace}</p>
									</div>
									<p class="time">${taxi.taxiDeparturetime}</p>
									<p class="bottom">
										<span>${taxi.taxiWriter}</span>
										<span><script>displayedAt("${taxi.taxiWritedate}")</script></span>
										<span>조회수 ${taxi.taxiViewnum }</span>
										<fmt:parseDate value="${taxi.endDate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss.S"/>
										<fmt:formatDate var="endDate" value="${dateValue}" pattern="yyyy-MM-dd HH:mm"/>
										<c:if test = "${taxi.taxiMembers eq taxi.taxiApplied or taxi.taxiState eq 0 or date > endDate }">
											<span class="ok_label">마감됨</span>
										</c:if>
									</p>
								</div>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li class="nodata">등록된 게시글이 없습니다.</li>
					</c:otherwise>
				</c:choose>
				</ul>
				<!-- 페이지 최대 8까지 노출 -->
				<p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p>

			</div>
	</div>
				
		<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
	<!-- CONTENTS END -->

</body>
</html>