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
	//문서체계 코드 변경
	function fn_docCodeChange(val){
		location.href = '/web/eval/evalfind01.do?plnIdx=${planMasterVO.plnIdx}&docCode='+val;
	}
	
	
	// 문서체계 항 변경
	function fnDocCategoryChange(val) {
		val = encodeURIComponent(val);
		location.href = '/web/eval/evalfind01.do?plnIdx=${planMasterVO.plnIdx}&docCode=${docVO.docCode}&docCategory='+val;		
	}
	
	function fn_submit(mode){
		if(mode=='update'){
			$('#frm').attr("action","/web/eval/evalUpdate.do");
			$('#frm').submit();
		}else if (mode=='submit'){
			$('#frm').attr("action","url");
			$('#frm').submit();
		}
	}
	
	function fn_confirm(idx){
		if(confirm("확인요청하시겠습니까?")){
			location.href = '/web/eval/request.do?plnIdx=' + idx;
		}
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
					<li><img src="/_img/web/comn/loca_home.png"
						alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
					<li>평가관리</li>
					<li>문서평가</li>
				</ol>
			</div>

			<ul class="tab">
				<li class="on"><a href="/web/eval/evalfind01.do?plnIdx=${planMasterVO.plnIdx}">문서대비표</a></li>
				<c:if test="${!empty reportChk}">
					<li><a href="/web/eval/evalfind02.do?plnIdx=${planMasterVO.plnIdx}">문서평가 결과보고서</a></li>
				</c:if>
			</ul>
	<form id="frm" method="post">
			<input type="hidden" name="plnIdx" value="${planInfo.plnIdx}">
			<input type="hidden" name="docCode" value="${docVO.docCode}">
			<input type="hidden" name="docCategory" value="<c:out value='${docVO.docCategory}'/>">
			
			<table class="table02" summary="인증기관 정보">
				<caption>인증기관 정보</caption>
				<colgroup><col width="12%"><col width="38%"><col width="12%"><col width="19%"><col width="19%"></colgroup>
				<tbody>
					<tr>
						<th scope="row">인증기관<span class="star">*</span></th>
						<td>${resultCompVO.orgNmKr}</td>
						<th scope="row">평가단계</th>
						<td colspan="2">
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
						<td colspan="4">${fn:split(resultCompLoc.adrKr,'|')[0]} ${fn:split(resultCompLoc.adrKr,'|')[1]}</td>
					</tr>
					<tr scope="row">
						<th scope="row" rowspan="3">평가범위<span class="star">*</span></th>
						<td colspan="4">
							<table class="intable" summary="평가범위 내용">
							<caption>평가범위 내용</caption>
							<colgroup><col width="15%"><col width="40%"><col width="15%"></colgroup>
								<tbody>
									<tr>
										<th scope="col">인정스킴(약자)</th>
										<th scope="col">분류</th>
										<th scope="col">평가종류</th>
									</tr>
									<c:forEach var="item" items="${resultSchemeList}">
										<tr>
											<td class="c">${item.schEn}</td>
											<td>${item.schSchemeValue}</td>
											<td class="c">
												${item.schRan}
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="check_legend02">
				<select id="docCode" style="width: 200px" onChange="fn_docCodeChange(this.value);">
					<option value="KAB-R-MSCB" <c:if test="${docVO.docCode eq 'KAB-R-MSCB' }">selected</c:if>>KAB-R-MSCB</option>
					<c:forEach var="item" items="${docCodeList}">
						<option value="${item.docCode }" <c:if test="${docVO.docCode eq item.docCode }">selected</c:if>>${item.docCode}</option>
					</c:forEach>
					<c:forEach var="item" items="${resultSchemeList}">
						<c:if test="${item.schScheme eq '5'}"><option value="KAB-AR-MD9" <c:if test="${reqDocVO.docCode eq 'KAB-AR-MD9'}">selected</c:if>>KAB-AR-MD9</option><!-- KAB-AR --></c:if>
						<c:if test="${item.schScheme eq '11'}"><option value="KAB-AR-MD22" <c:if test="${reqDocVO.docCode eq 'KAB-AR-MD22'}">selected</c:if>>KAB-AR-MD22</option><!-- KAB-AR --></c:if>
					</c:forEach>
				</select>
				<ul class="arti_tab">
					<c:forEach var="item" items="${docCategory}" varStatus="stat">
						<c:choose>
							<c:when test="${item.docCategory eq 9999 }">
							<c:set var="string1" value="${fn:replace(item.docCategory,'9999','부속서')}"/>
								<li><a href="javascript:fnDocCategoryChange('${item.docCategory}');" <c:if test="${docVO.docCategory eq item.docCategory}">class="on"</c:if>>${string1}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="javascript:fnDocCategoryChange('${item.docCodeNum}');" <c:if test="${docVO.docCategory eq item.docCodeNum}">class="on"</c:if>>${item.docCodeNum}항</a></li>	
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
					<col width="35%">
					<col width="15%">
					<col width="*">
					<col width="12%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">조항번호</th>
						<th scope="col">조항 내용</th>
						<th scope="col">적합성평가기관문서<br>및 조항번호</th>
						<th scope="col">문서내용 및 확인내용</th>
						<th scope="col">평가 결과</th>
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
											<c:when test="${docVO.docCategory eq 9999}">
												<c:set var="chDocCodeNum" value="${fn:replace(item.docCodeNum,'9999','부속서')}"/>
												${chDocCodeNum}
											</c:when>
											<c:otherwise>
												${item.docCodeNum }		
											</c:otherwise>
										</c:choose>
									</th>
									<td>
										<div class="article">
											<p class="tt">${item.docTitle}</p>
											${fn:replace(item.docContents, newLineChar, "<br>")}
										</div>
									</td>
									<td class="c">
										<c:choose>
											<c:when test="${item.docContents ne ''}">
												<input type="text" id="dtCode" name="dtCodeArr" value="${item.dtCode}"> 
												<label class="f_0">적합성평가기관문서 및 조항번호 입력</label>
												
											</c:when>
											<c:otherwise>
												<input type="hidden" id="dtCode" name="dtCodeArr" value="${item.dtCode}"> 
												<label class="f_0">적합성평가기관문서 및 조항번호 입력</label>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${item.docContents ne ''}">
												<div class="docu_msg">
													<div class="msg01">
														<textarea style="width: 100%;" cols="20" rows="3" name="cbTitleArr" placeholder="입력해주세요.">${item.cbTitle}</textarea>
														<c:if test="${item.cbTitle ne ''}">
															<p class="msg_date">
																<span>${item.regName}</span>${item.cbDate}
															</p>
														</c:if>
													</div>
													<c:if test="${item.abTitle ne '' }">
														<div class="msg02">
															${item.abTitle}
															<p class="msg_date"><span>${item.abName}</span>${item.abDate}</p>
														</div>
													</c:if>
												</div>
											</c:when>
											<c:otherwise>
												<div class="docu_msg"  style="display:none;">
													<div class="msg01">
														<textarea style="width: 100%;" cols="20" rows="3" name="cbTitleArr" placeholder="입력해주세요.">${item.cbTitle}</textarea>
														<c:if test="${item.cbTitle ne ''}">
															<p class="msg_date">
																<span>${item.regName}</span>${item.cbDate}
															</p>
														</c:if>
													</div>
													<div class="msg02">
														${item.abTitle}
														<p class="msg_date"><span>${item.abName}</span>${item.abDate}</p>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="c">
										<c:choose>
											<c:when test="${not empty item.dtCode }">
												<input type="hidden" name="dtTypeArr" value="" />
												<c:forEach var="rev_answer" items="${rev_answer }">
													<c:if test="${item.dtType eq rev_answer.cdVal2 }">${rev_answer.cdVal2 }</c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<input type="hidden" name="dtTypeArr" value="" />
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="no_cont">
								<td colspan="5">문서 내용이 없습니다.</td>
							</tr>		
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		</form>
			<p class="check_legend">
				<b>분류</b> : C=적합, N=부적합(시정요구/인정정지/인정취소), R=권고사항, PD=보류, NA=해당없음 
			</p>
			<p class="btn_area">
				<c:if test="${(verifyChk.usercnt eq 0 and verifyChk.resultcnt eq 0) or ( verifyChk.usercnt ne verifyChk.resultcnt) or ( verifyChk.usercnt eq null and verifyChk.resultcnt eq null)}">
					<a href="javascript:fn_submit('update')" class="btn_line">저장</a> 
					<a href="javascript:fn_confirm('${planMasterVO.plnIdx}')" class="btn_submit l">AB확인요청</a>
					<!-- <a href="notice.html" class="btn_list">목록</a> -->
				</c:if>
			</p>
		</div>
		<%@include file="../_inc/footer.jsp"%>
</body>

</html>