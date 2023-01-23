<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>LicenseApi Page</title>
</head>
<body>
	<button name="button" onclick="javascript:subject()">국가자격 종목 목록 정보(SUBJECT)</button>
	<button name="button" onclick="javascript:date()">시험일정 (DATE)</button>
	<button name="button" onclick="javascript:statistics()">국가자격취득자 현황(STATISTICS)</button>
	<button name="button" onclick="javascript:interest()">관심자격 정보(INTEREST)</button>
	<button name="button" onclick="javascript:question()">문제아이디별 파일URL 조회(QUESTION)</button>
	<button name="button" onclick="javascript:qual()">국가기술자격 종목 정보(QUAL)</button>
</body>
<script>
function subject(){
	
	$.ajax({
		type:"POST",
		data:{
			
		},
		url:"licenseApiSubject.do",
		dataType:"text",
		success: function(data){
			if(data=="success"){
				alert("saved successfully");
				location.href="licenseApi.do";
			}else{
				alert("?");
			}
		},
		error:function(){
			alert("could't working ajax");
		}
	});
}
function date(){
	
	$.ajax({
		type:"POST",
		data:{
			
		},
		url:"licenseApiDate.do",
		dataType:"text",
		success: function(data){
			if(data=="success"){
				alert("saved successfully");
				location.href="licenseApi.do";
			}else{
				alert("?");
			}
		},
		error:function(){
			alert("could't working ajax");
		}
	});
	
	
}
function statistics(){
	
	$.ajax({
		type:"POST",
		data:{
			
		},
		url:"licenseStatistics.do",
		dataType:"text",
		success: function(data){
			if(data=="success"){
				alert("saved successfully");
				location.href="licenseApi.do";
			}else{
				alert("?");
			}
		},
		error:function(){
			alert("could't working ajax");
		}
	});
	
	
}
function interest(){
	
	$.ajax({
		type:"POST",
		data:{
			
		},
		url:"licenseApiInterest.do",
		dataType:"text",
		success: function(data){
			if(data=="success"){
				alert("saved successfully");
				location.href="licenseApi.do";
			}else{
				alert("?");
			}
		},
		error:function(){
			alert("could't working ajax");
		}
	});
	
	
}
function question(){
	
	$.ajax({
		type:"POST",
		data:{
			
		},
		url:"licenseApiQuestion.do",
		dataType:"text",
		success: function(data){
			if(data=="success"){
				alert("saved successfully");
				location.href="licenseApi.do";
			}else{
				alert("?");
			}
		},
		error:function(){
			alert("could't working ajax");
		}
	});
	
	
}
function qual(){
	
	$.ajax({
		type:"POST",
		data:{
			
		},
		url:"licenseApiQual.do",
		dataType:"text",
		success: function(data){
			if(data=="success"){
				alert("saved successfully");
				location.href="licenseApi.do";
			}else{
				alert("?");
			}
		},
		error:function(){
			alert("could't working ajax");
		}
	});
	
	
}
	</script>
</html>