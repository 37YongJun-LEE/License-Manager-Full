 <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="page_num_depth_01" value="1"/>
<c:set var="page_num_depth_02" value="1"/>

<html lang="utf-8">
<head>
<%@include file="../_inc/tit.jsp"%>
<script>
	$(document).ready(function(){
		var text = $('#text1').val();
		var line = text.split('\n');
		var str ="";
		for(var i=0; i<line.length; i++){
			str += '<li>'+line[i]+'</li>';
		}
		$('#dot').append(str);
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
			     <h2>평가계획 조회</h2>
			     <ol class="loca">
                    <li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
                    <li>인정관리</li>
					<li>계획 관리</li>
				</ol>
			</div>
			
			<p class="btn_tarea">
				<a href="/planPdfDownload.do?plnIdx=${planMasterVO.plnIdx}" class="btn_list_down" style="margin-bottom: 10px;">계획서 다운로드</a>
			</p>

		<table class="table02" summary="인증서신청 조회">
			<caption>인증서신청 조회</caption>
			<colgroup><col width="12%"><col width="38%"><col width="12%"><col width="38%"></colgroup>
			<tbody>
				<tr>
					<th scope="row">인증기관<span class="star">*</span></th>
					<td>${companyInfo.orgNmKr} [${companyInfo.orgNmAlias}]</td>
					<th scope="row">평가단계<span class="star">*</span></th>
					<td>
						<input type="hidden" id="scheEval" name="scheEval" value="${resultMap.scheEval}" />
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
					<th scope="row">소재지</th>
					<td>
						<c:forEach var="item" items="${resultLocList}">
							<c:if test="${companySchemeVO.locIdx eq item.locIdx}">${item.locNm}(${fn:replace(item.adrKr, '|', ' ')})</c:if>
						</c:forEach>
					</td>
					<th scope="row">인정분야</th>
					<td>
						<c:forEach var="item" items="${org_kind}">
							<c:if test="${companyInfo.orgKind eq item.cdVal2}">${item.cdName2}</c:if>
						</c:forEach>
					</td>
				</tr>

				<tr>
					<th scope="row">평가범위<span class="star">*</span></th>
					<td colspan="3"> 
						<table class="intable" summary="평가범위 내용">
							<caption>평가범위 내용</caption>
							<colgroup><col width="12%"><col width="*"><col width="12%"></colgroup>
								<tbody>
								<tr>
									<th scope="col">인정스킴(약자)</th>
									<th scope="col">분류</th>
									<th scope="col">평가종류</th>
								</tr>
								<c:set var="isNotEmpty" value="N"/>
								<c:choose>
									<c:when test="${fn:length(resultSchemeList) > 0 }">
										<c:forEach var="item" items="${resultSchemeList }">
											<tr>
												<td style="text-align: center;">${item.schEn}</td>
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
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<th scope="row">평가목적<span class="star">*</span></th>
					<td colspan="3">${resultVO.plnPurpose}</td>
				</tr>
				<tr>
					<th scope="row">평가기간</th>
					<td><c:choose>
						<c:when test="${!empty planMasterVO.scheIdx}">
							<b>${resultMap.scheSdate} ~ ${resultMap.scheEdate}</b>
						</c:when>
					</c:choose></td>
					<th scope="row">평가장소</th>
					<td>${resultVO.plnPlace}</td>
				</tr>
				<tr>
					<th scope="row">평가기준<br/>/참조문서<span class="star">*</span></th>
					<td colspan="3" class="scroll_wrap">
						<div class="h_scroll">
						<input type="hidden" id="text1" value="${resultVO.plnCont}">
							<ul class="basic_dot" id="dot">
							</ul>
						</div>
					</td>
				</tr>
			</tbody>
		</table>

		<h4>평가 / 참관인 정보</h4>
		<table class="table02" summary="인증기관 목록">
			<caption>인증기관 목록</caption>
			<colgroup><col width="15%"><col width="20%"><col width="*"><col width="20%"><col width="20%"></colgroup>
			<thead>
				<tr>
					<th scope="col">구분</th>
					<th scope="col">이름</th>
					<th scope="col">평가기간</th>
					<th scope="col">평가분야</th>
					<th scope="col">MD</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${fn:length(resultUserList) > 0 }">
					<c:forEach var="item" items="${resultUserList}" varStatus="status">
						<!-- 목록이 없는 경우
						<tr class="no_cont">
							<td colspan="5">평가 / 참관인 정보가 없습니다.</td>
						</tr>
						-->
						<tr class="c">
							<th class="sub_th">
								<c:forEach var="usr_level_cd" items="${usr_level_cd}">
									<c:if test="${item.usrLevelCd eq usr_level_cd.cdVal2 }">${usr_level_cd.cdName2}</c:if>
								</c:forEach>
							</th>
							<td>${item.usrName}</td>
							<td>${item.usrSdate} ~ ${item.usrEdate}</td>
							<td>${item.usrEvalCont}</td>
							<td>${item.usrMd}</td>
						</tr>
					</c:forEach>
					<tr class="c bg">
						<th colspan="2">합계</th>
						<th colspan="2">총MD</th>
						<th>${resultMap.totalMd}</th>
					</tr>
				</c:if>
			</tbody>
		</table>

		<p class="note_r pt10">※평가 세부일정은 우측 상단의 계획서를 참조해주시기 바랍니다.</p>

		<p class="btn_area">
			<a href="javascript:chkLogin('/web/apply/applyCheck.do?scheIdx=${planMasterVO.scheIdx}&plnIdx=${planMasterVO.plnIdx}','${orgSessionVo.orgIdx}')" class="btn_submit">확인사항 작성</a>
			<a href="javascript:chkLogin('/web/apply/applyList.do','${orgSessionVo.orgIdx}')" class="btn_list">목록</a>
<!-- 				<a href="#" class="btn_del">삭제</a> -->
		</p>
	</div>
	<%@include file="../_inc/footer.jsp"%>
</body>

</html>