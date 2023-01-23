<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<html lang="utf-8">
	<head>
		<%@include file="../_inc/tit.jsp" %>
		<script>
			var flag = true;
			// 저장
			function fnSubmit() {
				if(flag){
					flag=false;
					$("#frm").submit();	
				}
				
			}
			
			// 파일 이름 추출
		    $(document).on("change","input[type=file]", function(){
				var fileSplit = $(this).val().split('\\');
				var fileName = fileSplit[fileSplit.length -1];
				$(this).prev('input').val(fileName);
			});
			
			// 로고파일 버튼 조작
			$(document).on("click","a[id=btn-upload]",function(){
				$(this).next().next().click();
		  	});
			
			// 첨부파일 삭제
			function fn_filDelete(filIdx, filPath){
				if(confirm("파일을 삭제하시겠습니까?")){
					$('#certiFile').html("");
					$.ajax({
						type: "post",
						url: "/web/eval/docCheckFileDelete.do",
						data: {
							filIdx : filIdx,
							filPath : filPath
						},
						async: false,
						success: function(data) {
							alert("정상적으로 삭제되었습니다.");
							location.reload();
						},
						error: function(xhr, status, error) {
							alert("error");
						}
					});
				}
			}
		
		</script>
	</head>
	<body class="pop_bg">
		<div class="popup_tit">
			<h2 class="pop_tit">조치결과 코멘트</h2>
			<p class="cbtn"><a href="#" onclick="document.location.href='javascript:window.close()'"><img src="/_img/adm/cont/pop_close.png" alt="닫기"/></a></p>
		</div>
		
		<form name="frm" id="frm" autocomplete="off" method="post" action="/web/eval/docCheckRegist.do" encType="multipart/form-data">
			<input type="hidden" name="dtIdx" value="${docVO.dtIdx }" />
			<input type="hidden" name="plnIdx" value="${docVO.plnIdx}" />
			<input type="hidden" name="flag" value="C" />
		
			<div class="popup_cont" style="width:auto; margin:0; height:auto">
				<table class="table02" summary="인정신청 목록">
					<caption>인정신청 목록</caption>
					<colgroup><col width="20%"><col width="80%"></colgroup>
					<tbody>
						<tr>
							<td class="c">조치내용</td>
							<td>
								<textarea style="width: 100%;" name="docMemoCab" id="docMemoCab" cols="30" rows="10" placeholder="내용을 입력하세요.">${resultMap.docMemoCab }</textarea>
							</td>
						</tr>
						<tr>
							<td class="c">파일첨부</td>
							<td>
								<c:choose>
									<c:when test="${fn:length(resultFileList) > 0 }">
										<c:forEach var="item" items="${resultFileList }">
											<c:url value="/fileDownload.do" var="fileUrl">
												<c:param name="srvFile" value="${item.filSvrName}" />
												<c:param name="usrFile" value="${item.filUsrName}" />
												<c:param name="folder" value="${item.filPath}" />
											</c:url>
											<a href="${fileUrl}" target="_blank" class="file"><span class="ti-clip"></span>${item.filUsrName}</a>
											<button type="button" class="sm_del" onclick="fn_filDelete('${item.filIdx}','${item.filPath}')"></button><br>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<input type="hidden" name="fileIdx" value="">
										<a href="javascript:void(0);" class="sm_line" id="btn-upload">파일검색</a>
										<input class="file" type="text" id="fileName" name="fileName" value="" style="width:200;" placeholder="선택된 파일 없음" readonly="readonly">
										<input type="file" id="fileUp" name="certi" style="display: none;">									
										<label class="f_0">파일 등록</label>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
				<c:if test="${resultMap.docMemoAb ne '' and resultMap.docMemoAb ne null }">
				<div class="popup_cont" style="width:auto; margin:0; height:auto">
					<table class="table02" summary="조치결과 코멘트">
						<caption>조치결과 코멘트</caption>
						<colgroup><col width="20%"><col width="80%"></colgroup>
						<tbody>
							<tr>
								<td class="c">확인내용</td>
								<td style="height:100;">
									<input type="hidden" name="docMemoAb" id="docMemoAb" value="${resultMap.docMemoAb}">
									${resultMap.docMemoAb}
<%-- 									<textarea style="width: 100%;" name="docMemoAb" id="docMemoAb" cols="30" rows="10" placeholder="내용을 입력하세요.">${resultMap.docMemoAb}</textarea> --%>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</c:if>
			
				<p class="btn_area" style="text-align:center;">
					<a href="javascript:;" onclick="fnSubmit();" class="btn_submit">저장</a>
				</p>
			<div class="popup_cont" style="width:auto; margin:0; height:auto">
			</div>
		</form>
	</body>
</html>