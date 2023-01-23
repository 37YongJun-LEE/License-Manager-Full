<html>
<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	/*  201924206  990126*/

	
	
	var dateRemk = $("#ddate").val()+"~"+$("#date").val();
	var data = new FormData();
	data.append("url", "https://dormmgr.kku.ac.kr/KKU/stdModule/stdOutRegProcess.jsp");
	data.append("stdNo", '${vo.stdNo}');
	data.append("resno", '${vo.resno}');
	data.append("DORM_CD", '${vo.DORM_CD}');
	data.append("crud", "set");
	data.append("remk", dateRemk);
	data.append("gubun", "2");
	data.append("scStartReceDt", $("#ddate").val());
	data.append("scEndReceDt", $("#date").val());
	data.append("resn", $("#num01").val());
	data.append("dataSeq", ""); 
	
	 $.ajax({
	    url: '/dormOutSubmitAction.do',
	    type: 'POST',
	    contentType: false,               // * 중요 *
        processData: false,  
	    data: data,
	    enctype : 'multipart/form-data',
	    success: function (data) {
	 
	           if(data.includes("처리 되었습니다.")){
	        	   eval(data.slice(77,95));
	        	   location.href="/dormOutSearch.do?check=n&stdNo="+${vo.stdNo}+"&resno="+${vo.resno}+"&DORM_CD="+${vo.DORM_CD};
	           }
	           else if(data.includes("오늘")){
	        	   eval(data.slice(77,110));
	        	   location.href="/dormOutSearch.do?check=n&stdNo="+${vo.stdNo}+"&resno="+${vo.resno}+"&DORM_CD="+${vo.DORM_CD};
	           }

	          
	        }
	});  

	
 

	
}



</script>
<div id="test"></div>

<body style="overflow-x: hidden; overflow-y: hidden;">

<header class="sub">
		<%@include file="../_inc/header.jsp" %>
	</header>

<!-- <script>
let i = document.querySelector('frame');
i.contentWindow.scrollTo(0, i.contentDocument.body.scrollHeight);
</script> -->
<%-- <div class="navi">
			<div class="top_navi flex">
				<div class="left">
					<a href="/main.do"><img src="/_img/_img/cont/navi_arrow.png"></a>
					 <c:if test = "${vo.DORM_CD eq '1' }"> <h2>모시래 기숙사 외박 신청</h2> </c:if> 
 					<c:if test = "${vo.DORM_CD eq '2' }"> <h2>해오름 기숙사 외박 신청</h2> </c:if> 
				</div>
			
			</div> --%>

<!-- <div id="contents">
			<div class="login email">
				<div class="input_box">
					 
					<input type="text" id="ddate" placeholder="기간을 입력해주세요" onkeypress="addDash(this)"/>
					<input type="text" id="date" placeholder="기간을 입력해주세요" onkeypress="addDash(this)"/> 
				</div>
				
				<p class="btn mt35">
					<a href="#" class="line" onclick="formsubmit()">조회하기</a>
				</p>
			
			</div
</div> -->

 <div id="sub_contents" class="head_mg mb140 stay_list">

			<div class="navi small">
				<div class="top_navi"><a href="javascript:history.back(-1)"><img src="/_img/_img/cont/navi_arrow.png"></a>
					 <c:if test = "${vo.DORM_CD eq '1' }"> <h2>모시래 기숙사 외박 신청</h2> </c:if> 
 					<c:if test = "${vo.DORM_CD eq '2' }"> <h2>해오름 기숙사 외박 신청</h2> </c:if> </div>
			</div>
			<div class="w_box no_line">
				<!-- <p class="stay_info mb20">과학기술대학 컴퓨터공학과 : 김경태(201621305)</p> -->
				<ul class="form">
					<!-- <li>
						<div class="input_box">
							<p class="input_t">종류</p>
							<p>
								<select><option>외박</option></select>
							</p>
						</div>
					</li> -->
					<li>
						<div class="input_box">
							<p class="input_t">사유</p>
							<p>
								<input type="text" id="num01" placeholder="사유를 입력하세요">
							</p>
						</div>
					</li>
					<li>
						<div class="input_box">
							<p class="input_t">기간</p>
							<p class="date"><input type="text" id="ddate" onkeypress="addDash(this)" disabled><span>~</span><input type="text" id="date" onkeypress="addDash(this)" placeholder=""></p>
							<p class="tip">Ex) 2022-08-07로 작성해주세요</p>
						</div>
					</li>
				</ul>
				<div class="guide">
					<p class="mb10">* 외박신청기간: 생활관 나가는 날짜 ~ 생활관 복귀 날짜</p>
					<ol>
						<li>1. 평일외박</li>
						<li class="in">- 월~수, 당일 오전 9시부터 23시 50분까지 신청 가능</li>
						<li>2. 주말외박</li>
						<li class="in">- 목~일, 목요일 오전 1시부터 일요일 23시 50분까지 신청 가능</li>
						<li class="in">- 횟수 제한 없음</li>
				<!-- 		<li>3. 주의사항</li>
						<li class="in">- 외박신청은 외박 당일 23시 50분까지 신청되며, 신청 당일 전에 미리 작성하거나 당일이 지난 이후는 신청 불가</li>
						<li class="in">- 외박 신청을 하고 귀관 할 경우에는 반드시 신청 시간을 고려하여 삭제</li>
						<li class="in">- 외박 후 귀관 시 제출서류가 있는 경우, 귀관 신청을 누르고 첨부파일(1MB이하)을 반드시 첨부.</li> -->
					</ol>
				</div>
				<p class="three_btn btn mt35">
					<a href="#" class="bt_green" onclick="formsubmit()">입력</a>
					<a href="stay_write.html" class="bt_greenL">재입력</a>
					<a href="/dormOutSearch.do?check=n&stdNo=${vo.stdNo}&resno= ${vo.resno }&DORM_CD=${vo.DORM_CD }" class="bt_gray" >목록</a>
				</p>
			</div>
			
		</div>
	<!-- CONTENTS END -->
	


</div>
<!-- //wrap -->

	

</body>

<%@ include file="../_inc/bottom_menu.jsp" %>

<%@ include file="../_inc/footer.jsp" %>
</html>