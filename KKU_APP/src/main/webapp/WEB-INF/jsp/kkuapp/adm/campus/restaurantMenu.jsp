<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%
%>
<t:default>
	<jsp:attribute name="head_area">
	</jsp:attribute>

    <jsp:attribute name="meta_area">
    	<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>학교 정보 관리</li>
			<li>음식점 정보 관리</li>
			<li>음식점 메뉴 정보</li>
		</ol>
		<h2>음식점 메뉴 정보</h2>
	</jsp:attribute>

	<jsp:attribute name="body_area">
			<h2>메인 메뉴</h2>
			<p class="btn_area">
				<a class="btn_submit" id="insert_Main" href="javascript:{}" >추가</a>
			</p>
			<div id="mainDiv">
				<form name="frm" id="frm" action="restaurantMenuSubmit.do" autocomplete="off" method="post" >
				<input type="hidden" id="restIdx" name="restIdx" value="${restIdx}"/>
				<input type="hidden" id="mainMenuIdx" name="mainMenuIdx" value=""/>
				<input type="hidden" id="mainMenuName" name="mainMenuName" value=""/>
				<input type="hidden" id="mainMenuDesc" name="mainMenuDesc" value=""/>
				<input type="hidden" id="mainMenuPrice" name="mainMenuPrice" value=""/>
				<input type="hidden" id="subMenuIdx" name="subMenuIdx" value=""/>
				<input type="hidden" id="subMenuName" name="subMenuName" value=""/>
				<input type="hidden" id="subMenuDesc" name="subMenuDesc" value=""/>
				<input type="hidden" id="subMenuPrice" name="subMenuPrice" value=""/>
				<input type="hidden" id="mainAddMenu" name="addSubMenu" value="" /> 			
					
			<c:forEach var="menu" items="${menu}">
			<c:if test="${menu.mainYn == 'Y'}">
				<table class="table02" id="main" summary="음식점 메인 메뉴">
					<colgroup><col width="12%"><col width="38%"><col width="12%"><col width="38%"></colgroup>
			<tbody>
			
				<tr>
					<th scope="row">음식명<span class="star">*</span></th>
						<td>
							<input type="hidden" class="inputMainIdx" value="${menu.menuIdx}"/>
							<input class="inputMainName"  style="width:180px" type="text" value="${menu.menuName}" />    
							<p id="dupUsrIdYn" class="pass"> </p>
							
						</td>
						
						<th scope="row">음식 설명<span class=""></span></th>
						<td>
							<input class="inputMainDesc"  style="width:180px" type="text" value="${menu.menuDesc}" />
							<label class="f_0" for="">음식 종류 입력</label>
						</td>
				</tr>
				<tr>
					<th scope="row">음식가격<span class="star">*</span></th>
						<td>
							<input class="inputMainPrice"  style="width:180px" type="text" value="${menu.menuPrice}" />    
							<p id="dupUsrIdYn" class="pass"> </p>
							
						</td>
						
						<th scope="row">추가메뉴<span class="star">*</span></th>
						<td class="addMenuTd">
							<a onclick="window.open('./popup/addRestaurantMenu.do?restIdx=${restIdx}&menuIdx=${menu.menuIdx}', '수정팝업', 'width=335, height=335')"  style="color: blue" href="#none" >
							수정
							</a>
							<input type="text" class="addSubMenu"  id="addMenu${menu.menuIdx}" value="${menu.addMenu}" readonly>
						<%-- <select name="mainAddMenu" id="addMenu" class="addMenu" multiple style="height: 50px">
						<c:forEach var="addMenu" items="${addMenu}">
							<option value="${addMenu.menuIdx}">${addMenu.menuName}</option>	WWW
						</c:forEach>
						</select> --%>
						
							<!-- <input class="inputMainAdd"  style="width:180px" type="text" id="restMenucategory" value="" />
							<label class="f_0" for="">음식 종류 입력</label> -->
						</td>
				</tr>

			</tbody>
			</table>
			<p class="btn_area max_width">
				<a href="/admin/restaurantMenuDelete.do?menuIdx=${menu.menuIdx}&restIdx=${menu.restIdx}" class="btn_del">삭제</a>
				<!-- <a class="btn_submit" href="javascript:save();">저장</a> -->
			</p>		
			</c:if>
			</c:forEach>
			</div>
				<h2>서브 메뉴</h2>
			<div id ="subDiv">
			<p class="btn_area">
				<a class="btn_submit" id="insert_Sub" href="javascript:{}" >추가</a>
			</p>					
			
			<c:forEach var="menu" items="${menu}">
			<c:if test="${menu.mainYn == 'N'}">

						
			<table class="table02" id="sub" summary="음식점 메인 메뉴">
			<colgroup><col width="12%"><col width="38%"><col width="12%"><col width="38%"></colgroup>
			<tbody>
			
				<tr>
					<th scope="row">음식명<span class="star">*</span></th>
						<td>
							<input type="hidden" class=inputSubIdx value="${menu.menuIdx}"/>
							<input class="inputSubName"  style="width:180px" type="text" value="${menu.menuName}" />    
							<p id="dupUsrIdYn" class="pass"> </p>
							
						</td>
						
						<th scope="row">음식 설명<span class=""></span></th>
						<td>
							<input class="inputSubDesc"  style="width:180px" type="text" value="${menu.menuDesc}" />
							<label class="f_0" for="">음식 종류 입력</label>
						</td>
				</tr>
				<tr class = "subTr">
					<th scope="row">음식가격<span class="star">*</span></th>
						<td>
							<input class="inputSubPrice"  style="width:180px" type="text" value="${menu.menuPrice}" />    
							<p id="dupUsrIdYn" class="pass"> </p>
							
						</td>
				</tr>

			</tbody>
			</table>
			<p class="btn_area max_width">
				<a href="/admin/restaurantMenuDelete.do?menuIdx=${menu.menuIdx}&restIdx=${menu.restIdx}" class="btn_del">삭제</a>
			</p>		
			
			</c:if>
			</c:forEach>	
			</div>	
	</form>
		</div>
		<p class="btn_area max_width">
			<a href="/admin/restaurant.do" class="l btn_list">목록</a>
				

			<a class="btn_submit" href="javascript:save();">저장</a>
			
		</p>
	</jsp:attribute>

	<jsp:attribute name="script_area">
<script>
var tableMainIndex = 0;
var tableSubIndex = 0;
var addId = 100;

$(document).ready(function(){
	if(!$("#main").length){
		insertMain();	
	}
	if(!$("#sub").length){
		insertSub();
	}
	
});


$("#insert_Main").on("click",insertMain);

$("#insert_Sub").on("click",insertSub);


function save(){

	$inputMainIdx = "";
	$inputMainName = "";
	$inputMainDesc = "";
	$inputMainPrice = "";
	$inputAddMenu = "";
	
	for(var i=0; i <$(".addMenuTd").length ; i++){
		if(i === $(".addMenuTd").length-1){
			$inputAddMenu += $(".addMenuTd input").eq(i).val();
		}else{
			$inputAddMenu += $(".addMenuTd input").eq(i).val();
			$inputAddMenu += "^";
		}
	}
	console.log($inputAddMenu);
	
	for(var i=0; i<$(".inputMainIdx").length ; i++){
		if(i === $(".inputMainIdx").length-1){
			$inputMainIdx += $(".inputMainIdx").eq(i).val();
		}else{
			$inputMainIdx += $(".inputMainIdx").eq(i).val();
			$inputMainIdx += "^";
		}
	}

	console.log($inputMainIdx);
	
	for(var i=0; i<$(".inputMainName").length ; i++){
		if(i === $(".inputMainName").length-1){
			$inputMainName += $(".inputMainName").eq(i).val();
		}else{
			$inputMainName += $(".inputMainName").eq(i).val();
			$inputMainName += "^";
		}
	}
	
	console.log($inputMainName);
	
	for(var i=0; i<$(".inputMainDesc").length ; i++){
		if(i === $(".inputMainDesc").length-1){
			$inputMainDesc += $(".inputMainDesc").eq(i).val();
		}else{
			$inputMainDesc += $(".inputMainDesc").eq(i).val();
			$inputMainDesc += "^";
		}
	}
	
	console.log($inputMainDesc);
	
	for(var i=0; i<$(".inputMainPrice").length ; i++){
		if(i == $(".inputMainPrice").length-1){
			$inputMainPrice += $(".inputMainPrice").eq(i).val();
		}else{
			$inputMainPrice += $(".inputMainPrice").eq(i).val();
			$inputMainPrice += "^";
		}
	}
	
	console.log($inputMainPrice);
	

	$inputSubIdx = "";
	$inputSubName = "";
	$inputSubDesc = "";
	$inputSubPrice = "";
	$inputSubAddArr = "";
	
	for(var i=0; i<$(".inputSubIdx").length ; i++){
		if(i === $(".inputSubIdx").length-1){
			$inputSubIdx += $(".inputSubIdx").eq(i).val();
		}else{
			$inputSubIdx += $(".inputSubIdx").eq(i).val();
			$inputSubIdx += "^";
		}
	}

	console.log($inputSubIdx);
	
	for(var i=0; i<$(".inputSubName").length ; i++){
		if(i === $(".inputSubName").length-1){
			$inputSubName += $(".inputSubName").eq(i).val();
		}else{
			$inputSubName += $(".inputSubName").eq(i).val();
			$inputSubName += "^";
		}
	}
	
	console.log($inputSubName);
	
	for(var i=0; i<$(".inputSubDesc").length ; i++){
		if(i === $(".inputSubDesc").length-1){
			$inputSubDesc += $(".inputSubDesc").eq(i).val();
		}else{
			$inputSubDesc += $(".inputSubDesc").eq(i).val();
			$inputSubDesc += "^";
		}
	}
	
	console.log($inputSubDesc);
	
	for(var i=0; i<$(".inputSubPrice").length ; i++){
		if(i == $(".inputSubPrice").length-1){
			$inputSubPrice += $(".inputSubPrice").eq(i).val();
		}else{
			$inputSubPrice += $(".inputSubPrice").eq(i).val();
			$inputSubPrice += "^";
		}
	}
	
	console.log($inputSubPrice);

	$("#mainAddMenu").val($inputAddMenu);
	$("#mainMenuIdx").val($inputMainIdx);
	$("#mainMenuName").val($inputMainName);
	$("#mainMenuDesc").val($inputMainDesc);
	$("#mainMenuPrice").val($inputMainPrice);
	
	$("#subMenuIdx").val($inputSubIdx);
	$("#subMenuName").val($inputSubName);
	$("#subMenuDesc").val($inputSubDesc);
	$("#subMenuPrice").val($inputSubPrice);
	
	/* var valueArray = new Array(); // 값을 담을 배열

	//셀렉트박스에 있는 값을 하나씩 꺼내 배열에 담는 로직

	$('select[name=mainAddMenu] option:selected').each(function(index){
	 var num=$(this).attr('value');
	 valueArray.push(num);
	});
	
	console.log(valueArray); */ 
	
	
	document.getElementById("frm").submit();
}

function insertMain(){
	tableMainIndex += 1;
	addId +=1;
		var html = "";
		 	html += '<table class="table02" id="main'+tableMainIndex+'" name="main'+tableMainIndex+'" summary="음식점 메인 메뉴">';
			html += '<colgroup><col width="12%"><col width="38%"><col width="12%"><col width="38%"></colgroup>';
			html += '<tbody>'
			html += '<tr>'	
			html += '<th scope="row">음식명<span class="star">*</span></th>'
			html += '<td>'
			html += '<input type="hidden" class="inputMainIdx" value="0"/>'
			html += '<input class="inputMainName"  style="width:180px" type="text" value="" />'    
			html +=	'<p id="dupUsrIdYn" class="pass"> </p>'
			html += '</td>'
			html += '<th scope="row">음식 설명<span class=""></span></th>'
			html += '<td>'			
			html += '<input class="inputMainDesc"  style="width:180px" type="text" value="" />'				
			html += '<label class="f_0" for="">음식 종류 입력</label>';
			html += '</td>';
			html += '</tr>';
			html += '<tr class = "subTr">';
			html += '<th scope="row">음식가격<span class="star">*</span></th>';
			html += '<td>';			
			html += '<input class="inputMainPrice"  style="width:180px" type="text" value="" />';    
			html += '<p id="dupUsrIdYn" class="pass"> </p>';				
			html += '</td>';			
			html += '<th scope="row">추가메뉴<span class="star">*</span></th>';
			html += '<td class="addMenuTd">';
			html += '<a onclick="window.open(\'./popup/addRestaurantMenu.do?restIdx='+${restIdx} +'&menuIdx='+addId+' \', \'수정팝업\', \'width=335, height=335\')"  style="color: blue" href="#none" >수정 </a>';
			html += '<input type="text" class="addSubMenu"  id="addMenu'+addId+'" readonly>';		
			html += '</select>';
			html += '</td>';			
			html += '</tr>';		
			html += '</tbody>';
			html += '</table>';
			html += '<p class="btn_area max_width">';
			html += '<a href="#" class="btn_del">삭제</a>';		
			html += '</p>';
			
			$("#mainDiv").append(html);
}

function insertSub(){
	tableSubIndex += 1;
	var html = "";
		
	 	html += '<table class="table02" id="sub'+tableMainIndex+'" name="sub'+tableSubIndex+'"summary="음식점 메인 메뉴">';
		html += '<colgroup><col width="12%"><col width="38%"><col width="12%"><col width="38%"></colgroup>';
		html += '<tbody>'
		html += '<tr>'	
		html += '<th scope="row">음식명<span class="star">*</span></th>'
		html += '<td>'
		html += '<input type="hidden" class="inputSubIdx" value="0"/>'
		html += '<input class="inputSubName"  style="width:180px" type="text" value="" />'    
		html +=	'<p id="dupUsrIdYn" class="pass"> </p>'
		html += '</td>'
		html += '<th scope="row">음식 설명<span class=""></span></th>'
		html += '<td>'			
		html += '<input class="inputSubDesc"  style="width:180px" type="text" value="" />'				
		html += '<label class="f_0" for="">음식 종류 입력</label>';
		html += '</td>';
		html += '</tr>';
		html += '<tr class = "subTr">';
		html += '<th scope="row">음식가격<span class="star">*</span></th>';
		html += '<td>';			
		html += '<input class="inputSubPrice"  style="width:180px" type="text" value="" />';    
		html += '<p id="dupUsrIdYn" class="pass"> </p>';				
		html += '</td>';						
		html += '</tr>';		
		html += '</tbody>';
		html += '</table>';
		html += '<p class="btn_area max_width">';
		html += '<a href="#" class="btn_del">삭제</a>';		
		html += '</p>';
		
		$("#subDiv").append(html);
	}


</script>
	</jsp:attribute>
</t:default>