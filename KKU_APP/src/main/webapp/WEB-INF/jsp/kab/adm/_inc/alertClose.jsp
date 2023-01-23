<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty message}">
	<script>alert("${message}");</script>
</c:if>
<script>opener.location.reload(true);</script>
<script>self.close();</script>
