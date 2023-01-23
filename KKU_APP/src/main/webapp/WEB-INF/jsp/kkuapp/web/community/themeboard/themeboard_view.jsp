<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
</head>
<script>
function dateChange(date , type){ 
	var testString = date;
	var test = testString.split('-');

	if(type=="writedate")
		document.write(test[0])
	else if (type=="writehour")
		document.write(test[1])
}
function boardLikeButton(){
	var boardIdx = "${boardList.tboardIdx}";
	var usrId = '${sessionID}';
	var boardDetailname = "${boardList.tboardDetailname}";
	var boardName = "${boardList.tboardDetailname}" ;
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "POST",
		url : "/TboardLike.do",
		data : {
				boardIdx: boardIdx,
				usrId : usrId,
				boardDetailname: boardDetailname,
				boardName: boardName
	
			},
			success: function(tmp) {
				if(tmp == "success"){
					layer_open('replyPop','reply_Pop');
					$("#contreplyOne").show();
					$("#contreplyTwo").hide(); 
					

				}
				else{
					layer_open('replyPop','reply_Pop');
					$("#contreplyOne").hide();
					$("#contreplyTwo").show(); 
				}
			}
			 
	});
}

function replyWriteAjax(){
	var boardIdx = "${boardList.tboardIdx}";
	var boardWriter = "${boardList.tboardWriter}";
	var boardTitle = "${boardList.tboardTitle}";
	var boardDetailname = "${boardList.tboardDetailname}";
	var boardName = "${boardList.tboardName}" ;
	var replyContent = $('#comment').val();
	var replyWriter = '${sessionID}';
	if(replyContent ==""){
		layer_open('confirmPop','confirm_Pop');
		$("#contOne").show();
		$("#contTwo").hide(); 
	}
	else{
		$.ajax({
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
			url : "/tboardreplyWrite.do",
			data : {
					boardIdx: boardIdx,
					boardWriter : boardWriter,
					boardTitle : boardTitle,
					boardDetailname: boardDetailname,
					boardName: boardName,
					replyWriter: replyWriter,
					replyContent: replyContent
				},
				success: function(tmp) {
					if(tmp == "success"){
						layer_open('confirmPop','confirm_Pop');
						$("#contOne").hide();
						$("#contTwo").show(); 
						document.getElementById("comment").value='';
						setTimeout(function() {
							location.reload();
							}, 1000);

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
	<%@include file="../../_inc/header.jsp" %>
	</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg  mb140">
			<div class="navi">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>미국 주식 게시판</h2></div>
			</div>
			<div class="bbs_view">

				<div class="view_top">
					<div class="writer"> 
						<a href="#" class="photo">
							<span>
							<c:choose>
									<c:when test="${boardList.usrSrvprofilepic ne null }">
											<p><img src="/upload/mypage/${boardList.usrSrvprofilepic}"></p>
									</c:when>
									<c:otherwise>
										<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
									</c:otherwise>
								
							</c:choose>	
								<!-- 기본이미지 -->
								ㅣ
							</span>
						</a>
						<div class="info">
							<a href="#" class="name">${boardList.usrNickname}</a>
							<%-- <p class="depart"><span>${boardList.usrMajor}</span><span>${boardList.usrStdnum}학번</span></p> --%>
							<p><p><span> <script>dateChange("${boardList.tboardWritedate}","writedate");</script> </span>
							<span><script>dateChange("${boardList.tboardWritedate}","writehour");</script></span></p>
							<span>조회수 ${boardList.tboardViewnum }</span></p>
						</div>
					</div>
				</div>
				<div class="view_bottom">
					<div class="view_cont">
					
							<c:choose>
									<c:when test="${boardList.first ne null }">
											<p><img src="/upload/tboard/${boardList.first}"></p>
									</c:when>
								
							</c:choose>		
					
						<br/>
						
						<p>${boardList.tboardContent }</p>
					</div>
					<a href="#none" class="heart on"  onClick="boardLikeButton()">
						<span> <!-- 하트활성화 :a 태그에 class="on"를 넣어주세요 -->
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg>
						</span>
						이 게시물 추천<strong>${boardList.likeNum }</strong>
					</a>
					<p class="btn nk_btn mt15">
						
						<a href="/themeboard.do?bthemeName=${boardList.tboardDetailname }" class="bt_greenL">목록</a>
						<c:if test="${boardList.tboardWriter eq loginVO.usrEmail }">
						<a href="/themeboard_modify.do?tboardIdx=${boardList.tboardIdx }" class="bt_gray02">수정</a>
						<a href="#none" class="bt_grayL" onclick="layer_open('delPop','del_Pop')">삭제</a>
						</c:if>					
					</p>
				</div>
			
			</div>

			<div class="bbs_comment">
				<textarea rows="4" placeholder="댓글입력" id= "comment"></textarea>
				<p class="btn mt5"><a href="#" onClick="replyWriteAjax()">등록</a></p>
				<ul>
				<c:forEach var="result" items="${replyList}">
					<li>
						<div class="con">
							<p>${result.replyContent }</p>
						</div>
						<div class="info">
							<p><span>${result.usrNickname }</span>
							<span><script>dateChange("${result.replyWritedate }","writedate");</script></span>
							<span><script>dateChange("${result.replyWritedate }","writehour");</script></span></p>
							<%-- <a href="#none" class="heart small on">
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg></span>
								좋아요<strong>${result.likeNum }</strong>
							</a> --%>
						</div>
					</li>
				</c:forEach>
				
					
				</ul> 
			</div>
				
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@ include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->

	<!-- POPUP BEGIN -->
	<!-- 삭제 선택 시 노출 -->
	<div class="layer" id="del_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delPop">
			<div class="pop_cont text">
				<p class="tit c">게시물 삭제</p>
				<p class="mb20 c">게시물 삭제 후 복구가 불가합니다.<br/>정말 삭제하시겠습니까?</p>
				<p class="two_btn btn"><a href="#" onclick="layer_open('delokPop','delok_Pop')">확인</a><a href="#" class="bt_red cbtn">취소</a></p>
			</div> 
		</div>
	</div>

	<!-- 삭제 팝업 확인 선택 시 노출 -->
	<div class="layer" id="delok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delokPop">
			<div class="pop_cont text">
				<p class="tit c">게시물 삭제 완료</p>
				<p class="mb20 c">게시물이 삭제되었습니다.</p>
				<p class="btn"><a href="/themeboard_list.do">확인</a></p>
			</div> 
		</div>
	</div>

	<!-- POPUP END -->
<!-- 댓글 작성 버튼 클릭시 노출 -->
	<div class="layer" id="confirm_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="confirmPop">
			
			<!-- 01. 댓글 입력란이 공백일때 -->
			<div class="pop_cont text" id="contOne">
				<p class="mb20 c">댓글 입력란을 확인해주세요</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 

			<!-- 02. 댓글이 성공적으로 달렸을때 -->
			 <div class="pop_cont text" id="contTwo">
				<p class="mb20 c">댓글이 성공적으로 작성되었습니다.</p>
				<p class="btn"><a href="#" class="cbtn" id="commConfirm">확인</a></p>
			</div>
			 
		</div>
	</div>
	<!-- POPUP END -->
	<!--좋아요 버튼 클릭시 노출 -->
	<div class="layer" id="reply_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="replyPop">
			
			<!-- 01.  좋아요 -->
			<div class="pop_cont text" id="contreplyOne">
				<p class="mb20 c">좋아요를 누르셨습니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 

			<!-- 02. 이미 눌렀을때 -->
			 <div class="pop_cont text" id="contreplyTwo">
				<p class="mb20 c">이미 좋아요를 누르셨습니다.</p>
				<p class="btn"><a href="#" class="cbtn" id="commConfirm">확인</a></p>
			</div>
			 
		</div>
	</div>
	<!-- POPUP END -->
</div>
<!-- //wrap -->

</body>
</html>