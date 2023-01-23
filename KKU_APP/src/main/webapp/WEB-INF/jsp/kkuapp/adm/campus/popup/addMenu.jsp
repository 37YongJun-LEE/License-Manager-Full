<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<% 
	String param1 = request.getParameter("menuIdx");
	
%>

<t:popup>

	<jsp:attribute name="head_area">
	</jsp:attribute>

    <jsp:attribute name="meta_area">
    </jsp:attribute>
    
    <jsp:attribute name="body_area">
    	<div id="popup">
		<div class="pop_tit">
			<h2> 정보 변경</h2>
		</div>
	<div class="pop_cont">
		<!-- <p class="tit">자산명</p> --> <!-- 자산명, 최초 구매일, 가격(원) 등 인풋폼-->
		<!-- <p class="cont"><input type="text" value="표준PC_N20"></p> -->
	</hr>
		<p class="tit">분류</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
			<p class="cont">
				<select id="selectMenu" multiple="multiple" style="height : 200px; width: 100%">
					<c:forEach var="menu" items="${subMenu}">
						<option>${menu.menuName}</option>
					</c:forEach>
				</select>
			</p>
	<p class="pop_btn"><a href="#" class="del">취소</a><a href="javascript:onClick(${menuIdx});" class="comp">수정</a></p>
</div>
	</div>
    </jsp:attribute>
    
   	<jsp:attribute name="script_area">
   		<script>
   		function onClick(menuIdx){
   			/* opener.document.getElementById("selectMenu").value = idx; */
   			selectMenu = $("#selectMenu").val();
   			
   			opener.document.getElementById("addMenu"+menuIdx).value = selectMenu
   			console.log($("#selectMenu").val());
   			window.close();
   			
   		}
   			

   		
   		</script>
   	</jsp:attribute>
</t:popup>

