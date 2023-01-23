<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div class="smn_wrap">
	<ul class="smn">
		<li><a href="/web/support/boardList.do?bbsDiv=notices" <c:if test="${page_num_depth_02 eq 1}">class="on"</c:if>>공지사항</a></li>
		<li><a href="/web/support/boardList.do?bbsDiv=qna" <c:if test="${page_num_depth_02 eq 2}">class="on"</c:if>>Q&A</a></li>
		<li><a href="/web/support/faq.do" <c:if test="${page_num_depth_02 eq 3}">class="on"</c:if>>FAQ</a></li>
	</ul>
</div>