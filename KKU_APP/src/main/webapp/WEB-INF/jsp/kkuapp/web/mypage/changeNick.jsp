<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script>

// 오타 ex) 건ㄱ국대 유효성 검사 필요 / confirm 팝업 필요 / 한번이라도 사용한 닉네임 사용할수있게 or 없게 << 정책
$(document).ready(function(){

	$("#changeBtn").click(function(){ // 닉네임 중복 체크 
		var memCnt = 0;
		var name = $("#name").val();
		if(check(name) == 1){
			$("#contOne").hide();
			$("#contTwo").hide();
			$.ajax({
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				type: "POST",
				url: "/mypage/updateNick.do",
				data: {
					usrNickname : name
				},
				success: function(data) {
					memCnt = data;
					if(memCnt == '1') { //해당 닉네임이 중복 되지 않았을때 
						isNicknamechked = true;
						layer_open('confirmPop','confirm_Pop');
						$("#contOne").show();
						$("#contTwo").hide(); 
    			     	location.href='/mypage.do';
					}
					else {
						isNicknamechked = false;
						layer_open('confirmPop','confirm_Pop');
						$("#contOne").hide();
						$("#contTwo").show();
						$("#nickname").focus();
					}
				}
			});
			
		}
	
	}); 

});

function check(name){
	
	var nickLength = 0;

    var engCheck = /[a-z]/;
    var numCheck = /[0-9]/;
    var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

    //한글, 영문 길이 2,1로 바꾸기
    for(var i=0; i<name.length; i++){ //한글은 2, 영문은 1로 치환
    	
       nick = name.charAt(i);
       if(escape(nick).length >4){
          nickLength += 2;
       }else{
          nickLength += 1;
       }
    }
    
  //닉네임 필수 입력
    if (name == null || name == "") {

       alert("닉네임 입력은 필수입니다.");

    //닉네임 빈칸 포함 안됨
    } else if (name.search(/\s/) != -1) {
       alert("닉네임은 빈 칸을 포함 할 수 없습니다.");return 0;
    //닉네임 한글 1~10자, 영문 및 숫자 2~20자   
    } //else if (nickname.length<2 || nickname.length>20) {
    else if (nickLength<4 || nickLength>20) {
       alert("닉네임은 한글 2~10자, 영문 및 숫자 4~20자 입니다.");return 0;
    //닉네임 특수문자 포함 안됨   
    } else if (specialCheck.test(name)) {
		 alert("닉네임은 특수문자를 포함 할 수 없습니다.");return 0;
    } else if (name == "${userInfo.usrNickname }"){
    	alert("변경하려는 닉네임이 현재 닉네임과 동일합니다.");return 0;
    } else
    	return 1;
}
</script>
</head>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
			
		</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="my_main head_mg">
			<div class="navi">
				<div class="top_navi"><a href="/mypage.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>닉네임 변경</h2></div>
			</div>
			<div class="w_box no_line">
				<ul class="form">
					<li>
						<p class="overflow mb15"><input type="text" id="name" placeholder="닉네임을 입력해주세요."/><a href="#"  id=changeBtn class="btn" >변경</a></p>
						<p class="tip">* 닉네임 변경은 60일 이후에 가능합니다</p>
						<p class="tip">(이전 변경 날짜 : ${userInfo.nickChangedate })</p>
					</li>
				</ul>
			</div>
			<%@include file="../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->

	<!-- POPUP BEGIN -->
	<!--  닉네임 중복일 경우  -->
	<div class="layer" id="confirm_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="confirmPop">
			
			<!-- 01. 사용가능한 닉네임일 시 -->
			<div class="pop_cont text" id="contOne">
				<p class="mb20 c">변경되었습니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 

			<!-- 02. 닉네임이 중복될 시 -->
			 <div class="pop_cont text" id="contTwo">
				<p class="mb20 c">이미 사용중이거나 변경은 60일 이내 한번만 가능합니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
			 
		</div>
	</div>
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>