<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>

<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->
	
	<!-- CONTENTS BEGIN -->
		<div class="navi">
			<div class="top_navi"><a href="/timetable.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>내 시간표 불러오기</h2></div>
		</div>
		
		<div>
			${Url }
		</div>
		<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
	<!-- CONTENTS END -->
	

	
	<!-- POPUP END -->
</div>

</body>
</html>