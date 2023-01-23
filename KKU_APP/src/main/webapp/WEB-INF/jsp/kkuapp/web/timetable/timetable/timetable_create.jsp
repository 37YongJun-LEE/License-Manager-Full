<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../_inc/title.jsp" %>
</head>
<script>
function fnsubmit(){
	var id = $("#id").val();
	var pwd = $("#pwd").val();
	if(id == "") {
		layer_open('sendPop','send_Pop');
		$("#popContOne").hide();
		$("#popContTwo").hide();
		$("#popContThree").hide();
		$("#popContFour").show();
		$("#popContFive").hide();
	} else if(pwd == "") {
		layer_open('sendPop','send_Pop');
		$("#popContOne").hide();
		$("#popContTwo").hide();
		$("#popContThree").hide();
		$("#popContFour").hide();
		$("#popContFive").show();
	} else if(id != null && pwd !=null){
		layer_open('sendPop','send_Pop');
		$("#popContOne").show();
		$("#popContTwo").hide();
		$("#popContThree").hide();
		$("#popContFour").hide();
		$("#popContFive").hide();
		deleteAll();
		$.ajax({
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
			url : "/myTimetable.do",
			data : {
				kkuId: id,
				kkuPwd: pwd
			},
			success: function(msg) {
				if(msg == "success"){
					layer_open('sendPop','send_Pop');
					$("#popContOne").hide();
					$("#popContTwo").show();
					$("#popContThree").hide();
					$("#popContFour").hide();
					$("#popContFive").hide();
				} else {
					layer_open('sendPop','send_Pop');
					$("#popContOne").hide();
					$("#popContTwo").hide();
					$("#popContThree").show();
					$("#popContFour").hide();
					$("#popContFive").hide();
				}
			}
		});
	}
}

function deleteAll(){
	location.href = "timetable_delete.do";
}

</script>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div class="navi">
			<div class="top_navi"><a href="/timetable.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>내 시간표 불러오기</h2></div>
		</div>
		<div class="w_box top no_line">
			<p style="font-size:13px;">※ 학교 계정을 입력하시면 수강신청 내역을 시간표로 불러옵니다.</p>
			<p style="font-size:13px;">※ 기존 시간표가 있다면 초기화 되며 새로운 시간표로 변경됩니다.</p>
			<div id="contents">
				<div class="login email">
					<div class="input_box">
						<input type="text" id="id" placeholder="학교 계정 아이디 입력" onkeypress="if(event.keyCode == 13){fnsubmit(); return;}"/>
						<input type="password" id="pwd" placeholder="학교 계정 패스워드 입력" onkeypress="if(event.keyCode == 13){fnsubmit(); return;}"/>
					</div>
					
					<p class="btn">
						<a href="#" onclick="fnsubmit()" class="line" >내 시간표 불러오기</a>
					</p>
				
				</div>
			</div>
		</div>
		<%@include file="../../_inc/bottom_menu.jsp" %>
		<%@include file="../../_inc/footer.jsp" %>
	<!-- CONTENTS END -->

	<!-- POPUP BEGIN -->
	<!-- 인증번호 발송 선택 시 노출 -->
	<div class="layer" id="send_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop">
			<div class="pop_cont text" id="popContOne">
				<p class="mb20 c">잠시만 기다려주세요.</p>
			</div>
			<div class="pop_cont text" id="popContTwo">
				<p class="mb20 c">내 시간표 불러오기가 완료되었습니다.</p>
				<p class="btn"><a href="#" onClick="location.href='/timetable.do'" class="cbtn">돌아가기</a></p>
			</div>
			<div class="pop_cont text" id="popContThree">
				<p class="mb20 c">로그인 정보가 일치하지 않거나 해당 학기 수강이력이 없습니다.</p> 
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
			<div class="pop_cont text" id="popContFour">
				<p class="mb20 c">아이디를 입력해주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
			<div class="pop_cont text" id="popContFive">
				<p class="mb20 c">비밀번호를 입력해주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
		</div>
	</div>
	
	<!-- POPUP END -->
</div>

</body>
</html>