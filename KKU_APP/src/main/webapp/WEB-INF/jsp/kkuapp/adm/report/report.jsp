
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:searchable_board_list search_urls="/admin/report.do" search_condition_name="전체" search_range_name="신고 접수일" search_keyword_placeholder="신고내용을 입력 해주세요">
	<jsp:attribute name="head_area">
	
	</jsp:attribute>
	
	<jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>신고관리</li>
			<li>게시물 신고 관리</li>
		</ol>
		<h2>게시물 신고 관리 관리</h2>
	</jsp:attribute>

	<jsp:attribute name="search_options">
		<option value="all" <c:if test="${vo.searchCondition eq 'all'  }"></c:if>>전체</option>
		<option value="reporter" <c:if test="${vo.searchCondition eq 'reporter' }">selected="selected"</c:if>>신고자</option>
		<option value="reported" <c:if test="${vo.searchCondition eq 'reported' }">selected="selected"</c:if> >신고당한사람</option>
		<option value="content" <c:if test="${vo.searchCondition eq'content'  }">selected="selected"</c:if>>내용</option>

	</jsp:attribute>
	
	<jsp:attribute name="body_area">
	<div>
	<p  style="float:left;">총 <b>${paginationInfo.totalRecordCount}</b>개의 글이 있습니다.</p>
					<div class="r_set" style="float:right;">
						<select name="orderBy" id="orderBy" style="cursor:pointer;">
							<option value=""  <c:if test="${vo.reportTblCode eq ''}">selected</c:if>> 전체 </option>
							<c:forEach var="item" items="${boardCodeList}" varStatus="status">
							
								<option value="${item.cdVal2}"  <c:if test="${vo.orderBy eq item.cdVal2}">selected</c:if>> ${item.cdName2} </option>
							</c:forEach>
						</select>
					</div>
			
	</div>
	
		
		<table class="table01" summary="회원 목록" >
					<caption>관리자 목록</caption>
					<colgroup>
						<col width="4%">
						<col width="6%">
						<col width="15%">
						<col width="15%">
						<col width="12%">
						<col width="10%">
						<col width="auto">
						<col width="9%">
						<!--<col width="8%">
						<col width="12%">
						<col width="9%">-->
						<col width="7%">
						<col width="5%">
					</colgroup>
					
					<thead>
						<tr>
							<th scope="col">
								<input class="checkbox chk_all" type="checkbox" value="" id="ck1" >
								<label for="ck1" class="font_0 chk_all"></label>
							</th>
								<th>NO</th>
								<th>신고자</th>
								<th>신고 당한사람</th>
								<th>신고 게시판명</th>
								<th>신고유형</th>
								<th>신고내용</th>
								<th>신고 접수일</th>
								<!-- <th>처리자</th>
								<th>처리내용</th>
								<th>처리일</th> -->
								<th>처리상태</th>
								<th>비고</th><!-- 수정 및 해당 게시물로 이동   -->
						</tr>
					</thead>
					<tbody>
					<c:forEach var="result" items="${reportList}" varStatus="status">
					<c:set var="itemCnt" value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/>
							<tr>
								<td>
								<input class="checkbox" type="checkbox" value="${result.reportIdx}" name="reportIdx" id="${status.count}" >				
								<label for="${status.count}" class="font_0 "></label>
								</td>
								<td>${itemCnt }</td>
								<td>${result.writerId}</td>
								<td>${result.reporterId}</td>
								<td>

								<c:choose>
									<c:when test="${result.reportTblCode eq 0}">중고거래</c:when>
									<c:when test="${result.reportTblCode eq 1}">자유게시판</c:when>
									<c:when test="${result.reportTblCode eq 2}">강의정보</c:when>
									<c:when test="${result.reportTblCode eq 3}">택시합승</c:when>
									<c:when test="${result.reportTblCode eq 4}">분실물게시판</c:when>
									<c:otherwise>?</c:otherwise>
								</c:choose> 
								</td>			
								<td>${result.reportCategory}</td>
								<td>${result.content}</td>
								<td>${result.reportDate}</td>
								<!-- <td></td>
								<td></td>
								<td></td> -->
								<td>
								<c:choose>
									<c:when test="${result.reportState eq 0}">접수됨</c:when>
									<c:when test="${result.reportState eq 1}">접수완료</c:when>
									<c:when test="${result.reportState eq 2}">처리완료</c:when>
									<c:when test="${result.reportState eq 3}">처리불가</c:when>
									<c:otherwise>?</c:otherwise>
								</c:choose> 
								</td>
								
								
								
								<td><p class="btn">
					<a href="/admin/reportProcess.do?reportIdx=${result.reportIdx}&reportTblCode=${result.reportTblCode}&reportBoardIdx=${result.reportBoardIdx}"  class="line" >수정</a><br>
					
				
				</p></td>
							</tr>
			
						</c:forEach> 
					</tbody>
						
				</table>
			
				<p class="btn_area max_width">
				<a href="javascript:void(0)" onclick="deleteForm(); return false" class="btn_del">삭제</a>
			</p>
		<p class="pn" >
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
		</p>

		

		
		
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