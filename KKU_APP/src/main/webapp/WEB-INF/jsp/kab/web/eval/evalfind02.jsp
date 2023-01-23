<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="2" />

<html lang="utf-8">
<head>
	<%@include file="../_inc/tit.jsp"%>
	<script>
		//문서체계 코드 변경
		function fn_docCodeChange(val){
			location.href = '/web/eval/evalfind02.do?plnIdx=${planMasterVO.plnIdx}&docCode='+val;
		}
		// 문서체계 항 변경
		function fnDocCategoryChange(val) {
			val = encodeURIComponent(val);
			location.href = '/web/eval/evalfind02.do?plnIdx=${planMasterVO.plnIdx}&docCode=${docVO.docCode}&docCategory='+val;		
		}
		function fnSubmit(){
			if("${resultInfo.repUserDate}"==''){
				if($('#orgUserNm').val()!=''){
					$('#frm').attr("action","/web/eval/evalDocConfirm.do?plnIdx=${planMasterVO.plnIdx}");
					$('#frm').submit();		
				}else{
					alert('서명란에 서명을 확인해주세요.');
				}
			}else {
				alert('이미 확인된 보고서입니다.');
			}
		}
		
		// 확인결과 팝업창
		function performDocResultPop(idx) {
			var w = 500;
			var h = 480;
			var winX = window.screenLeft;	//내 컴퓨터 화면 가로 사이즈
		 	var winY = window.screenTop;	//내 컴퓨터 화면 세로 사이즈
		 	var bodyW = document.body.clientWidth;	//브라우저 현재 너비
		 	var bodyH = document.body.clientHeight; //브라우저 현재 높이 
		    var left = (winX) + ((bodyW-w)/2);
			var top  = (winY) + ((bodyH-h)/2);
			window.open('/web/eval/evalDocResultPop.do?dtIdx='+idx+'&plnIdx=${planMasterVO.plnIdx}','_blank','scrollbars=1,width='+w+', height='+h+'; top='+top+', left='+left);
		}//performDocResultPop -end
		
		// 주요 확인사항 수정
		function docResultUpdate(idx) {
			if(confirm("주요 확인사항을 수정하시겠습니까?")) {
				if(idx != "") {
					$.ajax({
						type: "post",
						url: "/web/eval/docResultUpdate.do",
						data: {
							dtIdx : idx,
							abTitle : $("#abTitle"+idx).val()
						},
						async: false,
						success: function(data) {
							if(data.trim() == "Y") {
								alert("정상적으로 수정되었습니다.");
								location.reload();
							} else {
								alert("잘못된 접근입니다.");
							}
						},
						error: function(xhr, status, error) {
							alert("error");
						}
					});
				} else {
					alert("잘못된 접근입니다.");
				}
			}
		}//docResultUpdate -end
		
		$(document).on("keyup","#orgUserNm",function(){
			$("#repUserNm").val($(this).val());
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
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
					<li>평가관리</li>
					<li>문서평가</li>
				</ol>
	</div>
	
	<ul class="tab">
		<li><a href="/web/eval/evalfind01.do?plnIdx=${planMasterVO.plnIdx}">문서대비표</a></li>
		<li class="on"><a href="/web/eval/evalfind02.do?plnIdx=${planMasterVO.plnIdx}">문서평가 결과보고서</a></li>
	</ul>

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

 
	<%-- <!-- 셀렉 항목에 따라 아래의 표 DB값이 변경됩니다 -->
	<div class="check_legend02">
		<select id="docCode" style="width: 200px" onChange="fn_docCodeChange(this.value);">
			<option value="KAB-R-MSCB" <c:if test="${docVO.docCode eq 'KAB-R-MSCB' }">selected</c:if>>KAB-R-MSCB</option>
				<c:forEach var="item" items="${docCodeList}">
					<option value="${item.docCode }" <c:if test="${docVO.docCode eq item.docCode }">selected</c:if>>${item.docCode }</option>
				</c:forEach>
			<option value="" <c:if test="${reqDocVO.docCode eq 'KAB-AR'}">selected</c:if>>KAB-AR 문서류</option> <!-- KAB-AR -->
		</select>
		<ul class="arti_tab">
			<c:forEach var="item" items="${docCategory}" varStatus="stat">
				<c:choose>
					<c:when test="${fn:length(docCategory) ne stat.count}">
						<li><a href="javascript:fnDocCategoryChange('${item.docCodeNum}');" <c:if test="${docVO.docCategory eq item.docCodeNum}">class="on"</c:if>>${item.docCodeNum}항</a></li>	
					</c:when>
					<c:otherwise>
						<li><a href="javascript:fnDocCategoryChange('${item.docCodeNum}');" <c:if test="${docVO.docCategory eq item.docCodeNum}">class="on"</c:if>>${item.docCodeNum}</a></li>
					</c:otherwise> 
				</c:choose>
			</c:forEach>
		</ul>
	</div> --%>
	
	<div class="scroll_box">
		<table class="table02" summary="문서평가 결과보고서">
		<caption>문서평가 결과보고서</caption>
		<colgroup><col width="12%"><col width="8%"><col width="*"><col width="10%"><c:if test="${!empty resultInfo.repUserDate}"><col width="15%"></c:if><%-- <col width="10%"> --%></colgroup>
			<thead>
				<tr>
					<th scope="col">문서체계</th>
					<th scope="col">인정기준 조항</th>
					<th scope="col">주요 확인사항</th>
					<th scope="col">분류</th>
					<c:if test="${!empty resultInfo.repUserDate}">
						<th scope="col">시정조치 상태</th>
					</c:if>
					<!-- <th scope="col">관리</th> -->
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(resultList) > 0}">
						<c:forEach var="item" items="${resultList }">
							<tr>
								<th class="sub_th">${item.docCode }</th>
								<th class="sub_th">
									<c:set var="doc1" value="${fn:replace(item.docCodeNum,'.',' ')}"/>
									<c:set var="docCate" value="${fn:split(doc1,' ')[0]}"/>	
									<c:choose>
										<c:when test="${docCate eq 9999}">
											<c:set var="chDocCodeNum" value="${fn:replace(item.docCodeNum,'9999','부속서')}"/>
											${chDocCodeNum}
										</c:when>
										<c:otherwise>
											${item.docCodeNum}		
										</c:otherwise>
									</c:choose>
								</th>
								<td class="l">
									<div class="docu_msg">
										<p class="msg02">
											<c:choose>
												<c:when test="${item.abTitleUpdate eq null }">
													${item.abTitle}<%-- <input type="text" id="abTitle${item.dtIdx }" name="abTitle" value="" /> --%>
												</c:when>
												<c:otherwise>
													${item.abTitleUpdate }<%-- <input type="text" id="abTitle${item.dtIdx }" name="abTitle" value="" /> --%>
												</c:otherwise>
											</c:choose>
										</p>
									</div>
								</td>
								<td class="c">${item.dtType }</td>
								<c:if test="${!empty resultInfo.repUserDate}">  <!-- 시정조치 상태 -->
									<td class="c"> 
										<c:if test="${item.dtType eq 'N'}">
											<a class="sm_line" href="javascript:;" onclick="performDocResultPop('${item.dtIdx}');">
												<c:choose>
													<c:when test="${item.docMemoAb eq ''}">조치중</c:when>
													<c:otherwise>완료</c:otherwise>
												</c:choose>
											</a>
										</c:if>
									</td>
								</c:if>
								<%-- <td class="c"><a class="sm_blue" href="javascript:;" onclick="docResultUpdate('${item.dtIdx}');">수정</a></td> --%>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${!empty resultInfo.repUserDate}">
								<tr class="no_cont"><td colspan="5">결과보고서 내용이 없습니다.</td></tr>
							</c:when>
							<c:otherwise>
								<tr class="no_cont"><td colspan="4">결과보고서 내용이 없습니다.</td></tr>
							</c:otherwise>
						</c:choose>				
						<!-- <tr class="no_cont"><td colspan="5">결과보고서 내용이 없습니다.</td></tr> -->
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<p class="check_legend">
		<b>분류</b> : C=적합, N=부적합(시정요구/인정정지/인정취소), R=권고사항, PD=보류<!-- , NA=해당없음 -->
	</p>
	<p class="office_sign">인정평가팀과 신청기관은 상기 내용이 협의를 통해 합의되었음을 확인합니다.
		<%-- <c:choose>
			<c:when test="${empty resultRepInfo.repIdx}">
				<br>${fn:split(today, '-')[0]}년 ${fn:split(today, '-')[1]}월 ${fn:split(today, '-')[2]}일
			</c:when>
			<c:otherwise>
				<br>${fn:split(resultInfo.repUserDate, '-')[0]}년 ${fn:split(resultInfo.repUserDate, '-')[1]}월 ${fn:split(resultInfo.repUserDate, '-')[2]}일
			</c:otherwise>
		</c:choose> --%>
	</p>
	<table class="table02 sign" summary="협의내용 확인 서명">
						<caption>협의내용 확인 서명</caption>
						<tr class="c">
							<th>인정평가팀장<br>확인</th>
							<td>${resultInfo.repLeaderNm}</td>
							<th>경영자대리인<br>확인</th>
							<td>
								<c:choose>
									<c:when test="${resultInfo.repUserNm eq null }">
										<input type="text" name="orgUserNm" id="orgUserNm" onKeyup="this.value=this.value.replace(/[a-zA-Z0-9]/g,'');" required>
									</c:when>
									<c:otherwise>${resultInfo.repUserNm}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr class="c">
							<th>확인일시</th>
							<td>
								<c:choose>
									<c:when test="${empty resultInfo.repLeaderDate}">
									-
									</c:when>
									<c:otherwise>
										${fn:split(resultInfo.repLeaderDate, '-')[0]}년 ${fn:split(resultInfo.repLeaderDate, '-')[1]}월 ${fn:split(resultInfo.repLeaderDate, '-')[2]}일
									</c:otherwise>
								</c:choose>
							</td>
							<th>확인일시</th>
							<td>
								<c:choose>
									<c:when test="${empty resultInfo.repUserDate}">
									-
									</c:when>
									<c:otherwise>
										${fn:split(resultInfo.repUserDate, '-')[0]}년 ${fn:split(resultInfo.repUserDate, '-')[1]}월 ${fn:split(resultInfo.repUserDate, '-')[2]}일
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
	<p class="btn_area">
		<c:if test="${empty resultInfo.repUserDate}">
			<a href="javascript:fnSubmit();" class="btn_line">결과보고서 확인완료</a>
		</c:if>
	</p>
	
	<form name="frm" id="frm" autocomplete="off" method="post">
		<input type="hidden" name="repUserIdx" value="${resultCompVO.orgIdx}">
		<input type="hidden" name="repUserNm" id="repUserNm" value="">
		<input type="hidden" name="repIdx" id="repIdx" value="${resultInfo.repIdx}">
		<input type="hidden" name="repUserDate" value="${today}">
	</form>
		</div>
		<%@include file="../_inc/footer.jsp"%>
	</div>
</body>

</html>