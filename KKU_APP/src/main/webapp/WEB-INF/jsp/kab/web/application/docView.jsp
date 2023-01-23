<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("newLineChar", "&lt;br/&gt;"); %>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="3" />

<html lang="utf-8">
<head>
	<%@include file="../_inc/tit.jsp"%>
	<script>
		
		function fn_docCodeChange(val){/* &locIdx=${reqVO.locIdx} */
			location.href = '/web/application/docView.do?reqIdx=${reqVO.reqIdx}&docCode='+val;
		}
		
		function fn_docCategoryChange(val){
			val = encodeURIComponent(val); 
			location.href = '/web/application/docView.do?reqIdx=${reqVO.reqIdx}&docCode=${reqDocVO.docCode}&docCategory='+val;
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
				 <h2>문서대비표 작성</h2>
				 <ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
					<li>인정신청</li>
					<li>문서대비표 작성</li>
				</ol>
			</div>

			<table class="table02" summary="인증기관 정보">
				<caption>인증기관 정보</caption>
				<colgroup><col width="12%"><col width="*"></colgroup>
				<tbody>
					<tr>
						<th scope="row">인증기관<span class="star">*</span></th>
						<td>${resultCompVO.orgNmKr}</td>
					</tr>
					<tr>
						<th scope="row">소재지</th>
						<td>${fn:split(resultCompLoc.adrKr,'|')[0]} ${fn:split(resultCompLoc.adrKr,'|')[1]}</td>
					</tr>
					<tr scope="row">
						<th scope="row" rowspan="3">평가범위<span class="star">*</span></th>
						<td>
							<table class="intable" summary="평가범위 내용">
							<caption>평가범위 내용</caption>
							<colgroup><col width="15%"><col width="*"><col width="15%"></colgroup>
								<tbody>
									<tr>
										<th scope="col">인정스킴(약자)</th>
										<th scope="col">분류</th>
										<th scope="col">평가종류</th>
									</tr>
									<%-- <c:forEach var="item" items="${reqSchemeList}">
										<tr>
											<td>${item.schEnPjt}</td>
											<td>${item.schFullNameStuff}</td>
											<td>
												<c:forEach var="item1" items="${reqType}">
													<c:if test="${item1.cdVal2 eq item.reqType}">${item1.cdName2}</c:if>
												</c:forEach>
											</td>
										</tr>
									</c:forEach> --%>
									<%-- <c:choose>
										<c:when test="${reqVO.reqType eq '2'}">
											<c:forEach var="item" items="${reqSchemeList1}">
												<tr>
													<td class="c">${item.schEnPjt}</td>
													<td>${item.schFullNameStuff}</td>
													<td class="c">
														<c:forEach var="item1" items="${reqType}">
															<c:if test="${item1.cdVal2 eq item.reqType}">${item1.cdName2}</c:if>
														</c:forEach>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise> --%>
											<c:forEach var="item" items="${reqSchemeList}">
												<tr>
													<td class="c">${item.schEn}</td>
													<td>${item.schFullNameStuff}</td>
													<td class="c">
														<c:forEach var="item1" items="${reqType}">
															<c:if test="${item1.cdVal2 eq item.reqType}">${item1.cdName2}</c:if>
														</c:forEach>
													</td>
												</tr>
											</c:forEach>
									<%-- 	</c:otherwise>
									</c:choose> --%>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>	
			<!-- 셀렉 항목에 따라 아래의 표 DB값이 변경됩니다 -->
			
			<!-- 셀렉 항목에 따라 아래의 표 DB값이 변경됩니다 -->
			<div class="check_legend02">
				<c:choose>
					<c:when test="${reqVO.reqType eq '2' }">
						<select id="docCode" style="width: 200px" onChange="fn_docCodeChange(this.value);">
							<option value="KAB-R-MSCB" <c:if test="${reqDocVO.docCode eq 'KAB-R-MSCB'}">selected</c:if>>KAB-R-MSCB</option>
							<c:forEach var="item" items="${reqSchemeList1}">
								<option value="${item.docSr}"<c:if test="${reqDocVO.docCode eq item.docSr}">selected</c:if>>${item.docSr}</option>
							</c:forEach>
							<c:forEach var="item" items="${reqSchemeList}">
								<c:if test="${item.schScheme eq '5'}"><option value="KAB-AR-MD9" <c:if test="${reqDocVO.docCode eq 'KAB-AR-MD9'}">selected</c:if>>KAB-AR-MD9</option><!-- KAB-AR --></c:if>
								<c:if test="${item.schScheme eq '11'}"><option value="KAB-AR-MD22" <c:if test="${reqDocVO.docCode eq 'KAB-AR-MD22'}">selected</c:if>>KAB-AR-MD22</option><!-- KAB-AR --></c:if>
							</c:forEach>
						</select>
					</c:when>
					<c:otherwise>
						<select id="docCode" style="width: 200px" onChange="fn_docCodeChange(this.value);">
							<option value="KAB-R-MSCB" <c:if test="${reqDocVO.docCode eq 'KAB-R-MSCB'}">selected</c:if>>KAB-R-MSCB</option>
							<c:forEach var="item" items="${docCodeList}">
								<option value="${item.docSr}"<c:if test="${reqDocVO.docCode eq item.docSr}">selected</c:if>>${item.docSr}</option>
							</c:forEach>
							<c:forEach var="item" items="${reqSchemeList}">
								<c:if test="${item.schScheme eq '5'}"><option value="KAB-AR-MD9" <c:if test="${reqDocVO.docCode eq 'KAB-AR-MD9'}">selected</c:if>>KAB-AR-MD9</option><!-- KAB-AR --></c:if>
								<c:if test="${item.schScheme eq '11'}"><option value="KAB-AR-MD22" <c:if test="${reqDocVO.docCode eq 'KAB-AR-MD22'}">selected</c:if>>KAB-AR-MD22</option><!-- KAB-AR --></c:if>
							</c:forEach>
						</select>	
					</c:otherwise>
				</c:choose>
				
				<ul class="arti_tab">
					<c:forEach var="item" items="${docCategory}" varStatus="stat">
						<c:choose>
							<c:when test="${item.docCategory eq 9999 }">
							<c:set var="string1" value="${fn:replace(item.docCategory,'9999','부속서')}"/>
								<li><a href="javascript:fn_docCategoryChange('${item.docCategory}');" <c:if test="${reqDocVO.docCategory eq item.docCategory}">class="on"</c:if>>${string1}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="javascript:fn_docCategoryChange('${item.docCategory}');" <c:if test="${reqDocVO.docCategory eq item.docCategory}">class="on"</c:if>>${item.docCategory}항</a></li>	
							</c:otherwise>
						</c:choose>						
					</c:forEach>
				</ul>
			</div>

		<div class="scroll_box">
			<table class="table02" summary="조항 및 문서 내용">
				<caption>조항 및 문서 내용</caption>
				<colgroup>
					<col width="8%">
					<col width="38%">
					<col width="15%">
					<col width="*">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">조항번호</th>
						<th scope="col">조항 내용</th>
						<th scope="col">적합성평가기관문서<br>및 조항번호
						</th>
						<th scope="col">문서내용 및 확인내용</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(docList) > 0}">
							<c:forEach var="item" items="${docList}">
							
								<input type="hidden" name="dtIdxArr"		value="${item.dtIdx}" />
								<input type="hidden" name="docCodeNumArr" 	value="${item.docCodeNum}" />
								<input type="hidden" name="docTitleArr" 	value="${item.docTitle }" />
								<input type="hidden" name="docContentsArr" 	value="${item.docContents }" />
								<input type="hidden" name="docDepthArr" 	value="${item.docDepth }" />
								<input type="hidden" name="cbDateArr" 		value="${item.cbDate }" />
								<input type="hidden" name="cbTitlePrevArr" 	value="${item.cbTitle}" />
								<input type="hidden" name="dtCodePrevArr" 	value="${item.dtCode}" />
								
										
								<tr>
									<th class="sub_th">
										<c:choose>
											<c:when test="${reqDocVO.docCategory eq 9999 }">
												<c:set var="chDocCodeNum" value="${fn:replace(item.docCodeNum,'9999','부속서')}"/>
												${chDocCodeNum}
											</c:when>
											<c:otherwise>
												${item.docCodeNum}
											</c:otherwise>
										</c:choose>
									</th>
									<td>
										<div class="article">
											<p class="tt">${item.docTitle}</p>
											${fn:replace(item.docContents, newLineChar, "<br>")}
										</div>
									</td>
									<td style="text-align:center;">${item.dtCode}</td>
									<td>
										<c:choose>
											<c:when test="${item.docContents ne ''}">
												<div class="docu_msg">
													<div class="msg01">
														${item.cbTitle}
														<c:if test="${item.cbTitle ne ''}">
															<p class="msg_date">
																<span>${item.regName}</span>${item.cbDate}
															</p>
														</c:if>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="docu_msg"  style="display:none;">
													<div class="msg01">
														<%-- <textarea style="width: 100%;" cols="20" rows="3" name="cbTitleArr" placeholder="입력해주세요.">${item.cbTitle}</textarea> 
														<c:if test="${item.cbTitle ne ''}">
															<p class="msg_date">
																<span>${item.regName}</span>${item.cbDate}
															</p>
														</c:if>--%>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="no_cont">
								<td colspan="4">문서 내용이 없습니다.</td>
							</tr>		
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
			<p class="check_legend">
				<b>분류</b> : C=적합, N=부적합(시정요구/인정정지/인정취소), R=권고사항, PD=보류, NA=해당없음
			</p>
			<p class="btn_area">
				<a href="/web/application/applicationList.do" class="btn_submit">확인</a>
			</p>
		</div>
		<%@include file="../_inc/footer.jsp"%>
	</div>
</body>

</html>