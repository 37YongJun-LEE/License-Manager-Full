<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../_inc/title.jsp" %>
<script>
function chkType(type,str){
	var reg,res;
	switch(type){
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
function formSubmit(){
	/*club_join_ok.do  */
	var Pnum = $("#clubUserPhone").val();
	if($("#clubUserMsg").val().trim() == ''){
		$("#clubUserMsg").focus();
		layer_open('msgPop','msg_Pop');
		return;
	}
	if($("#clubUserPhone").val().trim() == ''){
		$("#clubUserPhone").focus();
		layer_open('pnumPop','pnum_Pop');
		$("#pnumOne").show();
		$("#pnumTwo").hide();
		return false;
	}
	if($("#clubUserPhone").val().includes("-")){
		Pnum = $("#clubUserPhone").val().replace(/-/g,"");
	} //추가로 핸드폰 입력길이 검증 필요 
	if(!Pnum.match(/^\d+$/)) {
		layer_open('pnumPop','pnum_Pop');
		$("#pnumOne").hide();
		$("#pnumTwo").show();
		
	 	return;
	}
	if($('input:checkbox[id="agreeYn"]').is(":checked") != true){
		layer_open('agreePop','agree_Pop');
		return;
	}
	
	if($('input:checkbox[id="agreeYn"]').is(":checked") == true){
		var data = new FormData();
		data.append("clubUserMsg",$("#clubUserMsg").val());
		data.append("clubIdx",'${clubIdx}');
		data.append("clubUserPhone",Pnum);
		data.append("agreeYn","Y");
		$.ajax({
		    url: '/club_join_action.do',
		    type: 'POST',
		    contentType: false,               // * 중요 *
	        processData: false,  
		    data: data,
		    enctype : 'multipart/form-data',
		    success: function (data) {
		 			if(data == "success"){
		 				layer_open('submitPop','submit_Pop');
		 				$("#submitOne").show();
		 				$("#submitTwo").hide();
		 			}
		 			else{
		 				layer_open('submitPop','submit_Pop');
		 				$("#submitOne").hide();
		 				$("#submitTwo").show();
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
		<!-- CONTENTS BEGIN -->
		<form id ="application">
		<div id="sub_contents" class="board head_mg mb140">
				<div class="navi">
					<div class="top_navi"><a href="#"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>동아리 가입 신청</h2></div>
				</div>
				<div class="bbs_write w_box top no_line">
					<div>
						<textarea rows="7" placeholder="지원동기 입력" id ="clubUserMsg" name="clubUserMsg"></textarea>
						<input type="text" placeholder="연락처 입력" class="mb10" id="clubUserPhone" name="clubUserPhone" style = "margin-top: 7px;"/>
					</div>

					<p class="agree_all">
						<input type="checkbox" id="agreeYn" name="agreeYn"><label for="agreeYn"><b>이 정보가 동아리 관리자에게 제출되는것을 동의합니다.</label>
					</p>
					<p class="btn"><a href="#" onclick="formSubmit()">신청하기</a></p>
				</div>
					
		</div>
		</form>
	<!-- CONTENTS END -->
	
	</div>
	<!-- POPUP BEGIN -->
	<!-- 지원동기 공백시 노출 -->
	<div class="layer" id="msg_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="msgPop">
			
			<!-- 01. 지원동기 입력칸 공백 -->
			<div class="pop_cont text" >
				<p class="mb20 c">지원동기 입력을 확인해주세요</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
		</div>
	</div>
	<!-- 휴대폰번호  미입력시 공백시 노출 -->
	<div class="layer" id="pnum_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="pnumPop">
			
			<!-- 01. 휴대폰번호 입력칸 공백 -->
			<div class="pop_cont text" id="pnumOne">
				<p class="mb20 c">연락처 입력을 확인해주세요</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
			
			<!-- 02. 휴대폰번호 입력칸 공백 -->
			<div class="pop_cont text" id="pnumTwo">
				<p class="mb20 c">숫자만 입력 해주세요</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
				
			</div> 
		</div>
	</div>
	
		<!-- 동의 안했을때 -->
	<div class="layer" id="agree_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="agreePop">

			<div class="pop_cont text" >
				<p class="mb20 c">동의 여부를 확인해주세요</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
		</div>
	</div>
	
			<!-- 제출시 노출 -->
	<div class="layer" id="submit_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="submitPop">

			<div class="pop_cont text" id="submitOne" >
				<p class="mb20 c">성공적으로 제출 되었습니다.</p>
				<p class="btn"><a href="#" onclick="location.href='/clubList.do?clubCategory=all'" class="cbtn">확인</a></p>
			</div> 
			
			<div class="pop_cont text" id="submitTwo">
				<p class="mb20 c">입력란을 확인해주세요</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
		</div>
	</div>
	
	<!-- POPUP END -->
</body>
<%@include file="../_inc/bottom_menu.jsp" %>
<%@include file="../_inc/footer.jsp" %>
</html>






