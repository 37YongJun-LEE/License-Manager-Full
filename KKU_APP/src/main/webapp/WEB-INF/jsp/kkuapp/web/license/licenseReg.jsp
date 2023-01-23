<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script>
</script>
</head>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
	<header class="sub">
	<%@include file="../_inc/header.jsp" %>
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
				<div class="top_navi"><a href="/main.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>관심 자격증 등록</h2></div>
			</div>
			<div class="w_box no_line">
			<form name="schFrm" id="schFrm" method="post" action="<c:url value='/notice.do?noticeCategory=${vo.noticeCategory}'/>">
				<input type="hidden" name="pageIndex" id="pageIndex" value="${vo.pageIndex}"/>
				<div class="search">
					<select name="searchCondition" id="searchCondition">
						<%-- <option value=""<c:if test="${vo.searchCondition eq ''}">selected</c:if>>전체</option>
						<option value="title"<c:if test="${vo.searchCondition eq 'title' }">selected</c:if>>제목</option>
						<option value="contents"<c:if test="${vo.searchCondition eq 'contents' }">selected</c:if>>내용</option>
						<option value="writer"<c:if test="${vo.searchCondition eq 'writer' }">selected</c:if>>작성자</option> --%>
					</select>
					<p class="input_box">
						<input type="text" name="searchKeyword" id="searchKeyword" placeholder="자격증 검색" value="${vo.searchKeyword }" onkeypress="if(event.keyCode==13){fnSearch();}">
						<a href="javascript:fnSearch();"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
				
				<ul class="best_list basic notice">
				<c:choose>
					<c:when test="${list ne null }">
						<c:forEach var="item" items="${list}">
							<li>
								<div>
									<div>
										<p class="tit">${item.description}</p>
									</div>
									<p class="bottom">
										<span>${item.wtestAplcStartdt }</span>
										<span>${item.wtestAplcEnddt }</span>
										<span>등록일 ${item.regDate }</span>
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
				<%-- <p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p> --%>
				</form>
				<!-- 페이지 최대 5까지 노출
				<p class="paging">
					<a href="#" class="prev end">처음으로</a>
					<a href="#" class="prev">이전</a>
					<a href="#" class="on">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#" class="next">다음</a>
					<a href="#" class="next end">마지막으로</a>
				</p> -->
				<!-- 
				<a href="notice_crawler.do?noticeCategory=학사공지" >(학사공지 불러오기)<br></a>
				<a href="notice_crawler.do?noticeCategory=장학공지" >(장학공지 불러오기)<br></a>
				<a href="notice_crawler.do?noticeCategory=취업/창업" >(취업/창업 불러오기)<br></a>
				<a href="notice_crawler.do?noticeCategory=국제교류" >(국제교류 불러오기)<br></a>
				<a href="notice_crawler.do?noticeCategory=일반공지" >(일반공지 불러오기)<br></a>
				<a href="notice_crawler.do?noticeCategory=외부행사/공모전" >(외부행사/공모전 불러오기)<br></a>
				 -->
			</div>
			
			<%@include file="../_inc/bottom_menu.jsp" %>
			<%@include file="../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	


</div>
<!-- //wrap -->

</body>
</html>