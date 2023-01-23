<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>
<style>

</style>
<script>
$(function(){
	var date	= new Date();
	var year	= date.getFullYear(); 
	var month	= date.getMonth() + 1;
	var day		= date.getDate();
	
	if (("" + month).length==1){month = "0"+month;}
	if (("" + day).length==1){day = "0"+day;}
	var today = year+"-"+month+"-"+day;
	
	$("#ddate").val(today);
	});

function addDash(dateCtl){
	if(dateCtl.value.length==4 || dateCtl.value.length==7){
	dateCtl.value +="-";
	}
}
function formsubmit(){
	if($("#stdId").val() == ""){
		alert("학번을 입력해주세요");
		$("#stdId").focus();
		return false;
	}
	if ($("#stdId").val().length != 9){
		alert("학번은 9자리입니다.");
		$("#stdId").focus();
		return;
	}

	if(isNaN($("#stdId").val())){
		alert("학번은 숫자로 입력해 주세요.");
		$("#stdId").focus();
		return;
	}
	if($("#birthDate").val() == ""){
		alert("생년월일을 입력해주세요");
		$("#birthDate").focus();
		return false;
	}
	if ($("#birthDate").val().length != 6){
		alert("생년월일은 6자리입니다. ex)970713");
		$("#birthDate").focus();
		return;
	}
	if(isNaN($("#birthDate").val())){
		alert("생년월일은 숫자로 입력해 주세요.");
		$("#birthDate").focus();
		return;
	}

	var searchQuery = "/dormOutSearch.do?check=n&stdNo="+$("#stdId").val()+"&resno="+$("#birthDate").val()+"&DORM_CD="+${cd}
	location.href = searchQuery;
	
	
 

	
}



</script>
<div id="test"></div>

<body >
<header class="sub">
		<%@include file="../_inc/header.jsp" %>
	</header>


<!-- <script>
let i = document.querySelector('frame');
i.contentWindow.scrollTo(0, i.contentDocument.body.scrollHeight);
</script> -->
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="head_mg mb140">

			<div class="navi small">
				<div class="top_navi"><a href="javascript:history.back(-1)"><img src="/_img/_img/cont/navi_arrow.png"></a> 
				<c:if test = "${cd eq '1' }"> <h2>모시래 기숙사 외박 신청</h2> </c:if> 
 					<c:if test = "${cd eq '2' }"> <h2>해오름 기숙사 외박 신청</h2> </c:if> </div>
			</div>
			<div class="w_box no_line">
				<ul class="form">
					<li>
						<div class="input_box">
							<p>
								<input type="text" id="stdId" placeholder="학번을 입력해주세요" onkeypress="if(event.keyCode == 13){submit(); return;}"/>
								<input type="text" id="birthDate" placeholder="생년월일을 입력해주세요" class="mt10" onkeypress="if(event.keyCode == 13){submit(); return;}"/>
							</p>
						</div>
					</li>
				</ul>
				<p class="btn mt35"><a href="#"  onclick="formsubmit()">조회하기</a></p>
			</div>
			</div>

			

 

	

</body>

<%@ include file="../_inc/bottom_menu.jsp" %>

<%@ include file="../_inc/footer.jsp" %>
</html>