<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>
<script>


var today = new Date();
$(document).ready(function() {
	var hour = today.getHours();
	if(hour<10){hour = "0"+hour}
	var min = today.getMinutes();
	if(min<10){min = "0"+min}
	if(min%10>0){
		min=min-min%10;
	}
	var af = "";
	if(hour>=12){
		af = "오후";
		if(hour!=12){
			hour-=12;
		}
	}else{
		af = "오전";
	}
	
	var todayCal = today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+(today.getDate())+"일 "+af+" "+hour+"시 "+min+"분";
	$("#date1").text(todayCal)
	$("#date2").text(todayCal)
	
});

function buildCalendar(){
	  var row = null
	  var cnt = 0;
	  var calendarTable = document.getElementById("calendar");
	  var calendarTableTitle = document.getElementById("calendarTitle");
	  calendarTableTitle.innerHTML = today.getFullYear()+"년 "+(today.getMonth()+1)+"월 ";
	  
	  var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
	  var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
	  while(calendarTable.rows.length > 0){
	  	calendarTable.deleteRow(calendarTable.rows.length -1);
	  }

	  row = calendarTable.insertRow();
	  for(i = 0; i < firstDate.getDay(); i++){
	  	cell = row.insertCell();
	  	cnt += 1;
	  }
	  
	  for(i = 1; i <= lastDate.getDate(); i++){
	  	cell = row.insertCell();
	  	cnt += 1;

	    cell.setAttribute('id', i);
	  	cell.innerHTML = i;
	  	cell.setAttribute('onclick', "dateClicked(this.id)");
	  	
	  	if (i == today.getDate()){
	  		var compareDay = new Date().getMonth();
	  		if(compareDay==today.getMonth()){
	  	  		cell.setAttribute('class', 'on');	
	  		}
	  	} else {
	  		cell.setAttribute('class', i);
	  	}
	  	
	    if (cnt % 7 == 0){
	    	row = calendar.insertRow();
	    }
	  }

	  if(cnt % 7 != 0){
	  	for(i = 0; i < 7 - (cnt % 7); i++){
	  		cell = row.insertCell();
	  	}
	  }
	}
	function prevCalendar(){
		today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
		buildCalendar();
	}
	function nextCalendar(){
		today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
		buildCalendar();
	}

//일시 선택
var departureDate = today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+(today.getDate())+"일 ";
function dateClicked(value) {
	
	var departureYM = $('#calendarTitle').text();
	departureDate = departureYM+value+"일";
	
	if(document.getElementsByClassName('on')[0] != null){
		document.getElementsByClassName('on')[0].setAttribute("class"," ");
	}
	document.getElementById(value).className = 'on';
	
}
var dateType="";
function submitDateAndTime() {
	var af = document.getElementById("af").value;
	if(af == ''){
		var hour = today.getHours();
		if(hour>=12){
			af = "오후";
		}else{
			af = "오전";
		}
	}
	var hour = document.getElementById("hour").value;
	var minutes = document.getElementById("minutes").value;
	
	if(dateType==1){dateType="date1"}
	else{dateType="date2"}
	
	document.getElementById(dateType).innerText = departureDate + " " + af +" "+ hour+ " " + minutes;
}

function dateSelect(date){
	dateType = date;
	
	var amp = "오전"
		var hour = today.getHours();
		if(hour>=12){
			if(hour != 12){
				hour = hour-12
			}
			amp = "오후"
		}
		var min = today.getMinutes()+10;
		if(min<=10){
			min = "00";
		}else if(min<=20){
			min = 10;
		}else if(min<=30){
			min = 20;
		}else if(min<=40){
			min = 30;
		}else if(min<=50){
			min = 40;
		}else if(min>=60){
			hour += 1;		
			min = "00";
		}else{
			min = 50;
		}
	
	$("#af").val(amp)
	$("#hour").val(hour+"시")
	$("#minutes").val(min+"분")
	
	layer_open('confirmPop','confirm_Pop')
}
</script>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->
	
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi small">
				<div class="top_navi"><a href="/taxi.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>택시 알림 설정</h2></div>
			</div>

			<div id="contents" class="taxi">
				<p class="taxi_tit">출발시간을 등록해주세요</p>
				<div class="line_box place">
					<p class="tit start">출발지</p>
					<select class="stratSelect">
						<option>정문 슬대존</option>
						<option>후문 슬대존</option>
						<option>연수동</option>
						<option>충주역</option>
						<option>충주터미널</option>
						<option>모시래</option>
						<option>신촌</option>
						<option>학생회관</option>
						<option>모시래 기숙사</option>
						<option>해오름 기숙사</option>
					</select>

					<p class="tit arrive">도착지</p>
					<select class="arriveSelect">
						<option>정문 슬대존</option>
						<option>후문 슬대존</option>
						<option>연수동</option>
						<option>충주역</option>
						<option>충주터미널</option>
						<option>모시래</option>
						<option>신촌</option>
						<option>학생회관</option>
						<option>모시래 기숙사</option>
						<option>해오름 기숙사</option>
					</select>

					<p class="mt20">
						<div class="line_box mt20">
				            <p class="tit">알람 시작 시간</p>
				            <p class="cal_pop" id="date1" onclick="dateSelect(1);"></p>
				            <p class="tit">알람 종료 시간</p>
				            <p class="cal_pop" id="date2" onclick="dateSelect(2);"></p>
			            </div>
					</p>
					

<!--             		<p class="btn mt35"><a href="#" class="cbtn" onclick="submitDateAndTime()">확인</a></p> -->
					<p class="btn mt35"><a href="javascript:retrun false;" onclick="javascript:submit();">등록</a></p>
				</div>


			<p class="taxi_tit mt30">등록된 출발 알람</p>
				<c:forEach var="alarm" items="${alarmList}">
	 			<div class="taxi_place line_box">
					<div>
						<div class="place">
							<p><span class="b">출발지</span><span>${alarm.startplace }</span></p><p><span class="b">도착지</span>${alarm.arrive }</p>
						</div>
			            					
						<fmt:parseDate value="${alarm.regiTime}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
			            <fmt:formatDate value="${dateValue }" var="time" pattern="yyyy-MM-dd HH:mm"/>
						<p class="time">${time } ${alarm.radio }   </p> 
						<script> makeFinbtn('${time }', '${alarm.radio }');</script>
						<br/>
						<fmt:parseDate value="${alarm.startTime}" var="dateValue1" pattern="yyyy-MM-dd HH:mm:ss"/>
			            <fmt:formatDate value="${dateValue1 }" var="time1" pattern="yyyy-MM-dd HH:mm"/>
						<fmt:parseDate value="${alarm.endTime}" var="dateValue2" pattern="yyyy-MM-dd HH:mm:ss"/>
			            <fmt:formatDate value="${dateValue2 }" var="time2" pattern="yyyy-MM-dd HH:mm"/>
			            
			            <p class="time">알람 시작 시간 : ${time1 }</p>
			            <p class="time">알람 종료 시간 : ${time2 }</p>
						<p class="gray_x">
							<a href="javascript:retrun false;" onclick="javascript:deleteAlarm(${alarm.alarmIdx})">삭제</a>
						</p>
					
					</div>
				</div>
				</c:forEach>
			</div>
				
		<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<!-- 작성완료 선택 시 노출 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="tit c">알림 등록 완료</p>
				<p class="mb20 c">알람이 등록되었습니다.</p>
				<p class="btn"><a href="/taxiAlarm.do">확인</a></p>
			</div> 
		</div>
	</div>
	
	<!-- 출발일시 선택 시 노출 -->
   <div class="layer" id="confirm_Pop">
      <div class="bg"></div>
      <div class="pop-layer" id="confirmPop">
         
         <div class="pop_cont texi_cal_pop">
            <div class="top">
               <p class="prev year_btn" onclick="prevCalendar()"><a href="#"><img src="/_img/_img/cont/year_prev_btn.png"></a></p>
               <p class="year" id="calendarTitle"></p>
               <p class="next year_btn" onclick="nextCalendar()"><a href="#"><img src="/_img/_img/cont/year_next_btn.png"></a></p>
            </div>
            
            <div class="cal_box">
               <table>
                  <colgroup>
                     <col width="15%">
                     <col width="14%">
                     <col width="14%">
                     <col width="14%">
                     <col width="14%">
                     <col width="14%">
                     <col width="15%">
                  </colgroup>
                  <thead>
                     <tr>
                        <th>S</th>
                        <th>M</th>
                        <th>T</th>
                        <th>W</th>
                        <th>T</th>
                        <th>F</th>
                        <th>S</th>
                     </tr>
                  </thead>
                  <tbody id="calendar">
                     <script type="text/javascript">buildCalendar();</script>
                  </tbody>
                </table>
            </div>

            <p class="tit">시간 선택</p>
            <div class="time_flex">
               <select id="af">
                  <option>오전</option>
                  <option>오후</option>
               </select>

               <select id="hour">
                  <option>1시</option>
                  <option>2시</option>
                  <option>3시</option>
                  <option>4시</option>
                  <option>5시</option>
                  <option>6시</option>
                  <option>7시</option>
                  <option>8시</option>
                  <option>9시</option>
                  <option>10시</option>
                  <option>11시</option>
                  <option>12시</option>
               </select>

               <select id="minutes">
                  <option>00분</option>
                  <option>10분</option>
                  <option>20분</option>
                  <option>30분</option>
                  <option>40분</option>
                  <option>50분</option>
               </select>
            </div>

            <p class="btn mt35"><a href="#" class="cbtn" onclick="submitDateAndTime()">확인</a></p>
         </div> 
      </div>
   </div>
	
	<div class="layer" id="del_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delPop">
			<div class="pop_cont text">
				<p class="tit c">알림 삭제 완료</p>
				<p class="mb20 c">알람이 삭제되었습니다.</p>
				<p class="btn"><a href="/taxiAlarm.do">확인</a></p>
			</div> 
		</div>
	</div>
</body>
</html>


<script>



//양식 제출
function submit() {
	var startTime = $('#date1').text();
	var endTime = $('#date2').text();
	var start = $('.stratSelect option:selected').text();
	var arrive = $('.arriveSelect option:selected').text();
	if(start != arrive){
		$.ajax({
			type: "POST",
			url:"/taxiAlarmAjax.do",
			data:{
				startTime: startTime,
				endTime: endTime,
				startplace: start,
				arrive: arrive
			},
	        success: function (data) { // data    1: 등록/수정 완료    2: 거래완료 / 삭제완료
	    		layer_open('okPop','ok_Pop');
	    		//window.location.href = "/taxiAlarm.do"
	        },
	        error: function (xhr, desc, err) {
	            alert('에러가 발생 하였습니다.');
	            return;
	        }
    });
		
		
	}else
		alert("출발지와 도착지가 같습니다")
}

function deleteAlarm(idx){
	$.ajax({
		type: "POST",
		url:"/taxiAlarmDelete.do",
		data:{
			alarmIdx: idx
		},
        success: function (data) { // data    1: 등록/수정 완료    2: 거래완료 / 삭제완료
    		layer_open('delPop','del_Pop');
    		//window.location.href = "/taxiAlarm.do"
        },
        error: function (xhr, desc, err) {
            alert('에러가 발생 하였습니다.');
            return;
        }
});
}

</script>
