<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../_inc/title.jsp" %>

<script>
function submit(){
	if($("#boardContent").val().trim() != ""){
		var data = new FormData();
		data.append("clubBoardType","NOTICE");
		data.append("clubIdx",'${clubVO.clubIdx}');
		data.append("clubBoardContent",$("#boardContent").val());
		data.append("viewnum",0);
		$.ajax({
		    url: '/club_notice_write_action.do',
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
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>게시물 작성</h2></div>
			</div>
			
			<div class="bbs_write w_box top no_line">
				 <p class="path mb10" id="bname">동아리 공지사항 작성</p>
				<textarea rows="10"name ="boardContent"  id="boardContent" placeholder="게시물 내용 입력"></textarea>
			
			</div> 

				
				<p class="btn mt10"><a href="#" onclick="submit()">작성완료</a></p>
				</div>

	
	</div>
		<!-- 제출시 노출 -->
	<div class="layer" id="submit_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="submitPop">

			<div class="pop_cont text" id="submitOne" >
				<p class="mb20 c">성공적으로 제출 되었습니다.</p>
				<p class="btn"><a href="#" onclick="location.href='/club_view.do?clubIdx=${clubVO.clubIdx}&category=board'" class="cbtn">확인</a></p>
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






