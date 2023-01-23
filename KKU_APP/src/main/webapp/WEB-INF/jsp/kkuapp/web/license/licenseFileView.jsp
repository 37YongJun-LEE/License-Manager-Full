<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
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
			<div class="navi">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>기출문제</h2></div>
			</div>
			<div class="bbs_view">
				<div class="view_top">
					<p class="tit">${fileDetail.quesTitle }</p>
					<div class="writer"> 
						<%-- <div class="info">
							<a href="#" class="name">${notice.noticeName }</a>
							<p><span>${notice.noticeDate }</span>
							<span>조회수 ${notice.noticeViewcnt }</span></p>
						</div> --%>
					</div>
				</div>
				<div class="view_bottom">
					<div class="view_cont">
					${fileDetail.quesContents}
					
					
					첨부파일 링크<br>
					<c:forEach var ="file" items="${fileList }">
					<a href="/licenseFileDownload.do?quesIdx=${file.quesIdx}&quesFileOrder=${file.quesFileOrder}" style="word-break: break-all;">${file.quesFileName}</a><br>
					</c:forEach>
					
					</div>

				</div>
				<p class="btn nk_btn mt15">
					<a href="/licenseFileBoard.do" class="bt_greenL">목록</a>
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