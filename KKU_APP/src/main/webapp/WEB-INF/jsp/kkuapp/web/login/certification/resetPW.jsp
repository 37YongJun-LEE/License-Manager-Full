<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../_inc/title.jsp" %>

</head>

<script>
//contOne : 비밀번호 다름  contTwo : 비밀번호 성공적으로 변환 
function inputCheck(id){
	var newId = '#' + id;
	$(newId).val($(newId).val().replace(/(\s*)/g,"") )
}

function newPassWord(){
	if($("#pw").val().trim() =="" || $("#pwc").val().trim() == ""){
		layer_open('okPop','ok_Pop')
		return;
	}
	var mail = "${email }";
	var pw = $("#pw").val();
	
	if($("#pw").val() != "" && $("#pwc").val() !="" ){
		if($("#pwc").val() == $("#pw").val()) {
			$.ajax({
	    		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    		type : "POST",
	    		url : "/member/resetPWajax.do",
	    		data : { usrEmail : mail,
	    				usrPassword : pw
	    			},
	    			success: function(tmp) {
	    				if(tmp=="1"){
	    					
	    					layer_open('confirmPop','confirm_Pop')
	    					$("#contOne").hide();
	    			     	$("#contTwo").show();
	    			     	location.href='/member/login.do';
	    			     	
	    				}
	    				
	    			}
	    			 
	    	});
		}
		else{
			layer_open('confirmPop','confirm_Pop')
			$("#contOne").show();
	     	$("#contTwo").hide();
		}
	}
}
</script>
<body>

<div id="wrap">
<!-- HEADER BEGIN -->
		<div class="navi">
			<div class="top_navi"><a href="javascript:history.go(-1)"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>비밀번호 재설정</h2></div>
			<ul>
				<li>본인 인증</li>
				<li class="on">비밀번호 재설정</li>
			</ul>
		</div>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="contents">
			<div class="login self">
				<div class="input_box">
					<p>
					
						<input type="password" id="pw" placeholder="새 비밀번호" onkeyup="inputCheck(this.id)">
						<input type="password" id="pwc" placeholder="새 비밀번호 확인" onkeyup="inputCheck(this.id)">
					</p>
				</div>
				<!-- layer_open('confirmPop','confirm_Pop') -->
				<p class="btn">
					<a href="#" onclick="newPassWord()">비밀번호 변경하기</a>
				</p>
			</div>
		</div>
	
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->

	<!-- 비밀번호 변경하기 선택 시 노출 -->
	<div class="layer" id="confirm_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="confirmPop">
			
			<!-- 01.비밀번호 틀렸을 시 노출 -->
			 <div class="pop_cont text" id="contOne">
				<p class="mb20 c">비밀번호가 다릅니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 

			<!-- 02. 비밀번호 변경 시 -->
			<div class="pop_cont text" id="contTwo">
				<p class="mb20 c">비밀번호가 성공적으로<br/>변경되었습니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>

		</div>
	</div>
	
	<!-- POPUP END -->
	
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			
			<!-- 01.새 비밀번호 입력란들이 공백일시 노출 -->
			 <div class="pop_cont text" id="ocontOne">
				<p class="mb20 c">비밀번호 입력란들을 확인해주세요 </p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 

		</div>
	</div>
</div>

</body>
</html>