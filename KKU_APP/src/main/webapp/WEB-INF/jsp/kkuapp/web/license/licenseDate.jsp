<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
</head>
<script>
function fnLinkPage(pageNo) {
	$("#pageIndex").val(pageNo);
	$("#schFrm").submit();
}
function fnSearch(){
	$("#pageIndex").val('1');
	$("#schFrm").submit();
}
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
			<!-- <div class="tab">
				<ul>
					<li><a href="board.do" class="on">자유게시판</a></li>
					<li><a href="themeboard_list.do">주제별 게시판</a></li>
					<!-- <li><a href="school_info.do">학교 정보</a></li> 
				</ul>
			</div>-->
			
			<div class="navi small">
				<div class="top_navi"><a href="/licenseView.do?subjectCd=${vo.subjectCd}"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>${sub.subjectName} 시험일정</h2></div>
			</div>
			
			<div class="w_box no_line">
				<form name="schFrm" id="schFrm" method="post" action="<c:url value='/licenseDate.do?subjectCd=${vo.subjectCd}'/>">
					<input type="hidden" name="pageIndex" id="pageIndex" value="${vo.pageIndex}" />
					<%-- <div class="search">
						<select name="searchCondition">
							<option value="All" <c:if test="${vo.searchCondition eq ''}">selected</c:if>>전체</option>
							<option value="quesTitle" <c:if test="${vo.searchCondition == 'quesTitle'}">selected="selected"</c:if>>제목</option>
							
							<option value="quesContents" <c:if test="${vo.searchCondition == 'quesContents'}">selected="selected"</c:if>>내용</option>
							
						</select>
						<p class="input_box">
							<input name="searchKeyword" value="${vo.searchKeyword}" type="text" placeholder="게시물 검색">
							<a href="javascript:fnSearch();" id="schButton"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
						</p>
					</div> --%>
				</form> 
				<div class="list_top">
				</div>
				
				
				<c:if test="${licenseDate ne null}">
					<ul class="ls_list bg">
                        <c:forEach var="date" items="${licenseDate}">
                            <li>
                                <c:choose>
	                                <c:when test="${date.displayW ne 0 and date.displayP ne 0}">
		                                <div class="list_wrap">
		                                    <div>
		                                        <p class="ls_con">${date.description} 필기</p>
		                                        <p class="ls_txt">접수기간 : ${date.wtestAplcStartdt}~${date.wtestAplcEnddt}</p>
		                                        
		                                        <p class="ls_txt">시험날짜 : ${date.wtestStartdt }~${date.wtestEnddt }</p>
		                                    </div>
		                                    <c:choose>
		                                    <c:when test="${date.waplcEnd ne 0 }">
		                                    <a href="#" class="btn_mini bt_green">접수중</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <a href="#" class="btn_mini bt_green">접수마감</a>
		                                    </c:otherwise>
		                                    </c:choose>
		                                </div>
		                                <div class="list_wrap dashed">
		                                    <div>
		                                        <p class="ls_con">${date.description} 실기</p>
		                                        <p class="ls_txt">접수기간 : ${date.ptestAplcStartdt}~${date.ptestAplcEnddt}</p>
		                                        
		                                        <p class="ls_txt">시험날짜 : ${date.ptestStartdt }~${date.ptestEnddt }</p>
		                                    </div>
		                                   <c:choose>
		                                    <c:when test="${date.paplcEnd ne 0 }">
		                                    <a href="#" class="btn_mini bt_green">접수중</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <a href="#" class="btn_mini bt_green">접수마감</a>
		                                    </c:otherwise>
		                                    </c:choose>
		                                </div>
	                                </c:when>
	                                <c:when test="${date.displayW ne 0 and date.displayP eq 0}">
	                                	<div class="list_wrap">
		                                    <div>
		                                        <p class="ls_con">${date.description} 필기</p>
		                                        <p class="ls_txt">접수기간 : ${date.wtestAplcStartdt}~${date.wtestAplcEnddt}</p>
		                                        
		                                        <p class="ls_txt">시험날짜 : ${date.wtestStartdt }~${date.wtestEnddt }</p>
		                                    </div>
		                                    <c:choose>
		                                    <c:when test="${date.waplcEnd ne 0 }">
		                                    <a href="#" class="btn_mini bt_green">접수중</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <a href="#" class="btn_mini bt_green">접수마감</a>
		                                    </c:otherwise>
		                                    </c:choose>
		                                </div>
	                                </c:when>
	                                <c:otherwise>
		                                <div class="list_wrap">
		                                    <div>
		                                        <p class="ls_con">${date.description} 실기</p>
		                                        <p class="ls_txt">접수기간 : ${date.ptestAplcStartdt}~${date.ptestAplcEnddt}</p>
		                                        
		                                        <p class="ls_txt">시험날짜 : ${date.ptestStartdt }~${date.ptestEnddt }</p>
		                                    </div>
		                                    <c:choose>
		                                    <c:when test="${date.paplcEnd ne 0 }">
		                                    <a href="#" class="btn_mini bt_green">접수중</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <a href="#" class="btn_mini bt_green">접수마감</a>
		                                    </c:otherwise>
		                                    </c:choose>
		                                </div>
	                                </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
					</ul>
				</c:if>
				
				
				<p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p>
				</div>

			<%@include file="../_inc/bottom_menu.jsp" %>
			<%@include file="../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
</div>
<!-- //wrap -->

</body>
</html>