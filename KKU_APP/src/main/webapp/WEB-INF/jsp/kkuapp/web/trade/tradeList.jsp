<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
</head>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
			
<script>
$(document).on("click", "#schButton", function() {
	$("#pageIndex").val('1');
	$("#schFrm").submit();
});

function displayedAt(createdAt) {
	
	  const milliSeconds = new Date() - Date.parse(createdAt);
	  
	  const seconds = milliSeconds / 1000
	  if (seconds < 60) return document.write( "방금 전");
	  
	  const minutes = seconds / 60
	  if (minutes < 60) return document.write(Math.floor(minutes)+"분 전");
	  
	  const hours = minutes / 60
	  if (hours < 24) return document.write(Math.floor(hours)+"시간 전");
	  const days = hours / 24
	  if (days < 7) return document.write(Math.floor(days)+"일 전");
	  const weeks = days / 7

	  if (weeks < 5) return document.write(Math.floor(weeks)+"주 전");
	  const months = days / 30
	  if (months < 12) return document.write(Math.floor(months)+"개월 전");
	  const years = days / 365
	  return document.write(Math.floor(years)+"년 전");
};


var likeList = ${likeList }
	
function isIn(idx) {
	if(likeList.indexOf(idx) < 0)
		return 0;
	else
		return 1;
}
	
</script>
		</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="head_mg mb140">
			<div class="w_box no_line">
				<!-- 검색 -->
				<form name="schFrm" id="schFrm" method="get" autocomplete="off" action="/trade/tradeList.do">
					<input type="hidden" name="pageIndex" id="pageIndex" value="${boardVO.pageIndex}" />
				<div class="search">
					<p class="input_box one">
						<input name="searchKeyword" type="text" value="${boardVO.searchKeyword }" placeholder="검색어를 입력해주세요." ><a href="#" id="schButton">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
				</form>
				<div class="deal_wrap">
					<ul class="mp_list mydeal vers">
					
						<c:forEach var="trade" items="${tradeList }">
							<li onclick="location.href='/trade/trade.do?trdIdx=${trade.trdIdx }';">
								<p class="img">
									<c:if test="${trade.first != null}">									
										<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url('/upload/trade/${trade.first }')no-repeat 50% 50% / cover;">
									</c:if>
									<c:if test="${trade.first == null}">
										<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/eye-slash-solid.png')no-repeat 50% 50% / cover;">
								    </c:if>									
								</p>
								<div>
									<div>
										<p class="tit w90">${trade.trdTitle }</p>
										<p class="price">
										<fmt:formatNumber maxFractionDigits="3" value="${trade.trdPrice }" />
										원
											<c:if test="${trade.trdStatus == 2 }">
												<span class="ok_label">예약중</span>
											</c:if>
											<c:if test="${trade.trdStatus == 3 }">
												<span class="ok_label">거래완료</span>
											</c:if>
										</p>
									</div>
									<p class="bottom">
										<span>${trade.realNickname }</span>
										<span>
											<svg <c:if test="${fn:contains(likeList, trade.trdIdx)}">class="luv" </c:if> xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg>
											${trade.likeCnt }
										</span>
										<span>
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M256 32C114.6 32 .0272 125.1 .0272 240c0 49.63 21.35 94.98 56.97 130.7c-12.5 50.37-54.27 95.27-54.77 95.77c-2.25 2.25-2.875 5.734-1.5 8.734C1.979 478.2 4.75 480 8 480c66.25 0 115.1-31.76 140.6-51.39C181.2 440.9 217.6 448 256 448c141.4 0 255.1-93.13 255.1-208S397.4 32 256 32z"/></svg>
											0 <!-- 채팅연결개수로 변경 -->
										</span>
										<span> <script> displayedAt("${trade.trdWritedate}") </script>  </span>
									</p>
								</div>
							</li>
						</c:forEach>		

						
					</ul>
					<a href="/trade/tradeWrite.do" class="add_btn"></a>
				</div><!-- deal_wrap -->
				
				
			</div>
			
			
			<!-- 페이지 최대 5까지 노출 -->
			<p class="paging">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
			</p>
			
			</form>
				

			<%@include file="../_inc/bottom_menu.jsp" %>		
			<%@include file="../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->

	

</div>
<!-- //wrap -->

</body>
</html>
