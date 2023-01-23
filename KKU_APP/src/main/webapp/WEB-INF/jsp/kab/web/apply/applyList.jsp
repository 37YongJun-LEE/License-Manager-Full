<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="1" />

<html lang="utf-8">
<head>
<%@include file="../_inc/tit.jsp"%>
<script>
	$(document).ready(function(){
		//datepicker
		$(".cal").datepicker({
			changeMonth: true,
			changeYear: true
		});
		$('#scheSdate').datepicker();
	    $('#scheSdate').datepicker("option", "maxDate", $("#scheEdate").val());
	    $('#scheSdate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#scheEdate").datepicker( "option", "minDate", selectedDate );
	    });
	    $('#scheEdate').datepicker();
	    $('#scheEdate').datepicker("option", "minDate", $("#scheSdate").val());
	    $('#scheEdate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#scheSdate").datepicker( "option", "maxDate", selectedDate );
	    });	
	});
	$(document).on("click", "#srchFrm", function() {
		$("#pageIndex").val(1);
		$("#schFrm").attr("action","<c:url value='/web/apply/applyList.do'/>");
		$("#schFrm").submit();
	});
	$(document).on("change", "#recordCountPerPage", function() {
		$("#schFrm").submit();
	});
</script>
</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp"%>
		<%@include file="../_inc/smn01.jsp"%>


		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
				<h2>계획 관리</h2>
				<ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
					<li>계획 관리</li>
				</ol>
			</div>
			
		<form id="schFrm" method="get" autocomplete="off">
			<input type="hidden" id="pageIndex" name="pageIndex" value="${planMasterVO.pageIndex}"/>
			<div class="t_search02">
				<div class="search_wrap">
					<p>
						<input class="w200 cal" id="scheSdate" name="searchSdate" type="text" value="${planMasterVO.searchSdate}" placeholder="평가일정 시작일" readonly>
						<label for="scheSdate" class="f_0">평가일정 시작일 설정</label>
						<span class="hyphen">~</span>
						<input class="w200 cal" id="scheEdate" name="searchEdate" type="text" value="${planMasterVO.searchEdate}" placeholder="평가일정 종료일" readonly>
						<label for="scheEdate" class="f_0">평가일정 종료일 설정</label>
					</p>
					<p class="sel">
						<select name="searchScheme">
							<option value="" >분류</option>
							<c:forEach var="schemeAllList" items="${schemeAllList}">
								<option value="${schemeAllList.schIdx}" <c:if test="${planMasterVO.searchScheme eq schemeAllList.schIdx}">selected</c:if>>${schemeAllList.schEnPjt}</option>
							</c:forEach>
						</select>
					</p>
					<p class="sel">
						<select name="searchPjtRan">
							<option value=""  >평가종류</option>
							<c:forEach var="sche_ran" items="${sche_ran }">
								<option value="${sche_ran.cdVal2 }" <c:if test="${planMasterVO.searchPjtRan eq sche_ran.cdVal2}">selected</c:if>>${sche_ran.cdName2}</option>
							</c:forEach>
						</select>
					</p>
					<p class="search_btn"><a href="javascript:void(0);" id="srchFrm">검색하기</a></p>
				</div>
			</div>
	
			<div class="list_top mt30">
				<p class="count">검색총건수 <span>${resultCnt}</span>건</p>
				<p class="sel">
					<select name="recordCountPerPage" id="recordCountPerPage">
						<option value="10" <c:if test="${planMasterVO.recordCountPerPage eq '10'}">selected</c:if>>10개씩 보기</option>
						<option value="20" <c:if test="${planMasterVO.recordCountPerPage eq '20'}">selected</c:if>>20개씩 보기</option>
						<option value="30" <c:if test="${planMasterVO.recordCountPerPage eq '30'}">selected</c:if>>30개씩 보기</option>
					</select>
				</p>
			</div>
	
			<table class="table02 baselist" summary="계획관리 목록">
				<caption>계획관리 목록</caption>
				<colgroup>
					<col width="*">
					<col width="25%">
					<col width="10%">
					<col width="10%">
					<%-- <col width="10%"> --%>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">평가범위</th>
						<th scope="col">평가일정</th>
						<th scope="col">평가단계</th>
						<th scope="col">확인사항</th>
						<!-- <th scope="col">평가결과</th> -->
					</tr>
				</thead>
	
				<tbody>
					<c:choose>
						<c:when test="${fn:length(resultList) > 0}">
							<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
								<tr class="c l" style="cursor:pointer;" onclick="location.href='/web/apply/applyView.do?scheIdx=${resultInfo.scheIdx}&plnIdx=${resultInfo.plnIdx}'">
									<td><a class="link" href="/web/apply/applyView.do?scheIdx=${resultInfo.scheIdx}&plnIdx=${resultInfo.plnIdx}">${resultInfo.scheEvalRan}</a></td>
									
									<td>${fn:replace(resultInfo.scheSdate, "-", ".")} ~ ${fn:replace(resultInfo.scheEdate, "-", ".")}</td>
									<td>
										<c:if test="${!empty resultInfo.scheEval}">
											<c:choose>
												<c:when test="${resultInfo.scheEval eq 'D'}">
													문서
												</c:when>
												<c:when test="${resultInfo.scheEval eq 'O'}">
												 	사무소
												</c:when>
												<c:when test="${resultInfo.scheEval eq 'A'}">
													입회
												</c:when>
											</c:choose>
										</c:if>
									</td>
									<td>
										<c:choose>
											<c:when test="${resultInfo.checkDate ne null }">완료</c:when>
											<c:otherwise>미완료</c:otherwise>
										</c:choose>
									</td>
									<!-- <td><a href="#" class="sm_line">확인</a></td> -->
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="no_cont">
								<td colspan="5">계획관리 정보가 없습니다.</td>
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