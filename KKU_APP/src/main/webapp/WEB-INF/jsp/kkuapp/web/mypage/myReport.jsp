<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script src="/_js/_js/loading.js" type="text/javascript" charset="utf-8"></script>
</head>
<script>
var isRun = false;
function submit(){
	var form = document.querySelector("frm");
    var formData = new FormData(frm);
    isRun= true;

    console.log($("#reportContent").val());
    if(!$("#reportContent").val().trim().length < 1){
	    loading("글을 등록 중입니다...");
  
    	  $.ajax({
    		type : "POST",
    		url : "/campusReportAction.do",
    	 	data: formData,
    		contentType: false,               
            processData: false,              
            enctype : 'multipart/form-data', 
    			success: function(tmp) {
    				if(tmp == "1"){
						closeLoading();
    					layer_open('okPop','ok_Pop');
    			    	$("#one").show();
    					$("#two").hide();
    				}
    			}
    			 
    	});  
    } else{
 /*    	layer_open('emptyPop','empty_Pop'); */
    	layer_open('okPop','ok_Pop');
    	$("#one").hide();
		$("#two").show();
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
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>신고접수</h2></div>
			</div>
			<div class="bbs_write w_box top no_line">
		<ul class="best_list basic">
				<c:forEach var="result" items="${reportList }">
				
					<li>
						<div>
							<div>
								<p> ${result.reportCategory}</p>
								<p> ${result.content}</p>
								<p> 신고일 : ${result.reportDate}</p>
									
									
							</div>
									
									
							 <p class="bottom">
								<span>관리자 comment :${result.reportProcesscomment }</span> <!-- 시설팀 코멘트  -->
								<span>${result.reportProcessdate }</span> <!-- 신고일  -->
							</p> 
						</div>
						<c:if test="${result.reportState eq '0' }">
										<span class="ok_label">접수대기중</span>
									</c:if>
									<c:if test="${result.reportState eq '1' }">
										<span class="ok_label">접수완료</span>
									</c:if>
									<c:if test="${result.reportState eq '2' }">
										<span class="ok_label">처리중</span>
									</c:if>
									<c:if test="${result.reportState eq '3' }">
										<span class="ok_label">처리불가</span>
									</c:if>
									<c:if test="${result.reportState eq '4' }">
										<span class="ok_label">처리완료</span>
									</c:if>
					</li>
				
				</c:forEach> 
			</ul>
			</div>
		</div>
	<!-- CONTENTS END -->
	
			<%@include file="../_inc/bottom_menu.jsp" %>
			<%@include file="../_inc/footer.jsp" %>
		
	<!-- CONTENTS END -->
<!--layer_open('okPop','ok_Pop')  -->
	<!-- POPUP BEGIN -->

<!-- POPUP BEGIN -->
	
</div>
	<!-- 작성완료 선택 시 노출 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text " id="one">
				<p class="tit c">게시물 작성 완료</p>
				<p class="btn"><a href="/main.do">확인</a></p>
			</div> 
			
			<div class="pop_cont text" id="two">
				<p class="tit c">입력칸이 비어 있습니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->

<!-- //wrap -->

</body>
</html>


