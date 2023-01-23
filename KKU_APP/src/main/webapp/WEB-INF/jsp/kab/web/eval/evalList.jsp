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
		
		//검색
		$(document).on("click", "#srchFrm", function() {
			$("#pageIndex").val(1);
			$("#schFrm").attr("action","<c:url value='/web/eval/evalList.do'/>");
			$("#schFrm").submit();
		});
		
		//검색개수
		$(document).on("change", "#recordCountPerPage", function() {
			$("#schFrm").submit();
		});
		
		//화면 중앙 팝업 오픈
		function openPop(url,w,h) {
		  
		 	var winX = window.screenLeft;	//내 컴퓨터 화면 가로 사이즈
		 	var winY = window.screenTop;	//내 컴퓨터 화면 세로 사이즈
		 	var bodyW = document.body.clientWidth;	//브라우저 현재 너비
		 	var bodyH = document.body.clientHeight; //브라우저 현재 높이 
		 
		    var left = (winX) + ((bodyW-w)/2);
			var top  = (winY) + ((bodyH-h)/2);
		 	
			location.reload();
		 	window.open(url, url, '"status=no,scrollbars=yes, height='+h+',width='+w+',top='+top+',left='+left+'"');
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
				<h2>평가 관리</h2>
				<ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
				<li>평가관리</li>
			</ol>
			</div>

		<!-- 검색 -->
	<%-- 	<div class="t_search">
			<div class="search_wrap">
				<p>
					<input class="w200 cal" id="scheSdate" name="searchSdate" type="text" value="${planMasterVO.searchSdate}" placeholder="평가일정 시작일" readonly>
					<label for="scheSdate" class="f_0">평가일정 시작일 설정</label>
					<span class="hyphen">~</span>
					<input class="w200 cal" id="scheEdate" name="searchEdate" type="text" value="${planMasterVO.searchEdate}" placeholder="평가일정 종료일" readonly>
					<label for="scheEdate" class="f_0">평가일정 종료일 설정</label>
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
				<p class="search_btn"><a href="javascript:void(0);" id="srchFrm">검색하기</a></p>
			</div>
		</div>

		<div class="list_top mt30">
			<p class="count">검색총건수 <span>${resultCnt }</span>건</p>
			<p class="sel">
				<select name="recordCountPerPage" id="recordCountPerPage">
					<option value="10" <c:if test="${planMasterVO.recordCountPerPage eq '10'}">selected</c:if>>10개씩 보기</option>
					<option value="20" <c:if test="${planMasterVO.recordCountPerPage eq '20'}">selected</c:if>>20개씩 보기</option>
					<option value="30" <c:if test="${planMasterVO.recordCountPerPage eq '30'}">selected</c:if>>30개씩 보기</option>
				</select>
			</p>
		</div> --%>
		
	<form id="schFrm" method="get" autocomplete="off">
		<input type="hidden" id="pageIndex" name="pageIndex" value="${planMasterVO.pageIndex}"/>
		<table class="table02 baselist" summary="인증기관 목록">
			<caption>인증기관 목록</caption>
			<colgroup><%-- <col width="10%"> --%><col width="*"><col width="10%"><col width="10%"><col width="10%"><col width="20%"><col width="20%"><col width="8%"><%-- <col width="10%"> --%></colgroup>
			<thead>
				<tr>
					<!-- <th scope="col">순번</th> -->
					<th scope="col">평가일정</th>
					<th scope="col">평가단계</th>
					<th scope="col">시정조치<br>요청건수</th>
					<th scope="col">확인사항</th>
					<th scope="col">평가장소</th>
					<th scope="col">평가범위</th>
					<th scope="col">상태</th>
					<!-- <th scope="col">발견사항</th> -->
				</tr>
			</thead>

			<tbody>
				<c:set var="plnIdx" value=""/>
						<c:choose>
								<c:when test="${fn:length(resultList) > 0}">
									<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
										<c:if test="${plnIdx ne resultInfo.plnIdx}">
											<c:choose>
												<c:when test="${resultInfo.scheEval eq 'D'}">
													<tr class="c" style="cursor:pointer;" onclick="location.href='/web/eval/evalfind01.do?plnIdx=${resultInfo.plnIdx}'">
												</c:when>
												<c:when test="${resultInfo.scheEval eq 'O'}">
												 	<tr class="c" style="cursor:pointer;" onclick="openPop('/web/eval/discoveryList.do?plnIdx=${resultInfo.plnIdx}&evalDiv=${resultInfo.scheEval}&tab=1','1300', '850');">
												</c:when>
												<c:when test="${resultInfo.scheEval eq 'A'}">
													<tr class="c" style="cursor:pointer;" onclick="openPop('/web/eval/discoveryList.do?plnIdx=${resultInfo.plnIdx}&evalDiv=${resultInfo.scheEval}&tab=1','1300', '850');">
												</c:when>
											</c:choose>
												<td >
													${resultInfo.scheSdate} ~ ${resultInfo.scheEdate}
												</td>
												<td >
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
												<td >
													<c:choose>
														<c:when test="${resultInfo.scheEval eq 'D' }">
															<c:choose>
																<c:when test="${resultInfo.agrYn eq 'Y' }">
																	${resultInfo.docCnt}/${resultInfo.docTotalCnt}
																</c:when>
																<c:otherwise>
																	0/0
																</c:otherwise>
															</c:choose> 
															
														</c:when>
														<c:otherwise>
															${resultInfo.disCompleteCount}/${resultInfo.disCount}
														</c:otherwise>
													</c:choose>
													
												</td>
												<td>
													<c:choose>
														<c:when test="${resultInfo.scheEval eq 'D' }">
															<c:choose>
																<c:when test="${resultInfo.agrYn eq 'Y' }">
																	<c:choose>
																		<c:when test="${resultInfo.docCnt eq resultInfo.docTotalCnt }">
																			<img src="/_img/adm/cont/alram_off.png" alt="" />
																		</c:when>
																		<c:otherwise>
																			<img src="/_img/adm/cont/alram_on.png" alt="" />	
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<img src="/_img/adm/cont/alram_off.png" alt="" />
																</c:otherwise>
															</c:choose> 
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${resultInfo.disCompleteCount eq resultInfo.disCount }">
																	<img src="/_img/adm/cont/alram_off.png" alt="" />
																</c:when>
																<c:otherwise>
																	<img src="/_img/adm/cont/alram_on.png" alt="" />	
																</c:otherwise>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</td>
												<td >
													${resultInfo.plnPlace}
												</td>
												<td >
													${resultInfo.scheEvalRan}
												</td>
												<td>
													<c:choose>
														<c:when test="${resultInfo.agrYn eq 'Y' }">
															완료 
														</c:when>
														<c:otherwise>
															미완료
														</c:otherwise>
													</c:choose> 
												</td>
												<!-- <td><a href="/web/eval/evalfind01.do?reqIdx=40" class="sm_line">상세보기</a></td> -->
											</tr>
											<c:set var="plnIdx" value="${resultInfo.plnIdx}"/>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="no_cont">	<!-- 목록이 없는 경우 -->
										<td colspan="7">평가관리 정보가 없습니다.</td>
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