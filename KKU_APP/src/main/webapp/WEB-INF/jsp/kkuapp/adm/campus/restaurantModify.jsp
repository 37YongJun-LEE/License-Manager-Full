<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<t:default>
	<jsp:attribute name="head_area">
	</jsp:attribute>

    <jsp:attribute name="meta_area">
    	<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>학교 정보 관리</li>
			<li>음식점 정보 관리</li>
			<li>음식점 정보  <c:if test="${!empty param.restIdx}">수정</c:if><c:if test="${empty param.restIdx}">등록</c:if></li>
		</ol>
		<h2>음식점 정보 <c:if test="${!empty param.restIdx}">수정</c:if><c:if test="${empty param.restIdx}">등록</c:if></h2>
	</jsp:attribute>

	<jsp:attribute name="body_area">
		<form name="frm" id="frm" action="restaurantModifySubmit.do" autocomplete="off" method="post" >
			<input type="hidden" id="restIdx" name="restIdx" value="${rest.restIdx}" />
			
			
			<table class="table02" summary="음식점 기본정보 등록">
				<caption>음식점 기본정보 등록</caption>
				<colgroup><col width="12%"><col width="38%"><col width="12%"><col width="38%"></colgroup>
				<tbody>
					<tr>
						<th scope="row">음식점명<span class="star">*</span></th>
						<td>
							<!-- <a class="sm_line" id="chkDupUsrIdBtn" href="javascript:void(0);">중복확인</a> -->
							<input style="width:180px" id="restName" name="restName" type="text" value="${rest.restName}"/>    
							<p id="dupUsrIdYn" class="pass"> </p>
							
						</td>
						
						<th scope="row">음식종류<span class="star">*</span></th>
						<td>
							<input style="width:180px" type="text" id="restMenucategory" name="restMenucategory" value="${rest.restMenucategory}" />
							<label class="f_0" for="">음식 종류 입력</label>
						</td>
					</tr>
	
					<tr>
						<th scope="row">영업 시간<span class="star">*</span></th>
						<td>
							<input type="text" id="restOpentime" name="restOpentime" value="${rest.restOpentime}" style="width:180px">
							<label class="f_0" for="">영업시간 입력</label>
						</td>
						<th scope="row">사장님 한마디<span class="star">*</span></th>
						<td>
							<input type="text" id="restDescription" name="restDescription" value="${rest.restDescription}" placeholder="" class="w300">
							<label class="f_0" for=""></label>
						</td>
					</tr>
					<tr>	
						<th scope="row">주소<span class="star">*</span></th>
						<td>
							<input type="text" id="restAddr" name="restAddr" value="${rest.restAddr}" class="w300">
						</td>
						<th scope="row">사장님 휴대폰<span class="star">*</span></th>
						<td >
							<input style="width:180px" type="text" id="restContact" name="restContact" value="${rest.restContact}">
						</td>
					</tr>
					<tr>
						<th scope="row">배달가능<span class="star">*</span></th>
						<td class="ra_base">
							<input type="radio" id="restDeliY" name="deliveryYn" value="Y" <c:if test="${rest.deliveryYn eq 'Y' }">checked</c:if>>
							<label for="restDeliY" class="mr15">사용</label>
							<input type="radio" id="restDeliN" name="deliveryYn" value="N" <c:if test="${rest.deliveryYn eq 'N' }">checked</c:if>>
							<label for="restDeliN" class="mr15">미사용</label>
						</td>
						<th scope="col">사용여부<span class="star">*</span></th>
						<td class="ra_base">
							<input type="radio" id="restUseY" name="useYn" value="Y" <c:if test="${rest.useYn eq 'Y' }">checked</c:if>>
							<label for="restUseY" class="mr15">사용</label>
							<input type="radio" id="restUseN" name="useYn" value="N" <c:if test="${rest.useYn eq 'N' }">checked</c:if>>
							<label for="restUseN" class="mr15">미사용</label>
						</td>
					</tr>
					<tr>	
						<th scope="col">최종 수정일<span class="star">*</span></th>
						<td>
							<input class="c" class="w300" type="text" id="modDate" value="${rest.modDate}" readonly>
						</td>
						<th></th>
						<td></td>
					</tr>
				</tbody>
			</table>
		</form>
		</div>
		<p class="btn_area max_width">
			<a href="/admin/restaurant.do" class="l btn_list">목록</a>
				
			
			<a href="/admin/restaurantDelete.do?restIdx=${rest.restIdx}" class="btn_del">삭제</a>
			<a class="btn_submit" href="javascript:save();">저장</a>
			
		</p>
	</jsp:attribute>

	<jsp:attribute name="script_area">
<script>

var usrIdx = '${modifyUserVO.usrIdx }';
var usrPwChkflag = false;





function save(){
		document.getElementById("frm").submit();
}


</script>
	</jsp:attribute>
</t:default>