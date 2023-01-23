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
	$(document).ready(function() {
		var minDate = new Date();
	    var max30Date = new Date();
	    max30Date.setDate(max30Date.getDate() + 30);
	    var max30DateYear = max30Date.getFullYear();
	    var max30DateMonth = max30Date.getMonth() + 1;
	    var max30DateDate = max30Date.getDate();
	    max30DateMonth = max30DateMonth > 9 ? max30DateMonth : "0" + max30DateMonth;
	    max30DateDate  = max30DateDate > 9 ? max30DateDate : "0" + max30DateDate;
		var max30DateVal = max30DateYear + "-" + max30DateMonth + "-" + max30DateDate;
	    var max90Date = new Date();
	    max90Date.setDate(max90Date.getDate() + 90);
	    var max90DateYear = max90Date.getFullYear();
	    var max90DateMonth = max90Date.getMonth() + 1;
	    var max90DateDate = max90Date.getDate();
	    max90DateMonth = max90DateMonth > 9 ? max90DateMonth : "0" + max90DateMonth;
	    max90DateDate  = max90DateDate > 9 ? max90DateDate : "0" + max90DateDate;
		var max90DateVal = max90DateYear + "-" + max90DateMonth + "-" + max90DateDate;
	    
		if($("#disIdx").val() == ""){
			$("#C0").attr('checked', true);
		}
		
		if($("input[value='C4']").is(":checked")){
			$("#disConfRstDt").removeClass("gray");
		}else{
			$("#disConfRstDt").addClass("gray");
		}
		
		$(document).on("change", ".pdate", function() {
			if($("input[value='A']").is(":checked")){
				$("#disPlanDate2").addClass("gray");
				$("#disPlanDate3").addClass("gray");
				$("#disPlanDate1").removeClass("gray");
				$('.date1').datepicker('destroy');
				$('.date2').datepicker('destroy');
				$(".date").datepicker({
					minDate : minDate,
				    maxDate : max30Date,
					changeMonth: true,
					changeYear: true
				});
				$("#disPlanDate2").val("");
				$("#disPlanDate2").datepicker('destroy');
				$("#disPlanDate3").val("");
				$("#disPlanDate3").datepicker('destroy');
				$("#disPlanDate1").val(max30DateVal);
			}
			
			if($("input[value='B']").is(":checked")){
				$("#disPlanDate1").addClass("gray");
				$("#disPlanDate2").removeClass("gray");
				$("#disPlanDate3").removeClass("gray");
				$('.date').datepicker('destroy');
				$(".date1").datepicker({
					minDate : minDate,
				    maxDate : max30Date,
					changeMonth: true,
					changeYear: true
				});
				$(".date2").datepicker({
					minDate : minDate,
				    maxDate : max90Date,
					changeMonth: true,
					changeYear: true
				});
				$("#disPlanDate1").val("");
				$("#disPlanDate1").datepicker('destroy');
				$("#disPlanDate2").val(max30DateVal);
				$("#disPlanDate3").val(max90DateVal);
			}
			
			$('#disSubDate').datepicker('destroy');
			$('#disConfDate').datepicker('destroy');
			$('#disConfRstDt').datepicker('destroy');
			
			$("#disSubDate").datepicker({
				changeMonth: true,
				changeYear: true
			});
			$("#disConfDate").datepicker({
				changeMonth: true,
				changeYear: true
			});
			$("#disConfRstDt").datepicker({
				changeMonth: true,
				changeYear: true
			});
		});
		
		$(document).on("change", ".disConfRstCd", function() {
			if($("input[value='C4']").is(":checked")){
				$("#disConfRstDt").removeClass("gray");
			}else{
				$("#disConfRstDt").addClass("gray");
			}
		});
		
		if($("input[value='A']").is(":checked")){
			$('.date').datepicker('destroy');
			$(".date").datepicker({
				minDate : minDate,
			    maxDate : max30Date,
				changeMonth: true,
				changeYear: true
			});
		}if($("input[value='B']").is(":checked")){
			$('.date').datepicker('destroy');
			$(".date").datepicker({
				minDate : minDate,
			    maxDate : max90Date,
				changeMonth: true,
				changeYear: true
			});
		}

		if($("input[value='A']").is(":checked")){
			$("#disPlanDate2").addClass("gray");
			$("#disPlanDate3").addClass("gray");
			$("#disPlanDate1").removeClass("gray");
			$('.date').datepicker('destroy');
			$(".date").datepicker({
				minDate : minDate,
			    maxDate : max30Date,
				changeMonth: true,
				changeYear: true
			});
			$("#disPlanDate2").val("");
			$("#disPlanDate2").datepicker('destroy');
			$("#disPlanDate3").val("");
			$("#disPlanDate3").datepicker('destroy');
			
		}if($("input[value='B']").is(":checked")){
			$("#disPlanDate1").addClass("gray");
			$("#disPlanDate2").removeClass("gray");
			$("#disPlanDate3").removeClass("gray");
			$('.date').datepicker('destroy');
			$(".date").datepicker({
				minDate : minDate,
			    maxDate : max90Date,
				changeMonth: true,
				changeYear: true
			});
			$("#disPlanDate1").val("");
			$("#disPlanDate1").datepicker('destroy');
		}
		
		$(".cal1").click(function(){
		    $("#disPlanDate1").datepicker("show");
		}); 
		 
		$(".cal2").click(function(){
		    $("#disPlanDate2").datepicker("show");
		});
		
		$(".cal3").click(function(){
		    $("#disPlanDate3").datepicker("show");
		});
		
		$(".cal4").click(function(){
		    $("#disSubDate").datepicker("show");
		});
		
		$(".cal5").click(function(){
		    $("#disConfDate").datepicker("show");
		});
		
		$(".cal6").click(function(){
		    $("#disConfRstDt").datepicker("show");
		});
		
		$("#input_usr_file").on("change",function(){
			var f_val = $("#input_usr_file").val().split('\\');
			var s_val= f_val[f_val.length-1];
			$("#fileInfo").attr("value",s_val);	
		});	
		
		$('#disSubDate').datepicker('destroy');
		$('#disConfDate').datepicker('destroy');
		$('#disConfRstDt').datepicker('destroy');
		
		$("#disSubDate").datepicker({
			changeMonth: true,
			changeYear: true
		});
		$("#disConfDate").datepicker({
			changeMonth: true,
			changeYear: true
		});
		$("#disConfRstDt").datepicker({
			changeMonth: true,
			changeYear: true
		});
		
	});

	function submit(mode) {
		if (isSubmit()) {
			if (mode == 'ins') {
				$("#frm").attr("action", "/web/eval/discoveryUpdate.do?evalDiv=${evalDiv}&orgDiv=${orgDiv}&tab=${tab}");
				$("#frm").submit();
			}/*  else if (mode == 'mod') {
				$("#frm").attr("action", "/kabadm/perform/discoveryUpdate.do?evalDiv=${evalDiv}&orgDiv=${orgDiv}&tab=${tab}&leader=${leader}");
				$("#frm").submit();
			} else if (mode == 'del') {
				if(confirm('정말 삭제하시겠습니까?')){
					$("#frm").attr("action", "/kabadm/perform/discoveryDelete.do?evalDiv=${evalDiv}&orgDiv=${orgDiv}&tab=${tab}");
					$("#frm").submit();
				}
			} */
		} 
	}
	
	function compactTrim(str) {
		return str.replace(/(\s*)/g, "");
	}
	
	function isSubmit() {
		var isPass = true;
		
		$("input[required]").each(function() {
			if (compactTrim($(this).val()) == "") {
				$(this).focus();
				alert($(this).data("msg") + " 입력해 주세요.");
				return isPass = false;
			}
		});
		
		return isPass;
	}
	
	function openFile(){
		$("#input_usr_file").trigger("click");
	}
	
	function fnDelFile(){
		$("#fileDel").val("Y");
		$("#fileLink").css("display", "none");
	}
	
	//사용자 시정조치계획결과 최종확인
	function fnConfirmRep(){
		$('#frm').attr("action","/web/eval/discoveryConfirm.do");
		$("#frm").submit();
	}

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
  <form name="frm" id="frm" autocomplete="off" method="post" onsubmit="return isSubmit();" enctype="multipart/form-data">
			 	<input type="hidden" id="disType" name="disType" value="U"/>
			 	<input type="hidden" id="disState" name="disState" value="${resultMap.disState}"/>
				<input type="hidden" id="disIdx" name="disIdx" value="${resultMap.disIdx}"/>
				<input type="hidden" name="plnIdx" id="plnIdx" value="${planMasterVO.plnIdx}">
				<input type="hidden" name="pageIndex" id="pageIndex" value="${discoveryVO.pageIndex}" />
				<input type="hidden" name="evalDiv" id="evalDiv" value="${evalDiv}" />
				<input type="hidden" name="orgDiv" id="orgDiv" value="${orgDiv}" />
				<input type="hidden" name="tab" id="tab" value="${tab}" />
		<table class="table02" summary="부적합사항 등록">
			<caption>부적합사항 등록</caption>
			<colgroup><col width="15%"><col width="*"><col width="12%"><col width="18%"><col width="15%"><col width="20%"></colgroup>
			<tbody>
				<tr>
					<th scope="row">발행번호</th>
					<td>${resultMap.disNo}</td>
					<th scope="row">발행자</th>
					<td class="c">
						<c:choose>
							<c:when test="${empty discoveryVO.disIdx}">
								<input id="disNm" name="disNm" value="${usrNmKr}" type="hidden""/>
								${usrNmKr}
							</c:when>
							<c:otherwise>
								<input id="disNm" name="disNm" value="${resultMap.disNm}" type="hidden""/>
								${resultMap.disNm}
							</c:otherwise>
						</c:choose>
					</td>
					<th scope="col">평가단계</th>
					<td>
						<c:choose>
							<c:when test="${evalDiv eq 'D' }">문서</c:when>
							<c:when test="${evalDiv eq 'O' }">사무소</c:when>
							<c:when test="${evalDiv eq 'A' }">입회</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="col">부적합내용 요약</th>
					<td colspan="3">${resultMap.disSummary}</td>
					<th scope="col" rowspan="2">인정기준 및 조항</th>
					<td rowspan="2">${resultMap.disDocNm} ${resultMap.disClauseDet}<br>${resultMap.addDisInfo}</td>
				</tr>
				<tr>
					<th scope="row">요구사항</th>
					<td colspan="3">
						${resultMap.disDemand}
					</td>
				</tr>
				
				<tr>
					<th scope="row">불일치사항 및<br>객관적 증거</th>
					<td colspan="5">
						${resultMap.disIssues}
					</td>
				</tr>
				<tr>
					<th scope="row" rowspan="4">시정조치 합의</th>
					<th class="sub_th" colspan="3">시정조치 방법</th>
					<th class="sub_th" colspan="2">완료예정일</th>
				</tr>
				<tr>
					<td colspan="3" class="ra_base">
						<c:forEach var="dis_act_type" items="${dis_act_type}" varStatus="status">
							<c:if test="${dis_act_type.cdVal2 eq 'A'}">
								<input type="radio" class="pdate" id="${dis_act_type.cdVal2}" name="disActType"
								<c:if test="${dis_act_type.cdVal2 eq resultMap.disActType || dis_act_type.cdVal2 eq discoveryVO.disActType}"> checked='checked'</c:if> value="${dis_act_type.cdVal2}"/>
								<label for="${dis_act_type.cdVal2}" class="mr15">${dis_act_type.cdName2}</label>
							</c:if>
						</c:forEach>
					</td>
					<td class="c">완료</td>
					<td class="c">
						<input class="w150 c date" id="disPlanDate1" name="disPlanDate1" type="text" value="${fn:substring(resultMap.disPlanDate1, 0, 10)}" readonly="readonly" /><!--
						--><label for="disPlanDate1" class="f_0">계약기간 설정</label><!--
						<!--<a href="javascript:void(0);" class="cal f_0 cal1">날짜선택</a> -->
					</td>
				</tr>
				<tr>
					<td colspan="3" rowspan="2" class="ra_base">
						<c:forEach var="dis_act_type" items="${dis_act_type}" varStatus="status">
							<c:if test="${dis_act_type.cdVal2 eq 'B'}">
								<input type="radio" class="pdate" id="${dis_act_type.cdVal2}" name="disActType"
								<c:if test="${dis_act_type.cdVal2 eq resultMap.disActType || dis_act_type.cdVal2 eq discoveryVO.disActType}"> checked='checked'</c:if> value="${dis_act_type.cdVal2}"/>
								<label for="${dis_act_type.cdVal2}" class="mr15">${dis_act_type.cdName2}</label>
							</c:if>
						</c:forEach>
					</td>
					<td class="c">제출</td>
					<td class="c">
						<input class="w150 c date1" id="disPlanDate2" name="disPlanDate2" value="${fn:substring(resultMap.disPlanDate2, 0, 10)}" type="text" readonly="readonly" /><!--
						--><label for="disPlanDate2" class="f_0">계약기간 설정</label><!--
						<!--<a href="javascript:void(0);" class="cal f_0 cal2">날짜선택</a> -->
					</td>
				</tr>
				<tr>
					<td class="c">완료</td>
					<td class="c">
						<input class="w150 c date2 " id="disPlanDate3" name="disPlanDate3" value="${fn:substring(resultMap.disPlanDate3, 0, 10)}" type="text" readonly="readonly" /><!--
						--><label for="disPlanDate3" class="f_0">계약기간 설정</label><!--
						<!-- <a href="javascript:void(0);" class="cal f_0 cal3">날짜선택</a> -->
					</td>
				</tr>
			</tbody>
		</table>
			
		<h4>시정조치 계획/시정조치 내용</h4>
		<table class="table02" summary="시정조치 계획/시정조치 내용 등록">
			<caption>시정조치 계획/시정조치 내용 등록</caption>
			<colgroup><col width="15%"><col width="*"></colgroup>
			<tbody>
				<tr>
					<th>시정조치 계획</th>
					<td class="c">
						<textarea style="width:100%;" id="disActCont" name="disActCont" cols="20" rows="3" title="요구사항 입력" placeholder="※ 근본원인 분석, 수평·수직 전개를 통한 유사부적합 발생가능성 분석, 재발방지대책을 포함할 것">${resultMap.disActCont}</textarea>
					</td>
				</tr>
				
				<tr>
					<th scope="row">첨부파일</th>
					<td>
						<input type="file" class="file" name="input_usr_file" id="input_usr_file" data-value="1"  data-value="2" style="display: none;" />
						<input type="hidden" name="usrFileNm" value="${resultMap.usrFileNm}"/>
						<input type="hidden" name="srvFileNm" value="${resultMap.srvFileNm}"/>
						
						<a href="javascript:openFile();" class="sm_line">파일검색</a>
						<input class="file" type="text" id="fileInfo" value="" placeholder="선택된 파일 없음" readonly="readonly">
						<label class="f_0">파일 등록</label>
						
						<c:url value="/fileDownload.do" var="fileUrl">
							<c:param name="srvFile" value="${resultMap.srvFileNm}" />
							<c:param name="usrFile" value="${fn:split(resultMap.usrFileNm,'|')[0]}" />
							<c:param name="folder" value="perform" />
						</c:url>
						
						<c:if test="${!empty resultMap.disIdx && !empty resultMap.usrFileNm}">
							<input type="hidden" id="fileDel" name="fileDel" value="N" />
							<p id="fileLink" style="display:block; margin-top:7px; margin-left:2px;">
								<a href="${fileUrl}" class="file" >${fn:split(resultMap.usrFileNm,'|')[0]}(${fn:split(resultMap.usrFileNm,'|')[1]})</a>
								<button class="sm_del" onclick="fnDelFile(); return false;" ></button>
							</p>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>

	<c:if test="${resultMap.disConfRstCd ne '' && resultMap.disConfRstCd ne null}">
		<h4>시정조치 계획 확인</h4>
		<table class="table02" summary="시정조치 계획/시정조치 내용 등록">
			<caption>시정조치 계획/시정조치 내용 등록</caption>
			<colgroup><col width="15%"><col width="*"></colgroup>
			<tbody>
				<tr>
					<th scope="row">제출일자</th>
					<td class="">${fn:split(fn:split(resultMap.disCbSubmitDate,' ')[0],'-')[0]}년 ${fn:split(fn:split(resultMap.disCbSubmitDate,' ')[0],'-')[1]}월 ${fn:split(fn:split(resultMap.disCbSubmitDate,' ')[0],'-')[2]}일<%-- ${fn:split(fn:split(resultMap.modDate,' ')[1],':')[0]}시 ${fn:split(fn:split(resultMap.modDate,' ')[1],':')[1]}분 --%></td>
					<th scope="row">제출기한</th>
					<td colspan="3">
						<c:forEach var="dis_sub_type" items="${dis_sub_type}" varStatus="status">
							<c:if test="${dis_sub_type.cdVal2 eq resultMap.disSubType || dis_sub_type.cdVal2 eq discoveryVO.disSubType}">${dis_sub_type.cdName2}</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th scope="row">확인내용</th>
					<td colspan="5">${resultMap.disConfCont}</td>
				</tr>
				<tr>
					<th scope="row" rowspan="2">확인결과</th>
					<td class="ra_base" colspan="3" rowspan="2">
						<c:forEach var="item" items="${dis_conf_rst_cd}" varStatus="status">
								<p>	
									<c:if test="${resultMap.disConfRstCd eq item.cdVal2}">
										<c:if test="${item.cdVal2 eq 'C4'}"><span class="v_middle">${item.cdName2} (제출기한 : ${fn:substring(resultMap.disConfRstDt, 0, 10)})</span></c:if>
										<c:if test="${item.cdVal2 ne 'C4'}"><span class="v_middle">${item.cdName2}</span></c:if>
									</c:if>
								</p>
						</c:forEach>
					</td>
					<th scope="row">확인일자</th>
					<td>${fn:substring(resultMap.disConfDate, 0, 10)}</td>
				</tr>
				<tr>
					<th scope="row">확인자</th>
					<td>${resultMap.disConfNm}</td>
				</tr>
			</tbody>
		</table>
	</c:if>
		<p class="btn_area">
			<c:if test="${admissionSessionVo eq null }">
				<c:if test="${resultMap.disCbConfirmYn ne 'Y' }">
					<c:if test="${resultMap.disConfRstCd ne 'C1' && resultMap.disConfRstCd ne 'C2' && resultMap.disConfRstCd ne 'C5'}"><a href="javascript:submit('ins')" class="btn_submit">저장 및 AB확인요청</a></c:if>
					<c:if test="${resultMap.disConfRstCd ne '' && resultMap.disConfRstCd ne null && resultMap.disConfRstCd ne 'C3' && resultMap.disConfRstCd ne 'C4'}"><a href="javascript:fnConfirmRep()" class="btn_submit">시정조치계획 최종확인</a></c:if>
				</c:if>
			</c:if>
			<a href="/web/eval/discoveryList.do?plnIdx=${plnIdx}&evalDiv=${evalDiv}&tab=${tab}" class="btn_list l">목록</a>
		</p>
		</form>
	</div>
	
	</div>
</body>

</html>