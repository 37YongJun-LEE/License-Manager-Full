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
function openerRefresh(){
	opener.document.location.reload();
}
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
 <form name="schFrm" id="schFrm" method="get" autocomplete="off" action="<c:url value='/kabadm/perform/performNote.do?'/>">
			<input type="hidden" name="plnIdx" id="plnIdx" value="${planMasterVO.plnIdx}">
			<input type="hidden" name="pageIndex" id="pageIndex" value="${discoveryVO.pageIndex}" />
			<input type="hidden" name="evalDiv" id="evalDiv" value="${evalDiv}" />
			<input type="hidden" name="orgDiv" id="orgDiv" value="${orgDiv}" />
			<input type="hidden" name="tab" id="tab" value="${tab}" />
		<table class="table02 info" summary="권고사항 평가단계">
			<caption>권고사항 평가단계</caption>
			<colgroup><col width="15%"><col width="*"><col width="12%"><col width="18%"></colgroup>
			<tbody>
				<tr>					
					<th scope="col">평가단계</th>
					<td colspan="3">
						<c:choose>
							<c:when test="${evalDiv eq 'D' }">문서</c:when>
							<c:when test="${evalDiv eq 'O' }">사무소</c:when>
							<c:when test="${evalDiv eq 'A' }">입회</c:when>
						</c:choose>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="table02 c_all" summary="권고사항">
			<caption>권고사항</caption>
			<colgroup><col width="10%"><col width="15%"><col width="18%"><col width="*"></colgroup>
			<tbody>
				<tr>					
					<th>발행번호</th>
					<th>발행자</th>
					<th>인정기준 및 조항</th>
					<th>내용</th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(resultList) > 0}">
						<c:forEach var="item" items="${resultList}">
							<tr>
								<td>${item.disNo}</td>
								<td>${item.disNm }</td>
								<td>${item.disDocNm} ${item.disClauseDet}</td>
								<td>${item.disSummary }</td>
							</tr>	
						</c:forEach>
					</c:when>	
					<c:otherwise>
						<tr class="no_cont"><!-- 목록이 없는 경우 -->
							<td colspan="4">발견사항 정보가 없습니다.</td>
						</tr>
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
		</form>		
		
	</div>
	</div>
</body>

</html>