<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../_inc/title.jsp" %>
<style>
.w_box.top {
    padding: 0px 0px 10px;
}
.bbs_write w_box top no_line {
    -ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}
.bbs_write w_box top no_line::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}

</style>
</head>
<script>
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
			<div class="navi small">
				<div class="top_navi"><a href="/licenseMain.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>${licenseSub.subjectName}</h2></div>
			</div>
			
			<div class="w_box no_line">
				<div class="top_tit">
					<p class="tit" style="color:#333;">자격증 정보</p>
				</div>
				<div class="bbs_write w_box top no_line">
					<form name="frm" id="frm" autocomplete="off" method="post" enctype	="multipart/form-data">
						<p class="path">
						<strong>자격구분명:</strong> ${licenseSub.qualName}</br>
						<strong>계열명:</strong> ${licenseSub.seriesName}</br>
						<strong>직무분야명:</strong> ${licenseSub.jobfieldName}</br>
						<strong>종직무분야명:</strong> ${licenseSub.mjobfieldName}</br>
						</p>
					</form>
				</div>
				<div class="top_tit">
					<p class="tit" style="color:#333;">응시자격</p>
				</div>
				<div class="bbs_write w_box top no_line" style="overflow:auto; height:auto;max-height:165px;border: 1px solid #fff;border-radius: 10px; ">
					<form name="frm" id="frm" autocomplete="off" method="post" enctype	="multipart/form-data">
						<p class="path">
						<c:forEach var="result" items="${licenseQual}">
							• ${result.emqualDescription}</br>
						</c:forEach> 
						</p>
					</form>
				</div>
				<div class="top_tit ls">
						<p class="tit">자격증 시험 일정</p>
						<c:if test="${!empty licenseDate}">
							<p class="more"><a href="/licenseDate.do?subjectCd=${licenseSub.subjectCd}">더보기<span></span><span></span></a></p>
						</c:if>
					</div>
					<c:choose>
					<c:when test="${!empty licenseDate}">
					<ul class="ls_list bg">
                        <c:forEach var="date" items="${licenseDate}">
                            <li>
                                <c:choose>
	                                <c:when test="${date.displayW ne 0 and date.displayP ne 0}">
		                                <div class="list_wrap">
		                                    <div>
		                                        <p class="ls_con">${date.description} 필기</p>
		                                        <p class="ls_txt">접수기간 : ${date.wtestAplcStartdt}~${date.wtestAplcEnddt}</p>
		                                        
		                                        <p class="ls_txt">시험날짜 : ${date.wtestStartdt }~${date.wtestEnddt }</p>
		                                    </div>
		                                    <c:choose>
		                                    <c:when test="${date.waplcEnd ne 0 }">
		                                    <a href="#" class="btn_mini bt_green">접수중</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <a href="#" class="btn_mini bt_green" style="background: #969696;color: #fff;border: 1px solid #9f9e9e;">접수마감</a>
		                                    </c:otherwise>
		                                    </c:choose>
		                                </div>
		                                <div class="list_wrap dashed">
		                                    <div>
		                                        <p class="ls_con">${date.description} 실기</p>
		                                        <p class="ls_txt">접수기간 : ${date.ptestAplcStartdt}~${date.ptestAplcEnddt}</p>
		                                        
		                                        <p class="ls_txt">시험날짜 : ${date.ptestStartdt }~${date.ptestEnddt }</p>
		                                    </div>
		                                   <c:choose>
		                                    <c:when test="${date.paplcEnd ne 0 }">
		                                    <a href="#" class="btn_mini bt_green">접수중</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <a href="#" class="btn_mini bt_green" style="background: #969696;color: #fff;border: 1px solid #9f9e9e;">접수마감</a>
		                                    </c:otherwise>
		                                    </c:choose>
		                                </div>
	                                </c:when>
	                                <c:when test="${date.displayW ne 0 and date.displayP eq 0}">
	                                	<div class="list_wrap">
		                                    <div>
		                                        <p class="ls_con">${date.description} 필기</p>
		                                        <p class="ls_txt">접수기간 : ${date.wtestAplcStartdt}~${date.wtestAplcEnddt}</p>
		                                        
		                                        <p class="ls_txt">시험날짜 : ${date.wtestStartdt }~${date.wtestEnddt }</p>
		                                    </div>
		                                    <c:choose>
		                                    <c:when test="${date.waplcEnd ne 0 }">
		                                    <a href="#" class="btn_mini bt_green">접수중</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <a href="#" class="btn_mini bt_green" style="background: #969696;color: #fff;border: 1px solid #9f9e9e;">접수마감</a>
		                                    </c:otherwise>
		                                    </c:choose>
		                                </div>
	                                </c:when>
	                                <c:otherwise>
		                                <div class="list_wrap">
		                                    <div>
		                                        <p class="ls_con">${date.description} 실기</p>
		                                        <p class="ls_txt">접수기간 : ${date.ptestAplcStartdt}~${date.ptestAplcEnddt}</p>
		                                        
		                                        <p class="ls_txt">시험날짜 : ${date.ptestStartdt }~${date.ptestEnddt }</p>
		                                    </div>
		                                    <c:choose>
		                                    <c:when test="${date.paplcEnd ne 0 }">
		                                    <a href="#" class="btn_mini bt_green">접수중</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    <a href="#" class="btn_mini bt_green" style="background: #969696;color: #fff;border: 1px solid #9f9e9e;">접수마감</a>
		                                    </c:otherwise>
		                                    </c:choose>
		                                </div>
	                                </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
                        
					</ul>
					</c:when>
						<c:otherwise>
						<ul class="ls_list">
								<li class="nodata">이번 연도 남은 시험 일정이 없습니다.</li> 
						</ul>
						</c:otherwise>
						</c:choose>
				
					<div class="top_tit ls">
						<p class="tit">추천 자격증</p>
						<c:if test="${licenseInterest.recSubjectNameOne ne null}">
							<p class="more"><a href="/licenseRecommend.do?subjectCd=${licenseSub.subjectCd}">더보기<span></span><span></span></a></p>
						</c:if>
					</div>
					<ul class="ls_list">
					
						<c:choose>
						<c:when test="${licenseInterest.recSubjectNameOne ne null}">
							<c:forEach var="interest" items="${licenseInterestSub}">
								<li onclick="location.href='/licenseView.do?subjectCd=${interest.subjectCd}'">						
									<div class="list_wrap">
										<p class="ls_tit mb0">${interest.subjectName}</p>
										<p>
										<c:choose>
											<c:when test="${interest.cnt ne '0'}">
												<a class="btn_mini bt_green" style="background: #969696;color: #fff;border: 1px solid #9f9e9e;">관심등록됨</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:setInterest('${interest.subjectCd}');" onclick="event.stopPropagation();" class="btn_mini bt_green">관심등록</a>
											</c:otherwise>
										</c:choose>
										</p>
									</div>
								</li>
							</c:forEach>
						</c:when>
							<c:otherwise>
								<li class="nodata">등록된 추천자격이 없습니다.</li> 
							</c:otherwise>
						</c:choose>
					</ul>
				
				
				<div class="top_tit ls">
					<p class="tit"> ${licenseSub.subjectName} 기출문제 자료실</p>
					<c:if test="${!empty flist}">
					<p class="more"><a href="/licenseFileBoard.do?subjectCd=${licenseSub.subjectCd}">더보기<span></span><span></span></a></p>
					</c:if>
				</div>
				<ul class="best_list basic">
					<c:choose>
					<c:when test="${!empty flist}">
						<c:forEach var="file" items="${flist}" >
							<li onclick="location.href='/licenseFileView.do?quesIdx=${file.quesIdx}'">
								<div>
									<div>
										<p class="tit">${file.quesTitle}</p>
										<p class="bottom">등록일 ${file.queRegdt}</p>
									</div>
									
								</div>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li class="nodata">등록된 기출문제가 없습니다.</li>
					</c:otherwise>
				</c:choose>
				</ul>		
				
				
				<div class="top_tit ls">
					<p class="tit">${licenseSub.subjectName} 게시판</p>
					<p class="more"><a href="/licenseBoard.do?subjectCd=${vo.subjectCd}">더보기<span></span><span></span></a></p>
					
				</div>
				<ul class="best_list basic">
					<c:choose>
					<c:when test="${!empty boardList}">
					<c:forEach var="result" items="${boardList}" >
							<li onclick="location.href='/licenseBoardView.do?boardIdx=${result.boardIdx}&subjectCd=${result.subjectCd}'">
								<div>
								<div>
										<p class="tit">${result.boardTitle }</p>
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
							<li class="nodata">등록된 게시물이 없습니다.</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			</div>
				
		<%@include file="../_inc/bottom_menu.jsp" %>
		<%@include file="../_inc/footer.jsp" %>
	<!-- CONTENTS END -->
	<div class="layer" id="sel_Pop">
			<div class="bg"></div>
			<div class="pop-layer" id="selPop">
				<div class="pop_cont text">
					<p class="mb20 c">
						관심 자격증 등록 완료 
					</p>
					<p class="btn">
						<a href="#" onClick="top.location='javascript:location.reload()'" class="cbtn">확인</a>
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
				return;
			}
			
			layer_open('selPop', 'sel_Pop');
		},
	});
}
			</script>
		</div>

</body>
</html>