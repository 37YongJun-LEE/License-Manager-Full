<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
</head>
<script>
$(document).on("click", "#schButton", function() {
	$("#pageIndex").val('1');
	$("#schFrm").submit();
});

function displayedAt(createdAt) {
		
	  const milliSeconds = new Date() - Date.parse(createdAt)
	  
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

	function linkPage(pageNo){
		location.href = "/board.do?pageNo="+pageNo;
	}		

</script>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->


	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="/main.do"><img src="/_img/_img/cont/navi_arrow.png"></a>
					<h2>분실물 게시판</h2>
				</div>
			</div>
			<div class="w_box no_line">
				<form name="schFrm" id="schFrm" method="get" autocomplete="off" action="/lost.do">
					<input type="hidden" name="pageIndex" id="pageIndex" value="${lostVO.pageIndex}" />
				<div class="search">
					<p class="input_box one">
						<input name="searchKeyword" type="text" value="${lostVO.searchKeyword }" placeholder="검색어를 입력해주세요." ><a href="#" id="schButton">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					</p>
				</div>
			</form>
				
				<div class="list_top">
					<p class="left sub_tab">
						<a href="lost.do" class="btn_mini state ${onOff.lost}">찾아가세요 </a> <!-- 해당 버튼에 클래스 on을 넣어주세요 -->
						<a href="find.do" class="btn_mini state ${onOff.find}">찾습니다</a> 					
					</p>
					<a href="/lostWrite.do" class="btn_mini bt_greenL">게시물 작성</a>
				</div>
				
				 
				<ul class="best_list basic">
				<c:choose>
				 <c:when test="${lostList ne null}">         
					<c:forEach var="lost" items="${lostList}">
						<li onclick="location.href='/lostView.do?lostIdx=${lost.lostIdx }'">
							<p class="img2">
									<c:if test="${lost.first != null}">									
											<img alt="분실물" src="/_img/_img/cont/best_bg.png" style="background: url(/upload/lost/${lost.first })no-repeat 50% 50% / cover;">
									</c:if>
									<c:if test="${lost.first == null}">
											<img alt="분실물" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/best_bg.png')no-repeat 50% 50% / cover;">
									  </c:if>	
								</p>
							<div>

							<div>
								<p class="tit"><c:if test="${lost.lostSelecter eq '분실물 찾습니다'}">[찾습니다] </c:if> 
								<c:if test="${lost.lostSelecter eq '분실물 찾아가세요'}">[습득] </c:if> ${lost.lostTitle }</p>
								<p class="con">${lost.lostContent }</p>
								<c:if test="${lost.lostStatus == 2 }">
									<span class="ok_label">해결완료</span>
								</c:if>
							</div>
							<p class="bottom">
								<span>${lost.usrNickname }</span>
								<span>
									${lost.lostLocation }
								</span>
								<span><script> displayedAt("${lost.lostWritedate}") </script> </span>
							</p>
						</div>

						</li>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<li class="nodata">등록된 게시글이 없습니다.</li>
				</c:otherwise>
					
					</c:choose>
				</ul>
<%-- 				<p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p> --%>

			</div>
				
			<%@include file="../_inc/bottom_menu.jsp" %>
			<%@include file="../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
</div>
<!-- //wrap -->

</body>
</html>