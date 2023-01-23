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
				<div class="top_navi"><a href="/licenseMain.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>관심 자격증 추가</h2></div>
			</div>
			<div class="w_box no_line">
				<form id="srcFrm" name="srcFrm" action="/licenseSearch" method="GET" autocomplete="off"
				<input type="hidden" name="pageIndex" id="pageIndex" value="${licenseVO.pageIndex}" />
				<div class="search">
					<select name="searchCondition">
						<option value="All" <c:if test="${licenseVO.searchCondition eq ''}">selected</c:if>>전체</option>
						<option value="licenseTitle" <c:if test="${licenseVO.searchCondition eq 'licenseTitle'}">selected</c:if>>이름</option>
					</select>
					<p class="input_box">
						<input type="text" name="searchKeyword" value="${licenseVO.searchKeyword }">
						<a href="javascript:;" onclick="$('#srcFrm').submit();" id="schButton"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
			</form>
				<ul class="ls_list">
					<c:choose>
                    <c:when test="${!empty list}">
                    <c:forEach var="data" items="${list}">
                    <a href="/licenseView.do?subjectCd=${data.subjectCd}">
	                    <li>
	                        <p class="ls_tit">${data.name }</p>
	                		<div class="list_wrap">
								<div>
									<c:choose>
	                        		<c:when test="${data.displayW }">
	                                <p class="ls_con">${data.description} 필기</p>
									<p class="ls_txt">접수기간 : ${data.wtestAplcStartdt}~${data.wtestAplcEnddt}</p>
									<p class="ls_txt">시험날짜 : ${data.wtestEnddt }</p>
									</c:when>
									
									<c:otherwise>
									<p class="ls_con">${data.description} 실기</p>
									
	                                <c:choose>
									<c:when test="${data.passed == 0 }">
									<p class="ls_txt">접수기간 : ${data.ptestAplcStartdt}~${data.ptestAplcEnddt}</p>
									<p class="ls_txt">시험날짜 : ${data.ptestEnddt }</p>
									</c:when>
									
									<c:otherwise>
									<p class="ls_txt">시험일정이 없습니다.</p>
									</c:otherwise>
									</c:choose>
									
									</c:otherwise>
									</c:choose>
								</div>
								<p><a href="javascript:setInterest('${data.subjectCd}');" class="btn_mini bt_green">선택</a></p>
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
			</div>
				
		<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
		<!-- CONTENTS END -->
		<!-- 선택 시 노출 -->
		<div class="layer" id="sel_Pop">
			<div class="bg"></div>
			<div class="pop-layer" id="selPop">
				<div class="pop_cont text">
					<p id="selPop_message" class="mb20 c">관심 자격증 등록 완료 </p>
					<p class="btn">
						<a href="#" class="cbtn">확인</a>
					</p>
				</div>
			</div>
		</div>
		
		<div id="scripts">
			<script>		
function setInterest(cd) {
	$.ajax({
		url: '/license/sinterest.do',
		type: 'POST',
		data: {
			subjectCd: cd
		},
		success: function(data) {
			if (!data.success) {
				$("#selPop_message").text(data.message);
				
				layer_open('selPop', 'sel_Pop');
				return;
			}
			
			$("#selPop_message").text("관심 자격증 등록 완료");
			layer_open('selPop', 'sel_Pop');
		},
	});
}
			</script>
		</div>
</body>
</html>
