<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../_inc/title.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
<body>
	<div id="wrap">
		<!-- HEADER BEGIN -->
			<header class="sub">
			<%@include file="../_inc/header.jsp" %>
			</header>
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="my_main head_mg">
			<div class="navi">
				<div class="top_navi"><a href="#"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>동아리 정보 관리</h2></div>
			</div>

			<div class="w_box no_line">
				<div class="my_list">
					<ul>
						<li>
							<a href="#">
								<i class="fas fa-edit"></i>
								동아리 정보 수정
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fas fa-paste"></i>
								동아리 게시판 관리
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fas fa-calendar-alt"></i>
								동아리 일정 관리
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fas fa-address-book"></i>
								동아리 회비 납부 관리 내역 수정
							</a>
						</li>
					</ul>
				</div>
				
			</div>
			
			
	<!-- CONTENTS END -->
	
	</div>
</body>
<%@include file="../_inc/bottom_menu.jsp" %>
<%@include file="../_inc/footer.jsp" %>
</html>






