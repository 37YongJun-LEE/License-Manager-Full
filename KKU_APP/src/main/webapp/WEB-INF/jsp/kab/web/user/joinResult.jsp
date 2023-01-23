 <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="utf-8">
	<head>
		<%@include file="../_inc/tit.jsp" %>
	</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp" %>
		<p class="top_line"></p>
		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
				 <h2>회원가입</h2>
				 <ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>회원가입</li>
					<li>완료</li>
				</ol>
			</div>

			<div class="user_box join03">
				<p class="user_t01">회원가입이 완료 되었습니다.</p>
				<p>로그인 후 스마트 인정시스템의 다양한 서비스를 이용하실 수 있습니다.</p>
			</div>
			
			<p class="btn_area c">
				<a href="/" class="btn_list">메인</a>
				<a href="/web/login.do" class="btn_submit">로그인</a>
			</p>
		</div>
		<%@include file="../_inc/footer.jsp" %>
	</div>
</body>

</html>