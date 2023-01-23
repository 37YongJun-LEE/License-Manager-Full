 <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<c:set var="page_num_depth_01" value="5"/>
<c:if test="${boardVO.bbsDiv eq 'notices'}"><c:set var="page_num_depth_02" value="1"/></c:if>
<c:if test="${boardVO.bbsDiv eq 'qna'}"><c:set var="page_num_depth_02" value="2"/></c:if>

<html lang="utf-8">
	<head>
		<%@include file="../_inc/tit.jsp" %>
		<script type="text/javascript">
			function chkCerti(regName,bbsIdx,bbsDiv,type){
				if("${orgSessionVo.orgNmKr}" == ""){
					location.href="/web/login.do";
				} else {
					if(type==1){
						if("${orgSessionVo.orgNmKr}"==regName){
							location.href="/web/support/boardView.do?bbsIdx="+bbsIdx+"&bbsDiv="+bbsDiv;
						} else {
							alert("접근 권한이 없습니다.");
						}
					} else {
						location.href="/web/support/qnaWrite.do?bbsDiv="+bbsDiv;
					}
					
				}
			}
			$(document).on("click", "#srchFrm", function() {
				$("#pageIndex").val(1);
				$("#schFrm").attr("action","<c:url value='/web/support/boardList.do'/>");
				$("#schFrm").submit();
			});
		</script>
	</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp" %>
		<%@include file="../_inc/smn05.jsp" %>
		
		<div class="cont_view">
		
			<!-- 리스트디자인 -->
			<div class="cont_top">
				<c:if test="${boardVO.bbsDiv eq 'notices'}"><h2>공지사항</h2></c:if>
				<c:if test="${boardVO.bbsDiv eq 'qna'}"><h2>Q&A</h2></c:if>
			    
			    <ol class="loca">
                   <li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
                   <li>고객센터</li>
						<c:if test="${boardVO.bbsDiv eq 'notices'}"><li>공지사항</li></c:if>
						<c:if test="${boardVO.bbsDiv eq 'qna'}"><li>Q&A</li></c:if>
                </ol>
			</div>
		  <form id="schFrm" method="get" autocomplete="off">
			<input type="hidden" id="pageIndex" name="pageIndex" value="${boardVO.pageIndex}"/>
			<input type="hidden" id="bbsDiv" name="bbsDiv" value="${boardVO.bbsDiv}"/>
			
			<div class="list_top">
                <p class="count">검색총건수 <span>${paginationInfo.totalRecordCount}</span>건</p>
	                <div class="bbs_search_bar">
	                    <p class="s_sel">
	                        <select name="searchCondition">
	                            <option value="bbsAll" <c:if test="${boardVO.searchCondition eq 'bbsAll'}">selected</c:if>>전체</option>
	                            <option value="bbsTitle" <c:if test="${boardVO.searchCondition eq 'bbsTitle'}">selected</c:if>>제목</option>
	                            <option value="bbsCont" <c:if test="${boardVO.searchCondition eq 'bbsCont'}">selected</c:if>>내용</option>
	                        </select>
	                    </p>
	
	                    <p class="word">
	                        <input type="text" style="display:none;" >
	                        <input type="text" placeholder="검색어를 입력해주세요" value="${boardVO.searchKeyword}" name="searchKeyword">
	                    </p>
	
	                    <p class="search_btn">
	                        <a href="javascript:void(0);" id="srchFrm"><img src="/_img/web/comn/search.png" alt="검색하기"></a>
	                    </p>
                </div>
                <p class="sel">
                    <select name="recordCountPerPage">
                        <option value="10" <c:if test="${boardVO.recordCountPerPage eq '10'}">selected</c:if>>10개씩 보기</option>
                        <option value="20" <c:if test="${boardVO.recordCountPerPage eq '20'}">selected</c:if>>20개씩 보기</option>
                        <option value="30" <c:if test="${boardVO.recordCountPerPage eq '30'}">selected</c:if>>30개씩 보기</option>
                    </select>
                </p>
            </div>			
			<table class="baselist">
				<colgroup>
					<col style="width:7%">
					<c:if test="${boardVO.bbsDiv eq 'qna'}"><col style="width:10%"></c:if>
					<col style="width:auto">
					<col style="width:8%">
					<col style="width:11%">
					<c:if test="${boardVO.bbsDiv eq 'qna'}"><col style="width:8%"></c:if>
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<c:if test="${boardVO.bbsDiv eq 'qna'}"><th>구분</th></c:if>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<c:if test="${boardVO.bbsDiv eq 'qna'}"><th>처리현황</th></c:if>
					</tr>
				</thead>
				<tbody>
					<!-- 중요공지 있을때 -->
					<c:if test="${boardVO.bbsDiv eq 'notices'}">
						<c:if test="${fn:length(resultImprtNotiList) > 0}">
							<c:forEach var="resultImprtNotiList" items="${resultImprtNotiList}">
								<tr class="att">
									<td><span class="ti-bookmark att"></span></td>
									<td class="l"><a href="/web/support/boardView.do?bbsIdx=${resultImprtNotiList.bbsIdx}&bbsDiv=${resultImprtNotiList.bbsDiv}" class="tit">${resultImprtNotiList.bbsTitle}</a>
									<c:if test="${resultImprtNotiList.regDate eq today }"><span class="new">NEW!</span></c:if>
									<c:if test="${resultImprtNotiList.fileUseYn eq 'Y' }"><span class="ti-clip file"></span></c:if>
									<td>${resultImprtNotiList.regName}</td>
									<td>${resultImprtNotiList.regDate}</td>
								</tr>	
							</c:forEach>	
						</c:if>
					</c:if>
					<c:choose>
						<c:when test="${fn:length(resultList) > 0 }">
							<c:forEach var="resultList" items="${resultList}" varStatus="status">
								<tr>
									<td>${paginationInfo.totalRecordCount - status.count+1 -((boardVO.pageIndex - 1) * boardVO.pageUnit)}</td>
									<c:if test="${boardVO.bbsDiv eq 'qna'}">
										<td>
											<c:if test="${resultList.qnaType eq 1}">인정기준</c:if>
											<c:if test="${resultList.qnaType eq 2}">기타</c:if>
										</td>
									</c:if>
									<td class="l">
										<c:if test="${boardVO.bbsDiv eq 'qna'}"><span class="ti-lock lock"></span></c:if>
										<c:if test="${boardVO.bbsDiv eq 'notices'}"><a href="/web/support/boardView.do?bbsIdx=${resultList.bbsIdx}&bbsDiv=${resultList.bbsDiv}" class="tit">${resultList.bbsTitle}</a></c:if>
										<c:if test="${boardVO.bbsDiv eq 'qna'}"><a href="javascript:chkCerti('${resultList.regName}',${resultList.bbsIdx},'${resultList.bbsDiv}',1);" class="tit">${resultList.bbsTitle}</a></c:if>
										<c:if test="${resultList.regDate eq today }"><span class="new">NEW!</span></c:if>
										<c:if test="${resultList.fileUseYn eq 'Y' }"><span class="ti-clip file"></span></c:if>
									</td>
									<td>${resultList.regName}</td>
									<td>${resultList.regDate}</td> <%-- ${resultList.cmtYn} --%>
									<c:if test="${boardVO.bbsDiv eq 'qna'}">
										<td>
											<c:if test="${resultList.cmtYn eq 'Y' }"><span class="state01">완료</span></c:if>
											<c:if test="${resultList.cmtYn eq 'N' }"><span class="state02">답변대기</span></c:if>
											
										</td>
									</c:if>
									
								</tr>				
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:if test="${boardVO.bbsDiv eq 'notices'}">
								<td colspan=4>검색 결과가 없습니다.</td>
							</c:if>
							<c:if test="${boardVO.bbsDiv eq 'qna'}">
								<td colspan=6>검색 결과가 없습니다.</td>
							</c:if>
						</c:otherwise>
					</c:choose>
					
				</tbody>			
			</table>
			<!-- 리스트디자인 끝 -->
        	<p class="pn">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
			</p>
			<p class="btn_area">
	 			<!-- <a href="write.html" class="l btn_list">목록</a> -->
				<c:if test="${boardVO.bbsDiv eq 'qna'}">
					<a href="javascript:chkCerti('-',-1,'${boardVO.bbsDiv}',2)" class="btn_submit">신규등록</a>
				</c:if>
	 			<!-- <a href="write.html" class="btn_del">삭제</a> -->
				<!-- <a href="javascript:void(0);" id="excelDown" class="btn_excel">EXCEL</a> -->
			</p>
	 	 </form>
		</div>
	</div>
	<%@include file="../_inc/footer.jsp" %>

</body>

</html>