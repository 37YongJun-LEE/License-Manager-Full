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
		<div id="sub_contents" class="my_main head_mg">
			<div class="navi">
				<div class="top_navi"><a href="#"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>지원서보기</h2></div>
			</div>
			<div class="w_box no_line">
				<div class="profile"> 
					<p class="photo">
						<span>
						<c:if test="${clubApplicationDetail.usrSrvprofilepic  ne null }">
							<img src="/_img/_img/cont/friend_bg.png"style="background: url('/upload/mypage/${applicants.usrSrvprofilepic }') no-repeat 50% 50% / cover" width="85">
						
						</c:if>
						<c:if test="${clubApplicationDetail.usrSrvprofilepic  eq null }">
							<img src="/_img/_img/cont/friend_bg.png"style="background: url('/_img/_img/cont/no_photo.png') no-repeat 50% 50% / cover" width="85">
						</c:if>
						
						</span>
					</p>
					<p class="info">
						<span class="name">${clubApplicationDetail.usrNickname }(${clubApplicationDetail.usrName })</span>
						<span class="mail">${clubApplicationDetail.usrEmail }</span>
						<span class="depart">${clubApplicationDetail.usrMajor}</span>
						<span class="depart">${clubApplicationDetail.nusrStdnum }학번</span>
					</p>
				</div>
			</div>
			<div class="room_wrap02 no_line pb0">
				<p class="info_tit">지원동기</p>
				<div class="ceo_talk">
					<p>${clubApplicationDetail.clubUserMsg }</p>
				</div>
			</div>
			<div class="room_wrap02 no_line">
				<p class="info_tit">연락처</p>
				<ul class="text_info">
					<li><span>${clubApplicationDetail.usrName }</span><a href="tel:${clubApplicationDetail.clubUserPhone }" class="tel">${clubApplicationDetail.clubUserPhone }</a></li>
				</ul>
			</div>
			<p class="w_box no_line btn"><a href="#" onclick="location.href='/club_join_view.do?clubIdx=${clubApplicationDetail.clubIdx}'">확인</a></p>

			
				</div>
	<!-- CONTENTS END -->
	
	</div>
</body>
<%@include file="../_inc/bottom_menu.jsp" %>
<%@include file="../_inc/footer.jsp" %>
</html>






