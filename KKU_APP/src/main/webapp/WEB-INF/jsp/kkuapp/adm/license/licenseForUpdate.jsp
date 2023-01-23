<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>
<t:default>
	<jsp:attribute name="head_area">
		<!-- 헤더 링크 -->
	</jsp:attribute>

 	<jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>자격증  관리</li>
			<li>자격증 정보 업데이트</li>
		</ol>
		<h2>자격증 정보 업데이트</h2>
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
				 	<%-- <c:forEach var="result" items="${campusInfoUpdateList}">
							<tr>
								<td>
								<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
								<label for="${result.usrIdx}" class="font_0 chk_all"></label>
								</td>
								<td>${result.noticeCategory }</td>
								<td>${result.noticeUpdated} </td>
								<td><p class="btn">
								<a href="#"  class="line" >업데이트</a><br>
							</p></td>
							</tr>
					</c:forEach>  --%>
					<tr>
						<td>
						<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
						<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
						</td>
						<td>국가자격 종목 목록 정보</td>
						<td>${result.noticeUpdated} </td>
						<td><p class="btn">
						<a href="javascript:subject();"  class="line" >업데이트</a><br>
					</p></td>
					</tr>
					<tr>
						<td>
						<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
						<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
						</td>
						<td>시험일정</td>
						<td>${result.noticeUpdated} </td>
						<td><p class="btn">
						<a href="javascript:date();"  class="line" >업데이트</a><br>
					</p></td>
					</tr>
					<tr>
						<td>
						<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
						<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
						</td>
						<td>국가자격취득자 현황</td>
						<td>${result.noticeUpdated} </td>
						<td><p class="btn">
						<a href="javascript:statistics();"  class="line" >업데이트</a><br>
					</p></td>
					</tr>
					<tr>
						<td>
						<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
						<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
						</td>
						<td>관심자격 정보</td>
						<td>${result.noticeUpdated} </td>
						<td><p class="btn">
						<a href="javascript:interest();"  class="line" >업데이트</a><br>
					</p></td>
					</tr>
					<tr>
						<td>
						<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
						<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
						</td>
						<td>문제아이디별 파일 URL 조회</td>
						<td>${result.noticeUpdated} </td>
						<td><p class="btn">
						<a href="javascript:question();"  class="line" >업데이트</a><br>
					</p></td>
					</tr>
					<tr>
						<td>
						<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
						<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
						</td>
						<td>국가기술자격 종목 정보</td>
						<td>${result.noticeUpdated} </td>
						<td><p class="btn">
						<a href="javascript:qual();"  class="line" >업데이트</a><br>
					</p></td>
					</tr>
					<tr>
						<td>
						<input class="checkbox" type="checkbox" value="${result.noticeIdx}" name="usrIdxArr" id="${result.noticeIdx}" >
						<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
						</td>
						<td>한국데이터산업진흥원 자격증 정보</td>
						<td>${result.noticeUpdated} </td>
						<td><p class="btn">
						<a href="javascript:information();"  class="line" >업데이트</a>
						<br>
					</p></td>
					</tr>
					</tbody>
				</table>
	</jsp:attribute>

	<jsp:attribute name="script_area">
		<script>
			function allCheck(){
				if($("input:checkbox[id='ck1']").prop("checked")){
			        $("input:checkbox[name='usrIdxArr']").prop("checked",true);
			    }else{
			        $("input:checkbox[name='usrIdxArr']").prop("checked",false);
			    } 
			}
			 
		 	function selectDelete(){
				if(confirm('정말 삭제하시겠습니까?')){
					$("input:checkbox[name='usrIdxArr']").each(function() {
						if($(this).is(':checked')){
							$.ajax({ 
								type : "POST",
								url : "/kpcceo/admin/userDelete.do",
								data : {
									usrIdx : $(this).val(),
								},
								success : function() {}
							});
						}
		
					});
					alert("정상적으로 삭제되었습니다.");
					location.reload();
				}	
			}
		 	
		 	function subject(){
		 		
		 		$.ajax({
		 			type:"POST",
		 			data:{
		 				
		 			},
		 			url:"/licenseApiSubject.do",
		 			dataType:"text",
		 			success: function(data){
		 				if(data=="success"){
		 					alert("업데이트가 되었습니다!");
		 					location.href="/admin/licenseUpdateList.do";
		 				}else{
		 					alert("?");
		 				}
		 			},
		 			error:function(){
		 				alert("[에러] 업데이트가 실패하였습니다");
		 			}
		 		});
		 		
		 		
		 	}
		 	function date(){
		 		
		 		$.ajax({
		 			type:"POST",
		 			data:{
		 				
		 			},
		 			url:"/licenseApiDate.do",
		 			dataType:"text",
		 			success: function(data){
		 				if(data=="success"){
		 					alert("업데이트가 되었습니다!");
		 					location.href="/admin/licenseUpdateList.do";
		 				}else{
		 					alert("?");
		 				}
		 			},
		 			error:function(){
		 				alert("[에러] 업데이트가 실패하였습니다");
		 			}
		 		});
		 		
		 		
		 	}
		 	function statistics(){
		 		
		 		$.ajax({
		 			type:"POST",
		 			data:{
		 				
		 			},
		 			url:"/licenseStatistics.do",
		 			dataType:"text",
		 			success: function(data){
		 				if(data=="success"){
		 					alert("업데이트가 되었습니다!");
		 					location.href="/admin/licenseUpdateList.do";
		 				}else{
		 					alert("?");
		 				}
		 			},
		 			error:function(){
		 				alert("[에러] 업데이트가 실패하였습니다");
		 			}
		 		});
		 		
		 		
		 	}
		 	function interest(){
		 		
		 		$.ajax({
		 			type:"POST",
		 			data:{
		 				
		 			},
		 			url:"/licenseApiInterest.do",
		 			dataType:"text",
		 			success: function(data){
		 				if(data=="success"){
		 					alert("업데이트가 되었습니다!");
		 					location.href="/admin/licenseUpdateList.do";
		 				}else{
		 					alert("?");
		 				}
		 			},
		 			error:function(){
		 				alert("[에러] 업데이트가 실패하였습니다");
		 			}
		 		});
		 		
		 		
		 	}
		 	function question(){
		 		
		 		$.ajax({
		 			type:"POST",
		 			data:{
		 				
		 			},
		 			url:"/licenseApiQuestion.do",
		 			dataType:"text",
		 			success: function(data){
		 				if(data=="success"){
		 					alert("업데이트가 되었습니다!");
		 					location.href="/admin/licenseUpdateList.do";
		 				}else{
		 					alert("?");
		 				}
		 			},
		 			error:function(){
		 				alert("[에러] 업데이트가 실패하였습니다");
		 			}
		 		});
		 		
		 		
		 	}
		 	function qual(){
		 		
		 		$.ajax({
		 			type:"POST",
		 			data:{
		 				
		 			},
		 			url:"/licenseApiQual.do",
		 			dataType:"text",
		 			success: function(data){
		 				if(data=="success"){
		 					alert("업데이트가 되었습니다!");
		 					location.href="/admin/licenseUpdateList.do";
		 				}else{
		 					alert("?");
		 				}
		 			},
		 			error:function(){
		 				alert("[에러] 업데이트가 실패하였습니다");
		 			}
		 		});
		 	}
		 	
		 	function information(){
				if(confirm("크롤링 하시겠습니까?"))
					result = location.href = "/admin/dataCrawler.do?type1=ok";
				else{
					alert("취소했어요");
					return false;
				}
			    loading("크롤링중입니다...이 작업은 3분정도 소요됩니다.");
			}
	 	</script>
	</jsp:attribute>
</t:default>
