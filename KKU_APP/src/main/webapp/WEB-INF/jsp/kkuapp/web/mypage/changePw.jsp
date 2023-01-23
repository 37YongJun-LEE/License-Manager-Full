<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>




</head>
<body>
	
	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
			
		</header>
	<!-- HEADER END -->
	
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="my_main head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="/mypage.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>비밀번호 변경</h2></div>
			</div>
			<div class="w_box no_line">
				<ul class="form">
					<li>
					<p class="input_t">현재 비밀번호를 입력해주세요.</p>
					<p class="password">
						<input type="password" id="pwOld" placeholder="현재 비밀번호"/>
					</p>
					</li>
					<li>
						<p class="input_t">새 비밀번호를 입력해주세요.</p>
						<div class="input_box">
							<p class="password">
								<input type="password" id="pw1" class="pw" placeholder="새 비밀번호"/>
								<input type="password" id="pw2" class="pw" placeholder="새 비밀번호 확인"/>
							</p>
							<p class="feedback Y" style="display: none;"><span>!</span>사용 가능합니다.</p>
							<p class="feedback N" style="display: none;"><span>!</span>비밀번호가 일치하지 않습니다.</p>
						</div>
					</li>
				</ul>
				<p class="btn mt35">
					<a href="#" onclick="newPassWord();">변경</a>
				</p>
			</div>
			<%@include file="../_inc/bottom_menu.jsp" %>
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
				<p class="btn"><a href="#" class="cbtn" onClick="location.href='/mypage.do'">확인</a></p>
			</div>


			<!-- 03. 현재 비밀번호 불일치 -->
			<div class="pop_cont text" id="contThree">
				<p class="mb20 c">현재 비밀번호가 다릅니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
		</div>
	</div>
	
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>

<script>

$('.pw').focusout(function () {
    var pwd1 = $("#pw1").val();
    var pwd2 = $("#pw2").val();

    if ( pwd1 != '' && pwd2 == '' ) {
        null;
    } else if (pwd1 != "" || pwd2 != "") {
        if (pwd1 == pwd2) {
            $(".feedback.Y").css('display', '');
            $(".feedback.N").css('display', 'none');
        } else {
            $(".feedback.Y").css('display', 'none');
            $(".feedback.N").css('display', '');
        }
    }
});


//contOne : 비밀번호 다름  contTwo : 비밀번호 성공적으로 변환 
function newPassWord(){

	/* 유효성 검사 필요  */ // 에전 비번이랑 지금 비번이랑 같은거도 유효성 추가
	var pw = $("#pw1").val();
	var pwo = $("#pwOld").val();
	if($("#pw1").val() != "" && $("#pw2").val() !="" ){
		if($("#pw1").val() == $("#pw2").val()) {
			$.ajax({
	    		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    		type : "POST",
	    		url : "/mypage/updatePassword.do",
	    		data : { oldPassword : pwo,
	    				newPassword : pw
	    			},
	    			success: function(tmp) {
	    				if(tmp=="1"){

	    					layer_open('confirmPop','confirm_Pop')
	    					$("#contOne").hide();
	    			     	$("#contTwo").show();
	    			     	$("#contThree").hide();
	    			     	
	    			
	    				}
	    				else if(tmp=="diffpass"){
	    					layer_open('confirmPop','confirm_Pop')
	    					$("#contOne").hide();
	    			     	$("#contTwo").hide();
	    			     	$("#contThree").show();
	    				}
	    				
	    			}
	    			 
	    	});
		} else{
			
			layer_open('confirmPop','confirm_Pop')
			$("#contOne").show();
	     	$("#contTwo").hide();
	     	$("#contThree").hide();
		}
	}
}
</script>