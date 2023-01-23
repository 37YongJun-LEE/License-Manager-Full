<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:default>
	<jsp:attribute name="head_area">
		<!-- 헤더 링크 -->
	</jsp:attribute>

  	<jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>학교 정보 관리</li>
			<li>학교시설 고장 신고 관리</li>
			<li>학교시설 고장 신고 수정</li>
		</ol>
		<h2>학교시설 고장 신고 관리</h2>
	</jsp:attribute>

	<jsp:attribute name="body_area">
	<form id="frm" name="frm">
	<input type="hidden" name="reportIdx" value="${resultMap.reportIdx }">
	<h3>신고자 정보</h3>
		<table class="table02" summary="관리자 기본정보 등록">
						<colgroup><col width="20%"><col width="20%"><col width="12%"><col width="48%"></colgroup>
						<tbody>
							<tr>
								<th scope="row">이름<span class="star">*</span></th>
								<td>
									${resultMap.usrName}
								</td>
								<th scope="row">학번<span class="star">*</span></th>
								<td>
									${resultMap.usrStdnum}
								</td>
								
							</tr>
							
							<tr>
								<th scope="row">소속<span class="star">*</span></th>
								<td>
									${resultMap.usrDepartment}
								</td>
								<th scope="row">학과<span class="star">*</span></th>
								<td>
									${resultMap.usrMajor}
								</td>
							</tr>
							<tr>
								<th scope="row">총 신고 횟수<span class="star">*</span></th>
								<td colspan="3">
									${resultMap.reportCnt}
								</td>
							</tr>
							
						</tbody>
					</table>
					
					
						<h3>신고 내용</h3>
						<table class="table02" summary="관리자 기본정보 등록">
						<colgroup><col width="20%"><col width="30%"><col width="12%"><col width="38%"></colgroup>
						<tbody>
							<tr>
								<th scope="row">신고 내용<span class="star">*</span></th>
								<td >
									${resultMap.reportContent}
								</td>
								<th scope="row">신고일<span class="star">*</span></th>
								<td>
									${resultMap.reportDate}
								</td>
								
							</tr>
							
							<tr>
								<th scope="row">진행상태<span class="star">*</span></th>
								<td class="ra_base" colspan="3">
									<c:forEach var="item" items="${reportProcessCodeList}" varStatus="status">
										<input type="radio" id="id0${status.count}" name="processState" value="${item.cdVal2 }" <c:if test="${resultMap.processStateNum eq item.cdVal2 }"> checked </c:if>>
      									<label for="id0${status.count}">${item.cdName2 }</label>
									</c:forEach>
									

								</td>
							</tr>
							<tr>
							
							</tr>
							
						</tbody>
					</table>
					<c:if test="${ resultMap.processStateNum ge 2}">
					<h3>처리 정보</h3>
						<table class="table02" summary="관리자 기본정보 등록">
						<colgroup><col width="20%"><col width="30%"><col width="12%"><col width="38%"></colgroup>
						<tbody>
							<tr>
								<th scope="row">담당자 이름<span class="star">*</span></th>
								<td class="ra_base" >
									<input type="text" id="commentWriter" name="commentWriter" value="${resultMap.commentWriter}">
								
								</td>
								<th scope="row">작성일<span class="star">*</span></th>
								<td>
									${resultMap.modDate}
								</td>
								
							</tr>
							
							<tr>
								<th scope="row">처리 내용<span class="star">*</span></th>
								<td class="ra_base" colspan="3">
									<textarea style="width:300px" id="fixComment" name="fixComment"> ${resultMap.fixComment }</textarea>
								</td>
							</tr>
							<tr>
							
							</tr>
							
						</tbody>
					</table>
					</c:if>
					</form>
					<p class="btn_area max_width">
					<a href="/admin/fixReport.do" class="l btn_list">목록</a>
						
					
					<a href="javascript:formSubmit();" class="btn_submit">저장</a>
				</p>
	</jsp:attribute>

	<jsp:attribute name="script_area">

		<script>
		function formSubmit(){
			
			if('${resultMap.processStateNum}'*1 >= 2){
				if($("#commentWriter").val().trim() == ''){
					alert('담당자 이름을 입력해주세요');
					return false;
				}
				if($("#fixComment").val().trim() == ''){
					alert('처리내용을 입력해주세요');
					return false;
				}
			}
			var formData = new FormData(frm);
			$.ajax({
					type : 'post',
					url : "<c:url value='/admin/fixReportModifyAction.do'/>",
					data : formData,
					async: false,
					contentType : false,
					processData : false,
					success : function(data) {
							if($.trim(data) == "Y") {
								
								alert("성공적으로 수정되었습니다.");
								location.reload();
							}
							else if($.trim(data) == "N") {
								alert("비밀번호가 틀립니다. ");
							}
						
						}
				}); 
		}
		</script>
	</jsp:attribute>
</t:default>

