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
function fnLinkPage(pageNo) {
	$("#pageIndex").val(pageNo);
	$("#schFrm").submit();
}
function fnSearch(){
	$("#pageIndex").val('1');
	$("#schFrm").submit();
}

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

	function linkPage(pageNo, subject){
		location.href = "/licenseBoard.do?subjectCd="+ subjectCd + "&pageNo="+pageNo;
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
			<!-- <div class="tab">
				<ul>
					<li><a href="board.do" class="on">자유게시판</a></li>
					<li><a href="themeboard_list.do">주제별 게시판</a></li>
					<!-- <li><a href="school_info.do">학교 정보</a></li> 
				</ul>
			</div>-->
			<div class="navi small">
				<div class="top_navi"><a href="/licenseView.do?subjectCd=${vo.subjectCd}"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>${sub.subjectName} 게시판</h2></div>
			</div>
			<div class="w_box no_line">
				<c:choose>
				<c:when test="${checkAuth eq 1}">
				
				<form name="schFrm" id="schFrm" method="post" action="<c:url value='/licenseBoard.do?subjectCd=${vo.subjectCd}'/>">
					<input type="hidden" name="pageIndex" id="pageIndex" value="${vo.pageIndex}" />
					<div class="search">
						<select name="searchCondition">
							<option value="All" selected="">전체</option>
							<option value="boardTitle" <c:if test="${vo.searchCondition == 'boardTitle'}">selected="selected"</c:if>>제목</option>
							<option value="boardContent" <c:if test="${vo.searchCondition == 'boardContent'}">selected="selected"</c:if>>내용</option>
							<option value="boardWriter" <c:if test="${vo.searchCondition == 'boardWriter'}">selected="selected"</c:if>>닉네임</option>
						</select>
						<p class="input_box">
							<input name="searchKeyword" value="${vo.searchKeyword}" type="text" placeholder="게시물 검색">
							<a href="javascript:fnSearch();" id="schButton"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
						</p>
					</div>
				</form>
				<div class="list_top">
					<p class="left sub_tab">
						
					</p>
					<a href="/licenseBoardWrite.do?subjectCd=${vo.subjectCd}" class="btn_mini bt_greenL">게시물 작성</a>
				</div>
				
				 
				<ul class="best_list basic">
				<c:choose>
				 <c:when test="${boardList ne null}">         
					<c:forEach var="result" items="${boardList}">
						<li onclick="location.href='licenseBoardView.do?boardIdx=${result.boardIdx}&subjectCd=${result.subjectCd}'">
							<div>
								<div>
									<p class="tit">${result.boardTitle }</p>
									<p class="con">${result.boardContent }</p>
								</div>
								<p class="bottom">
									<span>${result.boardWriter }</span>
									<span>
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="luv"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg>
										${result.boardLike}
									</span>
									<span>
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M256 32C114.6 32 .0272 125.1 .0272 240c0 49.63 21.35 94.98 56.97 130.7c-12.5 50.37-54.27 95.27-54.77 95.77c-2.25 2.25-2.875 5.734-1.5 8.734C1.979 478.2 4.75 480 8 480c66.25 0 115.1-31.76 140.6-51.39C181.2 440.9 217.6 448 256 448c141.4 0 255.1-93.13 255.1-208S397.4 32 256 32z"/></svg>
										${result.replyNum}
									</span>
									<span><script> displayedAt("${result.boardWritedate}") </script> </span>
									<span>조회수 ${result.boardViewnum }</span>
								</p>
							</div>
								<p class="img">
									<c:if test="${result.first != null}">									
											<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url(/upload/licenseBoard/${result.first })no-repeat 50% 50% / cover;">
									</c:if>
									<c:if test="${result.first == null}">
											<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/best_bg.png')no-repeat 50% 50% / cover;">
									  </c:if>
								</p>
						</li>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<li class="nodata">등록된 게시글이 없습니다.</li>
				</c:otherwise>
					
					</c:choose>
				</ul>
				<p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p>
				</c:when>
				<c:otherwise>
				<div style="padding:175px 15px">
					<li class="nodata">관심자격으로 등록되어있지 않습니다.</li>
				</div>
				</c:otherwise>
				</c:choose>
				

			</div>
				
			<%@include file="../_inc/bottom_menu.jsp" %>
			<%@include file="../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	
</div>
<!-- //wrap -->

</body>
</html>