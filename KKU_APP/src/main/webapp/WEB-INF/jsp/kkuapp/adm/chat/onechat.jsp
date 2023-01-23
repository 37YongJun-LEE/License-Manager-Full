<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%> 

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:searchable_board_list search_urls="/admin/userList.do" search_range_name="가입일"  search_condition_name="검색구분" search_keyword_placeholder="검색어 입력">
   <jsp:attribute name="head_area">
   </jsp:attribute>

    <jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>채팅 관리</li>
			<li>1:1 채팅관리</li>
		</ol>
		<h2>1:1 채팅 관리</h2>
   </jsp:attribute>
   
   <jsp:attribute name="search_options">
   </jsp:attribute>

   <jsp:attribute name="body_area">
   </jsp:attribute>

   <jsp:attribute name="script_area">
   </jsp:attribute>
</t:searchable_board_list>