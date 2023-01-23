<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../_inc/title.jsp" %>

</head>
<script>

//인증번호 발송 관련 onclick 함수 
var emailConfirmNum = '';
var emailAddress = {};

function checkClick(){ 
	
	if($("#email").val() == ""){
		layer_open('sendPop','send_Pop')
		$("#popContOne").show();
		$("#popContTwo").hide();
		$("#popContFive").hide();
	}
	else{
		/* if(!$("#email").val().includes("@kku.ac.kr")){
			alert("건국대 이메일로만 가입가능합니다");
			return;
		} */
		alert("test기간중에만 타 이메일로 가입가능합니다");
		
		emailAddress = {"usrEmail" : $("#email").val() };
		
		$.ajax({
			
			url:"/member/email.do",
			type:"GET",
			data: emailAddress,
			dataType:"text",
			contentType:"application/json; charset=UTF-8",
			success : function(data ) {
				if(data == "already"){
					layer_open('sendPop','send_Pop')
					$("#popContOne").hide();
					$("#popContTwo").hide();
					$("#popContFive").show();
				}
				else{
					layer_open('sendPop','send_Pop')
					$("#popContOne").hide();
					$("#popContTwo").show();
					$("#popContFive").hide();
					emailConfirmNum = data;
				}
			},
			error : function(data) {
				alert(data);
			} 
		}) 
	}

}

function formSubmit(){
	$("#frm").submit();
}
function confirmClick(){ //6자리 입력 검증 추가 예정 
	// + "@kku.ac.kr"
	$("#em").val($("#email").val());
	
	if (!chkLength($("#ctfNum"),4,6)){ //인증코드의 문자가 4~6자리 일때 
		if ( $("#ctfNum").val() != emailConfirmNum ) { //사용자 입력 인증번호가 메일인증번호와 다를때
			layer_open('confirmPop','confirm_Pop')
			$("#popContThree").show();
			$("#popContFour").hide();
		}
		else{//사용자 입력 인증번호가 메일인증번호와 같을때
			layer_open('confirmPop','confirm_Pop')
			$("#popContThree").hide();
			$("#popContFour").show();
			 //promotionYN , 사용자 email을 join03.do controller로 
		}
	}else{
		layer_open('confirmPop','confirm_Pop')
		$("#popContThree").show();
		$("#popContFour").hide();
	}
	

}

function chkLength(obj, min, max) { // 길이검사
	if(obj.val().length >= min && obj.val().length <= max ){
		return false;
	} else{
		return true;
	}
}

</script>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<div class="navi">
			<div class="top_navi"><a href="join01.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>이메일 인증</h2></div>
			<ul>
				<li>사용자 약관동의</li>
				<li  class="on">이메일 인증</li>
				<li>회원정보 입력</li>
				<li>가입완료</li>
			</ul>
		</div>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="contents">
			<div class="login email">
				<div class="input_box">
					<p class="email">
						<input type="text" id = "email" placeholder="이메일 입력">
						<!-- <span>@</span>
						<input type="text" value="kku.ac.kr" disabled> -->
					</p>
					<input type="text" placeholder="인증번호 입력" id = "ctfNum">
				</div>
				
				<p class="btn">
					<a href="#" onclick="checkClick()" class="line" >인증번호 발송</a>
					<a href="#" onclick="confirmClick()" class="cfm">회원 정보 입력하러 가기</a>
				</p>
			
			</div>
			<div class="guide">

				<p class="mb10">정확한 정보를 입력했으나 인증 번호가 수신되지 않는다면 아래 내용을 참고 해주시길 바랍니다.</p>
				<ol>
					<li>1. 발송된 메일이 스팸 메일함에 있는지 확인해 주세요.<li>
					<li>2. KuKuTeam에서 발송한 이메일 주소가 수신 차단되었는지 확인해 주세요. (<a href="mailto:﻿"kukuteamnoreply@gmail.com" >kukuteamnoreply@gmail.com</a>)<li>
					<li>3. 위 두가지가 아닐시 일시적 장애 일수도 있습니다.<li>
				</ol>
			</div>
		</div>
		<!--    -->
				<form name="frm" id="frm"  method="post" action="/member/join03.do">
					<input type= "hidden" name ="promotion" id="promotion" value="${promotionYn}">
					<input type="hidden" name="em" id="em">
				</form>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<!-- 인증번호 발송 선택 시 노출 -->
	<div class="layer" id="send_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop">

			<!-- 01.이메일이 틀렸을 시 노출 -->

	<!--나 건국대 이메일이 아닙니다  -->
			<!-- 01.이메일이 틀렸을 시 노출 -->
			 <div class="pop_cont text" id="popContOne">
				<p class="mb20 c">이메일 입력란이 공백입니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>  
		
			<!-- 02. 인증번호 발송 시 -->
			<div class="pop_cont text" id="popContTwo">
				<p class="mb20 c">입력하신 이메일로 인증번호를 발송했습니다.<br/>인증번호가 오지 않으면 입력하신 정보가<br/>정확한지 확인해 주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
			
			<!-- 03.이메일이 이미 가입되어 있을시-->
			 <div class="pop_cont text" id="popContFive">
				<p class="mb20 c">해당 이메일이 이미 존재합니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>  
		</div>
	</div>
	
	<!-- 회원 정보 입력하러 가기 선택 시 노출 -->
	<div class="layer" id="confirm_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="confirmPop">
			
			<!-- 01.인증번호가 틀렸을 시 노출 -->
			<div class="pop_cont text" id="popContThree">
				<p class="mb20 c">인증번호가 다릅니다.<br/></p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>

			<!-- 02. 인증번호 확인 시 노출 join03.do -->
			<div class="pop_cont text" id="popContFour">
				<p class="mb20 c">인증번호가 맞습니다!<br/>회원정보 입력페이지로 이동합니다.</p>
				<p class="btn"><a href="#" onClick="formSubmit()">확인</a></p>
			</div>

		</div>
	</div>
	<!-- POPUP END -->



</div>

</body>
</html>