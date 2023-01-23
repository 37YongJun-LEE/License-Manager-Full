<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../_inc/title.jsp" %>
<script>
function showPopUpList(usrLevel,clubIdx, usrIDx){

	layer_open('morePop','more_Pop');
	$("#alertList li").bind("click", function(e)
    {
        e = e || window.event;
        var ul = $(this).parent();
        var index = ul.children().index(this);
        userStatusChange(usrLevel,clubIdx, usrIDx,index);
    });
}
function userStatusChange(usrLevel,clubIdx, usrIdx,index){
	var clubUserLev= "";
	if(index == 0){
		clubUserLev= "2";
	}
	else if(index == 1){//운영진으로 임명
		clubUserLev= "1";
	}
	else if(index == 2){ //일반 유저로 임명
		clubUserLev= "0";
	}
	else if(index == 3){
		clubUserLev= "-1";
	}
	
	var data = new FormData();
	data.append("usrIdx",usrIdx);
	data.append("clubIdx",clubIdx);
	data.append("clubUserLev",clubUserLev); //바뀔 랭크
	$.ajax({
	    url: '/club_mem_process.do',
	    type: 'POST',
	    contentType: false,               // * 중요 *
        processData: false,  
	    data: data,
	    enctype : 'multipart/form-data',
	    success: function (data) {
			if(data == "noPermission"){
				alert('권한 없음');
			}
			else if(data =="selfSelected"){
				alert("자기 자신을 랭크 조절 할 수 없음");
			}
			else if(data =="updated"){
				alert("업데이트 되었습니다");
				location.reload();
			}
	 		/* 	if(data == "success"){
	 				if(index == 0){
	 					layer_open('submitPop','submit_Pop');
		 				$("#submitOne").show();
		 				$("#submitTwo").hide();
		 				$("#submitThree").hide();
	 				}
	 				else if(index == 1){
	 					layer_open('submitPop','submit_Pop');
	 					$("#submitOne").hide();
		 				$("#submitTwo").show();
		 				$("#submitThree").hide();
	 				}
	 				else if(index == 2){
	 					layer_open('submitPop','submit_Pop');
	 					$("#submitOne").hide();
		 				$("#submitTwo").hide();
		 				$("#submitThree").show();
	 				}
	 				
	 			} */
	 		

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
		
		
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="club head_mg mb140">
			<div class="navi small">
				<div class="top_navi flex_top_navi">
					<div class="left">
						<a href="#"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>회원관리</h2>
					</div>
					
				</div>
			</div>

			<div class="w_box no_line">
				<div class="club_name">
					<p class="img">
						<img src="/_img/_img/cont/best_bg.png" style="background:url('/_img/_img/cont/club_img01.jpg')no-repeat 50% 50% / cover" width="100">
					</p>
					<div class="info">
						<p class="tit">${clubDetailVO.clubName }(${clubDetailVO.clubCategory}동아리)</p>
						<p class="con"><span>현재 인원수 ${clubDetailVO.userNum }명</span></p>
						<p class="btn"><a href="/club_mem_alarm.do?clubIdx=${clubDetailVO.clubIdx}" class="btn_mini bt_greenL">알림 보내기</a></p>
					</div>
				</div>
			</div>
	
			<c:forEach items="${clubApplicationList}" var="item" varStatus="status">
						<c:if test="${item.clubUserLev > 0}">
							<c:set var="count" value="${count + 1}" />
						</c:if>
						<c:if test="${item.clubUserLev eq 0}">
							<c:set var="usrCount" value="${usrCount + 1}" />
						</c:if>
			  </c:forEach>
		<div class="w_box top no_line fm_bottom">
				<div class="join_view">
					<p class="num" style="border:none; padding-top:0">운영진 <c:out value="${count}"></c:out></p>
					<ul class="fm_list cj_list">
					<c:forEach var="result" items="${clubApplicationList}">
						<c:if test="${result.clubUserLev > 0}">
								<li>
									<div class="fm_profile" onclick="location.href='friend.html'">
										<c:if test="${result.clubUserLev eq 2}">
											<span class="president">
										</c:if>
										</span>
										<p class="img"><img alt="내 친구" src="_img/cont/friend_bg.png" style="background: url('_img/cont/ex_photo.jpg')no-repeat 50% 50% / cover;"></p>
										<p class="border blue"></p>
									</div>
									<div class="info">

										<p class="tt">${result.usrName}(${result.usrNickname})</p>
										<span>${result.usrMajor}</span><span>${result.nusrStdnum}학번</span>
									</div>
									<!-- layer_open('morePop','more_Pop') -->
									<a href="#none" class="more" onclick="showPopUpList('${result.clubUserLev}','${result.clubIdx}','${result.usrIdx}' )"><img src="/_img/_img/cont/fm_more.png" width="2" alt="친구관리"></a>
								</li>
							</c:if>
						</c:forEach>			
					</ul>
				</div>
				<div>
					<p class="num">회원 <c:out value="${usrCount}"></c:out></p>
					<ul class="fm_list">
					<c:forEach var="result" items="${clubApplicationList}">
						<c:if test="${result.clubUserLev eq 0 }">
							<li>
								<div class="fm_profile" onclick="location.href='friend.html'">
									<p class="img"><img alt="내 친구" src="_img/cont/friend_bg.png" style="background: url('_img/cont/ex_photo.jpg')no-repeat 50% 50% / cover;"></p>
									<p class="border blue"></p>
								</div>
								<div class="info">
									<p class="tt">${result.usrName}(${result.usrNickname})</p>
										<span>${result.usrMajor}</span><span>${result.nusrStdnum}학번</span>
								</div>
								<a href="#none" class="more" onclick="showPopUpList('${result.clubUserLev}','${result.clubIdx}','${result.usrIdx}')"><img src="/_img/_img/cont/fm_more.png" width="2" alt="친구관리"></a>
							</li>
						</c:if>
							</c:forEach>			
					</ul>
				</div>
	
			</div>
		
				</div>
	<!-- CONTENTS END -->
	
	
	<!-- POPUP BEGIN -->
	<!--  동아리 회원 관리 버튼을 눌렀을 시  -->
	<div class="layer" id="more_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="morePop">
			<div class="pop_cont club_list">
				<ul id="alertList">
					<li >
						<p>회장으로 임명</p>
						<a href="#.html" class="arrow"><img src="/_img/_img/comn/next.png"></a>
					</li>
					<li >
						<p>운영진으로 임명</p>
						<a href="#.html" class="arrow"><img src="/_img/_img/comn/next.png"></a>
					</li>
					<li >
						<p>일반 회원으로 임명</p>
						<a href="#.html" class="arrow"><img src="/_img/_img/comn/next.png"></a>
					</li>					
					<li >
						<p>회원에서 삭제하기</p>
						<a href="#.html" class="arrow"><img src="/_img/_img/comn/next.png"></a>
					</li>
				</ul>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->
	
	</div>
</body>
<%@include file="../_inc/bottom_menu.jsp" %>
<%@include file="../_inc/footer.jsp" %>
</html>






