<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script>
    $('.pw').click(function () {
        var pwd1 = $("#password_1").val();
        var pwd2 = $("#password_2").val();
  
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    });
</script>

<script>

$('#pw').focusout(function () {
	alert('이벤트호출')
    var pwd1 = $("(pw1)").val();
    var pwd2 = $("(pw2)").val();


    if ( pwd1 != '' && pwd2 == '' ) {
        null;
    } else if (pwd1 != "" || pwd2 != "") {
        if (pwd1 == pwd2) {
            $(".feedback_Y").css('display', 'none');
            $(".feedback_N").css('display', 'inline-block');
        } else {
            $(".feedback_Y").css('display', 'inline-block');
            $(".feedback_N").css('display', 'none');
        }
    }
});


//contOne : 비밀번호 다름  contTwo : 비밀번호 성공적으로 변환 
function newPassWord(){
	
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

</head>
<body>
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
<div class="content_title">비밀번호</div>
<div class="content_content">
    <input type="password" id="password_1" class="pw" placeholder="비밀번호">
    <span>8~15자리의 영문, 숫자, 특수문자의 입력이 가능합니다.</span>
</div>
  
<div class="content_title">비밀번호 확인</div>
<div class="content_content">
    <input type="password" id="password_2" class="pw" placeholder="비밀번호 확인">
    <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
    <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
</div>
  

	
	
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

</div>
<!-- //wrap -->

</body>
</html>