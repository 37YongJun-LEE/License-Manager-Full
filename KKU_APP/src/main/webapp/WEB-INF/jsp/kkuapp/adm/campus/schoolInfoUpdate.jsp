<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%> 

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:default>
   <jsp:attribute name="head_area">
   </jsp:attribute>

    <jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>학교 정보 관리</li>
			<li>학교 정보 업데이트</li>
		</ol>
		<h2>학교 정보 업데이트</h2>
   </jsp:attribute>
   

   <jsp:attribute name="body_area">
   		<table class="table01" summary="회원 목록" >
			<colgroup>
				<col width="65px">
				<col width="45%">
				<col width="35%">
				<col width="20%">
			
			</colgroup>
			
			<thead>
				<tr>
					<th scope="col">
						<input class="checkbox" type="checkbox" value="" id="ck1" onclick="allCheck();">
						<label for="ck1" class="font_0 chk_all"></label>
					</th>
						<th>카테고리</th>
						<th>최근 업데이트 날짜</th>
						<th>관리</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="4" style="text-align:left; padding-left:70px;">
					<strong>일정 정보</strong>
				</td>
			</tr>
			<tr>
				<td>
				<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
				<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
				</td>
				<td>학사일정 (1학기)</td>
				<td>${result.noticeUpdated} </td>
				<td><p class="btn">
				<a href="javascript:first_sem();"  class="line" >업데이트</a><br>
			</p></td>
			</tr>
			<tr>
				<td>
				<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
				<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
				</td>
				<td>학사일정 (2학기)</td>
				<td>${result.noticeUpdated} </td>
				<td><p class="btn">
				<a href="javascript:sec_sem();"  class="line" >업데이트</a><br>
			</p></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align:left; padding-left:70px;">
					<strong>학식 정보</strong>
				</td>
			</tr>
			<tr>
				<td>
				<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
				<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
				</td>
				<td>모시래 학식 정보</td>
				<td>${result.noticeUpdated} </td>
				<td><p class="btn">
				<a href="javascript:mosirae();"  class="line" >업데이트</a><br>
			</p></td>
			</tr>
			<tr>
				<td>
				<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
				<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
				</td>
				<td>해오름 학식 정보</td>
				<td>${result.noticeUpdated} </td>
				<td><p class="btn">
				<a href="javascript:haeoreum();"  class="line" >업데이트</a><br>
			</p></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align:left; padding-left:70px;">
					<strong>버스 정보</strong>
				</td>
			</tr>
			<tr>
				<td>
				<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
				<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
				</td>
				<td>버스 시간표</td>
				<td>${result.noticeUpdated} </td>
				<td><p class="btn">
				<a href="javascript:bus();"  class="line" >업데이트</a><br>
			</p></td>
			</tr>
			</tbody>
		</table>
   </jsp:attribute>

   <jsp:attribute name="script_area">
   
   		<script>
	   		function first_sem(){
	   			
	   			$.ajax({
	   				type:"POST",
	   				data:{
	   					
	   				},
	   				url:"/scheduleAnnualCrawlerReload1.do",
	   				dataType:"text",
	   				success: function(data){
	   					if(data=="success"){
	   						alert("업데이트가 되었습니다!");
	   						location.href="/admin/schoolInfoUpdate.do";
	   					}else{
	   						alert("?");
	   					}
	   				},
	   				error:function(){
	   					alert("[오류] 문제가 발생했습니다");
	   				}
	   			});
	   		}
	   		
	   		function sec_sem(){
	   			
	   			$.ajax({
	   				type:"POST",
	   				data:{
	   					
	   				},
	   				url:"/scheduleAnnualCrawlerReload2.do",
	   				dataType:"text",
	   				success: function(data){
	   					if(data=="success"){
	   						alert("업데이트가 되었습니다!");
	   						location.href="/admin/schoolInfoUpdate.do";
	   					}else{
	   						alert("?");
	   					}
	   				},
	   				error:function(){
	   					alert("[오류] 문제가 발생했습니다");
	   				}
	   			});
	   		}
	   		
			function bus(){
				   			
	   			$.ajax({
	   				type:"POST",
	   				data:{
	   					
	   				},
	   				url:"/busCrawlerReload.do",
	   				dataType:"text",
	   				success: function(data){
	   					if(data=="success"){
	   						alert("업데이트가 되었습니다!");
	   						location.href="/admin/schoolInfoUpdate.do";
	   					}else{
	   						alert("?");
	   					}
	   				},
	   				error:function(){
	   					alert("[오류] 문제가 발생했습니다");
	   				}
	   			});
	   		}
			
			function mosirae(){
	   			
	   			$.ajax({
	   				type:"POST",
	   				data:{
	   					
	   				},
	   				url:"/diet_mosirae_crawler.do",
	   				dataType:"text",
	   				success: function(data){
	   					if(data=="success"){
	   						alert("업데이트가 되었습니다!");
	   						location.href="/admin/schoolInfoUpdate.do";
	   					}else{
	   						alert("?");
	   					}
	   				},
	   				error:function(){
	   					alert("[오류] 문제가 발생했습니다");
	   				}
	   			});
	   		}
	   		
	   		function haeoreum(){
	   			
	   			$.ajax({
	   				type:"POST",
	   				data:{
	   					
	   				},
	   				url:"/diet_haeoreum_crawler.do",
	   				dataType:"text",
	   				success: function(data){
	   					if(data=="success"){
	   						alert("업데이트가 되었습니다!");
	   						location.href="/admin/schoolInfoUpdate.do";
	   					}else{
	   						alert("?");
	   					}
	   				},
	   				error:function(){
	   					alert("[오류] 문제가 발생했습니다");
	   				}
	   			});
	   		}
	   		
   		</script>
   </jsp:attribute>
</t:default>