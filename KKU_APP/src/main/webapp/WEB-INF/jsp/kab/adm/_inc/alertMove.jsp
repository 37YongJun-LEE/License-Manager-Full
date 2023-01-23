<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty message}">
	<script>alert("${message}");</script>
</c:if>
<c:if test="${!empty returnUrl}">
	<script>location.replace("${returnUrl}");</script>
</c:if>