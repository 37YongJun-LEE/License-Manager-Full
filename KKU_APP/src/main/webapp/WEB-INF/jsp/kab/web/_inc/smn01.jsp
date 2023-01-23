<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../_inc/tit.jsp"%>

<div class="smn_wrap">
	<ul class="smn">
	<c:choose>
		<c:when test="${admissionSessionVo ne null }">
			<li><a href="/web/eval/evalList.do" <c:if test="${page_num_depth_02 eq 2}">class="on"</c:if>>평가관리</a></li>
		</c:when>
		<c:otherwise>
		<li><a href="javascript:chkLogin('/web/application/applicationList.do','${orgSessionVo.orgIdx}')" <c:if test="${page_num_depth_02 eq 3}">class="on"</c:if>>인정신청</a></li>
			<li><a href="javascript:chkLogin('/web/apply/applyList.do','${orgSessionVo.orgIdx}')" <c:if test="${page_num_depth_02 eq 1}">class="on"</c:if>>계획 관리</a></li>
			<li><a href="javascript:chkLogin('/web/eval/evalList.do','${orgSessionVo.orgIdx}')" <c:if test="${page_num_depth_02 eq 2}">class="on"</c:if>>평가관리</a></li>
			<%-- <li><a href="javascript:chkLogin('/web/user/availableList.do','${orgSessionVo.orgIdx}')" <c:if test="${page_num_depth_02 eq 4}">class="on"</c:if>>평가사가용현황</a></li> --%>
			<li><a href="javascript:chkLogin('/web/possession/possessionList.do','${orgSessionVo.orgIdx}')" <c:if test="${page_num_depth_02 eq 5}">class="on"</c:if>>인정 보유현황</a></li>
			<%-- <li><a href="#" <c:if test="${page_num_depth_02 eq 5}">class="on"</c:if>>인증현황보고</a></li> --%>
		</c:otherwise>
	</c:choose>
		
	</ul>
</div> 
