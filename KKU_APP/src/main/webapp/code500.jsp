<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kpc/app/_inc/title.jsp" %>
</head>
<body>
<div id="wrap">
	<!-- 헤더 ------------------------->
	<%-- <%@ include file="/WEB-INF/jsp/kpc/app/_inc/header.jsp" %> --%>
	<!-- 헤더 끝------------------------->
	<div class="error">
		<img src="/_img/app/comn/error.png" alt=""/>
		<p>페이지를 찾을 수 없습니다.<br/><span>요청하신 페이지를 처리하는 도중<br/> 예기치 못한 에러가 발생했습니다.(5) <br/>잠시후 다시 시도해주세요.</span></p>
		<p class="btn"><a href="javascript:history.back()" class="r_btn">돌아가기</a></p>
	</div>
</div>
</body>
</html>