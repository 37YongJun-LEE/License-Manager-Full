<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../_inc/title.jsp" %>
<script type="text/javascript">

function report(){
	var para = document.location.href.split("/");
/* 	var parmeee = "reportPageurl"+para[3]; */
	var parm ="/declar.do?reportBoardIdx=${tradeInfo.trdIdx }&reportTblCode=0";
	
	location.href=parm;
}
	
	
$(document).ready(function() { 
	
	$(".update").click(function(){    
		$(".class_pop").addClass("active");
	});	
	$(".cbtn, .bg").click(function(){    
		$(".bottom_layer").removeClass("active");
	});	
});

function like(mode, idx){

	var usrIdx = "${userVO.usrIdx }";
	
	
    $.ajax({
    	type: "POST",
        url: "/trade/saveLike.do",
        data: {
        	mode : mode,
        	trdIdx : idx,
        	usrIdx : usrIdx
        },
        success: function (data) {
            //$("#like").load(location.href+' #like');
        	location.reload();
        },
        error: function (xhr, desc, err) {
            alert('에러가 발생 하였습니다.');
            return;
        }
    });
}

function update(status){
	var trdIdx = "${tradeInfo.trdIdx }";
	
    $.ajax({
    	type: "POST",
        url: "/trade/tradeProc3.do",
        data: {
        	mode : "update",
        	trdIdx : trdIdx,
        	trdStatus : status
        },
        success: function (data) {
            //$("#like").load(location.href+' #like');
    		layer_open('okPop','ok_Pop');
        },
        error: function (xhr, desc, err) {
            alert('에러가 발생 하였습니다.');
            return;
        }
    });
}


</script>
</head>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="head_mg mb140 deal">
			<div class="navi tp">
				<div class="top_navi">
					<a href="javascript:history.back();"><img src="/_img/_img/cont/w_navi_arrow.png" ></a>
				<!--<c:if test="${userVO.usrIdx == tradeInfo.trdUsrIdx}">
					<a href="/mypage/myTrade01.do"><img src="/_img/_img/cont/w_navi_arrow.png"></a>
				</c:if>
				<c:if test="${userVO.usrIdx != tradeInfo.trdUsrIdx}">
					<a href="/trade/tradeList.do"><img src="/_img/_img/cont/w_navi_arrow.png"></a>
				</c:if>-->
				</div>
			</div>
			<div class="slide_wrap">
				<span class="pagingInfo"></span>
				<ul class="photo_slide">
				<c:forEach var="file" items="${fileList }">
					<c:if test="${file.bfType == 'img' }">
						<li><a href="javascript:void(0);" onclick="room_prev_slick(this)" src="/upload/trade/${file.fileSrvFile}"><img src="/_img/_img/cont/view_img.png" style="background:url('/upload/trade/${file.fileSrvFile}')no-repeat 50% 50%/cover"  alt="거래정보"></a></li>					
						
					</c:if>					
				</c:forEach>
				<c:if test="${fn:length(fileList) == 0 }">
						<li><a href="javascript:void(0);" src='/_img/_img/cont/eye-slash-solid.png'><img src="/_img/_img/cont/view_img.png" style="background:url('/_img/_img/cont/eye-slash-solid.png')no-repeat 50% 50%/cover"alt="거래정보" ></a></li>		

				</c:if>
				<!-- 리스트가 비었을 때 기본이미지 -->
				</ul>
			</div>
			
			
			<div class="bbs_view">
				<div class="view_top">
					<div class="writer"> 
					<c:choose>
							<c:when test="${sessionVO.usrIdx eq tradeInfo.trdUsrIdx }">
								<a href="/mypage.do" class="photo">
									<span>
										<!-- 기본이미지 -->
										<c:if test="${tradeInfo.profile == null }">
											<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
										</c:if>
										<!-- 이미지 예시 : 권장이미지 225 * 225-->
										<c:if test="${tradeInfo.profile != null }">
											<img src="/_img/_img/cont/photo_bg.png" style="background:url('/upload/mypage/${tradeInfo.profile }')no-repeat 50% 50% /cover" width="85">
										</c:if>
									</span>
								</a>
								<div class="info">
									<a href="#" class="name">${tradeInfo.realNickname }</a>
								</div>
							</c:when>
							<c:otherwise>
								<a href="/friendView.do?usrIdx=${tradeInfo.trdUsrIdx }" class="photo">
									<span>
										<!-- 기본이미지 -->
										<c:if test="${tradeInfo.profile == null }">
											<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
										</c:if>
										<!-- 이미지 예시 : 권장이미지 225 * 225-->
										<c:if test="${tradeInfo.profile != null }">
											<img src="/_img/_img/cont/photo_bg.png" style="background:url('/upload/mypage/${tradeInfo.profile }')no-repeat 50% 50% /cover" width="85">
										</c:if>
									</span>
								</a>
								<div class="info">
									<a href="#" class="name">${tradeInfo.realNickname }</a>
									<p class="declar"><a href="#" onclick="report()">신고</a></p>
								</div>
							</c:otherwise>
						</c:choose>
					
						
					</div>
				</div>
				

				<div class="view_middle">
					
					<!-- 거래 상태 변경 버튼 버튼 디자인 수정 필요 -->
					<c:if test="${userVO.usrIdx == tradeInfo.trdUsrIdx}">
						<div class="trade_btn">
							<button class="update">
								<c:if test="${tradeInfo.trdStatus eq 1 }">판매중</c:if>
								<c:if test="${tradeInfo.trdStatus eq 2 }">예약중</c:if>
								<c:if test="${tradeInfo.trdStatus eq 3 }">거래완료</c:if>
							</button>
						</div>
					</c:if>

					<p class="tt">${tradeInfo.trdTitle }</p>
					<p><span>${tradeInfo.trdUsrnick }</span><span><fmt:formatDate pattern="MM-dd hh:mm" value="${tradeInfo.trdWritedate }"/></span></p>
				</div>
				<div class="view_bottom">
					<div class="view_cont">
						<p>${tradeInfo.trdContent }</p>
					</div>
				</div>

				<div class="view_menu">
					<c:if test="${userVO.usrIdx == tradeInfo.trdUsrIdx}">
						<p class="btn_area">
							<a href="/trade/tradeWrite.do?trdIdx=${tradeInfo.trdIdx }" >수정</a>
							<a href="javascript:submit('del');" >삭제</a>
							<form name="frm" id="frm" autocomplete="off" method="post" enctype="multipart/form-data">
								<input type="hidden" name="trdIdx" value="${tradeInfo.trdIdx }"/>
								<input type="hidden" name="mode" id="mode" />
							</form>
						</p>
					</c:if>	
				</div>	
			
			
			</div>
			

			<div class="price_box"> <!-- 하트 체크 시 a태그 클래스 on을 넣어주세요 -->
				
			<!-- 좋아요 -->
			<c:if test="${userVO.usrIdx != tradeInfo.trdUsrIdx}">
				<c:if test="${likeInfo == 0 }">
					<a id="like" href="#" class="heart_check" onclick="javascript:like('on', ${tradeInfo.trdIdx });"><svg width="23" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="19"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg></a>
				</c:if>
				<c:if test="${likeInfo != 0 }">
					<a id="like" href="#" class="heart_check on" onclick="javascript:like('off',${tradeInfo.trdIdx });"><svg width="23" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="19"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg></a>
				</c:if>
			</c:if>
			
			<c:if test="${userVO.usrIdx == tradeInfo.trdUsrIdx}">
				<c:if test="${likeInfo == 0 }">
					<a id="like" href="#" onclick="alert('본인글에는 좋아요를 누를 수 없습니다.')" class="heart_check"><svg width="23" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="19"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg></a>
				</c:if>
			</c:if>
		
		
				
			<form name="chat" id="chat" autocomplete="off" method="get" >
				<input type="hidden" name="roomId" id="roomId"/>
			</form>	
				<p>
					<span>
					<fmt:formatNumber maxFractionDigits="3" value="${tradeInfo.trdPrice }" />
					원</span>
					<c:if test="${userVO.usrIdx != tradeInfo.trdUsrIdx && tradeInfo.trdStatus == 1}">
						<a href="javascript:chatSubmit();" class="btn_mini bt_green">채팅하기</a>
					</c:if>		
				
				</p>
			</div>
		</div>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<div class="mo_room_pop">
	<div class="pop_area">
		<!-- NAV BEGIN -->
		<a href="javascript:void(0);" id="btn_cancel" class="close btn_pop_close"><img src="/_img/_img/cont/photo_close.png" width="20"></a>
		<span class="custom_paging"></span>
		<!-- :: 사진확대 가능하도록 해주세요 -->
		<div class="room_img_pop"></div>
	</div>
	</div>
	<!-- 찜목록 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			 <div class="pop_cont text" id="contTwo">
				<p class="mb20 c">상태가 변경됐습니다.</p>
				<p class="btn"><a href="#" onClick="top.location='javascript:location.reload()'" class="cbtn">확인</a></p>
			</div>
			 
		</div>
	</div>
	<!-- 강의정보 선택 시 노출 -->
	<div class="bottom_layer class_pop">
		<div class="bg"></div>
		<div class="bottom-pop-layer">
			<p class="box_btn line">
				<a href="#" onclick="javascript:update('1');" class="plus_btn">판매중</a> <!-- 1:판매중 2:예약중 3:판매완료 -->
				<a href="#" onclick="javascript:update('2');" class="cbtn">예약중</a>
				<a href="#" onclick="javascript:update('3');" class="cbtn">판매완료</a>
			</p>
		</div>
	</div>
	
	<!-- POPUP END -->

<!-- //wrap -->

</body>
</html>


<script>

function submit(mode) {
	
	if(mode == "update"){
		if(confirm("판매 상태를 변경하시겠습니까?")){
			$('#mode').val(mode);
			$("#frm").attr("action", "/trade/tradeProc2.do");
			$("#frm").submit();
		}
	}
	
	if(mode == "del"){
		if(confirm("정말 삭제하시겠습니까?")){
			$('#mode').val(mode);
			$("#frm").attr("action", "/trade/tradeProc2.do");
			$("#frm").submit();
		}
	}
}

/* 채팅관련 */
function uuidv4() {
	  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
	    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
	    return v.toString(16);
	  });
	}

function chatSubmit(){
	//ajax로 이미 존재하는지 검사하고, 방을 만듬
	
	let uuid = uuidv4();
	var usrIdx = ${tradeInfo.trdUsrIdx };
	
    $.ajax({
    	type: "POST",
        url: "/chat/makeRoom.do",
        data: {
        	roomId : uuid,
        	trdUsrIdx : usrIdx
        },
        success: function (roomId) {
            
        	$('#roomId').val(roomId);
        	$("#chat").attr("action", "/chat/room.do");
        	$("#chat").submit();
        },
        error: function (xhr, desc, err) {
            alert('에러가 발생 하였습니다.');
            return;
        }
    });
	
}


</script>

<script src="/_js/_js/image.js" type="text/javascript" charset="utf-8"></script>