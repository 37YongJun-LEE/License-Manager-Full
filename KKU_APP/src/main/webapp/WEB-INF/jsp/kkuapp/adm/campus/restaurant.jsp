<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%> 

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:searchable_board_list search_urls="/admin/restaurant.do" search_range_name="등록일" search_condition_name="검색구분" search_keyword_placeholder="검색어 입력">
   <jsp:attribute name="head_area">
   
   </jsp:attribute>
	


    <jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>학교 정보 관리</li>
			<li>음식점 정보 관리</li>
		</ol>
		<h2>음식점 정보 관리</h2>
		

   </jsp:attribute>
   
   <jsp:attribute name="search_options">
   	<option value="all" selected="">전체</option>
   	<option value="name"   <c:if test="">selected="selected"</c:if> >음식점별</option>
   	<option value="kind"   <c:if test="">selected="selected"</c:if>>음식종류별</option>
   </jsp:attribute>

   <jsp:attribute name="body_area">
   
      <table class="table01" summary="회원 목록" >
         <caption>관리자 목록</caption>
         <colgroup>
            <%-- <col width="4%"> --%>
            <col width="5%">
            <col width="12%">
            <col width="8%">
            <col width="10%">
            <col width="15%">
            <col width="15%">
            <col width="13%">
            <col width="auto">
            <col width="5%">
            <col width="5%">
         </colgroup>
         
         <thead>
            <tr>
<%--                <th scope="col">
                  <input class="checkbox" type="checkbox" value="" id="ck1" onclick="allCheck();">
                  <label for="ck1" class="font_0 chk_all"></label>
               </th> --%>
               <th>NO</th>
                  <th >음식점명</th>
                  <th>음식종류</th>
                  <th>시간</th>
                  <th>사장님 한마디</th>
                  <th>주소</th>
                  <th>휴대폰</th>
                  <th>등록일</th>
                  <th>관리</th>
                  <th>메뉴</th>
            </tr>
         </thead>
         <tbody>
         <c:forEach var="result" items="${restaurant}">
               <tr>
  <%--                 <td>
                  <input class="checkbox" type="checkbox" value="${result.restIdx}" name="restIdxArr" id="${result.restIdx}" >
                  <label for="${result.restIdx}" class="font_0 chk_all"></label>
                  </td> --%>
            
                  <td>${result.restIdx}</td>
                  <td>${result.restName}</td>
                  <td>${result.restMenucategory}</td>
                  <td>${result.restOpentime}</td>
                  <td>${result.restDescription}</td>
                  <td>${result.restAddr}</td>
                  <td>${result.restContact}</td>
                  <td>${result.regDate}</td>
                  <td>
                     <p class="btn">
                        <a href="/admin/restaurantModify.do?restIdx=${result.restIdx}"  class="line" >수정</a><br>
                     </p>
                  </td>
                  <td>
                     <p class="btn">
                        <a href="/admin/restaurantMenu.do?restIdx=${result.restIdx}"  class="line" >메뉴</a><br>
                     </p>
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
     	<p class="btn_area">
			<a href="/admin/restaurantModify.do" class="btn_excel">작성</a>
		</p>	
         <p class="pn" >
            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
         </p>
   </jsp:attribute>

   <jsp:attribute name="script_area">
   	<script>
    	function allCheck(){
        if($("input:checkbox[id='ck1']").prop("checked")){
             $("input:checkbox[name='restIdxArr']").prop("checked",true);
         }else{
             $("input:checkbox[name='restIdxArr']").prop("checked",false);
         } 
     }
   	</script>
   </jsp:attribute>  
</t:searchable_board_list>

     <%-- <c:if test="${adminSessionVo.cmntIdx == -1 }">
         <p class="btn_area max_width">
            <a href="javascript:void(0)" onclick="selectDelete(); return false" class="btn_del">삭제</a>
         </p>
      </c:if> --%> 
  