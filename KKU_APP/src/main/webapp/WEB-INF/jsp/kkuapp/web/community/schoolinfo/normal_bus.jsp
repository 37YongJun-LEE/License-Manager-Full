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
			<div class="navi small">
				<div class="top_navi"><a href="#"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>버스 시간표</h2></div>
			</div>
			<div class="w_box top no_line">
				<div class="list_top" style="margin-top:0;">
					<p class="left sub_tab">
						<a href="normal_bus.do" class="btn_mini state on">600번</a>
						<a href="schedule_bus.do" class="btn_mini state">건국터미널</a> 
					</p>
				</div>
				<div style="display: flex; justify-content: space-between;">
					<p class="bus_tit">600번 버스 노선</p>
					<p><a href="#" class="btn_mini bt_greenL" style="display: block;" onclick="layer_open('iPop','i_Pop')">운행경로 자세히보기</a></p>
				</div>
				<div class="bus_time">
					<table>
						<tbody>
							<tr>
								<!-- <th rowspan="2">회차</th> -->
								<th colspan="5">터미널 → 건국대 (건국대 행)</th>
							</tr>
							<tr>
								<th>회사</th>
								<th>터미널</th>
								<th>충주역</th>
								<th>호암<br>지구</th>
								<th>건국대<br>도착</th>
							</tr>
							<tr>
								<!-- <td>1회차</td> -->
								<td>8:32</td>
								<td>8:37</td>
								<td>8:40</td>
								<td></td>
								<td>8:50</td>
							</tr>
							<tr>
								<!-- <td>2회차</td> -->
								<td></td>
								<td>9:15</td>
								<td></td>
								<td></td>
								<td>9:28</td>
							</tr>
							<tr>
								<!-- <td>3회차</td> -->
								<td></td>
								<td></td>
								<td></td>
								<td>9:50</td>
								<td>9:57</td>
							</tr>
							<tr>
								<!-- <td>4회차</td> -->
								<td></td>
								<td>10:45</td>
								<td></td>
								<td></td>
								<td>10:58</td>
							</tr>
							<tr>
								<!-- <td>5회차</td> -->
								<td></td>
								<td>11:25</td>
								<td></td>
								<td></td>
								<td>11:38</td>
							</tr>
							<tr>
								<!-- <td>6회차</td> -->
								<td>1:00</td>
								<td></td>
								<td></td>
								<td>1:13</td>
								<td>1:20</td>
							</tr>
							<tr>
								<!-- <td>7회차</td> -->
								<td></td>
								<td>1:35</td>
								<td></td>
								<td></td>
								<td>1:48</td>
							</tr>
							<tr>
								<!-- <td>8회차</td> -->
								<td></td>
								<td>2:15</td>
								<td></td>
								<td></td>
								<td>2:28</td>
							</tr>
							<tr>
								<!-- <td>9회차</td> -->
								<td></td>
								<td>2:55</td>
								<td></td>
								<td></td>
								<td>3:08</td>
							</tr>
							<tr>
								<!-- <td>10회차</td> -->
								<td></td>
								<td></td>
								<td></td>
								<td>3:30</td>
								<td>3:37</td>
							</tr>
							<tr>
								<!-- <td>11회차</td> -->
								<td></td>
								<td>4:20</td>
								<td>4:23</td>
								<td></td>
								<td>4:33</td>
							</tr>
							<tr>
								<!-- <td>12회차</td> -->
								<td>5:42</td>
								<td>5:47</td>
								<td></td>
								<td></td>
								<td>6:00</td>
							</tr>
							<tr>
								<!-- <td>13회차</td> -->
								<td></td>
								<td>6:15</td>
								<td></td>
								<td></td>
								<td>6:28</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="bus_time mt20">
					<table>
						<tbody>
							<tr>
								<!-- <th rowspan="2" class="red">회차</th> -->
								<th colspan="7" class="red">건국대 → 터미널<br>(충주역·터미널·호안지구·신연수동 행)</th>
							</tr>
							<tr>
								<th class="red">건국대<br>출발</th>
								<th class="red">충주역</th>
								<th class="red">장소</th>
								<th class="red">터미널</th>
								<th class="red">호암<br>지구</th>
								<th class="red">신연수동</th>
								<th class="red">회사</th>
							</tr>
							<tr>
								<!-- <td>1회차</td> -->
								<td>9:00</td>
								<td></td>
								<td></td>
								<td>9:13</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>2회차</td> -->
								<td>9:40</td>
								<td colspan="3">호암지구</td>
								<td>9:47</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>3회차</td> -->
								<td>10:30</td>
								<td>10:37</td>
								<td></td>
								<td>10:43</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>4회차</td> -->
								<td>11:10</td>
								<td></td>
								<td></td>
								<td>11:23</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>5회차</td> -->
								<td>11:55</td>
								<td colspan="3">호암지구</td>
								<td>12:02</td>
								<td></td>
								<td>12:15</td>
							</tr>
							<tr>
								<!-- <td>6회차</td> -->
								<td>1:20</td>
								<td>1:27</td>
								<td></td>
								<td>1:33</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>7회차</td> -->
								<td>2:00</td>
								<td></td>
								<td></td>
								<td>2:13</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>8회차</td> -->
								<td>2:40</td>
								<td></td>
								<td></td>
								<td>2:53</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>9회차</td> -->
								<td>3:20</td>
								<td colspan="3">호암지구</td>
								<td>3:27</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>10회차</td> -->
								<td>4:05</td>
								<td></td>
								<td></td>
								<td>4:18</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>11회차</td> -->
								<td>4:45</td>
								<td></td>
								<td></td>
								<td>4:58</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>12회차</td> -->
								<td>6:00</td>
								<td>6:07</td>
								<td></td>
								<td>6:13</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<!-- <td>13회차</td> -->
								<td>6:40</td>
								<td colspan="3">호암지구 신연수동</td>
								<td>6:47</td>
								<td>7:00</td>
								<td>7:10</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="g_box">
					<p class="tt">토, 휴일, 건국대방학은 운휴</p>
					<ul>
						<li>- 회사는 봉방동 소재 버스차고지입니다.</li>
						<li>- 상황에 따라 시간표 및 운행경로는 변경될 수 있습니다.</li>
						<li>- 충주 시 교통정보센터(<a class="link_a" href="http://its.chungju.go.kr/bis" target="_blank">http://its.chungju.go.kr/bis</a>)에서 실시간 버스도착 정보를 확인할 수 있습니다.</li>
					</ul>
					<p class="tt mt10">버스관련 문의</p>
					<ul>
						<li>- 산화버스 <a  class="link_a" href="tel:(043) 844-4098">(043) 844-4098</a></li>
						<li>- 충주교통 <a  class="link_a" href="tel:(043) 845-5176">(043) 845-5176</a></li>
					</ul>
				</div>
				
			</div>
				
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	<!-- POPUP AREA -->
	<div class="layer" id="i_Pop">
		<div class="bg"></div>
		<div class="pop-layer pop-layer03" id="iPop">
			<a href="#" id="btn_cancel" class="close btn_pop_close cbtn"><img src="/_img/_img/cont/photo_close02.png" width="20"></a>
			<div class="pop_cont text">
				<p class="tit c">600번 버스 노선표</p>
				<p class="two_btn btn" style="margin: 30px 0 20px;">
				   <a href="#" class="btn" onclick="zoomin()">확대</a>
				   <a href="#" class="bt_greenL" onclick="zoomout()">축소</a>
			    </p>
				<div class="bus_img dragscroll"><img id="viewer" src="/_img/_img/cont/n600_bus.jpg"></div>
			</div> 
		</div>
	</div>


</div>
<!-- //wrap -->
<script>
function zoomin() {
     var myImg = document.getElementById("viewer");
     var currWidth = myImg.clientWidth;
     if (currWidth == 2500) return false;
     else {
       myImg.style.width = (currWidth + 100) + "px";
     }
}

function zoomout() {
     var myImg = document.getElementById("viewer");
     var currWidth = myImg.clientWidth;
     if (currWidth == 100) return false;
     else {
       myImg.style.width = (currWidth - 100) + "px";
     }
}
 </script>
</body>
</html>
