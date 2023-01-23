<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../_inc/tit.jsp"%>

 <div class="smn_wrap">
	<ul class="smn">
		<li><a href="/web/orgInfo/overseas.do" <c:if test="${page_num_depth_02 eq 1}">class="on"</c:if>>해외AB</a></li>
		<li><a href="/web/orgInfo/domestic.do" <c:if test="${page_num_depth_02 eq 2}">class="on"</c:if>>국내 인증기관</a></li>
	</ul>
</div> 

