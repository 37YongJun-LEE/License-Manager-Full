<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
</head>

<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->
	
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi small">
				<div class="top_navi"><a href="/main.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>자격증 매니저</h2></div>
			</div>
			<div class="w_box no_line">
				<div class="top_tit ls">
					<p class="tit">내 관심 자격증</p>
					<p class="more"><a href="/licenseSearch.do">추가<span></span><span></span></a></p>
				</div>
				<ul class="ls_list bg">
					<c:choose>
                    <c:when test="${!empty interestings}">
                    <c:forEach var="interesting" items="${interestings}">
                    <a href="/licenseView.do?subjectCd=${interesting.subjectCd}">
	                    <li>
	                        <p class="ls_tit">${interesting.name}</p>
							<div class="list_wrap">
								<div>
									<c:choose>
		                        		<c:when test="${interesting.displayW }">
			                                <p class="ls_con">${interesting.description} 필기</p>
											<p class="ls_txt">접수기간 : ${interesting.wtestAplcStartdt}~${interesting.wtestAplcEnddt}</p>
											<p class="ls_txt">시험날짜 : ${interesting.wtestEnddt }</p>
										</c:when>
										
										<c:otherwise>
											<c:choose>
												<c:when test="${interesting.passed == 0 }">
													<p class="ls_con">${interesting.description} 실기</p>
													<p class="ls_txt">접수기간 : ${interesting.ptestAplcStartdt}~${interesting.ptestAplcEnddt}</p>
													<p class="ls_txt">시험날짜 : ${interesting.ptestEnddt }</p>
												</c:when>
												
												<c:otherwise>
													<p class="ls_con"></p>
													<p class="ls_txt">시험일정이 없습니다.</p>
												</c:otherwise>
											</c:choose>
											
										</c:otherwise>
									</c:choose>
								</div>
								<p>
									<a href="javascript:openSettingDialog('${interesting.subjectCd}', '${interesting.alertYn}')" style="width: 16px; display: inline-block;">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M495.9 166.6C499.2 175.2 496.4 184.9 489.6 191.2L446.3 230.6C447.4 238.9 448 247.4 448 256C448 264.6 447.4 273.1 446.3 281.4L489.6 320.8C496.4 327.1 499.2 336.8 495.9 345.4C491.5 357.3 486.2 368.8 480.2 379.7L475.5 387.8C468.9 398.8 461.5 409.2 453.4 419.1C447.4 426.2 437.7 428.7 428.9 425.9L373.2 408.1C359.8 418.4 344.1 427 329.2 433.6L316.7 490.7C314.7 499.7 307.7 506.1 298.5 508.5C284.7 510.8 270.5 512 255.1 512C241.5 512 227.3 510.8 213.5 508.5C204.3 506.1 197.3 499.7 195.3 490.7L182.8 433.6C167 427 152.2 418.4 138.8 408.1L83.14 425.9C74.3 428.7 64.55 426.2 58.63 419.1C50.52 409.2 43.12 398.8 36.52 387.8L31.84 379.7C25.77 368.8 20.49 357.3 16.06 345.4C12.82 336.8 15.55 327.1 22.41 320.8L65.67 281.4C64.57 273.1 64 264.6 64 256C64 247.4 64.57 238.9 65.67 230.6L22.41 191.2C15.55 184.9 12.82 175.3 16.06 166.6C20.49 154.7 25.78 143.2 31.84 132.3L36.51 124.2C43.12 113.2 50.52 102.8 58.63 92.95C64.55 85.8 74.3 83.32 83.14 86.14L138.8 103.9C152.2 93.56 167 84.96 182.8 78.43L195.3 21.33C197.3 12.25 204.3 5.04 213.5 3.51C227.3 1.201 241.5 0 256 0C270.5 0 284.7 1.201 298.5 3.51C307.7 5.04 314.7 12.25 316.7 21.33L329.2 78.43C344.1 84.96 359.8 93.56 373.2 103.9L428.9 86.14C437.7 83.32 447.4 85.8 453.4 92.95C461.5 102.8 468.9 113.2 475.5 124.2L480.2 132.3C486.2 143.2 491.5 154.7 495.9 166.6V166.6zM256 336C300.2 336 336 300.2 336 255.1C336 211.8 300.2 175.1 256 175.1C211.8 175.1 176 211.8 176 255.1C176 300.2 211.8 336 256 336z"/></svg>
									</a>
								</p>
							</div>
						</li>
					</a>
                    </c:forEach>
                    </c:when>

                    <c:otherwise>
					<li class="nodata" onclick="location.href='/licenseSearch.do'">관심 자격증을 추가해주세요.</li>
                    </c:otherwise>
                    </c:choose>
				</ul>
				<p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p>
				
				<div class="top_tit ls">
					<p class="tit">학과 추천 자격증</p>
					<!-- <p class="more"><a href="#">더보기<span></span><span></span></a></p> -->
				</div>
				<ul class="ls_list">
					<c:choose>
                    <c:when test="${!empty recoItems}">
						<c:forEach var ="data" items="${recoItems }">
							<li onclick="location.href='/licenseView.do?subjectCd=${data.subjectCd}'">
		                        <div class="tit_wrap">
			                        <p class="ls_tit">${data.name }</p>
									<p><a href="javascript:setInterest('${data.subjectCd}');" onclick="event.stopPropagation();" class="btn_mini bt_green">관심등록</a></p>
								</div>
							</li>
						</c:forEach>
					</c:when>
					
					<c:otherwise>
						<li class="nodata">신청할 수 있는 자격증이 없습니다.</li>
					</c:otherwise>
					</c:choose>
				</ul>

				<p class="btn mt25"><a href="/licenseSearch.do">관심 자격증 추가</a></p>

			</div>
				
		<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
		
		<!-- CONTENTS END -->
		<!-- 선택 시 노출 -->
		<div class="layer" id="sel_Pop">
			<div class="bg"></div>
			<div class="pop-layer" id="selPop">
				<div class="pop_cont text">
					<p class="mb20 c">
						관리
					</p>
					<p class="two_btn btn">
						<a id="btnAlert" href="javascript:toggleAlert(currentCd);" class="btn_mini bt_green">알람등록</a>
						<a href="javascript:deleteInterest(currentCd);" class="btn_mini bt_green">등록해제</a>
					</p>
				</div>
			</div>
		</div>
		
		<div class="layer" id="added_Pop">
			<div class="bg"></div>
			<div class="pop-layer" id="addedPop">
				<div class="pop_cont text">
					<p id="addedPop_message" class="mb20 c">등록 성공</p>
					<p class="btn">
						<a id="btnAlert" href="javascript:location.reload();" class="btn_mini bt_green">확인</a>
					</p>
				</div>
			</div>
		</div>
		
		<div id="scripts">
			<script>
var currentCd = '';
function openSettingDialog(cd, alertYn) {
	currentCd = cd
	
	setAlertBtn(cd, alertYn);
	layer_open('selPop', 'sel_Pop');
}

function setAlertBtn(cd, alertYn) {
	var target = $('#btnAlert')[0];
	if (alertYn == 'Y') {
		target.className = 'btn_mini bt_red';
		target.innerText = '알림 취소';
	} else {
		target.className = 'btn_mini bt_green';
		target.innerText = '알림 설정';
	}
}

function toggleAlert(cd) {
	$.ajax({
		url: '/license/alert.do',
		type: 'POST',
		data: {
			subjectCd: cd
		},
		success: function(data) {
			var target = $("#btnAlert" + cd);
			
			if (!data.success) {
				return;
			}
			
			location.reload();
		},
	});
}

function setInterest(cd) {
	$.ajax({
		url: '/license/sinterest.do',
		type: 'POST',
		data: {
			subjectCd: cd
		},
		success: function(data) {
			if (!data.success) {
				$("#addedPop_message").text(data.message);
			
				layer_open('addedPop', 'added_Pop');
				return;
			}
			
			$("#addedPop_message").text("관심 자격증 등록 완료");
			layer_open('addedPop', 'added_Pop');
		},
	});
}

function deleteInterest(cd) {
	$.ajax({
		url: '/license/sinterest.do',
		type: 'DELETE',
		dataType : "json",
		contentType: "application/json",
		data: JSON.stringify({
			subjectCd: cd
		}),
		success: function(data) {
			if (!data.success) {
				return;
			}
			
			location.reload();
		},
	});
}
			</script>
		</div>

</body>
</html>
