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
			<form name="frm" id="frm" autocomplete="off" method="post" enctype="multipart/form-data">
			<p class="path mb10">학교 시설(강의실, 도서관등)이 제대로 작동하지 않을때 신고하는 기능입니다. 앱 이용시 보다 빠르게 신고 접수가 가능합니다</br>
								기획예산팀 비품관리/유지보수담당  전화번호 : 043-840-3193/3194/3195</br>
								
								</p>
				<textarea rows="10" name = "reportContent" id= "reportContent" placeholder="장소 및 상황에 대해  설명해 주세요 &#13;&#10;ex) 과기대 401호 2번째줄  1번째 컴퓨터 고장"></textarea>
				<!--<div class="add_photo">
					<a href="#none" class="add">
						<span class="icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M194.6 32H317.4C338.1 32 356.4 45.22 362.9 64.82L373.3 96H448C483.3 96 512 124.7 512 160V416C512 451.3 483.3 480 448 480H64C28.65 480 0 451.3 0 416V160C0 124.7 28.65 96 64 96H138.7L149.1 64.82C155.6 45.22 173.9 32 194.6 32H194.6zM256 384C309 384 352 341 352 288C352 234.1 309 192 256 192C202.1 192 160 234.1 160 288C160 341 202.1 384 256 384z"/></svg></span>
						<span class="count"><b>0</b> /1</span>
					</a>
					 <ul>
						<li>
							<span><img src="../_img/cont/photo_thum.png" width="65" height="65" style="background:url('../_img/cont/best03.jpg')no-repeat 50% 50% / cover"></span>
							<a href="#" class="close"></a>
						</li>
						<li>
							<span><img src="../_img/cont/photo_thum.png" width="65" height="65" style="background:url('../_img/cont/best04.jpg')no-repeat 50% 50% / cover"></span>
							<a href="#" class="close"></a>
						</li>
					</ul> 
				</div>-->
				</form>
				<p class="btn mt10"><a href="#" onclick="javascript:submit()">작성완료</a></p>
			<ul class="best_list basic">
				<c:forEach var="result" items="${fixList }">
					<li>
						<div>
							<div>
								<p> ${result.reportContent }</p>
									<c:if test="${result.processState eq '0' }">
										<span class="ok_label">접수대기중</span>
									</c:if>
									<c:if test="${result.processState eq '1' }">
										<span class="ok_label">접수완료</span>
									</c:if>
									<c:if test="${result.processState eq '2' }">
										<span class="ok_label">처리중</span>
									</c:if>
									<c:if test="${result.processState eq '3' }">
										<span class="ok_label">처리불가</span>
									</c:if>
									<c:if test="${result.processState eq '4' }">
										<span class="ok_label">처리완료</span>
									</c:if>
									
									
							</div>
							<p class="bottom">
								<span>시설팀 comment :${result.fixComment }</span> <!-- 시설팀 코멘트  -->
								<span>${result.reportDate }</span> <!-- 신고일  -->
							</p>
						</div>
				
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


