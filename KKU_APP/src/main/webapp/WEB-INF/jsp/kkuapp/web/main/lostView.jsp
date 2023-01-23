<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../_inc/title.jsp" %>
<script type="text/javascript">

function report(idx, boardYN){
	if(boardYN == 'Y'){
		var parm ="/declar.do?reportBoardIdx="+idx+"&reportTblCode=4";
		location.href=parm;
	}
	else if(boardYN == 'N'){
		var parm ="/declar.do?reportBoardIdx="+idx+"&reportTblCode=4&reportPageurl=reply";
		location.href=parm;
	}
}
$(document).ready(function() { 
	
	$(".update").click(function(){    
		$(".class_pop").addClass("active");
	});	
	$(".cbtn, .bg").click(function(){    
		$(".bottom_layer").removeClass("active");
	});	
});

 function update(status){
	var lostIdx = "${lostInfo.lostIdx }";
	
    $.ajax({
    	type: "POST",
        url: "/lostProc2.do",
        data: {
        	mode : "update",
        	lostIdx : lostIdx,
        	lostStatus : status
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

 function replySubmit(){
	 
	 var comment = $("#comment").val();
	 if(comment.trim() == ''){
		 alert('내용을 입력해주세요.');
		 return;
	 }else{
		$("#replyContent").val(comment);
		$("#replyFrm").submit();
	 }
 }
//날짜 년월일 , 시분 파싱 
	function dateChange(date, type) {
		var testString = date;
		var test = testString.split('-');

		if (type == "writedate")
			document.write(test[0])
		else if (type == "writehour")
			document.write(test[1])
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
					<a href="/lost.do"><img src="/_img/_img/cont/w_navi_arrow.png"></a>

				</div>
			</div>
			<div class="slide_wrap">
				<span class="pagingInfo"></span>
				<ul class="photo_slide">
				<c:forEach var="file" items="${fileList }">
					<c:if test="${file.bfType == 'img' }">
						<li><a href="javascript:void(0);" onclick="room_prev_slick(this)" src="/upload/lost/${file.fileSrvFile}"><img src="/_img/_img/cont/view_img.png" style="background:url('/upload/lost/${file.fileSrvFile}')no-repeat 50% 50%/cover"  alt="거래정보"></a></li>					
						
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
							<c:when test="${sessionVO.usrIdx eq lostInfo.lostWriter }">
								<a href="/mypage.do" class="photo">
										<span>
										<!-- 기본이미지 -->
										<c:if test="${lostInfo.profile == null }">
											<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
										</c:if>
										<!-- 이미지 예시 : 권장이미지 225 * 225-->
										<c:if test="${lostInfo.profile != null }">
											<img src="/_img/_img/cont/photo_bg.png" style="background:url('/upload/mypage/${lostInfo.profile }')no-repeat 50% 50% /cover" width="85">
										</c:if>
									</span>
								</a>
							</c:when>
							<c:otherwise>
								<a href="/friendView.do?usrIdx=${lostInfo.lostWriter }" class="photo">
										<span>
										<!-- 기본이미지 -->
										<c:if test="${lostInfo.profile == null }">
											<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
										</c:if>
										<!-- 이미지 예시 : 권장이미지 225 * 225-->
										<c:if test="${lostInfo.profile != null }">
											<img src="/_img/_img/cont/photo_bg.png" style="background:url('/upload/mypage/${lostInfo.profile }')no-repeat 50% 50% /cover" width="85">
										</c:if>
									</span>
								</a>
							</c:otherwise>
						</c:choose>
							
						<div class="info">
							<a href="#" class="name">${lostInfo.usrNickname }</a>
							<p class="declar"><a href="#" onclick="report('${lostInfo.lostIdx}','Y')">신고</a></p>
						</div>
					</div>
				</div>

				
				<!-- 거래 상태 변경 버튼 버튼 디자인 수정 필요 -->

				<div class="view_middle">
					<c:if test="${usrIdx == lostInfo.lostWriter}">
						<div class="trade_btn">
							<li>
								<button class="update">
									<c:if test="${lostInfo.lostStatus eq 1 }">찾는중</c:if>
									<c:if test="${lostInfo.lostStatus eq 2 }">해결완료</c:if>
								</button>
							</li>
						</div>
					</c:if>				
				
					<p class="tt">${lostInfo.lostTitle }</p>
					<p><span>${lostInfo.usrNickname }</span><span><fmt:formatDate pattern="MM-dd hh:mm" value="${lostInfo.lostWritedate }"/></span></p>
				</div>
				<div class="view_bottom">
					<div class="view_cont">
						<p>${lostInfo.lostContent }</p>
					</div>
				</div>

				<li>
					<div class="view_menu">
						<c:if test="${usrIdx == lostInfo.lostWriter}">
							<p class="btn_area">
								<a href="/lostWrite.do?lostIdx=${lostInfo.lostIdx }" >수정</a>
								<a href="javascript:submit('del');" >삭제</a>
								<form name="frm" id="frm" autocomplete="off" method="post" enctype="multipart/form-data">
									<input type="hidden" name="lostIdx" value="${lostInfo.lostIdx }"/>
									<input type="hidden" name="mode" id="mode" />
								</form>
							</p>
						</c:if>	
					</div>
				</li>	
			
			
			</div>
			<div class="bbs_comment">
			<form name="replyFrm" id="replyFrm" autocomplete="off" method="post" action="/lostReply.do" enctype="multipart/form-data">
				<input type="hidden" name="boardIdx" value="${lostInfo.lostIdx }"/>
				<input type="hidden" name="replyContent" id="replyContent" />
				<textarea rows="4" placeholder="댓글입력" id= "comment"></textarea>
				<p class="btn mt5"><a href="javascript:replySubmit();">등록</a></p>
			</form>
				
				<ul>
	
						<c:forEach var="result" items="${replyList }">
							<li>
								<div class="con">
									<p>${result.replyContent }</p>
								</div>
								<div class="info">
									 <p><span>${result.usrNickname }</span> 
									 <span><script>dateChange("${result.replyWritedate }","writedate");</script></span>
									<span><script>dateChange("${result.replyWritedate }","writehour");</script></span></p>
									</a>
									
							<p class="declar"><a href="#" onclick="report('${result.replyIdx}','N')">신고</a></p>
								</div>
							</li>
						</c:forEach>
				</ul>
			</div>

			
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
	<!-- pop -->
	<div class="bottom_layer class_pop">
		<div class="bg"></div>
		<div class="bottom-pop-layer">
			<p class="box_btn line">
				<a href="#" onclick="javascript:update('1');" class="plus_btn">찾는중</a> <!-- 1:판매중 2:예약중 3:판매완료 -->
				<a href="#" onclick="javascript:update('2');" class="cbtn">해결완료</a>
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
			$("#frm").attr("action", "/lostProc.do");
			$("#frm").submit();
		}
	}
	
	if(mode == "del"){
		if(confirm("정말 삭제하시겠습니까?")){
			$('#mode').val(mode);
			$("#frm").attr("action", "/lostProc2.do");
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
	var usrIdx = ${lostInfo.lostWriter };
	
    $.ajax({
    	type: "POST",
        url: "/chat/makeRoom.do",
        data: {
        	roomId : uuid,
        	lostWriter : usrIdx
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


//사진 슬라이드
var $status = $('.pagingInfo');
var $slickElement = $('.photo_slide');

$slickElement.on('init reInit afterChange', function(event, slick, currentSlide, nextSlide){
    var i = (currentSlide ? currentSlide : 0) + 1;
    $status.text(i + '/' + slick.slideCount);
});

$slickElement.slick({
    slide: 'li',		
	infinite : true, 	
	slidesToShow : 1,		
	slidesToScroll : 1,		
	speed : 100,	 
	arrows : false, 		
	dots : false, 		
	autoplay : false,			
	pauseOnHover : true,		
	vertical : false,		
	draggable : true, 	
});


//이미지 확대 팝업 
	function room_pre(e) {
		var obj = e;
		obj.setAttribute('id','fo');
		$('.room_img_pop').hide();
		document.getElementById('proom').setAttribute('src',obj.getAttribute('src'));
		$('.mo_room_pop').show();
		$('html, body').addClass('fix');
	}
	function room_prev_slick(e) {
		if ($('.room_img_pop img').length > 0) {
			jQuery('.room_img_pop').slick('slickRemove', null, null, true);
			jQuery('.room_img_pop').slick('unslick');
			$('.room_img_pop').empty();
		}
		$('#proom').hide();
		var obj = e;
		obj.setAttribute('id','fo');
		var $el = $(obj);
		var $room_img_list = $el.closest('.photo_slide').find('.slick-slide:not(.slick-cloned) a');
		var img_index = 0;
		$room_img_list.each(function(idx) {
			if ($el.attr('src') == $(this).attr('src')) img_index = idx;
			$('.room_img_pop').append('<div><img src="'+ $(this).attr('src') +'" style="width:100%;" /></div>');
			
		});
	
		$('.mo_room_pop').show();
		
		jQuery(".room_img_pop").slick({
			infinite: true,
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows : false, 	
			initialSlide : img_index,
			dots: true,
			dotsClass: 'custom_paging',
			customPaging: function (slider, i) {
			    return  (i + 1) + '/' + slider.slideCount;
			}
		});
	
		$(".room_img_pop").not('.slick-initialized').slick()
	
		$('html, body').addClass('fix');
	}
	$('#btn_cancel').click(function() {
		$('.mo_room_pop').hide();
		$('html, body').removeClass('fix');
		$('#fo').focus();
		var obj = document.getElementById("fo");
		obj.removeAttribute('id');
	});
	$('#btn_cancel')



</script>