<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="3" />

<html lang="utf-8">
<head>
<%@include file="../_inc/tit.jsp"%>
</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp"%>
		<%@include file="../_inc/smn01.jsp"%>


		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
				<h2>인정신청</h2>
				<ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
					<li>인정신청</li>
				</ol>
			</div>

			
			<div class="user_box accred03">
				<p class="user_t01">인정신청이 완료 되었습니다.</p>
			</div>
			
			<p class="btn_area c">
				<a href="/web/main.do" class="btn_submit">메인</a>
				<a href="/web/application/applicationList.do" class="btn_list">목록</a>
			</p>
		</div>
		<%@include file="../_inc/footer.jsp"%>
	</div>
</body>

</html>