<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
<style>
	body {
		word-break:break-all;
	}
	body table{
		width: auto !important;
	}
</style>
</head>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
	<header class="sub">
	<%@include file="../../_inc/header.jsp" %>
	</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>학사공지</h2></div>
			</div>
			<div class="bbs_view">
				<div class="view_top">
					<p class="tit">${notice.noticeTitle }</p>
					<div class="writer"> 
						<a href="#" class="photo">
							<span>
								<!-- 기본이미지 -->
								<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
								<!-- 이미지 예시 : 권장이미지 225 * 225 -->
								<!-- <img src="../_img/cont/photo_bg.png" style="background:url('../_img/cont/ex_photo.jpg')no-repeat 50% 50% /cover" width="85">--> 
							</span>
						</a>
						<div class="info">
							<a href="#" class="name">${notice.noticeName }</a>
							<p><span>${notice.noticeDate }</span>
							<span>조회수 ${notice.noticeViewcnt }</span></p>
						</div>
					</div>
				</div>
				<div class="view_bottom">
					<div class="view_cont">
						${notice.kc}
						${notice.kf}
					</div>

				</div>
				<p class="btn nk_btn mt15">
					<a href="/notice.do" class="bt_greenL">목록</a>
				</p>
			</div>
				
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->

</div>
<!-- //wrap -->

</body>
</html>