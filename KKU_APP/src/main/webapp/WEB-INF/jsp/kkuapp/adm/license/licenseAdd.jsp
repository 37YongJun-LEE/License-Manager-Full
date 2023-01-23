<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<style>
	.text_input {
	    width: 100%;
	    border: 1px solid #f8f8f8;
	    background: #f8f8f8;
	    padding: 12px 22px;
	    margin-bottom: 15px;
	    border-radius: 50px;
	    color: #888;
	    font: 400 14px/20px "Roboto", "Noto Sans KR", sans-serif;
	    transition: all .3s;
	    box-sizing: border-box;
	}
	
	.label_dec {
		margin-top : 15px;
		text-weight : bold;
	}
</style>

<t:default>
	<jsp:attribute name="head_area">
	
	</jsp:attribute>
	
	<jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>자격증 관리</li>
			<li>자격증 관리</li>
			<li>
				<c:if test="${empty edited_is}">자격증 추가하기</c:if>
				<c:if test="${!empty edited_is}">자격증 수정하기</c:if>
			</li>
		</ol>
		<c:if test="${empty edited_is}"><h2>자격증 추가하기</h2></c:if>
		<c:if test="${!empty edited_is}"><h2>자격증 수정하기</h2></c:if>
	</jsp:attribute>

	
	
	<jsp:attribute name="body_area">
	
		<!-- 작성부분 -->
		<c:if test="${empty edited_is}">
			<form id="write_form" name="write_form" method="POST" action="/admin/dataAddProc.do">
				<strong>자격구분명/계열</strong> <br/>
				<select name="qualCd" class="completed">
					<option>자격 구분을 선택하세요</option>
					<option value="T">국가전문자격</option>
					<option value="S">국가기술자격</option>
					<option value="D">데이터자격검정</option>
					<option value="Q">민간자격</option>
				</select> 
				<br/>
				
				<strong>직무분야 선택[대분류/중분류]</strong> <br/>
				<input name="jobfieldName" placeholder="대분류" class="text_input"/> <br/>
				<input name="mjobfieldName" placeholder="중분류" class="text_input"/> <br/>
				<br/>
	
				<label class="label_dec"><strong>계열명</strong></label> <br/>
				<input name="seriesName" placeholder="계열명" class="text_input"/> <br/>
				
				<label class="label_dec"><strong>자격증 이름</strong></label> <br/>
				<input name="subjectName" placeholder="자격증명" class="text_input"/> <br/>
				
				<div style="width:100%;text-align:center;margin-top:20px;">
					<a onclick="document.getElementById('write_form').submit();" class="btn_excel" style="background-color: rgb(15, 53, 132);">자격증 추가하기</a>
				</div>
			</form>
		</c:if>
		
		<!-- 수정부분 -->
		<c:if test="${!empty edited_is}">
			<form id="edit_form" name="edit_form" method="POST" action="/admin/dataEditProc.do">
				<strong>자격구분명/계열</strong> <br/>
				<select name="qualCd" class="completed">
					<option value="T" <c:if test="${result.qualCd eq 'T'}">selected</c:if>>국가전문자격</option>
					<option value="S" <c:if test="${result.qualCd eq 'S'}">selected</c:if>>국가기술자격</option>
					<option value="D" <c:if test="${result.qualCd eq 'D'}">selected</c:if>>데이터자격검정</option>
					<option value="Q" <c:if test="${result.qualCd eq 'Q'}">selected</c:if>>민간자격</option>
					<option value="N" <c:if test="${result.qualCd eq 'N'}">selected</c:if>>미분류</option>
				</select> 
				<br/>
				
				<input name="subjectCd" value="${result.subjectCd}" type="hidden" />
				<input name="idx" value="${result.idx}" type="hidden" />
				
				<strong>직무분야 선택[대분류/중분류]</strong> <br/>
				<input name="jobfieldName" placeholder="대분류" class="text_input" value = "${result.jobfieldName}"/> <br/>
				<input name="mjobfieldName" placeholder="중분류" class="text_input" value = "${result.mjobfieldName}"/> <br/>
				<br/>
	
				<label class="label_dec"><strong>계열명</strong></label> <br/>
				<input name="seriesName" placeholder="계열명" class="text_input" value = "${result.seriesName}"/> <br/>
				
				<label class="label_dec"><strong>자격증 이름</strong></label> <br/>
				<input name="subjectName" placeholder="자격증명" class="text_input" value = "${result.subjectName}"/> <br/>
				
				<div style="width:100%;text-align:center;margin-top:20px;">
					<a onclick="document.getElementById('edit_form').submit();" class="btn_excel" style="background-color: rgb(15, 53, 132);">자격증 수정하기</a>
				</div>
			</form>
		</c:if>
		
	</jsp:attribute>
	

	
</t:default>