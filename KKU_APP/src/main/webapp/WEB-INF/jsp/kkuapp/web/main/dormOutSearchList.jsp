<html>
<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_inc/title.jsp" %>
<link href="https://dormmgr.kku.ac.kr/itsp/css/style.css" rel="stylesheet" type="text/css">
</head>
<script>
$(document).ready(function(){
	$("#Enroll_3").click(function(e){
		delOut(); // parameter 필요 
		return false;
	})
});
function delOut(){
	if (confirm("신청취소 하시겠습니까?")) {
	var data = new FormData();
	data.append("url", "https://dormmgr.kku.ac.kr/KKU/stdModule/stdOutRegProcess.jsp"); 
	data.append("stdNo", '${vo.stdNo}');
	data.append("resno", '${vo.resno}');
	data.append("DORM_CD",'${vo.DORM_CD}');
	data.append("crud", "del");
	$.ajax({
	    url: '/dormOutSubmitCancelAction.do',
	    type: 'POST',
	    contentType: false,               // * 중요 *
        processData: false,  
	    data: data,
	    enctype : 'multipart/form-data',
	    success: function (data) {
	 
	           if(data.includes("처리 되었습니다.")){
	        	   eval(data.slice(77,95));
	        	   location.reload();
	           }
	           else if(data.includes("오늘")){
	        	   eval(data.slice(77,110));
	        	   location.reload();
	           }

	          
	        }
	});
	}
}

</script>
<style>
	
</style>


</header>
<body>
<header class="sub">
		<%@include file="../_inc/header.jsp" %>
	</header>
<!--  -->
<!-- <script>
let i = document.querySelector('frame');
i.contentWindow.scrollTo(0, i.contentDocument.body.scrollHeight);
</script> -->
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="head_mg mb140 stay_list">

			<div class="navi small">
				<div class="top_navi"><a href="javascript:history.back(-1)"><img src="/_img/_img/cont/navi_arrow.png"></a>
					<c:if test = "${vo.DORM_CD eq '1' }"> <h2>모시래 기숙사 외박 신청</h2> </c:if> 
 					<c:if test = "${vo.DORM_CD eq '2' }"> <h2>해오름 기숙사 외박 신청</h2> </c:if> </div>
			</div>
			<div class="w_box  pb0">
				<p class="stay_info">
				<c:if test= "${isExist eq  '1' }"> <!-- 관생이 존재하지 않을때-->
				
				${userName }

				</c:if>
				<c:if test= "${isExist eq  '0' }">
				
				${userName }
<div class="list_top"><div class="right"><a class="btn_mini bt_green" href="/dormOut.do?check=n&stdNo=${vo.stdNo}&resno= ${vo.resno }&DORM_CD=${vo.DORM_CD }">외박신청</a></div></div>
				</c:if>
				</p>
				
			</div>

			<c:if test="${applicationTable ne null}"> 
					<div class="post_tbl">
						${applicationTable}
					</div>
					
					</c:if> 


			
			</div>


			
				

</body>

<%@ include file="../_inc/bottom_menu.jsp" %>

<%@ include file="../_inc/footer.jsp" %>
</html>