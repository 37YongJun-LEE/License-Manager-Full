<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
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
			<!-- <div class="tab">
				<ul>
					<li><a href="board.do">자유게시판</a></li>
					<li><a href="themeboard_list.do">주제별 게시판</a></li>
					<li><a href="school_info.do" class="on">학교 정보</a></li>
				</ul>
			</div> -->
			<div class="navi small">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>버스 시간표</h2></div>
			</div>
			<div class="w_box top no_line">
				<div class="list_top" style="margin-top:0;">
					<p class="left sub_tab">
						<a href="/normal_bus.do" class="btn_mini state ">600번</a>
						<a href="/schedule_bus.do" class="btn_mini state on">건국터미널</a> 
				</div>
				<p class="bus_tit">2022년 1학기 건국 터미널 시간표</p>
					<p style="font-size:15px;">최근 업데이트 ${update}</p>
				<div class="bus_time">
					${content.crawlerContent}
					<!-- 
					<table>
						<tbody>
							<tr>
								<th>동서울</th>
								<th>안양, 부천</th>
								<th>성남</th>
								<th>안산, 인천</th>
							</tr>
							<tr>
								<td>08:00</td>
								<td rowspan="2">14:40</td>
								<td>15:05<br/>(목~일)</td>
								<td rowspan="12" class="br0 bb0">14:40</td>
							</tr>
							<tr>
								<td>09:00</td>
								<td rowspan="11" class="bb0">16:05</td>
							</tr>
							<tr>
								<td>09:50<br/><span class="direct">직통</span></td>
								<td rowspan="11" class="bb0">16:05<br/>(월~토)</td>
							</tr>
							<tr>
								<td>11:20<br/><span class="direct">직통</span></td>
							</tr>
							<tr>
								<td>13:30<br/><span class="direct">직통</span></td>
							</tr>
							<tr>
								<td>14:00</td>
							</tr>
							<tr>
								<td>14:40</td>
							</tr>
							<tr>
								<td>15:00</td>
							</tr>
							<tr>
								<td>15:20<br/><span class="direct">직통</span></td>
							</tr>
							<tr>
								<td>17:00</td>
							</tr>
							<tr>
								<td>18:20<br/><span class="direct">직통</span></td>
							</tr>
							<tr>
								<td class="bb0">19:20<br/><span class="direct">직통</span></td>
							</tr>
						</tbody>
					</table>
					 -->
				</div>

				<div class="g_box">
					<span class="red">- 동서울 행 버스는 토,일, 공휴일엔 정시차만 운행되며 직통은 월~토까지 운행됩니다.</span>
					<p class="tt">버스회사 연락처</p>
					<ul>
						<li>- 안산, 인천 = 친선고속 043-844-2605</li>
						<li>- 그외 = 경기고속 043-848-2605</li>
					</ul>
				</div>
				<!-- 관리자페이지 작업 전 크롤러 업데이트용 임시 버튼 -->
				<!-- <button onclick="location.href='busCrawlerReload.do'">업데이트</button> -->
			</div>
				
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@ include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
</div>
<!-- //wrap -->

</body>
</html>

