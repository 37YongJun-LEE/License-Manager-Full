<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:useBean id="now" class="java.util.Date" />

<%@include file="../_inc/title.jsp" %>
<script>
function showPopUpList(nickname, name, clubidx,useridx){
	var parma = nickname+'('+ name+')';
	 $('#name').text(parma);
	layer_open('morePop','more_Pop');
	
	$("#alertList li").bind("click", function(e)
    {
        e = e || window.event;
        var ul = $(this).parent();
        var index = ul.children().index(this);
        signUp(clubidx,useridx,index);
    });
}

function signUp(clubidx,useridx,index){
	var usrState = "";
	if(index == 0){
		usrState= "3";
	}
	else if(index == 1){
		usrState= "2";
	}
	else if(index == 2){
		usrState= "1";
	}
	
	var data = new FormData();
	data.append("usrIdx",useridx);
	data.append("clubIdx",clubidx);
	data.append("clubUserState",usrState);

	$.ajax({
	    url: '/club_apply_process.do',
	    type: 'POST',
	    contentType: false,               // * 중요 *
        processData: false,  
	    data: data,
	    enctype : 'multipart/form-data',
	    success: function (data) {
	    	console.log(data);
	 			if(data == "success"){
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
		<div id="sub_contents" class="board head_mg mb140">
				<div class="navi">
					<div class="top_navi"><a href="javascript:history.back(-1)"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>가입 신청</h2></div>
				</div>
			
		
		<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="w_box top no_line fm_bottom">
			<c:if test="${fn:length(clubApplicationList)  eq 0}">
				<li class="nodata">등록된 게시글이 없습니다.</li> 
			</c:if>
			<c:forEach var="result" items="${dateList }">
				<c:forEach var="applicants" items="${clubApplicationList }">
				<c:if test="${applicants.nregDate eq firstDate }">
					<div class="join_view">
				
				  <c:set var="datee" value="${result }"/>
					<p class="num" style="border:none; padding-top:0">${result }</p>
								
										<c:if test="${datee eq applicants.nregDate }">
												<div >
													<ul class="fm_list cj_list">
														<li>
															<div class="fm_profile" onclick="location.href='/friendView.do?usrIdx=/${applicants.usrIdx }'">
										
																<c:if test="${applicants.usrSrvprofilepic  ne null }">
																	<p class="img"><img alt="내 친구" src="'/_img/_img/cont/friend_bg.png'" style="background: url('/upload/mypage/${applicants.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p>
																</c:if>
																<c:if test="${applicants.usrSrvprofilepic  eq null }">
																	<p class="img"><img alt="내 친구" src="'/_img/_img/cont/friend_bg.png'" style="background: url('/_img/_img/cont/no_photo.png')no-repeat 50% 50% / cover;"></p>
																</c:if>
																<!-- <p class="border blue"></p> -->
															</div>
															<div class="info">
																<p class="tt">${applicants.usrNickname}(${applicants.usrName})</p>
																<span>${applicants.usrMajor}</span><span>${applicants.nusrStdnum}학번</span>
															</div>
															<a href="club_apply.do?clubIdx=${applicants.clubIdx }&usrIdx=${applicants.usrIdx}" class="view" alt="지원서보기">
													
																<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M0 64C0 28.65 28.65 0 64 0H224V128C224 145.7 238.3 160 256 160H384V299.6L289.3 394.3C281.1 402.5 275.3 412.8 272.5 424.1L257.4 484.2C255.1 493.6 255.7 503.2 258.8 512H64C28.65 512 0 483.3 0 448V64zM256 128V0L384 128H256zM564.1 250.1C579.8 265.7 579.8 291 564.1 306.7L534.7 336.1L463.8 265.1L493.2 235.7C508.8 220.1 534.1 220.1 549.8 235.7L564.1 250.1zM311.9 416.1L441.1 287.8L512.1 358.7L382.9 487.9C378.8 492 373.6 494.9 368 496.3L307.9 511.4C302.4 512.7 296.7 511.1 292.7 507.2C288.7 503.2 287.1 497.4 288.5 491.1L303.5 431.8C304.9 426.2 307.8 421.1 311.9 416.1V416.1z"/></svg>
															</a>
															<a href="#none" class="more" onclick="showPopUpList('${applicants.usrNickname}','${applicants.usrName}','${applicants.clubIdx }','${applicants.usrIdx}');"><img src="/_img/_img/cont/fm_more.png" width="2" alt="친구관리"></a>
														</li>
													</ul>
													</div>
														
												</c:if>
									
											</div>
									</c:if>
							
						
	
						<c:if test="${applicants.nregDate ne firstDate }">
							<div>
									<p class="num">${result }</p>
									<ul class="fm_list">
										<li>
															<div class="fm_profile" onclick="location.href='/friendView.do?usrIdx=/${applicants.usrIdx }'">
										
																<c:if test="${applicants.usrSrvprofilepic  ne null }">
																	<p class="img"><img alt="내 친구" src="'/_img/_img/cont/friend_bg.png'" style="background: url('/upload/mypage/${applicants.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p>
																</c:if>
																<c:if test="${applicants.usrSrvprofilepic  eq null }">
																	<p class="img"><img alt="내 친구" src="'/_img/_img/cont/friend_bg.png'" style="background: url('/_img/_img/cont/no_photo.png')no-repeat 50% 50% / cover;"></p>
																</c:if>
																<!-- <p class="border blue"></p> -->
															</div>
															<div class="info">
																<p class="tt">${applicants.usrNickname}(${applicants.usrName})</p>
																<span>${applicants.usrMajor}</span><span>${applicants.nusrStdnum}학번</span>
															</div>
															<a href="club_apply.do?clubIdx=${applicants.clubIdx }&usrIdx=${applicants.usrIdx}" class="view" alt="지원서보기">
													
																<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M0 64C0 28.65 28.65 0 64 0H224V128C224 145.7 238.3 160 256 160H384V299.6L289.3 394.3C281.1 402.5 275.3 412.8 272.5 424.1L257.4 484.2C255.1 493.6 255.7 503.2 258.8 512H64C28.65 512 0 483.3 0 448V64zM256 128V0L384 128H256zM564.1 250.1C579.8 265.7 579.8 291 564.1 306.7L534.7 336.1L463.8 265.1L493.2 235.7C508.8 220.1 534.1 220.1 549.8 235.7L564.1 250.1zM311.9 416.1L441.1 287.8L512.1 358.7L382.9 487.9C378.8 492 373.6 494.9 368 496.3L307.9 511.4C302.4 512.7 296.7 511.1 292.7 507.2C288.7 503.2 287.1 497.4 288.5 491.1L303.5 431.8C304.9 426.2 307.8 421.1 311.9 416.1V416.1z"/></svg>
															</a>
															<a href="#none" class="more" onclick="showPopUpList('${applicants.usrNickname}','${applicants.usrName}','${applicants.clubIdx }','${applicants.usrIdx}');"><img src="/_img/_img/cont/fm_more.png" width="2" alt="친구관리"></a>
														</li>
											
										</ul>
									</div>
								</c:if>
								</c:forEach>
				</c:forEach>
				

			</div>
		</div>
	<!-- CONTENTS END -->



	</div>
	<!-- //wrap -->
		
		
		
		
		
		
		
		
		
		

			</div>
					
				</div>
	<!-- CONTENTS END -->


	<!-- POPUP BEGIN -->
	<!--  동아리 관리 버튼을 눌렀을 시  -->
	<div class="layer" id="more_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="morePop">
			<div class="pop_cont club_list">
				<p class="name" id="name"> </p>
				<ul id="alertList">
					<li >
						<p>가입 승인</p>
						<a href="#" class="arrow"><img src="/_img/_img/comn/next.png"></a>
					</li>
					<li >					
						<p>가입 미승인</p>
						<a href="#" class="arrow"><img src="/_img/_img/comn/next.png"></a>
					</li>
					<li >
						<p>가입 거절</p>
						<a href="#" class="arrow"><img src="/_img/_img/comn/next.png"></a>
					</li>
				</ul>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->
	<!-- 제출시 노출 -->
	<div class="layer" id="submit_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="submitPop">

			<div class="pop_cont text" id="submitOne" >
				<p class="mb20 c">가입 승인 되었습니다.</p>
				<p class="btn"><a href="#" onclick="location.reload()" class="cbtn">확인</a></p>
			</div> 
			
			<div class="pop_cont text" id="submitTwo" >
				<p class="mb20 c">가입 미승인 되었습니다.</p>
				<p class="btn"><a href="#" onclick="location.reload()" class="cbtn">확인</a></p>
			</div> 
			<div class="pop_cont text" id="submitThree" >
				<p class="mb20 c">가입 거절 되었습니다.</p>
				<p class="btn"><a href="#" onclick="location.reload()" class="cbtn">확인</a></p>
			</div> 
			
		</div>
	</div>
	</div>
</body>
<%@include file="../_inc/bottom_menu.jsp" %>
<%@include file="../_inc/footer.jsp" %>
</html>






