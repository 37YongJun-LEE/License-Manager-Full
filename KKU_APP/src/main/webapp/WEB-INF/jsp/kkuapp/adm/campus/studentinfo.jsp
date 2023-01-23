<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>


<t:searchable_board_list search_urls="/admin/studentinfo.do" search_range_name="작성일" search_condition_name="검색구분" search_keyword_placeholder="검색어 입력">
	<jsp:attribute name="head_area">
	</jsp:attribute>
	
	<jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>학교 정보 관리</li>
			<li>학과 정보 관리</li>
		</ol>
		<h2>학과 정보 관리</h2>
	</jsp:attribute>

	<jsp:attribute name="search_options">
		<option value="ALL" selected="">전체</option>
		<option value="title"   <c:if test="">selected="selected"</c:if>>제목</option>
		<option value="major"   <c:if test="">selected="selected"</c:if>>학과</option>
		<option value="content"   <c:if test="">selected="selected"</c:if>>내용</option>
		<option value="name"   <c:if test="">selected="selected"</c:if> >작성자</option>
	</jsp:attribute>
	
	<jsp:attribute name="body_area">
	
		<table class="table01" summary="회원 목록" >
			<caption>관리자 목록</caption>
			<colgroup>
				<col width="4%">
				<col width="6%">
				<col width="auto">
				<col width="14%">
				<col width="14%">
				<col width="10%">
				<col width="14%">
				<col width="5%">
			
			</colgroup>
			
			<thead>
				<tr>
					<th scope="col">
						<input class="checkbox" type="checkbox" value="" id="ck1" onclick="allCheck();">
						<label for="ck1" class="font_0 chk_all"></label>
					</th>
						<th>NO</th>
						<th>제목</th>
						<th>학과</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>최근 업데이트 날짜</th>
						<th>관리</th>
				</tr>
			</thead>
			<tbody>
		 	<c:forEach var="result" items="${studentInfoList}">
				<tr>
					<td>
					<input class="checkbox" type="checkbox" value="${result.mnoticeIdx}" name="usrIdxArr" id="${result.mnoticeIdx}" >
					<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
					</td>
			
					<td>${result.mnoticeIdx }</td>
					<td>${result.mnoticeTitle} </td>
					<td>${result.mnoticeCategory}</td>
					<td>${result.mnoticeName }</td>
					<td>${result.mnoticeDate }</td>
					<td>${result.mnoticeUpdated }</td>
					<td><p class="btn">
						<a href="/admin/studentinfoDetail.do?mnoticeIdx=${result.mnoticeIdx}"  class="line" >수정</a><br>
					</p></td>
				</tr>		
			</c:forEach> 
			</tbody>
		</table>
		<p class="pn" >
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
			</p>
		
	</jsp:attribute>
	
	<jsp:attribute name="script_area">
		<script>
			function allCheck(){
				if($("input:checkbox[id='ck1']").prop("checked")){
			        $("input:checkbox[name='usrIdxArr']").prop("checked",true);
			    }else{
			        $("input:checkbox[name='usrIdxArr']").prop("checked",false);
			    } 
			}
			 
		 	function selectDelete(){
				if(confirm('정말 삭제하시겠습니까?')){
					$("input:checkbox[name='usrIdxArr']").each(function() {
						if($(this).is(':checked')){
							$.ajax({ 
								type : "POST",
								url : "/kpcceo/admin/userDelete.do",
								data : {
									usrIdx : $(this).val(),
								},
								success : function() {}
							});
						}
		
					});
					alert("정상적으로 삭제되었습니다.");
					location.reload();
				}	
			}
	 	</script>
	</jsp:attribute>
	
</t:searchable_board_list>