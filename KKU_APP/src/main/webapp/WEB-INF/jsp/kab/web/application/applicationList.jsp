<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="3" />

<html lang="utf-8">
<head>
<%@include file="../_inc/tit.jsp"%>
	<script>
		$(document).on("click", "#srchFrm", function() {
			$("#pageIndex").val(1);
			$("#schFrm").attr("action","<c:url value='/web/application/applicationList.do'/>");
			$("#schFrm").submit();
		});
		
		$(document).on("change", "#recordCountPerPage", function() {
			$("#schFrm").submit();
		});
		
		$(document).on("change", "#srchReqStatus", function() {
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
				<h2>인정신청</h2>
				<ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
					<li>인정신청</li>
				</ol>
			</div>

		<form id="schFrm" method="get" autocomplete="off">
		<input type="hidden" id="pageIndex" name="pageIndex" value="${reqVO.pageIndex}"/>
		<%-- <div class="t_search">
			<div class="search_wrap">
				<p>
					<input class="w200 cal" id="c4" type="text" placeholder="신청 시작일">
					<label for="c4" class="f_0">신청 시작일 설정</label>
					<span class="hyphen">~</span>
					<input class="w200 cal" id="c4" type="text" placeholder="신청 종료일">
					<label for="c4" class="f_0">신청 종료일 설정</label>
				</p>
				 <p class="sel">
					<select>
						<option value="10" selected="">신청범위</option>
						<option value="20"></option>
						<option value="30"></option>
					</select>
				</p>
				<p class="sel">
					<select name="srchReqStatus">
						<option value="" <c:if test="${reqVO.srchReqStatus eq ''}">selected</c:if>>상태</option>
						<c:forEach var="item" items="${reqStatus}">
							<option value="${item.cdVal2}" <c:if test="${reqVO.srchReqStatus eq item.cdVal2}">selected</c:if>>${item.cdName2}</option>
						</c:forEach>	
					</select>
				</p>
				<p class="search_btn"><a href="javascript:void(0);" id="srchFrm">검색하기</a></p>
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
				<p class="search_btn"><a href="javascript:void(0);" id="srchFrm">검색하기</a></p>
			</div>
		</div> --%>

		<div class="list_top mt30">
			<p class="count">검색총건수 <span>${totalCnt}</span>건</p>
			
			<p class="sel">
					<select name="srchReqStatus" id="srchReqStatus">
						<option value="" <c:if test="${reqVO.srchReqStatus eq ''}">selected</c:if>>상태</option>
						<c:forEach var="item" items="${reqStatus}">
							<option value="${item.cdVal2}" <c:if test="${reqVO.srchReqStatus eq item.cdVal2}">selected</c:if>>${item.cdName2}</option>
						</c:forEach>	
					</select>
				</p>
			<p class="sel">
				<select name="recordCountPerPage" id="recordCountPerPage">
					<option value="10" <c:if test="${reqVO.recordCountPerPage eq '10'}">selected</c:if>>10개씩 보기</option>
					<option value="20" <c:if test="${reqVO.recordCountPerPage eq '20'}">selected</c:if>>20개씩 보기</option>
					<option value="30" <c:if test="${reqVO.recordCountPerPage eq '30'}">selected</c:if>>30개씩 보기</option>
				</select>
			</p>
		</div>
		

		<table class="table02" summary="인정신청 목록">
			<caption>인정신청 목록</caption>
			<colgroup><col width="*"><col width="15%"><col width="10%"><col width="10%"><col width="15%"></colgroup>
			<thead>
				<tr>
					<th scope="col">신청범위</th>
					<th scope="col">신청날짜</th>
					<th scope="col">신청유형</th>
					<th scope="col">상태</th>
					<th scope="col">신청서</th>
				</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${fn:length(resultList) > 0 }">
						<c:forEach var="item" items="${resultList }">
							<tr>
								<td>
									${fn:replace(item.schFullName,'|','<br>')}${fn:replace(item.schFullName1,'|','<br><br>')}
								</td>
								<td class="c">
									<c:choose>
										<c:when test="${item.reqStatus eq 'T' }">
											-	
										</c:when>
										<c:otherwise>
											${item.reqDate }
										</c:otherwise>
									</c:choose>
								</td>
								<td class="c">${item.reqType }</td>
								<td class="c">
									<c:forEach var="code" items="${reqStatus}">
										<c:if test="${item.reqStatus eq code.cdVal2 }">${code.cdName2}</c:if>
									</c:forEach>
								</td>
								<td class="c">
									<c:choose>
										<c:when test="${item.reqStatus eq 'T' }">
											<a href="/web/application/applicationWrite.do?reqIdx=${item.reqIdx}" class="sm_line">서류제출</a>	
										</c:when>
										<c:otherwise>
											<a href="/web/application/applicationView.do?reqIdx=${item.reqIdx}" class="sm_line">확인</a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<!-- 목록이 없는 경우 -->
						<tr class="no_cont">
							<td colspan="5">인정신청 정보가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<p class="pn"> 
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
		</p>
		</form>
		<p class="btn_area">
			<a href="/web/application/applicationWrite.do" class="btn_submit">신청</a>
		</p>
	</div>
		<%@include file="../_inc/footer.jsp"%>
	</div>
</body>

</html>