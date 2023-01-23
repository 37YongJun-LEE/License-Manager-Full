<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="3" />

<html lang="utf-8">
<head>
	<%@include file="../_inc/tit.jsp"%>
	<script>
		$(function(){
			//제출 서류 변경
			var number = 1;
			$('tr[class^=doc_]').each(function(){
				var reqType = $('#reqType').val();
				var classNm = $(this).attr("class");
				if(classNm.indexOf(reqType) == -1){
					$(this).children('td').children('p').children('input[type=text]').val('');
					$(this).children('td').children('p').children('input[type=file]').val('');
					$(this).children('td').children('p').children('input[type=text]').attr("required",false);
					$(this).hide();
				}else {
					$(this).children('td[id^=number_]').html(number);
					number++;
				}
			});
		});//document.ready __end
	</script>
</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp"%>
		<%@include file="../_inc/smn01.jsp"%>
		
	<div class="cont_view">
		<!-- -->
		<div class="cont_top">
			 <h2>인정 신청</h2>
			 <ol class="loca">
				<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
				<li>인정관리</li>
				<li>인정신청</li>
			</ol>
		</div>
		
		<h4>일반정보</h4>
		<input type="hidden" id="reqType" name="reqType" value="${resultReqInfo.reqType}">
		<table class="table02" summary="일반정보 조회">
				<caption>일반정보 조회</caption>
				<colgroup><col width="15%"><col width="10%"><col width="15%"><col width="10%"><col width="15%"><col width="10%"><col width="10%"><col width="*"></colgroup>
				<tbody>
					<tr>
						<th scope="row" rowspan="2">신청기관 법인명칭</th>
						<th class="sub_th">국문</th>
						<td colspan="2">${resultComp.orgNmKr}</td>
						<th scope="row">사업자등록번호</th>
						<td colspan="3">${resultComp.bsnsNo}</td>
					</tr>
					<tr>
						<th class="sub_th">영문</th>
						<td colspan="2">${resultComp.orgNmEn}</td>
						<th scope="row">대표전화</th>
						<td colspan="3">${resultComp.telNo}</td>
					</tr>
					<tr>
						<th>소재지</th>
						<td colspan="7">${resultCompLoc.locNm} ( ${fn:replace(resultCompLoc.adrKr,'|',' ')} )</td>
					</tr>
					<tr>
						<th scope="row">대표자</th>
						<td colspan="3">${resultComp.ceoNm}</td>
						<th scope="row">홈페이지</th>
						<td colspan="3">${resultComp.homepage}</td>
					</tr>
					<tr>
						<th scope="row">설립근거</th>
						<td colspan="3">${resultComp.foundedRef}</td>
						<th scope="row">설립일</th>
						<td colspan="3">${resultComp.foundedDate}</td>
					</tr>
					<tr>
						<th scope="row">담당자</th>
						<th class="sub_th">성명(직책)</th>
						<td>${resultComp.personNm}(${resultComp.personPosition})</td>
						<th class="sub_th">전화</th>
						<td>${resultComp.personTelNo}</td>
						<th class="sub_th">이메일</th>
						<td colspan="2">${resultComp.personEmail}</td>
					</tr>
				</tbody>
			</table>




		<h4>인정신청 및 범위 선택</h4>
		<table class="table02" summary="인정신청 범위 선택">
			<caption>인정신청 범위 선택</caption>
			<colgroup><col width="130px"><col width="220px"><col width="*"></colgroup>
			<tbody>
				<tr>
					<th colspan="2">적합성평가기관의 경영시스템에 대한 선택사항</th>
					<td class="sel">
						<c:choose>
							<c:when test="${resultReqInfo.reqType eq '2' }">
								${renewalSchFinal[0].schDiv}
							</c:when>	
							<c:otherwise>
								${resultReqSchemeInfo.schCd}
							</c:otherwise>
						</c:choose>	
					</td>			
				</tr>
				<tr>
					<th>신청유형</th>
					<td colspan="2" class="ra_base">
						<input type="hidden" id="reqType" name="reqType" value="${resultReqInfo.reqType}">
						<c:forEach var="item" items="${req_type}" varStatus="stat">
							<c:if test="${item.cdVal2 eq resultReqInfo.reqType }">${item.cdName2}</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th rowspan="2">최종신청범위</th>
					<td class="overflow" colspan="2">
						<%-- <c:choose>
							<c:when test="${resultReqInfo.reqType eq '2' }">
								<c:forEach var="item" items="${renewalSchFinal}" varStatus="stat">
									${fn:replace(item.schFullName1,'|','<br>')}
								</c:forEach>
							</c:when>	
							<c:otherwise> --%>
								<c:forEach var="item" items="${resultReqSchemeFullName}" varStatus="stat">
									<c:choose>
										<c:when test="${item.schFullNameStuff ne null}">
											${item.schEn} : ${item.schFullNameStuff}
											<c:if test="${fn:length(item) ne stat.index}"><br></c:if>
										</c:when>
										<c:otherwise>
											${item.schEn}<c:if test="${fn:length(item) ne stat.index}"><br></c:if>
										</c:otherwise>
									</c:choose>
								</c:forEach>	
							<%-- </c:otherwise>
						</c:choose>	 --%>
					</td>
				</tr>
			</tbody>
		</table>


		<h4>평가 희망사항</h4>
		<table class="table02" summary="평가 희망사항">
			<caption>평가 희망사항</caption>
			<colgroup><col width="18%"><col width="14%"><col width="16%"><col width="14%"><col width="*"><col width="14%"></colgroup>
			<tbody>
				<tr>
					<th>KAB의 예비 방문 희망여부</th>
					<td colspan="5" class="ra_base">
						<c:if test="${resultReqInfo.preliVisit eq 'Y' }"><p>희망함</p></c:if>
						<c:if test="${resultReqInfo.preliVisit eq 'N' }"><p>희망하지않음</p></c:if>									
					</td>				
				</tr>
				<tr>
					<th>문서평가 희망시기</th>
					<td>
						<p>${resultReqInfo.docEval}</p>
					</td>				
					<th>사무소평가 희망시기</th>
					<td>
						<p>${resultReqInfo.offEval}</p>
					</td>				
					<th>인정결정 및 인정서 발행 희망시기</th>
					<td>
						<p>${resultReqInfo.certiIssue}</p>
					</td>	
				</tr>
			</tbody>
		</table>

		<h4>제출 필요 서류</h4>
		<%-- <table class="table02" summary="제출 필요 서류">
			<caption>제출 필요 서류</caption>
			<colgroup><col width="10%"><col width="25%"><col width="15%"><col width="15%"><col width="*"></colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>필요서류</th>
					<th>양식</th>
					<th>양식 다운로드</th>
					<th>첨부</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach var="reqDoc" items="${reqDoc}" varStatus="stat">
					<tr>
						<td class="c">${stat.index}</td>
						<td class="c">${reqDoc.cdName2 }</td>
						<td class="c">
							<c:choose>
								<c:when test="${stat.index eq '1' }">KAB-AM-F01</c:when>
								<c:when test="${stat.index eq '4' }">KAB-AM-F02</c:when>
								<c:when test="${stat.index eq '5' }">KAB-AM-F03</c:when>
								<c:when test="${stat.index eq '10' }">KAB-AM-F05</c:when>
								<c:when test="${stat.index eq '11' }">KAB-AM-F06</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<td class="c">
							<c:choose>
								<c:when test="${stat.index eq '4'or stat.index eq '5' or stat.index eq '11' }">
									<c:if test="${stat.index eq '4' or stat.index eq '5'}">
										<a href="#" class="sm_line">다운로드</a>
									</c:if>
									<c:if test="${stat.index eq '11'}">
										<a href="/web/application/docView.do?reqIdx=${reqVO.reqIdx}" id="btn_reqDoc" class="sm_blue">문서대비표</a>
									</c:if>		
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
							
						</td>
						
							<td class="files" id="td_${stat.index}">
								<c:if test="${stat.index ne '11' }">
									<c:set var="chk" value="0"/>
									<c:forEach var="item" items="${fileList}">
										<c:if test="${fn:split(item.filPath,'Doc')[0] eq stat.index}">
											<c:set var="chk" value="1"/>
											<p>
												<a href="<c:url value='/fileDownload.do'/>?srvFile=${item.filSvrName}&usrFile=${item.filUsrName}&folder=${item.filPath}" class="name"><span class="ti-clip"></span>${item.filUsrName}</a>
												<button class="sm_del" onClick="ajaxDelFile('${item.filIdx}')"></button>
											</p>
										</c:if>
									</c:forEach>
									<c:if test="${chk eq '0'}">
										<p>등록된 파일이 없습니다.</p>	
									</c:if> 
								</c:if>		
							</td>
						</tr>
				</c:forEach>
			</tbody>
		</table> --%>
		<table class="table02"  summary="제출 필요 서류">
			<caption>제출 필요 서류</caption>
			<colgroup><col width="10%"><col width="25%"><col width="15%"><col width="15%"><col width="*"></colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>필요서류</th>
					<th>양식</th>
					<th>양식 다운로드</th>
					<th>첨부</th>
				</tr>
			</thead>
			<tbody id="submitDoc">				
				<c:forEach var="reqDoc" items="${reqDoc}" varStatus="stat">
					<c:set var="listLen" value="${fn:length(reqDoc)}"/>
					<tr class="doc_${reqDoc.etc}">
						<td class="c" id="number_${stat.count}"></td>							<!-- 순번 -->
						<td class="l">${reqDoc.cdName2 }</td> 									<!-- 필요서류 -->
						<td class="c"> 															<!-- 양식 -->
							<c:choose>
								<%-- <c:when test="${reqDoc.cdVal2 eq '2' }">KAB-AM-F01</c:when> --%>
								<c:when test="${reqDoc.cdVal2 eq '5' }">KAB-AM-F02</c:when>
								<c:when test="${reqDoc.cdVal2 eq '6' }">KAB-AM-F03</c:when>
								<c:when test="${reqDoc.cdVal2 eq '11' }">KAB-AM-F05</c:when>
								<%-- <c:when test="${reqDoc.cdVal2 eq '12' }">KAB-AM-F06</c:when> --%>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<td class="c"> 															<!-- 양식다운로드 -->
							<c:choose>
								<c:when test="${reqDoc.cdVal2 eq '5'or reqDoc.cdVal2 eq '6' or reqDoc.cdVal2 eq '11' or reqDoc.cdVal2 eq '12'}">
									<c:if test="${reqDoc.cdVal2 eq '5'}">
										<a href="/upload/applyDoc/KAB-AM-F02%20신청기관%20현황%20및%20사업계획서.docx" class="sm_line">다운로드</a>
									</c:if>
									<c:if test="${reqDoc.cdVal2 eq '6'}">
										<a href="/upload/applyDoc/KAB-AM-F03%20인정범위%20별%20인적자원%20확보%20현황.docx" class="sm_line">다운로드</a>
									</c:if>
									<c:if test="${reqDoc.cdVal2 eq '11'}">
										<a href="/upload/applyDoc/KAB-AM-F05%20인정기준%20및%20인정절차%20준수서약서.docx" class="sm_line">다운로드</a>
									</c:if>
									<c:if test="${reqDoc.cdVal2 eq '12'}">
											<a href="/web/application/docView.do?reqIdx=${resultReqInfo.reqIdx}" id="btn_reqDoc" class="sm_blue">문서대비표</a>
									</c:if>		
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
						<td class="files" id="td_${reqDoc.cdVal2}"> 							<!-- 파일첨부 -->
							<c:if test="${reqDoc.cdVal2 ne '12'}">
								<c:set var="chk" value="0"/>
								<c:forEach var="item" items="${fileList}">
									<c:if test="${fn:split(item.filPath,'Doc')[0] eq stat.index}">
										<c:set var="chk" value="1"/>
										<p>
											<c:url value="/fileDownload.do" var="fileUrl">
												<c:param name="srvFile" value="${item.filSvrName}" />
												<c:param name="usrFile" value="${item.filUsrName}" />
												<c:param name="folder" value="${item.filPath}" />
											</c:url>
											<a href="${fileUrl}" target="_blank" class="file"><span class="ti-clip"></span>${item.filUsrName}</a>
											<%-- <button class="sm_del" onClick="ajaxDelFile('${item.filIdx}')"></button> --%>
										</p>
									</c:if>
								</c:forEach>
								<c:if test="${chk eq '0'}">
									<p>등록된 파일이 없습니다.</p>	
								</c:if> 
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p class="mt10"> 상기의 인정신청정보는 사실과 다름이 없음을 확인하며, 신청기관의 권한 있는 대표자 또는 권한을 위임 받은 책임자의 명의로 적합성평가기관 인정매뉴얼(KAB-AM-CAB) 4.2에 따라 한국인정지원센터(KAB)의 인정을 신청합니다.</p>

		<div class="repre_area mt25">
			<dl class="repre_cont">
			  <dt>신청일</dt>
			  <dd><p>${fn:split(resultReqInfo.reqDate,'-')[0]}년  ${fn:split(resultReqInfo.reqDate,'-')[1]}월  ${fn:split(resultReqInfo.reqDate,'-')[2]}일</p></dd>
			</dl>
			<dl class="repre_cont">
			  <dt>성명</dt>
			  <dd><p>${resultReqInfo.reqName}</p></dd>
			</dl>
		</div>


		<p class="btn_area">
			<a href="/web/application/applicationList.do" class="btn_submit">확인</a>
		</p>
	</div>
	<%@include file="../_inc/footer.jsp"%>
</body>
</html>