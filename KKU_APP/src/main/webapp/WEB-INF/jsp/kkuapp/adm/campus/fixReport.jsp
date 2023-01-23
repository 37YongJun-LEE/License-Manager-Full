
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:searchable_board_list search_urls="/admin/fixReport.do" search_condition_name="전체" search_range_name="신고일 "  search_keyword_placeholder="내용을 입력 해주세요">
	<jsp:attribute name="head_area">
	
	</jsp:attribute>
	
	<jsp:attribute name="meta_area">
		<ol class="loca">
						<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
						<li>학교 정보 관리</li>
						<li>시설고장 신고 </li>
					</ol>
					<h2>시설고장 신고 관리</h2>
	</jsp:attribute>

	<jsp:attribute name="search_options">
		<option value="all" <c:if test="${vo.searchCondition eq 'all'  }"></c:if>>전체</option>
		<option value="pnum" <c:if test="${vo.searchCondition eq 'reporter' }">selected="selected"</c:if>>연락처</option>
		<option value="id" <c:if test="${vo.searchCondition eq 'reported' }">selected="selected"</c:if> >아이디</option>
		<option value="content" <c:if test="${vo.searchCondition eq'content'  }">selected="selected"</c:if>>신고내용</option>

	</jsp:attribute>
	
	<jsp:attribute name="body_area">

		
		<table class="table01" summary="회원 목록" >
					<caption>관리자 목록</caption>
					<colgroup>
						<col width="4%">
						<col width="6%">
						<col width="auto">
						<col width="11%">
						<col width="15%">
						<col width="10%">
						<col width="12%">
						<col width="8%">
						<col width="6%">
						<col width="11%">
						<col width="5%">
					</colgroup>
					
					<thead>
						<tr>
							<th scope="col">
								<input class="checkbox" type="checkbox" value="" id="ck1" onclick="allCheck();">
								<label for="ck1" class="font_0 chk_all"></label>
							</th>
							<th>NO</th>
							<th>신고내역</th>
							<th>신고자 연락처</th>
							<th>신고자 아이디</th>
							<th>신고일</th>
							<th>시설팀 코멘트</th>
							<th>처리내역 </th>
							<th>읽음 여부</th>
							<th>코멘트 수정일</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="result" items="${reportList}">
			
							<tr>
								<td>
								<input class="checkbox" type="checkbox" value="${result.reportIdx}" name="reportIdx" id="${result.reportIdx}" >
								<label for="${result.reportIdx}" class="font_0 chk_all"></label>
								</td>
						
								<td>${result.reportIdx}</td>
								<td>${result.reportContent}</td>
								<td>${result.reporterPnum}</td>
								<td>${result.reporterId}</td>
								<td>${result.reportDate}</td>
								<td>${result.fixComment}</td>
								<c:if test="${result.processState eq '0' }">
										<td>접수대기중</td>
									</c:if>
									<c:if test="${result.processState eq '1' }">
										<td>접수완료</td>
									</c:if>
									<c:if test="${result.processState eq '2' }">
										<td>처리중</td>
									</c:if>
									<c:if test="${result.processState eq '3' }">
										<td>처리불가</td>
									</c:if>
									<c:if test="${result.processState eq '4' }">
										<td>처리완료</td>
									</c:if>
						
								<td>${result.readYn}</td>
								<td>${result.modDate}</td>
								<td><p class="btn">
									<a href='<c:url value="/admin/fixReportView.do?reportIdx=${result.reportIdx }"/>'  class="line" >수정</a><br>
					
				
				</p></td>
							</tr>
						
						</c:forEach> 
					</tbody>
				
				</table>
			
				<!-- <p class="btn_area max_width">
				<a href="javascript:void(0)" onclick="deleteForm(); return false" class="btn_del">삭제</a>
			</p> -->
<%-- 		<p class="pn" >
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
		</p> --%>

		

		
		
	</jsp:attribute>
	
	<jsp:attribute name="script_area">
		<script src="/_js/_js/loading.js" type="text/javascript" charset="utf-8"></script>
		<script>
		$(".chk_all").click(function(){
		    $('input:checkbox').not(this).prop('checked', this.checked);
		});
			
			$(document).on("change", "#orderBy", function() {
				$("#pageIndex").val(1);
				$("#schFrm").submit();
			});
			
			function deleteForm(){
				$("#pageIndex").val(1);
				var formData = new FormData(schFrm);

				$.ajax({
						type : 'post',
						url : "<c:url value='/admin/reportDeleteAction.do'/>",
						data : formData,
						async: false,
						contentType : false,
						processData : false,
						success : function(data) {
								if($.trim(data) == "Y") {
									
									alert("성공적으로 삭제되었습니다.");
									location.href='<c:url value="/admin/report.do"/>';
								}
							
							}
					}); 
			}
	 	</script>
	</jsp:attribute>
	
</t:searchable_board_list>