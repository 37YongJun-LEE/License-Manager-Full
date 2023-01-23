<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>
<script>
function linkPage(pageNo){
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
			<div class="navi small">
				<div class="top_navi"><a href="#"><img src="_img/_img/cont/navi_arrow.png"></a><h2>동아리</h2></div>
			</div>
			<div class="w_box no_line">
			<form name="schFrm" id="schFrm" method="post" action="<c:url value='/clubList.do?clubCategory=${selected}'/>">
				<input type="hidden" name="pageIndex" id="pageIndex" value="${vo.pageIndex}"/>
				<div class="search">
					<select name="searchCondition" id="searchCondition" >
						<option value="all" <c:if test="${vo.searchCondition eq 'all'}">selected</c:if> >전체</option>
						<option value="title"<c:if test="${vo.searchCondition eq 'title'}">selected</c:if> >동아리명</option>
				<!-- 		<option value="content">내용</option>
						<option value="nickname">닉네임</option> -->
					</select>
					<p class="input_box">
						<input type="text" placeholder="동아리 검색" placeholder="게시물 검색" value="${vo.searchKeyword }" onkeypress="if(event.keyCode==13){fnSearch();}">
						<a href="javascript:fnSearch();"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
				<div class="list_top sub_tab">
				
					<p> <!-- 해당되는 메뉴에 클래스 on을 붙여주세요 -->
						<a href="/clubList.do?clubCategory=all"  <c:if test="${selected eq 'all' }">class="on" </c:if>>전체</a>
						<a href="/clubList.do?clubCategory=art"<c:if test="${selected eq 'art' }">class="on" </c:if>>예술분과</a>
						<a href="/clubList.do?clubCategory=business"<c:if test="${selected eq 'business' }">class="on" </c:if>>창업분과</a>
						<a href="/clubList.do?clubCategory=hobby"<c:if test="${selected eq 'hobby' }">class="on" </c:if>>취미교양분과</a>
						<a href="/clubList.do?clubCategory=volunteer"<c:if test="${selected eq 'volunteer' }">class="on" </c:if>>봉사분과</a>
						<a href="/clubList.do?clubCategory=leisure"<c:if test="${selected eq 'leisure' }">class="on" </c:if>>레저분과</a>
						<a href="/clubList.do?clubCategory=sport"<c:if test="${selected eq 'sport' }">class="on" </c:if>>체육분과</a>
						<a href="/clubList.do?clubCategory=religion"<c:if test="${selected eq 'religion' }">class="on" </c:if>>종교분과</a>
						<a href="/clubList.do?clubCategory=study"<c:if test="${selected eq 'study' }">class="on" </c:if>>학술분과</a>
					</p>
				</div>

			<ul class="best_list basic">
				<c:forEach var="result" items="${clubList }">
						<li onclick="location.href='club_info.do?clubIdx=${result.clubIdx}'">
									<div>
								<div>
									<p class="tit">${result.clubName }</p>
									<p class="con">${result.clubCategory} 동아리</p>
								</div>
								<p class="bottom club_text"> <!-- //소개문  -->
									${result.clubEvent }
								</p>
							</div>
							<p class="img">
								<img alt="자유게시판" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/club_img01.jpg')no-repeat 50% 50% / cover;">
							</p>
						</li>
				</c:forEach>
					
					
					<!-- <li class="nodata">등록된 게시글이 없습니다.</li> -->
				</ul>
				<p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
				</p>
			</form>
			</div>
				
			</div>
	<!-- CONTENTS END -->
				
		

</body>
<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
	<!-- CONTENTS END -->
</html>