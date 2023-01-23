<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../_inc/title.jsp" %>
<script>
 $(document).ready(function() {
	
	$("#ckall").click(function(){
	    $('input:checkbox').not(this).prop('checked', this.checked).each(function () {
	
	    })

	});
	
}); 
function submit(){
	var alarmList = [];
	$("input:checkbox:checked").each(function () {
       alarmList.push( $(this).attr("id"));
    });
	if(alarmList.includes('ckall')){
		alarmList.shift();
	}

	var data = new FormData();
	data.append("clubUserMsg",$("#content").val());
	data.append("clubIdx",'${clubVO.clubIdx}');
	 for (var i = 0; i < alarmList.length; i++) {
	        // 삭제되지 않은 파일만 폼데이터에 담기
	        if (!alarmList[i].is_delete) {
	        	data.append("userIdxArr", alarmList[i]);
	        }
	    }
	$.ajax({
	    url: '/club_mem_alarm_process.do',
	    type: 'POST',
	    contentType: false,               // * 중요 *
        processData: false,  
	    data: data,
	    enctype : 'multipart/form-data',
	    success: function (data) {
	    	console.log(data);
	 			if(data == "1" || data == "2"){
	 				alert("알람 성공적으로 보냄");
	 			}
	        }
	});
}
</script>
<body>
	<div id="wrap">
		<!-- HEADER BEGIN -->
			<header class="sub">
			<%@include file="../_inc/header.jsp" %>
			</header>
		<!-- CONTENTS BEGIN -->
		

		<div id="sub_contents" class="club head_mg mb140">
			<div class="navi small">
				<div class="top_navi flex_top_navi">
					<div class="left">
						<a href="#"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>알림 보내기</h2>
					</div>
					
				</div>
			</div>
			
			<div id="contents" class="taxi"> 
				<div class="line_box place">
					<p class="tit">
						<input type="checkbox" id="ckall">
						<label for="ckall" class="mt0">전체 선택</label>
					</p>

					<p class="tit">운영진</p>
					<p class="sub_con">
						<c:forEach var="result" items="${clubApplicationList}">
							<c:if test="${result.clubUserLev > 0}">
								<input type="checkbox" id="${result.usrIdx }">
								<label for="${result.usrIdx }">${result.usrName}, ${result.usrMajor}, ${result.nusrStdnum}학번</label>
							</c:if>
						</c:forEach>
					</p>

					<p class="tit">회원</p>
					<p class="sub_con">

					<c:forEach var="result" items="${clubApplicationList}">
							<c:if test="${result.clubUserLev eq 0}">
								<input type="checkbox" id="${result.usrIdx }">
								<label for="${result.usrIdx }">${result.usrName}, ${result.usrMajor}, ${result.nusrStdnum}학번</label>
							</c:if>
						</c:forEach>
					</p>
				</div>

				<div class="mt30">
					<textarea rows="7" placeholder="알림 내용을 작성해주세요" id="content"></textarea>
					<p class="btn mt35"><a href="#" onclick="submit()">알림 보내기</a></p>
				</div>
			</div>

		
		</div>
	<!-- CONTENTS END -->
	
	</div>
</body>
<%@include file="../_inc/bottom_menu.jsp" %>
<%@include file="../_inc/footer.jsp" %>
</html>






