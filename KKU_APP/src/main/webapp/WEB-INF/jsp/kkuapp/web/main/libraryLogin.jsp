<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://lib.kku.ac.kr/assets/css/main.css?sv=2022.4.5.13">
<link rel="stylesheet" type="text/css" href="https://lib.kku.ac.kr/assets/css/ui.css">
<%@ include file="../_inc/title.jsp" %>
</head>
<script>
$( document ).ready(function() {

	if (/Mobi|Android/i.test(navigator.userAgent)) {
		var libID = window.Android.getLibID();
		var libPass = window.Android.getLibPass();
		$("#id").val(libID);
		$("#pwd").val(libPass);
		
	}
}); 
function submit(){
	var id = $("#id").val();
	var pwd = $("#pwd").val();
	if (/Mobi|Android/i.test(navigator.userAgent)) {
		window.Android.setLibIDandPass(id,pwd);
	}
	
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
		$.ajax({
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
			url : "/librarySeatAction.do",
			data : {
				kkuId: id,
				kkuPwd: pwd
			},
			dataType : "text",
			success: function(msg) {
				if(msg != "fail"){	
					layer_open('sendPop','send_Pop');
					$("#popContOne").hide();
					$("#popContTwo").show();
					$("#popContThree").hide();
					$("#popContFour").hide();
					$("#popContFive").hide();
	
					/* var html = "<iframe src="+ msg+" style= width:100%; height:300px; border: 3px dashed maroon>" + "</iframe>"
					alert(html);*/
					
					 $(".ikc-main div").remove();
					 $(".ikc-main ").append(msg);
					
				}
				
		
				
			}
		});
	}
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
		<div class="navi">
			<div class="top_navi"><a href="javascript:history.back(-1)"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>????????? ???????????? ?????? </h2></div>
		</div>
		
		<div id="contents">
			<div class="login email">
				<div class="input_box">
					<input type="text" id="id" placeholder="?????? ?????? ????????? ??????" onkeypress="if(event.keyCode == 13){submit(); return;}"/>
					<input type="password" id="pwd" placeholder="?????? ?????? ???????????? ??????" onkeypress="if(event.keyCode == 13){submit(); return;}"/>
				</div>
				
				<p class="btn">
					<a href="#" onclick="submit()" class="line" >????????? ?????? ??????</a>
				</p>
			
			</div>
			
			
		</div>
		<div class="ikc-main" ui-view="main">
			
		</div>
		
		<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<!-- ???????????? ?????? ?????? ??? ?????? -->
	<div class="layer" id="send_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="sendPop">
			<div class="pop_cont text" id="popContOne">
				<p class="mb20 c">????????? ??????????????????.</p>
			</div>
			<div class="pop_cont text" id="popContTwo">
				<p class="mb20 c">??????!</p>
				<p class="btn"><a href="#"  class="cbtn">????????????</a></p>
			</div>
			<div class="pop_cont text" id="popContThree">
				<p class="mb20 c">????????? ????????? ?????? ??????????????????.</p>
				<p class="btn"><a href="#" class="cbtn">??????</a></p>
			</div>
			<div class="pop_cont text" id="popContFour">
				<p class="mb20 c">???????????? ??????????????????.</p>
				<p class="btn"><a href="#" class="cbtn">??????</a></p>
			</div>
			<div class="pop_cont text" id="popContFive">
				<p class="mb20 c">??????????????? ??????????????????.</p>
				<p class="btn"><a href="#" class="cbtn">??????</a></p>
			</div>
		</div>
	</div>
	
	<!-- POPUP END -->

</body>
</html>