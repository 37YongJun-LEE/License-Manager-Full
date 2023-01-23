<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
<script src="/_js/_js/loading.js" type="text/javascript" charset="utf-8"></script>
</head>
<script>
function submitForm(mode) {

	$('#mode').val(mode);
	
	if (isSubmit()) {
	    loading("글을 등록 중입니다...");
	    // 폼데이터 담기
	    var form = document.querySelector("frm");
	    var formData = new FormData(frm);
	    for (var i = 0; i < filesArr.length; i++) {
	        // 삭제되지 않은 파일만 폼데이터에 담기
	        if (!filesArr[i].is_delete) {
	            formData.append("attach_file", filesArr[i]);
	        }
	    }
	    $.ajax({
	    	type: "POST",
	        url: "majorNotice_changeAdminSubmit.do",
	        data: formData,
            async: false,
	        contentType: false,               // * 중요 *
	        processData: false,               // * 중요 *
	        enctype : 'multipart/form-data',  // * 중요 *
	        success: function () {
				location.href="majorNotice.do?usrIdx=${usrIdx}";
	        },
	        error: function (xhr, desc, err) {
	            alert('에러가 발생 하였습니다.');
	            return;
	        }
	    });
	}
}
function isSubmit() {
	var isPass = true;

	if(isPass){	
		if($('#boardTitle').val() == ''){
			layer_open('faildPop','faild_Pop');
			$("#one").show();
			$("#two").hide();
			$("#boardTitle").focus();
			return false;
		}

		if($('#boardContent').val() == ''){
			layer_open('faildPop','faild_Pop');
			$("#one").hide();
			$("#two").show();
			$("#boardContent").focus();
			return false;
		}
	}
	return isPass;
}
</script>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
	<header class="sub">
	<%@include file="../../_inc/header.jsp" %>
	</header>

	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="majorNotice.do?usrIdx=${usrIdx}"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>컴퓨터공학과 공지</h2></div>
			</div>
			<div class="w_box no_line">
			<p class="mb25 ml5"><b>새 관리자의 이메일을 입력해 주세요</b><p>
			<ul class="form" >
				<li>
					<p class="input_t">대표 관리자<span class="star">*</span></p>
					<input type="text" id="email" value="${admin1}"/>
				</li>
				<li>
					<p class="input_t">보조 관리자1</p>
					<input type="text" id="email" value=""/>
				</li>
				<li>
					<p class="input_t">보조 관리자2</p>
					<input type="text" id="email" value=""/>
					<!-- <p class="feedback Y"><span>!</span>해당 이메일이 존재합니다.</p>
					<p class="feedback N"><span>!</span>해당 이메일이 존재하지 않습니다.</p>-->
				</li>
			</ul>
			
			<p class="btn mt35"><a href="javascript:submitForm();" onclick="layer_open('ok2Pop','ok2_Pop')">변경하기</a></p>
			</div>
				
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->

	<!-- POPUP BEGIN -->
	<!-- 변경하기 선택 한 후 대표 관리자 입력란이 비어있거나 존재하지 않은 이메일이 있을 시 노출-->
 	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="mb20 c">관리자 이메일이<br/>존재하지 않습니다.</p>
				<p class="btn"><a href="major_notice_changeAdmin.do">확인</a></p>
			</div> 
		</div>
	</div>

	<!-- 변경하기 선택 한 후 사용자가 입력한 이메일이 모두 존재할 시 노출 -->
	<div class="layer" id="ok2_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok2Pop">
			<div class="pop_cont text">
				<p class="mb20 c">관리자가 변경되었습니다.</p>
				<p class="btn"><a href="major_notice_changeAdmin.do">확인</a></p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>


