<%@ tag language="java" pageEncoding="UTF-8"%>
<!-- 테그 속성 -->
<%@attribute name="head_area" fragment="true" required="false" %>
<%@attribute name="meta_area" fragment="true" required="false"%>
<%@attribute name="body_area" fragment="true" %>
<%@attribute name="script_area" fragment="true" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="generator" content="editplus">
		<meta name="author" content="">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<title>KKU APP ADMIN</title>
		<link rel="stylesheet" type="text/css" href="/_css/adm/default.css">
		
		<script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="/_js/adm/pop_layer.js"></script>
		<script src="/_js/adm/common.js"></script>
		<script src="/_js/adm/frmCheck.js"></script>
		<script src="/_js/adm/jw-strCheck-15.12.7.js"></script>
		
		<!-- <link href="/_css/adm/jquery-ui.css" type="text/css" rel="stylesheet" media="screen"/> -->
		<script src="/_js/adm/jquery-ui.js" language="JavaScript" type="text/javascript"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<!-- google charts -->
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

		<jsp:invoke fragment="head_area"/>
	</head>
	<body style="background-color : white">
		<div >
			<div >
						<jsp:invoke fragment="meta_area"/>
					</div>
					<div class="cont_view max_width pt0">
						<jsp:invoke fragment="body_area"/>
					</div>
				</div>
		<%-- <%@include file="../../jsp/kkuapp/adm/_inc/footer.jsp"%> --%>
	
		<div id="script">
			<jsp:invoke fragment="script_area"/>
		</div>
	</body>
</html>