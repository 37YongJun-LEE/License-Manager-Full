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
				 <h2>비밀번호 찾기</h2>
				 <ol class="loca">
					<li><img src="/../_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>회원가입</li>
					<li>비밀번호 찾기</li>
				</ol>
			</div>
	
			<c:choose>
				<c:when test="${result eq 'find' }">
					<div class="user_box find_id02">
						<p class="user_t01">비밀번호 찾기 결과</p>
						<p>회원님의 이메일로 임시비밀번호가 전송되었습니다.</p>
						<ul class="find_result">
							<li>
								<p class="user_t01">${companyVO.personEmail}</p>
<!-- 								<p>임시비밀번호로 로그인뒤 비밀번호를 변경해 주시길 바랍니다.</p> -->
							</li>
						</ul>
					</div>
				</c:when>
				<c:when test="${result eq 'noFind' }">
					<div class="user_box find_id02">
						<p class="user_t01">비밀번호 찾기 결과</p>
						<ul class="find_result" style="width:600px; text-align:center; padding:15px 0px 7px;">
							<li>
								<p class="user_t01">입력하신 정보를 다시 확인해 주시길 바랍니다.</p>
							</li>
						</ul>
					</div>
				</c:when>
			</c:choose>
			
			
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