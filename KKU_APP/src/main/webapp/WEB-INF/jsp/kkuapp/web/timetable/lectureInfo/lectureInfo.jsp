<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
</head>
<script>
function fnLinkPage(pageNo) {
	$("#pageIndex").val(pageNo);
	$("#schFrm").submit();
}
$(document).on("click", "#schButton", function() {
	$("#pageIndex").val('1');
	$("#schFrm").submit();
});
</script>
<body>
	<div id="wrap">
	<!-- HEADER BEGIN -->
	<header class="sub">
			<%@include file="../../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="schedule head_mg mb140">
			<div class="tab">
				<ul>
					<li><a href="/timetable.do">시간표 보기</a></li>
					<li><a href="/lectureInfo.do?lectureMajor=first" class="on">강의정보</a></li>
				</ul>
			</div>
			<div class="w_box no_line">
				<form name="schFrm" id="schFrm" method="post" autocomplete="off" action="<c:url value='/lectureInfo.do'/>">
					<input type="hidden" name="pageIndex" id="pageIndex" value="${timetableVO.pageIndex}" />
				<div class="search block_search">
					<div class="block_select">
						<select name="searchMajor">
							<option value="" selected="">전체 학과</option>
							<c:forEach var="result" items="${resultList}">
								<option value="${result.uniMajor}" <c:if test="${timetableVO.searchMajor == result.uniMajor}">selected="selected"</c:if>>${result.uniMajor}</option>
							</c:forEach> 
						</select>
						<select name="searchGrade">
							<option value="" selected="">전체 학년</option>
							<option value="1" <c:if test="${timetableVO.searchGrade eq '1'}">selected="selected"</c:if>>1학년</option>
							<option value="2" <c:if test="${timetableVO.searchGrade eq '2'}">selected="selected"</c:if>>2학년</option>
							<option value="3" <c:if test="${timetableVO.searchGrade eq '3'}">selected="selected"</c:if>>3학년</option>
							<option value="4" <c:if test="${timetableVO.searchGrade eq '4'}">selected="selected"</c:if>>4학년</option>
						</select>
						<select name="searchCondition">
							<option value="All" selected="">전체</option>
							<option value="lectureSubnum" <c:if test="${timetableVO.searchCondition eq 'lectureSubnum'}">selected="selected"</c:if>>강의번호</option>
							<option value="lectureName" <c:if test="${timetableVO.searchCondition eq 'lectureName'}">selected="selected"</c:if>>강의명</option>
							<option value="lectureProfname" <c:if test="${timetableVO.searchCondition eq 'lectureProfname'}">selected="selected"</c:if>>교수명</option>
						</select>
					</div>
					<p class="input_box one">
						<input name="searchKeyword" value="${timetableVO.searchKeyword}" type="text" placeholder="강의정보 검색">
						<a href="#"id="schButton"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
				</form>

				<div class="table_list">
					<ul>
						<c:forEach var="lecture" items="${lectureList}">
							<li onclick="location.href='/lectureInfo_view.do?lectureSubnum=${lecture.lectureSubnum}'">
								<div>
									<p class="num">${lecture.lectureSubnum }</p>
									<p class="tit">${lecture.lectureName }</p>
								</div>
								<p class="name">${lecture.lectureProfname }</p>
							</li>
						</c:forEach>
					</ul>
					
				</div>
				<p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p>
			</div>
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
			</div>
		<!-- CONTENTS END -->

</div>
<!-- //wrap -->

</body>
</html>

