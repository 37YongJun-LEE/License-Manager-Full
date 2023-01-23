<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%> 

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:searchable_board_list search_urls="/admin/userList.do" search_range_name="가입일" search_condition_name="검색구분" search_keyword_placeholder="검색어 입력">
   <jsp:attribute name="head_area">
   </jsp:attribute>

    <jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>게시판관리</li>
			<li>중고거래 게시물관리</li>
		</ol>
		<h2>중고거래 게시물관리</h2>
   </jsp:attribute>
   
   <jsp:attribute name="search_options">
   <option value="ALL" selected="">전체</option>
		<option value="title" <c:if test="">selected="selected"</c:if>>제목</option>
		<option value="content" <c:if test="">selected="selected"</c:if>>내용</option>
		<option value="name"   <c:if test="">selected="selected"</c:if> >작성자</option>
   </jsp:attribute>

   <jsp:attribute name="body_area">
   <table class="table01" summary="회원 목록" >
			<caption>관리자 목록</caption>
			<colgroup>
				<col width="6%">
				<col width="20%">
				<col width="auto">
				<col width="15%">
				<col width="8%">
				<col width="5%">
				<col width="5%">
			</colgroup>
			
			<thead>
				<tr>
						<th>NO</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>상태</th>
						<th>수정</th>
						
				</tr>
			</thead>
			<tbody>
		 	<c:forEach var="result" items="${tradeList}">
				<tr>
					<td>${result.trdIdx }</td>
					<td>${result.trdWriter} </td>
					<td>${result.trdTitle}</td>
					<td>${result.trdWritedate }</td>
					<td>${result.trdViewnum }</td>
					<td>${result.trdStatus}</td>
				 	<td><p class="btn">
						<a href="/admin/tradeListDetail.do?trdIdx=${result.trdIdx}"  class="line" >수정</a><br>
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
	</script>
   </jsp:attribute>
</t:searchable_board_list>