<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>
	

<body>
	<header class="sub">
		<%@include file="../_inc/header.jsp" %>
	</header>
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="head_mg mb140">

			<div class="navi small">
				<div class="top_navi"><a href="javascript:history.back(-1)"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>기숙사 외박 신청</h2></div>
			</div>
			<div class="w_box no_line">
				<ul class="stay_choice">
					<li><a href="/dormitory.do?type=mo">모시래 학사 외박신청</a></li>
					<li><a href="/dormitory.do?type=hae">해오름 학사 외박신청</a></li>
				</ul>
			</div>
		</div>
</body>
<%@ include file="../_inc/bottom_menu.jsp" %>

<%@ include file="../_inc/footer.jsp" %>
</html>