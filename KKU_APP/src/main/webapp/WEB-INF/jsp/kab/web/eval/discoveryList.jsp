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
			<table class="table02 c_all baselist" summary="발견사항 목록">
				<caption>발견사항 목록</caption>
				<colgroup>
					<col width="6%">
					<col width="8%">
					<col width="10%">
					<col width="*">
					<col width="13%">
					<%-- <col width="13%"> --%>
					<c:if test="${!empty resultRepInfo.repUserDate }">
						<col width="13%">
					</c:if>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">no</th>
						<th scope="col">구분</th>
						<th scope="col">발행번호</th>
						<th scope="col">내용요약</th>
						<th scope="col">조치기한</th>
						<!-- <th scope="col">상태</th> -->
						<c:if test="${!empty resultRepInfo.repUserDate }">
							<th scope="col">시정조치 상태</th>
						</c:if>
					</tr>
				</thead>
	
				<!-- 리스트 10개씩 노출되게 해주세요 -->
				<tbody>
					<c:choose>
						<c:when test="${fn:length(resultList) > 0}">
							<c:forEach var="resultInfo" items="${resultList }" varStatus="status">
								<c:set var="tab" value="1"/>
								<c:choose>
					 				<c:when test="${resultInfo.disType eq 'U'}">
					 					<c:set var="tab" value="2"/>
									</c:when>
									<c:when test="${resultInfo.disType eq 'W'}">
										<c:set var="tab" value="3"/>
									</c:when>
									<c:when test="${resultInfo.disType eq 'R'}">
										<c:set var="tab" value="4"/>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${tab eq '4' }">
										<tr>									
									</c:when>
									<c:otherwise>
										<tr style="cursor: pointer;" onclick="location.href='/web/eval/discoveryList.do?evalDiv=${evalDiv}&tab=${tab}&orgDiv=${orgDiv}&plnIdx=${planMasterVO.plnIdx}&disIdx=${resultInfo.disIdx}&mode=view'">		
									</c:otherwise>
								</c:choose>
								
									<td>${paginationInfo.totalRecordCount - (((discoveryVO.pageIndex) - 1) * discoveryVO.pageUnit) - status.count + 1}</td>
									<td>
										<c:choose>
								 			<c:when test="${resultInfo.disType eq 'U'}">
								 				부적합
											</c:when>
											<c:when test="${resultInfo.disType eq 'W'}">
												우려
											</c:when>
											<c:when test="${resultInfo.disType eq 'R'}">
												권고
											</c:when>
										</c:choose>
									</td>
									<td>${resultInfo.disNo}</td>
									<td>
										<span style="overflow:hidden; display:-webkit-box; -webkit-line-clamp:1; -webkit-box-orient:vertical; word-wrap:break-word; text-overflow:ellipsis;">
												${resultInfo.disSummary}										
										</span>
									</td>
									<td>
										<%-- <c:set var="chk" value="1"/>
										<c:forEach var="dis_act_type" items="${dis_act_type}" varStatus="status">
											<c:choose>
												<c:when test="${tab eq '4'}">
														<c:if test="${chk eq 1 }">
															<c:set var="chk" value="2"/>
															-
														</c:if>
												</c:when>
												<c:otherwise>
													<c:if test="${dis_act_type.cdVal2 eq resultInfo.disActType}">
														 ${fn:replace(dis_act_type.cdName2, '및 90일 내 조치 완료', '')}
													</c:if>
												</c:otherwise>
											</c:choose>
											
										</c:forEach> --%>
										<c:if test="${resultInfo.disPlanDate1 eq '' }">${resultInfo.disPlanDate3}</c:if>
										<c:if test="${resultInfo.disPlanDate3 eq '' }">${resultInfo.disPlanDate1}</c:if>
												
									</td>
									<%-- <td>
										<c:choose>
											<c:when test="${resultInfo.disCbState eq '' }">
												-
											</c:when>
											<c:otherwise>
												<c:forEach var="item" items="${finding_stat}">
													<c:if test="${resultInfo.disCbState eq item.cdVal2}">${item.cdName2}</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose> 
									</td> --%>
									<c:if test="${!empty resultRepInfo.repUserDate }">
										<td>
											<%-- <c:choose>
									 			<c:when test="${!empty resultInfo.disConfRstCd}">
													<c:forEach var="dis_conf_rst_cd" items="${dis_conf_rst_cd}" varStatus="status">
														<c:if test="${dis_conf_rst_cd.cdVal2 eq resultInfo.disConfRstCd}">
															<c:choose>
									 							<c:when test="${resultInfo.disConfRstCd eq 'C4'}">
									 								${dis_conf_rst_cd.cdName2}(${resultInfo.disConfRstDt})
									 							</c:when>
									 							<c:otherwise>
									 								${dis_conf_rst_cd.cdName2}
									 							</c:otherwise>
									 						</c:choose>
														</c:if> 
													</c:forEach>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose> --%>
										
											<c:if test="${resultInfo.disType ne 'R' and resultInfo.disCbState ne ' '}">
												<c:choose>
													<c:when test="${resultInfo.disConfRstCd eq 'C2'}">완료</c:when>
													<c:otherwise>조치중</c:otherwise>
												</c:choose>
											</c:if>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${!empty resultRepInfo.repUserDate }"><tr class="no_cont"><!-- 목록이 없는 경우 --><td colspan="6">발견사항 정보가 없습니다.</td></tr></c:when>
								<c:otherwise><tr class="no_cont"><!-- 목록이 없는 경우 --><td colspan="5">발견사항 정보가 없습니다.</td></tr></c:otherwise>
							</c:choose>
								
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<p class="check_legend">
				<b>분류</b> : C=적합, N=부적합(시정요구/인정정지/인정취소), R=권고사항, PD=보류, NA=해당없음
			</p>
			<p class="pn">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
			</p>
		<%-- 	<p class="btn_area" style="display: none;" id="submitBtn">
				<a href="/kabadm/perform/performNote.do?evalDiv=${evalDiv}&tab=${tab}&orgDiv=${orgDiv}&plnIdx=${planMasterVO.plnIdx}&disIdx=${resultInfo.disIdx}&mode=view" class="btn_submit">등록</a>
			</p> --%>
			</form>
			
		</div>
	</div>
</div>
		
</html>