<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:default>
	<jsp:attribute name="head_area">
		
	</jsp:attribute>

  	<jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>학교 정보 관리</li>
			<li>학과 정보 업데이트</li>
		</ol>
		<h2>학과 정보 업데이트</h2>
	</jsp:attribute>

	<jsp:attribute name="body_area">
		<table class="table01" summary="회원 목록" >
					<caption>관리자 목록</caption>
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
								<th>학과</th>
								<th>최근 업데이트 날짜</th>
								<th>관리</th>
						</tr>
					</thead>
					<tbody>
				 	<c:forEach var="result" items="${studentInfoUpdateList}">
						
							<tr>
								<td>
									<input class="checkbox" type="checkbox" value="${result.mnoticeIdx}" name="usrIdxArr" id="${result.mnoticeIdx}" >
									<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
								</td>
								<td>${result.mnoticeCategory }</td>
								<td>${result.mnoticeUpdated} </td>
								<td><p class="btn">
									<a href="#"  class="line" >업데이트</a><br>
								</p></td>
							</tr>
					</c:forEach> 
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
	 	</script>
	</jsp:attribute>
</t:default>
