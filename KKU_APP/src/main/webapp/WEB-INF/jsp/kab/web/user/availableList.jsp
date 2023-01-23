<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="4" />
<html lang="utf-8">
<head>
	<link rel="stylesheet" href="/_css/web/fullCalendar_css/fullcalendar.min.css" />
    <link rel="stylesheet" href='/_css/web/fullCalendar_css/select2.min.css' />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="/_css/web/fullCalendar_css/main.css">
<%@include file="../_inc/tit.jsp"%>
<script>

	function formatDate(date) {
		var d = new Date(date), month = '' + (d.getMonth() + 1), day = ''
				+ d.getDate(), year = d.getFullYear();
		if (month.length < 2)
			month = '0' + month;
		if (day.length < 2)
			day = '0' + day;
		return [year, month, day].join('');
	}
</script>
</head>
<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp"%>
		<%@include file="../_inc/smn01.jsp"%>
		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
				<h2>평가사가용현황</h2>
				<ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
					<li>평가사가용현황</li>
				</ol>
			</div>
			<div class="container">
				<div id="wrapper" style="position: relative;">
					<div class="avail_legend">
						<span>범례 :</span>
						<p class="avl_01">부족(~30%)</p>
						<p class="avl_02">보통(30%~60%)</p>
						<p class="avl_03">여유(60%~)</p>
					</div>
					<div id="loading"></div>
					<div id="calendar"></div>
				</div>
			</div>
			<!-- /.container -->
		</div>
		<%@include file="../_inc/footer.jsp"%>
	</div>


	<script src="/_js/web/fullCalendar_js/jquery.min.js"></script>
    <script src="/_js/web/fullCalendar_js/moment.min.js"></script>
    <script src="/_js/web/fullCalendar_js/fullcalendar.min.js"></script>
    <script src="/_js/web/fullCalendar_js/ko.js"></script>
    <script src="/_js/web/fullCalendar_js/select2.min.js"></script>
    <script src="/_js/web/fullCalendar_js/main.js"></script>
    <script src="/_js/web/fullCalendar_js/addEvent.js"></script>
    <script src="/_js/web/fullCalendar_js/editEvent.js"></script>
    <script src="/_js/web/fullCalendar_js/etcSetting.js"></script>
</body>
</html>