<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../_inc/title.jsp" %>
<body>
	<div id="wrap">
		<!-- HEADER BEGIN -->
			<header class="sub">
			<%@include file="../_inc/header.jsp" %>
			</header>
		<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
				<div class="navi">
					<div class="top_navi"><a href="club_view.do?clubIdx=${clubVO.clubIdx }&category=gal"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>갤러리</h2></div>
				</div>

			<div class="w_box no_line">
				<div class="gall_top">				
					<a href="/club_gallery_write.do?clubIdx=${clubVO.clubIdx}" class="btn_mini bt_greenL">갤러리 작성</a>
				</div>

				<ul class="club_gall_list">
					<c:if test="${fn:length(galleryList) ne 0}">
						<c:forEach var="result" items="${galleryList }">
						<li onclick="location.href='/club_gallery_view.do?clubIdx=${result.clubIdx}&clubBoardIdx=${result.clubBoardIdx }'">
						<p class="img">
							<img alt="자유게시판" src="/_img/_img/cont/best_bg.png" style="background: url('/upload/clubBoard/${result.servFile }')no-repeat 50% 50% / cover;">
						</p>
						<p class="txt">${result.clubBoardTitle }</p>
						<div class="gallname">
							<a href="#">${result.usrName }</a>
							<p><span>2022-08-25</span><span>조회 ${result.viewnum }</span></p>
						</div>

						</li>
						</c:forEach>	
					</c:if>
					<c:if test="${fn:length(galleryList) eq 0}">
						<li class="nodata">등록된 게시글이 없습니다.</li>
					</c:if>
					
					
				</ul>

				<p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
				</p>
			</div>
						</div>
	<!-- CONTENTS END -->
	
	</div>
</body>
<%@include file="../_inc/bottom_menu.jsp" %>
<%@include file="../_inc/footer.jsp" %>
</html>






