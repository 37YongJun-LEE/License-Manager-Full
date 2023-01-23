<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_inc/title.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta http-equiv="X-UA-TextLayoutMetrics" content="gdi">
<meta http-equiv="imagetoolbar" content="no">
<meta name="apple-mobile-web-app-title" content="건국대학교 생활관">
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,shrink-to-fit=no">
<meta name="HandheldFriendly" content="true">
<meta name="Title" content="건국대학교 생활관" >
<meta name="Description" content="건국대학교 생활관 생활관소개,모시래학사,해오름학사">
<meta name="Keywords" content="건국대학교 생활관,생활관소개,모시래학사,해오름학사">
<meta name="Robots" content="INDEX,FOLLOW">
<meta property="og:url" content="https://dorm.kku.ac.kr">
<meta property="og:type" content="website" >
<meta property="og:title" content="건국대학교 생활관">
<meta property="og:description" content="건국대학교 생활관 생활관소개,모시래학사,해오름학사">
<meta property="og:image" content="https://dorm.kku.ac.kr/images/common/h1_logo.png">

<title>건국대학교 모시래학사 외박신청</title>

<link rel="shortcut icon" type="image/x-icon" href="https://dorm.kku.ac.kr/images/common/favicon.ico">
<link rel="icon" type="image/png" sizes="16x16" href="https://dorm.kku.ac.kr/images/common/favicon.png">
<link rel="apple-touch-startup-image" type="image/png" sizes="32x32" href="https://dorm.kku.ac.kr/images/common/favicon.png">
<link rel="apple-touch-icon" type="image/png" sizes="180x180" href="https://dorm.kku.ac.kr/images/common/favicon.png">

<link href="https://dormmgr.kku.ac.kr/itsp/css/style.css" rel="stylesheet" type="text/css">

<!--<SCRIPT language="JavaScript" src="../script/kkuValidityCheck.js"></SCRIPT>!-->

<!--jQuery Define : 2012-11-20(조남주)-->
<script type="text/javascript" src="https://dormmgr.kku.ac.kr/script/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#Enroll_1").click(function(e){
			//alert("등록");
			setOut("1","","","1");
			return false;
		});
	
		$("#Enroll_2").click(function(e){
			//alert("등록");
			setOut("1","","","2");
			return false;
		});
	
		$("#Enroll_3").click(function(e){
			//alert("취소");
			delOut("1","","");
			return false;
		});
	});
	//jQuery end
</script>


<script type="text/javascript">

	if (document.layers) {
		window.captureEvents(Event.MOUSEDOWN);
		window.onmousedown=Right;
	}
	
	function checkKP() {
		if (event.ctrlKey)
			if ((event.keyCode == 78) || (event.keyCode == 104))
				event.returnValue = false;
	}
	
	function LoginEnterKeyDown1(args){
		if(event.keyCode == 13 && args != "") document.stdNoForm.resno.focus();
	}
	
	function LoginEnterKeyDown2(args){
		if(event.keyCode == 13 && args != "") stdCheck();
	}
	
	function trim(str){
		str=str.replace(/(^\s*)|(\s*$)/g,"");
		return str;
	}

	function stdCheck(){
		if (document.stdNoForm.stdNo.value == ""){
			alert("학번을 입력하세요");
			document.stdNoForm.stdNo.focus();
			return;
		}
	
		if (document.stdNoForm.stdNo.value.length != 9){
			alert("학번은 9자리입니다.");
			document.stdNoForm.stdNo.focus();
			return;
		}
	
		if(isNaN(document.stdNoForm.stdNo.value)){
			alert("학번은 숫자로 입력해 주세요.");
			document.stdNoForm.stdNo.value = "";
			document.stdNoForm.stdNo.focus();
			return;
		}
	
		if(document.stdNoForm.resno.value.length == 0){
			alert("생년월일를 입력해주세요.");
			document.stdNoForm.resno.focus();
			return;
		}
		if (document.stdNoForm.resno.value.length != 6){
			alert("생년월일은 6자리입니다.");
			document.stdNoForm.resno.focus();
			return;
		}
		if(isNaN(document.stdNoForm.resno.value)){
			alert("생년월일은 숫자로 입력해 주세요.");
			document.stdNoForm.resno.value = "";
			document.stdNoForm.resno.focus();
			return;
		}
	
		document.stdNoForm.action="https://dormmgr.kku.ac.kr/KKU/stdModule/stdOutRegSearch.jsp"
		document.stdNoForm.submit();
	}


function setOut(dormcd, stdNo, resno, gubun){

	
		if( gubun == 1 ){
		//외출

			var form = document.forms[0];
			form.stdNo.value=stdNo;
			form.resno.value=resno;
			form.gubun.value=gubun;
			form.DORM_CD.value=dormcd;
			form.crud.value="set";
			form.action = "stdOutRegInpt.jsp"
			form.submit();

		//location.href="./stdOutRegInpt.jsp?stdNo=" + stdNo + "&resno=" + resno + "&gubun=" +gubun+ "&DORM_CD=" + dormcd + "&crud=set";
	}else{
		//외박
		//2014.10.27
		//모시래만 평일외박 6회로 제한
		//해오름 무제한으로

		//	alert("이번달 평일외박 신청을 6번이상 하셨습니다.\n이후 평일외박 신청을 하시려면 생활관 행정실로 직접 문의해 주십시오.");

		var form = document.forms[0];
		form.stdNo.value=stdNo;
		form.resno.value=resno;
		form.gubun.value=gubun;
		form.DORM_CD.value=dormcd;
		form.crud.value="set";
		form.action = "stdOutRegInpt.jsp"
		form.submit();
		//location.href="./stdOutRegInpt.jsp?stdNo=" + stdNo + "&resno=" + resno + "&gubun=" +gubun+ "&DORM_CD=" + dormcd + "&crud=set";

	}

}

function delOut(dormcd,stdNo,resno){
	if (confirm("신청취소 하시겠습니까?")) {
		var form = document.forms[0];
		form.stdNo.value=stdNo;
		form.resno.value=resno;
		form.DORM_CD.value=dormcd;
		form.crud.value="del";
		form.action = "stdOutRegProcess.jsp"
		form.submit();
	}
}

function tranOut(dormcd,stdNo,resno,dataseq){
	//alert("dataseq="+dataseq);
	if (confirm("귀관신청 하시겠습니까?")) {
		var form = document.forms[0];
		form.stdNo.value=stdNo;
		form.resno.value=resno;
		form.DORM_CD.value=dormcd;
		form.dataSeq.value=dataseq;
		form.crud.value="tran";
		form.action = "stdOutRegInpt.jsp"
		form.submit();
	}
}


function tranClick(e){
	//alert($(e).attr('id'));
	tranOut("1","","",$(e).attr('id'));
}
</script>
</HEAD>

<BODY>
<FORM ID="thisForm"  method="post" enctype='multipart/form-data' >
	<input type="hidden" name="stdNo" value = "">
	<input type="hidden" name="resno" value = "">
	<input type="hidden" name="gubun" value = "">
	<input type="hidden" name="DORM_CD" value = "">
	<input type="hidden" name="crud" value = "">
	<input type="hidden" name="dataSeq" value = "">
</FORM>

<FORM name="stdNoForm" method="post" onsubmit="return false;" >
	<input type="hidden" name="check" value="n"> 
	<input type="hidden" name="crud" value="">
	<input type="hidden" name="DORM_CD" value="1">

	<div id="wrap">
		<header>
			<div id="header">
			<%@ include file="../_inc/header.jsp" %>
<!-- 				<div class="header_inner"><h1 class="t_center">건국대학교 글로컬캠퍼스 생활관</h1></div> -->
			</div>
		</header>
		
		<section>
			<div id="container">
				<div class="logo_title_box">
					<img src="https://dormmgr.kku.ac.kr/itsp/images/common/logo.png" alt="건국대학교" class="logo_img">
					<div class=""><strong>
							모시래학사 
						외박 신청 
					</strong></div>
				</div>

				<div class="inquiry_page">
					<article>
						<div>
							<fieldset>
								<legend>조회입력 폼</legend>
								<ul class="inquiry_form">
									<li>
										<label for="id_stdNo">학번</label>
										<input name="stdNo" type="text" class='txt_field' size="15" maxlength="10" value='' onkeydown="LoginEnterKeyDown1(this.value)">
									</li>
									<li>
										<label for="id_resno">생년월일</label>
										<input name="resno" type="text" class='txt_field' size="15" maxlength="6" value='' onkeydown="LoginEnterKeyDown2(this.value)">
									</li>
									<li>
										<a href="#" class="bt bt_on bt_big" onclick="stdCheck();">검 색</a>
									</li>
									<li>
										<span class="fc_ff7800 medium">생년월일 1990년 1월1일생 ==> 900101</span>
									</li>
									<li class="mt_35 t_center">
										<input type="button" value="닫기" class="bt bt_close" onClick="window.open('about:blank','_self').close();">
									</li>
								</ul>
							</fieldset>
						</div>
					</article>
				</div>
				<!--//inquiry_page -->

				<div class="page">
		<embed type="text/html" src="https://dormmgr.kku.ac.kr/KKU/stdModule/stdOutRegSearch.jsp?DORM_CD='1'" width="800" height="500">
		</embed>

				</div>
				<!-- //page -->
			</div>
			<!-- //container -->
		</section>
	</div>
</form>
<%@ include file="../_inc/bottom_menu.jsp" %>
<%@ include file="../_inc/footer.jsp" %>
</body>
</html>
