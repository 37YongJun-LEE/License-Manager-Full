<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="5" />

<html lang="utf-8">
<head>
<%@include file="../_inc/tit.jsp"%>
<script>
	$(document).ready(function(){
		
	});
	function fn_changeCount(){
		$('#schFrm').submit();
	}
</script>
</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp"%>
		<%@include file="../_inc/smn01.jsp"%>


		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
				<h2>인정 보유현황</h2>
				<ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
					<li>인정 보유현황</li>
				</ol>
			</div>

			<!-- <div class="t_search">
			<div class="search_wrap">
				<p>
					<input class="w200 cal" id="c4" type="text" placeholder="평가일정 시작일">
					<label for="c4" class="f_0">평가일정 시작일 설정</label>
					<span class="hyphen">~</span>
					<input class="w200 cal" id="c4" type="text" placeholder="평가일정 종료일">
					<label for="c4" class="f_0">평가일정 종료일 설정</label>
				</p>
				<p class="sel">
					<select>
						<option value="10" selected="">평가범위</option>
						<option value="20"></option>
						<option value="30"></option>
					</select>
				</p>
				<p class="sel">
					<select>
						<option value="10" selected="">평가종류</option>
						<option value="20"></option>
						<option value="30"></option>
					</select>
				</p>
			</div>
			<div class="search_wrap">
				<p class="sel_short mr0">
					<select class="brn">
						<option selected="">전체</option>
						<option>제목</option>
						<option>내용</option>
					</select>
				</p>
				<p class="word"><input type="text" placeholder="검색어를 입력해주세요"></p>
				<p class="search_btn"><a href="#">검색하기</a></p>
			</div>
		</div> -->
	<form id="schFrm" method="get" autocomplete="off">
		<input type="hidden" id="pageIndex" name="pageIndex" value="${companyVO.pageIndex}"/>
		<div class="list_top mt30">
			<p class="count">검색총건수 <span>${resultCnt}</span>건</p>
			<p class="sel">
				<select name="recordCountPerPage" onChange="fn_changeCount();">
					<option value="10" <c:if test="${companyVO.recordCountPerPage eq '10' }">selected</c:if>>10개씩 보기</option>
					<option value="20" <c:if test="${companyVO.recordCountPerPage eq '20' }">selected</c:if>>20개씩 보기</option>
					<option value="30" <c:if test="${companyVO.recordCountPerPage eq '30' }">selected</c:if>>30개씩 보기</option>
				</select>
			</p>
		</div>
		

		<table class="table02" summary="인증기관 목록">
			<caption>인증기관 목록</caption>
			<colgroup><col width="15%"><%-- <col width="*"> --%><col width="25%"><%-- <col width="10%"> --%><col width="15%"></colgroup>
			<thead>
				<tr>
					<th scope="col">인정스킴</th>
						<!-- <th scope="col">코드</th> -->
					<th scope="col">유효기간</th>
					<th scope="col">인정서</th>
				</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${fn:length(resultList)>0 }">
						<c:forEach var="item" items="${resultList}" varStatus="stat">
							<tr>
								<td>${item.schCd}</td>
								<%-- <td>${item.schFullNameStuff}</td> --%>
								<td class="c">${fn:replace(item.valSdate,'-','.')}~${fn:replace(item.valEdate,'-','.')}</td>
								<td class="c"><a class="sm_line"  href="/web/certi/createCertiPdf.do?valIdx=${item.valIdx}" target="_blank">다운로드</a></td> <!-- <c:if test="${stat.index eq '0'}"><a href="/upload/인정서 샘플양식_경영시스템_V2.5(통합).pdf" target="_blank" class="sm_line">다운로드</a></c:if> -->
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<!-- 목록이 없는 경우 -->
						<tr class="no_cont">
							<td colspan="3">인정 보유현황 정보가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<p class="pn">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
		</p>	
	</form>
	</div>
		<%@include file="../_inc/footer.jsp"%>
	</div>
</body>

</html>