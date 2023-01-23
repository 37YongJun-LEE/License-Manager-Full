<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="1" />

<html lang="utf-8">
<head>
<%@include file="../_inc/tit.jsp"%>
	<script>
		$(document).ready(function(){
			$('input[name*=Detail]').each(function(){
				$(this).prop("disabled",true);
			});
			$('#chkYn2Date').prop("disabled",true);
			$('#chkYn3Nm').prop("disabled",true);
			$('#chk4File').prop("disabled",true);
			$('#chk5File').prop("disabled",true);
			$('#chkYn5Detail').prop("disabled",true);
			
			if('${resultCheck.chkIdx}'==""){
				$('input[type=radio]').each(function(){
					if($(this).val() =="N"){
						$(this).attr("checked","checked");
					}
				});
			}else {
				$('input[type=radio]').each(function(){
					if($(this).val() =="Y"){
						$(this).parent().siblings('p').children('input').prop("disabled",false);
					}
				});
			}
			
			$(".date").datepicker({
				changeMonth: true,
				changeYear: true
			});
			$('#chkYn2Date').datepicker();
			
			$(document).on('click','#chk4FileBtn',function(){
				$('#chk4File').click();
			});
			
			$(document).on('click','#chk5FileBtn',function(){
				$('#chk5File').click();
			});
			

		});//document.ready
		
		
		//Submit
		function fnSubmit(mode){
			if(isSubmit()){
				if(mode == 'ins'){
					$('#frm').attr("action","/web/apply/applyCheckInsert.do?scheIdx=${planMasterVO.scheIdx}&plnIdx=${planMasterVO.plnIdx}");
					$('#frm').submit();
				} else if(mode == 'mod'){
					$('#frm').attr("action","/web/apply/applyCheckUpdate.do?scheIdx=${planMasterVO.scheIdx}&plnIdx=${planMasterVO.plnIdx}");
					$('#frm').submit();
				}
			}
		}
		//필수체크
		function isSubmit(){
			var isPass = true;
			$("input[required]").each(function() {
				if(compactTrim($(this).val()) == "") {
					$(this).focus();
					alert("필수항목입니다. " + $(this).data("msg") + " 확인 해주세요.");
					return isPass = false;
				}
			});
			if(isPass){
				if($('#chkYn5_1').is(":checked")){
					if($('#chkYn5Detail').val()==""){
						$('#chkYn5Detail').focus();
						alert("필수항목입니다. " + $('#chkYn5Detail').data("msg") + " 확인 해주세요.");
						return isPass = false;
					}
				}
				
			}
			function compactTrim(str) {
				return str.replace( /(\s*)/g, "" );
			}
			return isPass;
		}

		//파일명
		$(document).on('change','input[type=file]',function(){
			var f_val = $(this).val().split('\\');
			var s_val= f_val[f_val.length-1];
			$(this).closest('input').attr("value",s_val);
		});
		
		
		
		//문항별 쿼리
		//1
		$(document).on("change",'input[name=chkYn1]',function(){
			var val = $(this).val();
			if(val=='Y'){
				$('#chkYn1Detail').removeAttr("disabled");
				$('#chkYn1Detail').prop("required",true);
				
			} else {
				$('#chkYn1Detail').removeAttr("required");
				$('#chkYn1Detail').prop("disabled",true);
				$('#chkYn1Detail').val("");
			}
		});
		//2
		$(document).on("change",'input[name=chkYn2]',function(){
			var val = $(this).val();
			if(val=='Y'){
				$('#chkYn2Date').removeAttr("disabled");
				$('#chkYn2Detail').removeAttr("disabled");
				$('#chkYn2Date').prop("required",true);
				$('#chkYn2Detail').prop("required",true);
				
			} else {
				$('#chkYn2Date').removeAttr("required");
				$('#chkYn2Detail').removeAttr("required");
				$('#chkYn2Date').prop("disabled",true);
				$('#chkYn2Detail').prop("disabled",true);
				$('#chkYn2Date').val("");
				$('#chkYn2Detail').val("");
			}
		});
		//3
		$(document).on("change",'input[name=chkYn3]',function(){
			var val = $(this).val();
			if(val=='Y'){
				$('#chkYn3Nm').removeAttr("disabled");
				$('#chkYn3Detail').removeAttr("disabled");
				$('#chkYn3Nm').prop("required",true);
				$('#chkYn3Detail').prop("required",true);
				
			} else {
				$('#chkYn3Nm').removeAttr("required");
				$('#chkYn3Detail').removeAttr("required");
				$('#chkYn3Nm').prop("disabled",true);
				$('#chkYn3Detail').prop("disabled",true);
				$('#chkYn3Nm').val("");
				$('#chkYn3Detail').val("");
			}
		});
		//4
		$(document).on("change",'input[name=chkYn4]',function(){
			var val = $(this).val();
			if(val=='Y'){
				$('#chkYn4Detail').removeAttr("disabled");
				$('#chkYn4Detail').prop("required",true);
				$('#chk4File').removeAttr("disabled");
				/* $('#chk4File').prop("required",true); */
				
			} else {
				$('#chkYn4Detail').removeAttr("required");
				/* $('#chk4File').removeAttr("required"); */
				$('#chkYn4Detail').prop("disabled",true);
				$('#chk4File').prop("disabled",true);
				$('#chkYn4Detail').val("");
				$('#chk4File').val("");
			}
		});
		//5
		$(document).on("change",'input[name=chkYn5]',function(){
			var val = $(this).val();
			if(val=='Y'){
				$('#chkYn5Detail').removeAttr("disabled");
				$('#chkYn5Detail').prop("required",true);
				$('#chk5File').removeAttr("disabled");
				/* $('#chk5File').prop("required",true); */
				
			} else {
				$('#chkYn5Detail').removeAttr("required");
				/* $('#chk5File').removeAttr("required"); */
				$('#chkYn5Detail').prop("disabled",true);
				$('#chk5File').prop("disabled",true);
				$('#chkYn5Detail').val("");
				$('#chk5File').val("");
			}
		});
		
		
		//파일 삭제
		function ajaxDelFile(fileIdx,focus){
			if(confirm("삭제하시겠습니까?")) {
				if(fileIdx == "") {
					alert("잘못된 요청 입니다.");
				} else {
					$.ajax({
						type: "post",
						url: "/web/apply/ajaxDelFile.do",
						data: {
							filIdx : fileIdx								
						},
						async: false,
						success: function(data) {
							$('#'+focus).html("");
							var str = '<a href="javascript:void(0);" id="'+focus+'FileBtn" class="sm_line">파일검색</a>';
							str +='<input class="file" id="'+focus+'FileNm" name="'+focus+'FileNm" type="text" value="" placeholder="선택된 파일 없음" readonly>';
							str +='<input type="file" id="'+focus+'File" name="'+focus+'File" style="display:none;" data-msg="조정 평가일정계획 첨부를">';
							str +='<label class="f_0">파일 등록</label>';
							$('#'+focus).html(str);
						},
						error: function(xhr, status, error) {
							alert("error");
						}
					});
				}
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
				<h2>계획 관리</h2>
				<ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
					<li>계획 관리</li>
					<li>사용자 확인사항</li>
				</ol>
			</div>

		<form name="frm" id="frm" autocomplete="off" method="post" encType="multipart/form-data">
			<input type="hidden" name="chkIdx" value="${resultCheck.chkIdx}">
			<table class="table02" summary="사용자 확인사항">

			<caption>사용자 확인사항</caption>
			<colgroup><col width="40%"><col width="60%"></colgroup>
			<thead>
				<tr>
					<th scope="col">확인사항</th>
					<th scope="col">답변</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<th class="sub_th l">추가 정보가 필요합니까?<br><span>(해당 시 요구정보 입력)</span></th>
					<td class="ra_base">
						<p>
							<input type="radio" name="chkYn1" id="chkYn1_1" value="Y" <c:if test="${resultCheck.chkYn1 eq 'Y'}">checked</c:if>>
							<label for="chkYn1_1" class="mr15"><span></span>예</label>
							<input type="radio" name="chkYn1" id="chkYn1_2" value="N" <c:if test="${resultCheck.chkYn1 eq 'N'}">checked</c:if>>
							<label for="chkYn1_2" class="mr15"><span></span>아니오</label>
						</p>
						<p class="mt10">
							<input type="text" id="chkYn1Detail" name="chkYn1Detail" value="${resultCheck.chkYn1Detail}" placeholder="요구정보 입력" data-msg="요구정보 입력을">
							<label class="f_0">요구정보 입력</label>
						</p>
					</td>
				</tr>
				<tr>
					<th class="sub_th l">일정조정이 필요합니까?<br><span>(해당 시 조정일정 및 사유 입력)</span></th>
					<td class="ra_base">
						<p>
							<input type="radio" name="chkYn2" id="chkYn2_1" value="Y" <c:if test="${resultCheck.chkYn2 eq 'Y'}">checked</c:if>>
							<label for="chkYn2_1" class="mr15"><span></span>예</label>
							<input type="radio" name="chkYn2" id="chkYn2_2" value="N" <c:if test="${resultCheck.chkYn3 eq 'N'}">checked</c:if>>
							<label for="chkYn2_2" class="mr15"><span></span>아니오</label>
						</p>
						<p class="mt10">
							<input class="date " style="width:150px;" id="chkYn2Date" name="chkYn2Date" type="text" value="${resultCheck.chkYn2Date}" onClick="$('#chkYn2Date').datepicker('show');" data-msg="조정일을" readonly><!--
								--><label for="chkYn2Date" class="f_0">조정일 설정</label>
							<input style="width:490px;" type="text" id="chkYn2Detail" name="chkYn2Detail" value="${resultCheck.chkYn2Detail}" placeholder="조정 사유" data-msg="조정 사유를">
							<label class="f_0">조정 사유 입력</label>
						</p>
					</td>
				</tr>
				<tr>
					<th class="sub_th l">평가팀의 변경이 필요합니까?<br><span>(해당 시 성명 및 사유 입력)</span></th>
					<td class="ra_base">
						<p>
							<input type="radio" name="chkYn3" id="chkYn3_1" value="Y" <c:if test="${resultCheck.chkYn3 eq 'Y'}">checked</c:if>>
							<label for="chkYn3_1" class="mr15"><span></span>예</label>
							<input type="radio" name="chkYn3" id="chkYn3_2" value="N" <c:if test="${resultCheck.chkYn3 eq 'N'}">checked</c:if>>
							<label for="chkYn3_2" class="mr15"><span></span>아니오</label>
						</p>
						<p class="mt10">
							<input style="width:185px;" id="chkYn3Nm" name="chkYn3Nm" type="text" placeholder="성명" value="${resultCheck.chkYn3Nm}" data-msg="성명을">
							<label class="f_0">성명 입력</label>
							<input style="width:490px;" type="text" id="chkYn3Detail" name="chkYn3Detail" placeholder="변경 사유" value="${resultCheck.chkYn3Detail}" data-msg="변경 사유를">
							<label class="f_0">변경 사유 입력</label>
						</p>
					</td>
				</tr>
				<tr>
					<th class="sub_th l">평가일정 계획의 조정이 필요합니까?<br><span>(해당 시 조정 사유 입력 및 조정 평가일정계획 첨부)</span></th>
					<td class="ra_base">
						<p>
							<input type="radio" name="chkYn4" id="chkYn4_1" value="Y" <c:if test="${resultCheck.chkYn4 eq 'Y'}">checked</c:if>>
							<label for="chkYn4_1" class="mr15"><span></span>예</label>
							<input type="radio" name="chkYn4" id="chkYn4_2" value="N" <c:if test="${resultCheck.chkYn4 eq 'N'}">checked</c:if>>
							<label for="chkYn4_2" class="mr15"><span></span>아니오</label>
						</p>
						<p class="mt10">
							<input type="text" id="chkYn4Detail" name="chkYn4Detail" value="${resultCheck.chkYn4Detail}" placeholder="조정 사유" data-msg="조정 사유를">
							<label class="f_0">조정 사유 입력</label>
						</p>
						<p class="mt10" id="chk4">
							<c:choose>
								<c:when test="${fn:length(file1) > 0 }">
									<c:forEach var="item" items="${file1}">
										<c:url value="/fileDownload.do" var="fileUrl">
											<c:param name="srvFile" value="${item.filSvrName}" />
											<c:param name="usrFile" value="${item.filUsrName}" />
											<c:param name="folder" value="${item.filPath}" />
										</c:url>
										<a href="${fileUrl}" target="_blank" class="file"><span class="ti-clip"></span>${item.filUsrName}</a>
										<button class="sm_del" type="button" onClick="ajaxDelFile('${item.filIdx}','chk4')"></button>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<a href="javascript:void(0);" id="chk4FileBtn" class="sm_line">파일검색</a>
									<input class="file" id="chk4FileNm" name="chk4FileNm" type="text" value="" placeholder="선택된 파일 없음" readonly>
									<input type="file" id="chk4File" name="chk4File" style="display:none;" data-msg="조정 평가일정계획 첨부를">
									<label class="f_0">파일 등록</label>
								</c:otherwise>
							</c:choose>
						</p>
					</td>
				</tr>
				<tr>
					<th class="sub_th l">현재 인증평가 대상업체는 선정되었습니까?<br><span>(선정 완료 시 대상업체 정보입력 및 계약서 첨부)</span></th>
					<td class="ra_base">
						<p>
							<input type="radio" name="chkYn5" id="chkYn5_1" value="Y" <c:if test="${resultCheck.chkYn5 eq 'Y'}">checked</c:if>>
							<label for="chkYn5_1" class="mr15"><span></span>예</label>
							<input type="radio" name="chkYn5" id="chkYn5_2" value="N" <c:if test="${resultCheck.chkYn5 eq 'N'}">checked</c:if>>
							<label for="chkYn5_2" class="mr15"><span></span>아니오</label>
						</p>
						<p class="mt10">
							<textarea style="width:100%;" name="chkYn5Detail" id="chkYn5Detail" cols="30" rows="3" placeholder="업체명, 전화번호 등 기타 정보" data-msg="기타 정보를">${resultCheck.chkYn5Detail}</textarea>
						</p>
						<p class="mt10" id="chk5">
							<c:choose>
								<c:when test="${fn:length(file2) > 0 }">
									<c:forEach var="item" items="${file2}">
										<c:url value="/fileDownload.do" var="fileUrl">
											<c:param name="srvFile" value="${item.filSvrName}" />
											<c:param name="usrFile" value="${item.filUsrName}" />
											<c:param name="folder" value="${item.filPath}" />
										</c:url>
										<a href="${fileUrl}" target="_blank" class="file"><span class="ti-clip"></span>${item.filUsrName}</a>
										<button class="sm_del" type="button" onClick="ajaxDelFile('${item.filIdx}','chk5')"></button>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<a href="javascript:void(0);" id="chk5FileBtn" class="sm_line">파일검색</a>
									<input class="file" id="chk5FileNm" name="chk5FileNm" value="" type="text" placeholder="선택된 파일 없음" readonly>
									<input type="file" id="chk5File" name="chk5File" style="display:none;" data-msg="계약서 첨부를">
									<label class="f_0">로고파일 등록</label>
								</c:otherwise>
							</c:choose>
						</p>
					</td>
				</tr>
				<tr>
					<!-- <th class="sub_th l">인정등록가이드(KAB-G-01)및 인정기준 적용지침<br>(KAB-A01 및 KAB-A-02)에 기술된 준수사항 및 협조사항을<br>충분히 인지하였습니까?</th> -->
					<th class="sub_th l">적합성평가기관 인정매뉴얼(KAB-AM-CAB)에 기술된 준수사항 및 협조사항을 충분히 인지하였습니까?</th>
					<td class="ra_base">
						<input type="radio" name="chkYn6" id="chkYn6_1" value="Y" <c:if test="${resultCheck.chkYn6 eq 'Y'}">checked</c:if>>
						<label for="chkYn6_1" class="mr15"><span></span>예</label>
						<input type="radio" name="chkYn6" id="chkYn6_2" value="N" <c:if test="${resultCheck.chkYn6 eq 'N'}">checked</c:if>>
						<label for="chkYn6_2" class="mr15"><span></span>아니오</label>
					</td>
				</tr>
				<tr>
					<th class="sub_th l">특기사항 및 요구사항<br><span>(해당되는 경우)</span></th>
					<td>
						<textarea style="width:100%;" name="chkYn7Detail" id="chkYn7Detail" cols="30" rows="3" placeholder="내용을 입력하세요.">${resultCheck.chkYn7Detail}</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<p class="note_r pt10">※ 본 신청자측 확인사항을 평가개시 <b>1일 전</b>까지 회신하여 주시기 바랍니다.<br>
		정해진 기한 내에 귀 기관의 회신이 없는 경우에는 동 평가계획서에 동의한 것으로 간주되어 통보된 일정계획에 따라 평가가 진행됩니다.</p>

		<div class="repre_area mt25">
			<dl class="repre_cont">
				<dt>
					신청기관 대표 :
					<!-- <span>성명:</span> -->
				</dt>
			 	<dd>
					<c:if test="${resultCheck.chkIdx eq ''}">
						<!-- <span>성명:</span> -->
						<input class="w300" type="text" id="orgCeoNm" name="orgCeoNm" data-msg="대표자 성명을" required>
						<label class="f_0">성명 입력</label>
					</c:if>
					<c:if test="${resultCheck.chkIdx ne ''}">
						<input type="hidden" id="orgCeoNm" name="orgCeoNm" value="${resultCheck.orgCeoNm}">
						<span>${resultCheck.orgCeoNm}</span>
					</c:if>
				</dd>
				<dt></dt>
				<dt></dt>
				<dt>작성일 :</dt>
			 	<dd>
					${fn:split(resultCheck.regDate,' ')[0]}
				</dd>
			</dl>				
		</div>
	</form>
		<p class="btn_area">
			<c:if test="${(resultCheck.userCnt eq 0 and resultCheck.resultCnt eq 0) or ( resultCheck.userCnt ne resultCheck.resultCnt)}">
	<!--  				<a href="notice.html" class="btn_list">목록</a> -->
				<c:if test="${resultCheck.chkIdx eq ''}">
						<a href="javascript:fnSubmit('ins');" class="btn_submit">저장</a>
				</c:if>
				<c:if test="${resultCheck.chkIdx ne ''}">
						<a href="javascript:fnSubmit('mod');" class="btn_submit">수정</a>
				</c:if>
			</c:if>
		</p>
	</div>
		<%@include file="../_inc/footer.jsp"%>
	</div>
</body>

</html>