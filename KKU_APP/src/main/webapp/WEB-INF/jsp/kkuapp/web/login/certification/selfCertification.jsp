<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../_inc/title.jsp" %>

</head>
<script>
var certificateNum;
function checkEmail(){ 
	var emailInput = $("#email").val();
	if( ($("#email").val() == "") || (!$("#email").val().includes("@kku.ac.kr"))  ){
		layer_open('sendPop','send_Pop')
		$("#popContOne").show();
		$("#popContTwo").hide();
		$("#popContThree").hide();
	}
	else{
		
		layer_open('sendPop','send_Pop')
		$("#popContOne").hide();
		$("#popContTwo").show();
		$("#popContThree").hide();
		$.ajax({
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			url:"/member/certificateEmail.do",
			type:"POST",
			data: { usrEmail : emailInput },
			
			success : function(data ) {
				
				if(data == "-1"){
					layer_open('sendPop','send_Pop')
					$("#popContOne").hide();
					$("#popContTwo").hide();
					$("#popContThree").show();
				}
				else{
					certificateNum = data;
				}
				
			}
		}) 
	}

}
//popContFour : 인증번호 정확 x , popContFive : 인증번호 정확하다 
function confirmClick(){ //6자리 입력 검증 추가 예정 
	$("#em").val($("#email").val());
	
	if (!chkLength($("#ctfNum"),4,6)){ //인증코드의 문자가 4~6자리 일때 
		if ( $("#ctfNum").val() != certificateNum ) { //사용자 입력 인증번호가 메일인증번호와 다를때
			layer_open('confirmPop','confirm_Pop')
			$("#popContFour").show();
			$("#popContFive").hide();
		}
		else{//사용자 입력 인증번호가 메일인증번호와 같을때
		
			layer_open('confirmPop','confirm_Pop')
			$("#popContFour").hide();
			$("#popContFive").show();
			$("#frm").submit();// 사용자 email을 resetpasswd controller로 
		}
	}else{
		layer_open('confirmPop','confirm_Pop')
		$("#popContFour").show();
		$("#popContFive").hide();
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
			<div class="top_navi"><a href="javascript:history.go(-1)"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>본인 인증</h2></div>
			<ul>
				<li class="on">본인 인증</li>
				<li>비밀번호 재설정</li>
			</ul>
		</div>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="contents">
			<div class="login self">
				<div class="input_box">
					<p>
						<input type="text" id="email" placeholder="이메일 입력해주세요">
						<input type="text" id ="ctfNum" placeholder="인증번호 입력">
					</p>
				</div>
				<p class="btn">
					<a href="#" class="line" onclick="checkEmail()">인증번호 발송</a>
					<a href="#" onclick="confirmClick()">인증확인</a>
				</p>
			</div>
		</div>
		<!-- method="post" action="/member/resetPW" -->
		<form name="frm" id="frm"  method="post" action="/member/resetPW.do">
					<input type="hidden" name="em" id="em">
				</form>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<!-- 인증번호 발송 선택 시 노출 -->
	<div class="layer" id="send_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop">
			
			<!-- 01.이메일이 틀렸을 시 노출 -->
			 <div class="pop_cont text" id="popContOne">
				<p class="mb20 c">이메일 입력란이 공백이거나 건국대 이메일이 아닙니다</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>  

			<!-- 02. 인증번호 발송 시 -->
			<div class="pop_cont text" id="popContTwo">
				<p class="mb20 c">이메일로 인증번호를 발송했습니다.<br/>인증번호가 오지 않으면 입력하신 정보가<br/>회원정보와 일치하는지 확인해 주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>

			<!-- 03. 해당 유저가 존재하지 않을때 -->
			 <div class="pop_cont text" id="popContThree">
				<p class="mb20 c">해당 유저가 존재 하지 않습니다</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
		</div>
	</div>
	
	<!-- 인증확인 선택 시 노출 -->
	<div class="layer" id="confirm_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="confirmPop">
			
			<!-- 01.인증번호가 틀렸을 시 노출 -->
			<div class="pop_cont text" id="popContFour">
				<p class="mb20 c">인증번호가 정확하지 않습니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>  

			<!-- 02. 인증번호 확인 시 노출 -->
			<div class="pop_cont text" id="popContFive">
				<p class="mb20 c">인증번호가 정확합니다.</p>
				<p class="btn"><a href="#">확인</a></p>
			</div>

		</div>
	</div>
	<!-- POPUP END -->


</body>
</html>