<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
<script>
function fnLinkPage(pageNo) {
	$("#pageIndex").val(pageNo);
	$("#schFrm").submit();
}
function fnSearch(){
	$("#pageIndex").val('1');
	$("#schFrm").submit();
}
</script>
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
			<!-- <div class="tab">
				<ul>
					<li><a href="board.do">자유게시판</a></li>
					<li><a href="themeboard_list.do">주제별 게시판</a></li>
					<li><a href="school_info.do" class="on">학교 정보</a></li>
				</ul>
			</div> -->
			
			<div class="navi small">
				<div class="top_navi flex_top_navi">
					<div class="left">
						<a href="/main.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>${usrMajor} 공지사항</h2>
					</div>
				</div>
			</div>
			<div class="w_box no_line">
			<form name="schFrm" id="schFrm" method="get" autocomplete="off" action="<c:url value='/majorNotice.do'/>">
				<input type="hidden" name="pageIndex" id="pageIndex" value="${vo.pageIndex}" />
				<div class="search">
					<select name="searchCondition" id="searchCondition">
						<option value=""<c:if test="${vo.searchCondition eq ''}">selected</c:if>>전체</option>
						<option value="title"<c:if test="${vo.searchCondition eq 'title' }">selected</c:if>>제목</option>
						<option value="contents"<c:if test="${vo.searchCondition eq 'contents' }">selected</c:if>>내용</option>
						<option value="writer"<c:if test="${vo.searchCondition eq 'writer' }">selected</c:if>>작성자</option>
					</select>
					<p class="input_box">
						<input type="text" name="searchKeyword" id="searchKeyword" placeholder="게시물 검색" value="${vo.searchKeyword }" onkeypress="if(event.keyCode==13){fnSearch();}">
						<a href="javascript:fnSearch();"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
					
					</p>
					
				</div>
				
				<div class="list_top">
				<p style="font-size:15px;">최근 업데이트일 ${update}</p>
					<div class="right">
						<!--<c:if test="${usrRank == '2'}">
							<div class="question right">
								<a href="#none" class="quest_btn mr5">?</a>
								<div class="quest_cont" style="width:165px">
									<span class="shape">관리자 변경</span>
									<p>관리자 변경 사유 발생 시 대표 관리자 계정을 통해 관리자 변경 가능</p>
								</div>
							</div>
						<a href="#" class="btn_mini bt_green">관리자 변경</a>
						</c:if> 
						<c:if test="${usrRank == '2' || '3'}">
						<a href="majorNotice_write.do?boardIdx=${majorNotice.boardIdx}" class="btn_mini bt_greenL">게시물 작성</a>
						</c:if>-->
					</div>
				</div>
				<ul class="best_list basic">
					<c:forEach var="majorNotice" items="${majorNoticeList}">
					<li onclick="location.href='majorNotice_view.do?noticeIdx=${majorNotice.mnoticeIdx}'">
						<div>
							<div>
								<p class="tit">${majorNotice.mnoticeTitle}</p>
							</div>
							<p class="bottom">
								<span>${majorNotice.mnoticeName}</span>
								<span>${majorNotice.mnoticeDate}</span>
								<span>조회수  ${majorNotice.mnoticeViewcnt}</span>
							</p>
						</div>
						<!-- <p class="img">
							<c:if test="${majorNotice.first != null}">
								<img alt="학과 공지" src="/_img/_img/cont/best_bg.png" style="background: url(/upload/board/${majorNotice.first })no-repeat 50% 50%/cover;">
							</c:if>
						</p> -->
					</li>
					</c:forEach>
					<!-- <li class="nodata">등록된 게시글이 없습니다.</li> -->
				</ul>
				<p class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p>
				<!-- 페이지 최대 5까지 노출  
				<p class="paging">
					<a href="#" class="prev end">처음으로</a>
					<a href="#" class="prev">이전</a>
					<a href="#" class="on">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#" class="next">다음</a>
					<a href="#" class="next end">마지막으로</a>
				</p>-->
				<!-- 
				<a href="majorNotice_crawler.do?noticeCategory=산업디자인학과" >(산업디자인학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=실내디자인학과" >(실내디자인학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=패션디자인학과" >(패션디자인학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=시각영상디자인학과" >(시각영상디자인학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=미디어콘텐츠학과" >(미디어콘텐츠학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=조형예술학과" >(조형예술학과 불러오기)<br></a>
				<br>
				<a href="majorNotice_crawler.do?noticeCategory=경영학과" >(경영학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=경제통상학과" >(경제통상학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=경찰학과" >(경찰학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=소방방재융합학과" >(소방방재융합학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=문헌정보학과" >(문헌정보학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=유아교육과" >(유아교육과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=사회복지학과" >(사회복지학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=신문방송학과" >(신문방송학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=동화한국어문화학과" >(동화한국어문화학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=영어문화학과" >(영어문화학과 불러오기)<br></a>
				<br>
				<a href="majorNotice_crawler.do?noticeCategory=메카트로닉스공학과" >(메카트로닉스공학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=컴퓨터공학과" >(컴퓨터공학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=바이오메디컬공학과" >(바이오메디컬공학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=녹색기술융합학과" >(녹색기술융합학과 불러오기)<br></a>
				<br>
				<a href="majorNotice_crawler.do?noticeCategory=간호학과" >(간호학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=바이오의약학과" >(바이오의약학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=생명공학과" >(생명공학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=식품(영양)학과" >(식품(영양)학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=뷰티화장품학과" >(뷰티화장품학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=스포츠건강학과" >(스포츠건강학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=골프산업학과" >(골프산업학과 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=의과대학" >(의과대학 불러오기)<br></a>
				<br>
				<a href="majorNotice_crawler.do?noticeCategory=반려동물융합전공" >(반려동물융합전공 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=융합치유전공" >(융합치유전공 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=빅데이터융합전공" >(빅데이터융합전공 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=도시디자인융합전공" >(도시디자인융합전공 불러오기)<br></a>
				<a href="majorNotice_crawler.do?noticeCategory=자기설계전공" >(자기설계전공 불러오기)<br></a>
				<p>힐링바이오대학(반려동물융합전공,융합치유전공,빅데이터융합전공,도시디자인융합전공,자기설계전공)은 하나의 사이트로 운영</p>
				 -->
				</form>
			</div>
		
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->
	


</div>
<!-- //wrap -->

</body>
</html>


<script>
//안내 팝업 띄우기
$(document).ready(function() {  
	$(".question .quest_btn").click(function(){    
		$(this).next(".quest_cont").fadeToggle();

	});

	$('html').click(function(e){
	if($(e.target).parents(".question").length < 1){
    	$(".quest_cont").fadeOut();
		}
	});

});
</script>