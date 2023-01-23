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
	
	
	document.getElementById("date").innerText = today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+(today.getDate())+"일 "+af+" "+hour+"시 "+min+"분";
	$("#input1").hide();
	$("#input2").hide();
	
})

//달력
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
//직접입력 활성화 체크
function checkOption(id){
	if(id == "departurePlace"){
		if(document.getElementById(id).value == "직접입력"){
			$("#input1").show();
		} else {
			$("#input1").hide();
		}
	}
	if(id == "arrivalPlace"){
		if(document.getElementById(id).value == "직접입력"){
			$("#input2").show();
		} else {
			$("#input2").hide();
		}
	}
}

//출발일시 선택
var departureDate = today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+(today.getDate())+"일 ";
function dateClicked(value) {
	
	var departureYM = $('#calendarTitle').text();
	departureDate = departureYM+value+"일";
	
	if(document.getElementsByClassName('on')[0] != null){
		document.getElementsByClassName('on')[0].setAttribute("class"," ");
	}
	document.getElementById(value).className = 'on';
	
}
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
	
	document.getElementById("date").innerText = departureDate + " " + af + " " + hour+" " + minutes;
}

//모집 성별 선택
var gender = "상관없음";
function genderSelected(value) {
	gender = value;
}

//작성자 성별 선택
var myGender = "";
function myGenderSelected(value) {
	myGender = value;
}

//양식 제출
function submit() {
	var departurePlace = document.getElementById('departurePlace').value;
	if(departurePlace == "직접입력") {
		departurePlace = document.getElementById('input1').value;
	}
	var arrivalPlace = document.getElementById('arrivalPlace').value;
	if(arrivalPlace == "직접입력") {
		arrivalPlace = document.getElementById('input2').value;
	}
	var members = document.getElementById('members').value;
	var departureTime = document.getElementById('date').innerText;
	
	var taxiRequest = document.getElementById('taxiRequest').value;
	
	
	if(departurePlace == '0'){
		layer_open('sendPop','send_Pop');
		$("#popContOne").show();
		$("#popContTwo").hide();
		$("#popContThree").hide();
		$("#popContFour").hide();
		$("#popContFive").hide();
	} else if(arrivalPlace == '0') {
		layer_open('sendPop','send_Pop');
		$("#popContOne").hide();
		$("#popContTwo").show();
		$("#popContThree").hide();
		$("#popContFour").hide();
		$("#popContFive").hide();
	} else if(members == '0') {
		layer_open('sendPop','send_Pop');
		$("#popContOne").hide();
		$("#popContTwo").hide();
		$("#popContThree").show();
		$("#popContFour").hide();
		$("#popContFive").hide();
	} else if(myGender == "") {
		layer_open('sendPop','send_Pop');
		$("#popContOne").hide();
		$("#popContTwo").hide();
		$("#popContThree").hide();
		$("#popContFour").hide();
		$("#popContFive").show();
	} else { 
		$.ajax({
			type: "POST",
			url:"/taxiWrite_submit.do",
			data:{
				departurePlace: departurePlace,
				arrivalPlace: arrivalPlace,
				members: members,
				gender: gender,
				departureTime: departureTime,
				myGender: myGender,
				taxiRequest: taxiRequest
			},
			success: function(msg) {
				if (msg == 0) {
				} else {

					layer_open('sendPop','send_Pop');
					$("#popContOne").hide();
					$("#popContTwo").hide();
					$("#popContThree").hide();
					$("#popContFour").show();
					$("#popContFive").hide();
				}
			}
		})
	}
	
}
function dateSelect(){
	
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
            <div class="top_navi"><a href="/taxi.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>택시 합승</h2></div>
         </div>

         <div id="contents" class="taxi">
            <div class="line_box place">
               <p class="tit start">출발지</p>
               <select id="departurePlace" onchange="checkOption(this.id)">
                  <option value="0">출발지 선택</option>
                  <option value="정문">정문</option>
                  <option value="후문">후문</option>
                  <option value="연수동">연수동</option>
                  <option value="충주역">충주역</option>
                  <option value="충주터미널">충주터미널</option>
                  <option value="건국터미널">건국터미널</option>
                  <option value="모시래">모시래</option>
                  <option value="신촌">신촌</option>
                  <option value="직접입력">직접입력</option>
                 
               </select>
               <input id="input1" type="text" value=""> </input>

               <p class="tit arrive">도착지</p>
               <select id="arrivalPlace" onchange="checkOption(this.id)">
                  <option value="0">도착지 선택</option>
                  <option value="정문">정문</option>
                  <option value="후문">후문</option>
                  <option value="연수동">연수동</option>
                  <option value="충주역">충주역</option>
                  <option value="충주터미널">충주터미널</option>
                  <option value="건국터미널">건국터미널</option>
                  <option value="모시래">모시래</option>
                  <option value="신촌">신촌</option>
                  <option value="직접입력">직접입력</option>
               </select>
               <input id="input2" type="text" value=""> </input>
            </div>

            <div class="line_box mt20">
               <p class="tit">출발 일시</p>
               <p class="cal_pop" id="date" onclick="dateSelect();"></p>
               
               <p class="tit">모집 인원</p>
               <select id="members">
                  <option value="0">모집인원 선택</option>
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                  <option value="3" selected>3명</option>
               </select>

               <p class="tit">모집 성별</p>
               <input onclick="genderSelected(this.value);" type="radio" id="r1" value="상관없음" name="radio" checked>
                  <label for="r1" style="margin-left: 5px;">상관없음</label>
               <input onclick="genderSelected(this.value);" type="radio" id="r2" value="남성" name="radio">
                  <label for="r2">남성</label>
               <input onclick="genderSelected(this.value);" type="radio" id="r3" value="여성" name="radio">
                  <label for="r3">여성</label>
                  
                  
               <p class="tit">작성자 성별*</p>
               <input onclick="myGenderSelected(this.value);" type="radio" id="r11" value="남성" name="radio2">
                  <label for="r11">남성</label>
               <input onclick="myGenderSelected(this.value);" type="radio" id="r12" value="여성" name="radio2">
                  <label for="r12">여성</label>
                  
               		<p class="tit">요청사항</p>
               		<input type="text" value="" id="taxiRequest"/>
               <p class="btn mt35"><a href="#" onclick="submit()">작성하기</a></p>
            </div>
         </div>
            
      <%@include file="../_inc/bottom_menu.jsp" %>
      <%@include file="../_inc/footer.jsp" %>
   <!-- CONTENTS END -->
   
   
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
   
   <div class="layer" id="send_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop">
			<div class="pop_cont text" id="popContOne">
				<p class="mb20 c">출발지를 입력해주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
			<div class="pop_cont text" id="popContTwo">
				<p class="mb20 c">도착지를 입력해주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
			<div class="pop_cont text" id="popContThree">
				<p class="mb20 c">모집 인원을 선택해주세요.</p> 
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
			<div class="pop_cont text" id="popContFour">
				<p class="mb20 c">게시물 등록이 완료되었습니다.</p>
				<p class="btn"><a href="#" onClick="location.href='/taxi.do'" class="cbtn">확인</a></p>
			</div>
			<div class="pop_cont text" id="popContFive">
				<p class="mb20 c">작성자 성별을 선택해주세요.</p> 
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
		</div>
	</div>

   
   

</body>
</html>