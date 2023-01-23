<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../_inc/title.jsp" %>
<%@page import="java.util.List" %>
</head>
<script>

/* 필요한 기능
 * 닉네임 : 한글, 영어, 숫자 입력만 
 * 비밀번호 x자 이상 영문 특수문자 입력 하게
 * 이름: 한글만 입력 가능하게
 * 학번 : 숫자만 입력 가능하게
 */
 function replacePnum(obj){

		$("#pnum").val($("#pnum").val().replace(/-/g,"")) 
	}

//비밀번호 보이기
/* $("input").on({
    keydown: function (e) {
        if (e.which === 32) return false;
    },
    change: function () {
        this.value = this.value.replace(/\s/g, "");
    }
}); */
var isNicknamechked = false;
var test = '';
$(document).ready(function(){

	changeOption();
	//changeOption();
	$(".feedback.Y").hide();
	$(".feedback.N").hide();
	
	$('.password i').on('click' ,function(){
		$(this).parent().toggleClass('active');
		if($('.password').hasClass('active')){
			$(this).siblings('input').attr('type','text');
		}else{
			$(this).siblings('input').attr('type','password');
		}
	}); // 비밀번호 입력시 보이기/ 감추기 

	
	$("#chkDupBtn").click(function(){ // 닉네임 중복 체크 
		var memCnt = 0;
		var name = $("#nickname").val().trim();

		$("#contOne").hide();
		$("#contTwo").hide();
		if(name == ''){
			alert("닉네임이 공백입니다.");
			$("#nickname").val($("#nickname").val().replace(/(\s*)/g, ""));
			return ;
		}
		else{
			$.ajax({
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				type: "POST",
				url: "/member/nickCheck.do",
				data: {
					usrNickname : name
				},
				success: function(data) {
					memCnt = data;
					if(memCnt == '0') { //해당 닉네임이 중복 되지 않았을때 
						isNicknamechked = true;
						layer_open('confirmPop','confirm_Pop');
						$("#contOne").show();
						$("#contTwo").hide(); 
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

function chkType(type,str){
	var reg,res;
	switch(type){
		case 'Chi':
			reg = /^[\u4E00-\u9FD5]+$/g;
			res = reg.test(str);
			break;
		case 'Kor':
			reg = /^[가-힣]+$/g;
			res = reg.test(str); //.test() 정규식과 일치하는 문자열인지 test -> 일치하면 true return 
			break;
		case 'Eng':
			reg = /^[a-zA-Z]+$/g;
			res = reg.test(str);
			break;
		case 'Num':
			reg = /^[0-9]{8,16}$/g;
			res = reg.test(str);
			break;
		default :
			return false;
	}
	return res;
}



function fn_submit(){
	var isPass = true;
	
	var promo = $("#promotion").val();
	
	$(".idFeedback.N").hide();
	 $('input').each(function() {
		 if(!$(this).val()){
        	$("#empty").text($(this).attr('placeholder'));
        	layer_open('submitPop','submit_Pop');
        	$("#subContOne").show();
        	$("#subContTwo").hide();
           return ;
        } // 입력칸들이 공백일때
    });  //for each end
	 if(!$("#option option:selected").val() || !$("#departM option:selected").val()){
     	var String = "단과대 또는 학과를 선택해 주세요";
     	$("#empty").text(String);
     	layer_open('submitPop','submit_Pop');
     	$("#subContOne").show();
     	$("#subContTwo").hide();
     	return isPass = false;
     }// 학과, 단과대 선택 안했을때 
    if(!chkType('Kor',$('#name').val())){
			
			return isPass = false;
		} //이름 입력란에 한글말고 다른 문자를 넣었을때
	if(!chkType('Num',$('#id').val())){
			/* alert('학번을 올바르게 입력해주세요'); //alert 대신 밑 표시로 
			$('#id').focus(); */
			return isPass = false;
		} //학번 입력란에 한글말고 다른 문자를 넣었을때
	if(isPass && isNicknamechked){ //유효성 검사와 닉네임 중복확인 조건 만족하면 진행 
    	
    	var mail = $("#email").val();
    	var nickname = $("#nickname").val();
    	var pw = $("#pw").val();
    	var name = $("#name").val();
    	var pnum = $("#pnum").val();
    	var id  = $("#id").val();
    	var promo = $("#promotion").val();
    	var depart = $("#option option:selected").val();
    	var major = $("#departM option:selected").val();
    	$.ajax({
    		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    		type : "POST",
    		url : "/member/memberInsert.do",
    		data : { usrEmail : mail,
    				usrPassword : pw,
    				usrName : name,
    				usrNickname : nickname,
    				phoneNumber : pnum,
    				usrStdnum: id,
    				usrDepartment : depart,
    				usrMajor : major ,
    				promotionYn : promo
    			},
    			success: function(tmp) {
    				if(tmp=="ok"){
    					layer_open('signupPop','signup_Pop');
    					
    				}
    				
    			}
    			 
    	});
    }
	
}
function passCheck(event) { 
	event = event || window.event;
	if($("#pw").val() != "" && $("#pwc").val() !="" ){
		if($("#pwc").val() == $("#pw").val()) {
			$(".feedback.Y").show();
			$(".feedback.N").hide();
		} else {
			$(".feedback.Y").hide();
			$(".feedback.N").show();
		}
	}
}



//단과대 select 가 onchange일때 실행 -- ajax로 학과 가져오기
function changeOption(){
	var selected = $("#option").val();
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		url : "/member/ajaxChangeOption.do",
		data : { selected : selected },
		success : function(tmp) {
			
			tmp = tmp.replace(/\s+/, "");//왼쪽 공백제거
			tmp = tmp.replace(/\s+$/g, "");//오른쪽 공백제거
			tmp = tmp.replace(/\n/g, "");//행바꿈제거
			tmp = tmp.replace(/\r/g, "");//엔터제거
			if(tmp == "]"){
			}
			else{
				$("#departM").html(""); 
				var newString = JSON.parse(tmp.substring(0,tmp.length-2) + "]" );
				var result = newString.map(function(e) {
					  return [e.uniMajor];
					})
				
				for (var name in result){
					$("#departM").append("<option>"+ result[name]+" </option>");
				}
			}
		}
	});
}
</script>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<div class="navi">
			<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>회원정보 입력</h2></div>
			<ul>
				<li>사용자 약관동의</li>
				<li>이메일 인증</li>
				<li class="on">회원정보 입력</li>
				<li>가입완료</li>
			</ul>
		</div>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="contents">
		
			<ul class="form">
				<li>
					<p class="input_t">EMail</p>
					<input type="text" id="email" value="${Mail}" disabled/>
				</li>
				<li>
					
					<p class="input_t">닉네임<span class="star">*</span></p>
					<p class="overflow"><input type="text" id="nickname" placeholder="닉네임을 입력해주세요."/><a href="javascript:void(0);" class="btn" id="chkDupBtn" >중복확인</a></p>
					<p class="tip">* 닉네임 변경은 60일 이후에 가능합니다</p>
				</li>
				<li>
					<p class="input_t">비밀번호<span class="star">*</span></p>
					<p class="password">
						<input type="password" id="pw" oninput="passCheck(this)" placeholder="비밀번호를 입력해주세요."/>
						<i class="fas eyes">보이기</i>
					</p>
				</li>
				<li>
					<p class="input_t">비밀번호 확인<span class="star">*</span></p>
					<div class="input_box">
						<p class="password">
							<input type="password" id="pwc" oninput="passCheck(this)" placeholder="비밀번호 확인을 입력해주세요."/>
							<i class="fas eyes">보이기</i>
						</p>
						<p class="feedback Y"><span>!</span >사용 가능합니다.</p>
					    <p class="feedback N"><span>!</span>사용 불가능합니다.</p> 
					</div>
				</li>
				<li>
					<p class="input_t">이름 입력<span class="star">*</span></p>
					<input type="text" id="name" placeholder="이름을 입력해주세요."/>
				</li>
				<li>
					<p class="input_t">전화번호 입력<span class="star">*</span></p>
					<input type="text" id="pnum" placeholder="핸드폰 번호를 입력해주세요." onkeyup="replacePnum(this)"/>
				</li>
				<li>
					<p class="input_t">학번 입력<span class="star">*</span></p>
					<input type="text" id="id" placeholder="학번을 입력해주세요."/>
					
				</li>
				<li>
					<p class="input_t">내 단과대 선택하기<span class="star">*</span></p>

					<!-- <select onchange="changeDepartment('1',this.value);"> -->

					<select id="option" onchange="changeOption();">
						<option selected="selected" >디자인 대학</option>
						<option >인문사회융합대학</option>
						<option>과학기술대학</option>
						<option>의료생명대학</option>
						<option>의과대학</option>
						<option>교양대학</option>
						<option>힐링바이오공유대학</option>
					</select>
				</li>
				<li>
	
					<p class="input_t">내 학과 선택하기<span class="star">*</span></p>
						<select id="departM">

					</select>
				</li>
			</ul>
			
			<input type= "hidden" id="promotion" value="${promotionYn}">

			<p class="btn mt35" onClick="javascript:fn_submit();"><a >가입하기</a></p>
<!-- href="joinok.do" -->
		</div>
	
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<!-- 중복확인 선택 시 노출 -->
	<div class="layer" id="confirm_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="confirmPop">
			
			<!-- 01. 사용가능한 닉네임일 시 -->
			<div class="pop_cont text" id="contOne">
				<p class="mb20 c">닉네임 사용 가능합니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 

			<!-- 02. 닉네임이 중복될 시 -->
			 <div class="pop_cont text" id="contTwo">
				<p class="mb20 c">이미 사용중인 닉네임입니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div>
			 
		</div>
	</div>
	<!-- POPUP END -->

<!-- POPUP BEGIN -->
	<!-- 입력칸 비었을때 노출 -->
	<div class="layer" id="submit_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="submitPop">
		
			<div class="pop_cont text" id="subContOne">
				<p class="mb20 c" id = "empty"></p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
			<div class="pop_cont text" id="subContTwo">
				<p class="mb20 c">숫자만 입력 가능합니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
		
		
			 
		</div>
	</div>
	<!-- POPUP END -->
	
<!-- 중복확인 선택 시 노출 -->
	<div class="layer" id="signup_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="signupPop">
			
			<!-- 01. 사용가능한 닉네임일 시 -->
			<div class="pop_cont text" id="contOne">
				<p class="mb20 c">가입 되셨습니다!</p>
				<p class="btn"><a href="#" onclick="location.href='/member/joinok.do'" class="cbtn">확인</a></p>
			</div> 

	
			 
		</div>
	</div>
	<!-- POPUP END -->

</div>

</body>
</html>