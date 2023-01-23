 <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				 <h2>아이디 찾기</h2>
				 <ol class="loca">
					<li><img src="/../_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>회원가입</li>
					<li>아이디 찾기</li>
				</ol>
			</div>

			<div class="user_box find_id02">
				<p class="user_t01">아이디 검색 결과</p>
				<p>입력한 정보와 일치하는 아이디 목록입니다.</p>
				<ul class="find_result">
					<c:forEach var="resultList" items="${resultList}">
						<li>
							<span>${resultList.orgId}</span>
							<c:set var="regDate" value="${fn:split(resultList.regDate,'-')[0]}.${fn:split(resultList.regDate,'-')[1]}.${fn:split(resultList.regDate,'-')[2]}"/>
							<span class="join_date">가입 : ${regDate}</span>
						</li>
					</c:forEach>
				</ul>
				
			</div>
			
			<p class="btn_area c">
				<a href="/web/login.do" class="btn_submit">로그인 하기</a>
				<!-- 하단 버튼 클릭시 이동한 페이지에서 비밀전호찾기 탭이 활성화 상태가 되도록 해주세요  -->
				<a href="/web/findIdPw.do?type=P" class="btn_list">비밀번호 찾기</a>
			</p>
		</div>
		<%@include file="../_inc/footer.jsp" %>
	</div>
</body>

</html>