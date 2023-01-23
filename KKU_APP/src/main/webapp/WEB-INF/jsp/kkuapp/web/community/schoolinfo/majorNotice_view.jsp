<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
</head>


<body>
	<div id="wrap">
	<!-- HEADER BEGIN -->
	<header class="sub">
	<%@include file="../../_inc/header.jsp" %>
	</header>

	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="/majorNotice.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>${usrMajor} 공지사항</h2></div>
			</div>
			<div class="bbs_view">
				<div class="view_top">
					<p class="tit">${majorNotice.noticeTitle}</p>
					<div class="writer"> 
						<a class="photo">
							<span>
								<!-- 기본이미지 -->
								<p class="img"><img alt="내 친구" src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover"></p>
								<!-- 이미지 예시 : 권장이미지 225 * 225-->
								<!-- <img src="../_img/cont/photo_bg.png" style="background:url('../_img/cont/ex_photo.jpg')no-repeat 50% 50% /cover" width="85"> -->
							</span>
						</a>
						<div class="info">
							<a class="name">${majorNotice.mnoticeName }</a>
							<p><span>${majorNotice.mnoticeDate }</span>
							<span>조회수 ${majorNotice.mnoticeViewcnt }</span></p>
						</div>
					</div>
				</div>
				
				<script>var text=0;</script>
				<c:set var = "noticeIdx" value = "${noticeIdx}"/>
				<c:forEach var="result" items="${users}" varStatus="status">	
					<c:set var = "list" value = "${result.viewChecking}"/>
					<c:set var = "view_check" value = "${fn:contains(list, noticeIdx)}"/>
					<c:if test = "${view_check}">
						<script>text+=1;</script>
				    </c:if>	
				</c:forEach>
				
				<div class="top_tit check">
					<p class="tit">게시글 확인한 친구 <script>document.write(text);</script></script></p>
					<p class="more"><a href="/majorNotice_viewCheck.do?noticeIdx=${majorNotice.mnoticeIdx}&usrMajor=${majorNotice.mnoticeCategory}">더보기<span></span><span></span></a></p>
				</div>
				<div class="check_p">
					<ul>
						<c:forEach var="result" items="${users}" varStatus="status">	
							<c:set var = "list" value = "${result.viewChecking}"/>
							<c:set var = "view_check" value = "${fn:contains(list, noticeIdx)}"/>
							<c:if test = "${view_check}">
								<li onclick="location.href='#'">
									<span class="new"></span>
									<p class="img"><img alt="내 친구" src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover"></p>
									<p class="list"><c:out value="${result.usrNickname}"/></p>
								</li>
						    </c:if>	
						</c:forEach>			
					</ul>
				</div>
				
				
				<div class="view_bottom">
					<div class="view_cont">
						${majorNotice.kc}
						<p>&lt;첨부파일&gt;</p>${majorNotice.kf}
						<!-- <div class="slide_wrap">
							<span class="pagingInfo"></span>
							<ul class="photo_slide">
								<c:forEach var="file" items="${fileList }">
									<c:if test="${file.bfType == 'img' }">
										<li><a href="javascript:void(0);" onclick="room_prev_slick(this)" src="/upload/trade/${file.fileSrvFile}"><img src="/_img/_img/cont/view_img.png" style="background:url(/upload/board/${file.fileSrvFile})no-repeat 50% 50%/cover"  alt="거래정보"></a></li>					
									</c:if>					
								</c:forEach>
							</ul>
						</div>
					<br>
					</div>
					<p class="btn nk_btn mt15">
						<a href="majorNotice.do?usrIdx=${usrIdx}" class="bt_greenL">목록</a>
						<!-- 해당권한을 가지고 있는 사람에게만 수정/삭제 버튼 노출 
						<c:if test="${usrRank == '2'}">
							<a href="majorNotice_write.do?boardIdx=${majorNoticeVO.boardIdx}" class="bt_gray02">수정</a>
							<a href="javascript:submit('del');" class="bt_grayL" onclick="layer_open('delPop','del_Pop')">삭제</a>
							<form name="frm" id="frm" autocomplete="off" method="post" enctype="multipart/form-data">
								<input type="hidden" name="boardIdx" value="${majorNoticeVO.boardIdx }"/>
								<input type="hidden" name="mode" id="mode" />
							</form>
						</c:if>
					</p>-->
				</div>
			</div>
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
	<!-- POPUP BEGIN -->
	<!-- 삭제 선택 시 노출 
	<div class="layer" id="del_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delPop">
			<div class="pop_cont text">
				<p class="tit c">게시물 삭제</p>
				<p class="mb20 c">게시물 삭제 후 복구가 불가합니다.<br/>정말 삭제하시겠습니까?</p>
				<p class="two_btn btn"><a href="#" onclick="layer_open('delokPop','delok_Pop')">확인</a><a href="#" class="bt_red cbtn">취소</a></p>
			</div> 
		</div>
	</div>-->

	<!-- 삭제 팝업 확인 선택 시 노출 
	<div class="layer" id="delok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delokPop">
			<div class="pop_cont text">
				<p class="tit c">게시물 삭제 완료</p>
				<p class="mb20 c">게시물이 삭제되었습니다.</p>
				<p class="btn"><a href="majorNotice.do?usrIdx=${usrIdx}" onclick="javascript:submit('del');">확인</a></p>
			</div> 
		</div>
	</div>-->

	<!-- POPUP END -->


</div>
<!-- //wrap -->

</body>
</html>
<script>
function submit(mode) {	
	if(mode == "del"){
		if(confirm("정말 삭제하시겠습니까?")){
			$('#mode').val(mode);
			$("#frm").attr("action", "/majorNotice_submit2.do");
			$("#frm").submit();
		}
	}
}

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