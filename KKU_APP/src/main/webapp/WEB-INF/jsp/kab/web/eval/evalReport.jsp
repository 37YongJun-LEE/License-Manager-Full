<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("newLineChar", "&lt;br/&gt;"); %>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="2" />

<html lang="utf-8">
<head>
<%@include file="../_inc/tit.jsp"%>
<script>
function fnSubmit(){
	if("${resultInfo.repUserDate}"==""){
		$('#frm').attr("action","/web/eval/reportConfirm.do?plnIdx=${plnIdx}&evalDiv=${evalDiv}&tab=5&mode=view");
		$('#frm').submit();	
	} else {
		alert("이미 확인완료되었습니다.");
	}
}	
function openerRefresh(){
	opener.document.location.reload();
}
$(function(){
	
	
});

</script>
</head>

<body onload="javascript:openerRefresh();">
	<div id="wrap">
		<div class="popup_tit">
			<h2 class="pop_tit">인정관리</h2>
			<p class="cbtn"><a class="pop_close" href="#" onclick="document.location.href='javascript:window.close()'"><img src="/_img/adm/cont/pop_close.png" alt="닫기"></a></p>
		</div>

		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
				<h2>평가 관리</h2>
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
		
			<input type="hidden" id="disType" name="disType" value="W"/>
			<input type="hidden" id="disState" name="disState" value="${resultMap.disState}"/>
			<input type="hidden" id="disIdx" name="disIdx" value="${discoveryVO.disIdx}"/>
			<input type="hidden" id="plnIdx" name="plnIdx" value="${planMasterVO.plnIdx}"/>
			<input type="hidden" name="pageIndex" id="pageIndex" value="${discoveryVO.pageIndex}" />
			<input type="hidden" name="evalDiv" id="evalDiv" value="${evalDiv}" />
			<input type="hidden" name="orgDiv" id="orgDiv" value="${orgDiv}" />
			<input type="hidden" name="tab" id="tab" value="${tab}" />
	<form name="frm" id="frm" autocomplete="off" method="post">
		<table class="table02" summary="인증기관 정보">
						<caption>인증기관 정보</caption>
						<colgroup><col width="12%"><col width="12%"><col width="26%"><col width="12%"><col width="38%"></colgroup>
						<tbody>
							<tr>
								<th scope="row">인증기관</th>
								<td colspan="4">${companyInfo.orgNmKr} [${companyInfo.orgNmAlias}]</td>
							</tr>
							<tr>
								<th scope="row">소재지</th>
								<td colspan="4">
									<c:forEach var="item" items="${resultLocList}">
										<c:if test="${companySchemeVO.locIdx eq item.locIdx}">${item.locNm} (${fn:replace(item.adrKr, '|', ' ')})</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr scope="row">
								<th scope="row">평가범위</th>
								<td colspan="4">
									<table class="intable" summary="평가범위 내용" style="width:100%">
											<caption>평가범위 내용</caption>
											<colgroup>
												<col width="14%">
												<col width="*">
												<col width="12%">
											</colgroup>
											<tr>
												<th scope="col">인정스킴(약자)</th>
												<th scope="col">분류</th>
												<th scope="col">평가종류</th>
											<c:choose>
												<c:when test="${fn:length(resultSchemeList) > 0 }">
													<c:forEach var="item" items="${resultSchemeList }">
														<tr>
															<td style="text-align: center;">${item.schEnPjt}</td>
															<td style="text-align: left;">
																${item.schSchemeValue}</td>
															<td style="text-align: center;">${item.schRan}</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td style="text-align: center;" colspan="3">
															등록(검색)된 평가범위가 없습니다.
														</td>
													</tr>
												</c:otherwise>
											</c:choose>
									</table>
								</td>
							</tr>
							<tr>
								<th scope="row">평가단계</th>
								<td colspan="4">
									<c:choose>
										<c:when test="${resultMap.scheEval eq 'D'}">
											문서
										</c:when>
										<c:when test="${resultMap.scheEval eq 'O'}">
										 	사무소
										</c:when>
										<c:when test="${resultMap.scheEval eq 'A'}">
											입회
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">평가기간</th>
								<td colspan="2">
									<b>${resultMap.scheSdate} ~ ${resultMap.scheEdate}</b>
								</td>
								<th scope="row">평가장소</th>
								<td>${planInfo.plnPlace}</td>
							</tr>
							<tr>
								<th colspan="2" scope="row">평가 결과</th>
								<td colspan="3"><b class="t_red">부적합 사항 ( ${cnt_U} )건,   우려사항 ( ${cnt_W} )건 , 권고사항 ( ${cnt_R} )건</b></td>
							</tr>
							<tr>
								<th scope="row" rowspan="2">시정조치기한</th>
								<th class="sub_th">부적합</th>
								<td colspan="3">
									<p class="v_middle">발행일로부터 30일 이내에 완료 ( ${resultInfo.repCnt1} ) 건</p>
									<p class="v_middle ml10">(부적합번호 : ${resultInfo.repNo1} )</p>
									<br>
									<p class="v_middle">발행일로부터 30일 이내에 계획보고, 계획한 기한 내 완료 ( ${resultInfo.repCnt2} ) 건</p>
									<p class="v_middle ml10">(부적합번호 : ${resultInfo.repNo2} )</p>
								</td>
							</tr>
							<tr>
								<th class="sub_th">우려사항</th>
								<td colspan="3">발행일로부터 30일 이내에 계획보고, 계획한 기한 내 완료</td>
							</tr>
							<tr>
								<th scope="row" rowspan="2">시정조치 확인방법</th>
								<th class="sub_th">부적합</th>
								<td colspan="3">
									<p class="v_middle">문서 확인 ( ${resultInfo.repCnt3} ) 건</p>
									<p class="v_middle ml10">(부적합번호 : ${resultInfo.repNo3} )</p>
								</td>
							</tr>
							<tr>
								<th class="sub_th">우려사항</th>
								<td colspan="3">차기 평가 시 확인</td>
							</tr>
							<tr>
								<th colspan="2" class="sub_th">평가결과에 대한 의견불일치 사항</th>
								<td colspan="3" id="repCmt" style="white-space:pre;"><c:out value="${resultInfo.repCmt}"/></td>
							</tr>
						</tbody>
					</table>
					<p class="office_sign">인정평가팀과 신청기관은 상기 내용이 협의를 통해 합의되었음을 확인합니다.
						<%-- <c:choose>
							<c:when test="${empty resultInfo.repUserDate}">
								<br>${fn:split(today, '-')[0]}년 ${fn:split(today, '-')[1]}월 ${fn:split(today, '-')[2]}일
							</c:when>
							<c:otherwise>
								<br>${fn:split(resultInfo.repUserDate, '-')[0]}년 ${fn:split(resultInfo.repUserDate, '-')[1]}월 ${fn:split(resultInfo.repUserDate, '-')[2]}일
							</c:otherwise>
						</c:choose> --%>
					</p>
					<table class="table02 sign" summary="협의내용 확인 서명">
						<caption>협의내용 확인 서명</caption>
						<c:choose>
							<c:when test="${admissionSessionVo ne null }">
								<tr class="c">
									<th>인정평가팀장<br>확인</th>
									<td>${resultInfo.repLeaderNm}</td>
									<th>확인자</th>
									<td>
										<c:choose>
											<c:when test="${resultInfo.repUserNm ne null }">
												${resultInfo.repUserNm}
											</c:when>
											<c:otherwise>
												<input type="text" name="admissionNm" id="admissionNm">
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="c">
									<th>인정평가팀장<br>확인</th>
									<td>${resultInfo.repLeaderNm}</td>
									<th>
										<c:choose>
											<c:when test="${evalDiv eq 'A' }">확인자</c:when>
											<c:otherwise>경영자대리인<br>확인</c:otherwise>
										</c:choose>										
									</th>
									<td>
										<c:choose>
											<c:when test="${resultInfo.repUserNm eq null }">
												<input type="text" name="orgUserNm" id="orgUserNm" onKeyup="this.value=this.value.replace(/[a-zA-Z0-9]/g,'');" required>
											</c:when>
											<c:otherwise>${resultInfo.repUserNm}</c:otherwise>
										</c:choose>
									</td>
								</tr>	
							</c:otherwise>
						</c:choose>
						<tr class="c">
							<th>확인일자</th>
							<td>${resultInfo.repLeaderDate}</td>
							<th>확인일자</th>
							<td>${resultInfo.repUserDate}</td>
						</tr>
					</table>
					
				<p class="btn_area">
					<c:choose>
						<c:when test="${evalDiv eq 'A' }">
							<c:if test="${admissionSessionVo ne null }">
								<a href="javascript:fnSubmit();" class="btn_line">평가요약서 확인완료</a>
							</c:if>
						</c:when>
						<c:otherwise>
								<a href="javascript:fnSubmit();" class="btn_line">평가요약서 확인완료</a>
						</c:otherwise>
					</c:choose>
					
				</p>
				
					<input type="hidden" name="repUserIdx" value="${orgIdx}">
					<input type="hidden" name="repUserNm" value="${orgPersonNm}">
					<input type="hidden" name="repIdx" id="repIdx" value="${resultInfo.repIdx}">
					<input type="hidden" name="repUserDate" value="${today}">
				</form>
		</div>
				
	</div>
</body>

</html>