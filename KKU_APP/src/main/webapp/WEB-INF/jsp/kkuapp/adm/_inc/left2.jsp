<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

//레프트메뉴
$(function(){
	$(".depth").hide();
	$(".depth02").hide();
	$('ul.left_menu li:has(.depth)').children('a').addClass('more'); 
	$('ul.depth li:has(.depth02)').children('a').addClass('more');

	//서브메뉴 조작
	$("ul.left_menu > li > a").on("click",function() {
		$("ul.depth").hide()
		if($(this).is(".on")){
			$(this).removeClass("on");
		}else{
			$("ul.left_menu > li > a").removeClass("on");
			$(this).addClass("on");
		}
		$(this).next("ul.depth").slideToggle();
	});

	//서브메뉴2 조작
	$("ul.depth > li > a").on("click",function() {
		$("depth02").hide();
		$("ul.depth li a").removeClass("on");
		$(this).addClass("on");
		$(this).next("depth02").slideToggle();
	});

	$(function(){
		$("ul.left_menu > li > a.on").next("ul").css("display","block");
		$("ul.depth > li > a.on").next("ul").css("display","block");
	});
});
</script>
<div id="left">
	<ul class="left_menu">
		<li>
		<!-- <c:if test="${page_num_depth_01 eq 1}">class="on"</c:if> -->
			<a href="javascript:void(0);" <c:if test="${depth01 eq 'user'}">class="on"</c:if>>회원 관리</a>
			<ul class="depth">
				<li><a href="/admin/userList.do">회원 관리</a></li>
				<li><a href="/admin/adminList.do" >관리자 관리</a></li>
			</ul>
		</li>		
		<li>
			<a href="javascript:void(0);" <c:if test="${depth01 eq 'board'}">class="on"</c:if>>게시판 관리</a>
			<ul class="depth">	
				<li><a href="/admin/freenoticeList.do" >자유 게시판 관리</a></li>
				<!-- <li><a href="/admin/topicList.do" >주제별 게시판 관리</a></li> -->
				<li><a href="/admin/tradeList.do" >중고거래 관리</a></li>
			</ul>
		</li>
		<li>
			<a href="javascript:void(0);" <c:if test="${depth01 eq 'lectureInfo'}">class="on"</c:if>>강의정보 관리</a>
			<ul class="depth">
				<li><a href="/admin/studyinfo.do" >강의정보 관리</a></li>
				<li><a href="/admin/studyrefer.do" >강의 참고자료 관리</a></li>
			</ul>
		</li>
		<li>
			<a href="javascript:void(0);" <c:if test="${depth01 eq 'chat'}">class="on"</c:if>>채팅 관리</a>
			<ul class="depth">
				<li><a href="/admin/onechat.do">1:1 채팅 관리</a></li>
				<!-- <li><a href="/admin/tradechat.do" >중고거래 채팅 관리</a></li> -->
			</ul>
		</li>
		<li>
			<a href="javascript:void(0);" <c:if test="${depth01 eq 'report'}">class="on"</c:if>>신고 관리</a>
			<ul class="depth">
				<li><a href="/admin/report.do" >게시물 신고 관리</a></li>
			</ul>
		</li>		
		<li>
			<a href="javascript:void(0);" <c:if test="${depth01 eq 'campusInfo'}">class="on"</c:if>>학교 정보 관리</a>
			<ul class="depth">
				<li><a href="/admin/campusinfo.do" >학교 공지 관리</a></li>
				<li><a href="/admin/studentinfo.do">학과 공지 관리</a></li>
				<li><a href="/admin/campusinfoupdate.do" >학교 공지 업데이트</a></li>
				<li><a href="/admin/studentinfoupdate.do" >학과 공지 업데이트</a></li>
				<li><a href="/admin/schoolInfoUpdate.do">학교 정보 업데이트</a></li>
				<li><a href="/admin/fixReport.do">학교 시설 고장 신고 관리</a></li>
			</ul>
		</li>
		<li>
			<a href="javascript:void(0);" <c:if test="${depth01 eq 'restaurant'}">class="on"</c:if>>음식점 관리</a>
			<ul class="depth">
				<li><a href="/admin/restaurant.do">음식점 관리</a></li>
			</ul>
		</li>
		<li>
			<a href="javascript:void(0);" <c:if test="${depth01 eq 'oneroom'}">class="on"</c:if>>원룸 관리</a>
			<ul class="depth">
				<li><a href="/admin/oneroom.do">원룸관리</a></li>
			</ul>
		</li>
		<li>
			<a href="javascript:void(0);" <c:if test="${depth01 eq 'license'}">class="on"</c:if>>자격증 관리</a>
			<ul class="depth">
				<li><a href="/admin/licenseList.do">자격증 관리</a></li>
				<li><a href="/admin/licenseUpdateList.do">자격증 정보 업데이트</a></li>
			</ul>
		</li>
		<%-- <li>
			<a href="javascript:void(0);" <c:if test="${depth01 eq 'statistics'}">class="on"</c:if>>통계 관리</a>
			<ul class="depth">
				<li><a href="/admin/statistics.do" >게시판 통계</a></li>
			</ul>
		</li> --%>
	</ul>
</div>
