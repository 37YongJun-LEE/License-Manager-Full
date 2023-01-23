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
		<div class="navi">
			<div class="top_navi"><a href="/majorNotice_view.do?noticeIdx=${noticeIdx}"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>게시글 확인한 친구</h2></div>
		</div>
		<div class="mn">					
			<select onchange="if(this.value) location.href=(this.value)">
				<option value="/majorNotice_viewCheck.do?noticeIdx=${noticeIdx}&usrMajor=${usrMajor}&filter=all" <c:if test = "${filter eq 'all'}">selected</c:if>>전체보기</option>
				<option value="/majorNotice_viewCheck.do?noticeIdx=${noticeIdx}&usrMajor=${usrMajor}&filter=checked" <c:if test = "${filter eq 'checked'}">selected</c:if>>읽음</option>
				<option value="/majorNotice_viewCheck.do?noticeIdx=${noticeIdx}&usrMajor=${usrMajor}&filter=none" <c:if test = "${filter eq 'none'}">selected</c:if>>안읽음</option>
			</select>
		</div>
		<c:set var = "noticeIdx" value = "${noticeIdx}"/>
		<div class="w_box top no_line fm_bottom">
				<div class="join_view">
					<ul class="fm_list cj_list">
					
						<c:if test = "${filter eq 'all'}">
							<c:forEach var="result" items="${users}" varStatus="status">
								<li>
									<div class="fm_profile" onclick="location.href='friend.html'">
										<span class="star">
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"></path></svg>
										</span>
										<p class="img"><img alt="내 친구" src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover"></p>
										<p class="border blue"></p>
									</div>
									<div class="info">
										<p class="tt"><c:out value="${result.usrNickname}"/>(<c:out value="${result.usrName}"/>)</p>
										<span><c:out value="${result.usrMajor}"/></span><span><c:out value="${result.admissionYear}"/>학번 </span>
									</div>	
									
									<!-- 읽음 여부 확인 부분 -->
									<c:set var = "list" value = "${result.viewChecking}"/>
									<c:set var = "view_check" value = "${fn:contains(list, noticeIdx)}"/>
									<c:if test = "${view_check}">
										<p class="read">읽음</p>
								    </c:if>
								    <c:if test="${view_check eq false}">
										<p class="read no">안읽음</p>
									</c:if>
								</li>		
							</c:forEach>
						</c:if>
						
						<c:if test = "${filter eq 'none'}"> 
							<c:forEach var="result" items="${users}" varStatus="status">
								<c:set var = "list" value = "${result.viewChecking}"/>
								<c:set var = "view_check" value = "${fn:contains(list, noticeIdx)}"/>
								<c:if test="${view_check eq false}">
								<li>
									<div class="fm_profile" onclick="location.href='friend.html'">
										<span class="star">
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"></path></svg>
										</span>
										<p class="img"><img alt="내 친구" src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover"></p>
										<p class="border blue"></p>
									</div>
									<div class="info">
										<p class="tt"><c:out value="${result.usrNickname}"/>(<c:out value="${result.usrName}"/>)</p>
										<span><c:out value="${result.usrMajor}"/></span><span><c:out value="${result.admissionYear}"/>학번 </span>
									</div>	
									
									<!-- 읽음 여부 확인 부분 -->
									
									<c:if test = "${view_check}">
										<p class="read">읽음</p>
								    </c:if>
								    <c:if test="${view_check eq false}">
										<p class="read no">안읽음</p>
									</c:if>
								</li>	
								</c:if>	
							</c:forEach>
						</c:if>
						
						<c:if test = "${filter eq 'checked'}">  
							<c:forEach var="result" items="${users}" varStatus="status">
								<c:set var = "list" value = "${result.viewChecking}"/>
								<c:set var = "view_check" value = "${fn:contains(list, noticeIdx)}"/>
								<c:if test = "${view_check}">
								<li>
									<div class="fm_profile" onclick="location.href='friend.html'">
										<span class="star">
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"></path></svg>
										</span>
										<p class="img"><img alt="내 친구" src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover"></p>
										<p class="border blue"></p>
									</div>
									<div class="info">
										<p class="tt"><c:out value="${result.usrNickname}"/>(<c:out value="${result.usrName}"/>)</p>
										<span><c:out value="${result.usrMajor}"/></span><span><c:out value="${result.admissionYear}"/>학번 </span>
									</div>	
									
									<!-- 읽음 여부 확인 부분 -->
									<c:set var = "list" value = "${result.viewChecking}"/>
									<c:set var = "view_check" value = "${fn:contains(list, noticeIdx)}"/>
									<c:if test = "${view_check}">
										<p class="read">읽음</p>
								    </c:if>
								    <c:if test="${view_check eq false}">
										<p class="read no">안읽음</p>
									</c:if>
								</li>		
								</c:if>
							</c:forEach>
						</c:if>
					</ul>
				</div>

				<!-- <p class="paging">
					<a href="#" class="prev end">처음으로</a>
					<a href="#" class="prev">이전</a>
					<a href="#" class="on">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#" class="next">다음</a>
					<a href="#" class="next end">마지막으로</a>
				</p> -->

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