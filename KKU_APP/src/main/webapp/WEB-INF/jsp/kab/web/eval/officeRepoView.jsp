<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="2" />

<html lang="utf-8">
<head>
	<%@include file="../_inc/tit.jsp"%>
	<script>
		$(function() {
			/* // 셀렉트박스 선택 시 바로 검색
			$(document).on("change", "#disType", function() {
				$("#schFrm").submit();
			}); */
			
			if($("#tab").val() == "1"){
				$("#submitBtn").css("display", "none");
				$("#disType").css("display", "");
				$("#tb1").css("margin-top", "1px");
			}else{
				$("#submitBtn").css("display", "");
				$("#disType").css("display", "none");
				$("#tb1").css("margin-top", "10px");
			}
			
		});
	</script>
</head>
	<div>
		<div class="pop_cont02" style="width:100%; height:100%;">
			
			<div class="popup_tit">
				<h2 class="pop_tit">인정관리</h2>
				<p class="cbtn"><a class="pop_close" href="#" onclick="document.location.href='javascript:window.close()'"><img src="/_img/adm/cont/pop_close.png" alt="닫기"></a></p>
			</div>
			<div class="cont_view">
				<!-- 리스트디자인 -->
				<div class="cont_top">
					<h2>평가 관리</h2>
					<c:choose>
						<c:when test="${empty resultVO }">
							<a href="javascript:alert('아직 평가계획공문이 저장되지 않았습니다.');" class="btn_list_down" style="margin-bottom: 10px;">평가계획공문</a>
						</c:when>
						<c:otherwise>
							<c:url value="/fileDownload.do" var="fileUrl">
								<c:param name="srvFile" value="${resultVO.filSvrName}" />
								<c:param name="usrFile" value="${resultVO.filUsrName}" />
								<c:param name="folder" value="${resultVO.filPath}" />
							</c:url>
							<a href="${fileUrl}" class="btn_list_down" style="margin-bottom: 10px;">평가계획공문</a>
						</c:otherwise>
					</c:choose>
					<ol class="loca">
						<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
						<li>인정관리</li>
						<li>평가관리</li>
						<li>발견사항</li>
					</ol>
			</div>
			
			<ul class="tab">
				<li <c:if test="${tab eq 1 }">class="on"</c:if>><a href="/web/eval/discoveryList.do?plnIdx=${plnIdx}&evalDiv=${evalDiv}&tab=1">발견사항목록</a></li>
				<li <c:if test="${tab eq 2 }">class="on"</c:if>><a href="/web/eval/discoveryList.do?plnIdx=${plnIdx}&evalDiv=${evalDiv}&tab=2">부적합사항</a></li>
				<li <c:if test="${tab eq 3 }">class="on"</c:if>><a href="/web/eval/discoveryList.do?plnIdx=${plnIdx}&evalDiv=${evalDiv}&tab=3">우려사항</a></li>
				<li <c:if test="${tab eq 4 }">class="on"</c:if>><a href="/web/eval/discoveryList.do?plnIdx=${plnIdx}&evalDiv=${evalDiv}&tab=4">권고사항</a></li>
				<c:if test="${evalDiv eq 'O' }">
					<li <c:if test="${tab eq 6 }">class="on"</c:if>><a href="/web/eval/officeRepo.do?plnIdx=${plnIdx}&evalDiv=${evalDiv}&tab=6">입회평가업체선정현황</a></li>
				</c:if>
				<c:if test="${!empty reportChk}">
					<li <c:if test="${tab eq 5 }">class="on"</c:if>><a href="/web/eval/discoveryList.do?plnIdx=${plnIdx}&evalDiv=${evalDiv}&tab=5&mode=view">평가요약보고서</a></li>
				</c:if>
			</ul>
	 <form name="schFrm" id="schFrm" method="get" autocomplete="off" action="<c:url value='/web/eval/discoveryList.do?'/>">
			<input type="hidden" name="plnIdx" id="plnIdx" value="${planMasterVO.plnIdx}">
			<input type="hidden" name="pageIndex" id="pageIndex" value="${discoveryVO.pageIndex}" />
			<input type="hidden" name="evalDiv" id="evalDiv" value="${evalDiv}" />
			<input type="hidden" name="orgDiv" id="orgDiv" value="${orgDiv}" />
			<input type="hidden" name="tab" id="tab" value="${tab}" />
			
			
			<%-- <div class="list_top">
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
            </div>		 --%>	
			<table class="table02" summary="평가사 자료 등록">
							<caption>평가사 자료 등록</caption>
							<colgroup>
								<col width="20%">
								<col width="80%">
					
							</colgroup>
							
							<tbody>
								<tr>
									<th>제목</th>
									<td>${resultMap.lbyTitle}</td>
								</tr>
								
								<tr>
									<th>설명</th>
									<td>${resultMap.lbyContents}</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td class="file_list">
																				
										<c:choose>
											<c:when test="${resultMap.srvFile eq ''}">
												첨부된 파일이 없습니다.
											</c:when>
											<c:otherwise>
												<c:if test="${!empty resultMap.lbyIdx && !empty resultMap.usrFile}">
													<c:url value="/fileDownload.do" var="fileUrl">
														<c:param name="srvFile" value="${resultMap.srvFile }" />
														<c:param name="usrFile" value="${fn:split(resultMap.usrFile,'|')[0]}" />
														<c:param name="folder" value="performLibrary" />
													</c:url>
												
													<input type="hidden" id="fileDel" name="fileDel" value="N" />
													<p id="fileLink" style="display:block; margin-top:7px; margin-left:2px;">
														<a href="${fileUrl}" class="name" >${fn:split(resultMap.usrFile,'|')[0]}</a>
														<!-- <button class="sm_del" onclick="fnDelFile(); return false;" ></button> -->
													</p>
												</c:if>	
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</tbody>
						</table>
					
			<!-- 리스트디자인 끝 -->
        	<%-- <p class="pn">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
			</p> --%>
			<p class="btn_area">
				<a href="/web/eval/officeRepo.do?evalDiv=O&tab=${tab}&orgDiv=${orgDiv}&plnIdx=${planMasterVO.plnIdx}&leader=${leader }" class="l btn_list">목록</a>	
			</p>
			</form>
		</div>
	</div>
</div>
		
</html>