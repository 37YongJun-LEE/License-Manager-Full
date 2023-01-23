<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>



<t:searchable_board_list search_urls="/admin/licenseList.do" search_condition_name="전공" search_range_name="시험일" search_keyword_placeholder="자격증코드 또는 자격증명 검색">
	<jsp:attribute name="head_area">
	
	</jsp:attribute>
	
	<jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>자격증 관리</li>
			<li>자격증 관리</li>
		</ol>
		<h2>자격증 관리</h2>
	</jsp:attribute>

	<jsp:attribute name="search_options">
		<option value="" selected>전체</option>
		<c:forEach var="item" items="${majorList }">
			<option value="${item.uniMajor }" <c:if test="${vo.searchCondition eq item.uniMajor }">selected</c:if>>${item.uniMajor}</option>
		</c:forEach>
	</jsp:attribute>
	
	<jsp:attribute name="body_area">
	
	<!-- 임시 크롤링 버튼 -->
		<div style="width:100%;text-align:right;margin-top:20px;">
			<a href="#" onclick="javascript:crawler();" class="btn_excel">진흥원 데이터 가져오기</a> <!-- 크롤링 하기 -->
		</div>
	<!-- 여기까지 -->
		
		<table class="table01" summary="회원 목록" >
		<caption>관리자 목록</caption>
		<colgroup>
			<col width="5%">
			<col width="15%">
			<col width="14%">
			<col width="auto">
			<col width="14%">
			<col width="15%">
			<col width="6%">
		</colgroup>
		<thead>
			<tr>
				<th>NO</th>
				<th>자격구분명</th>
				<th>계열명</th>
				<th>자격증명</th>
				<th>직무분야명</th>
				<th>중직무분야명</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${resultList }" varStatus="status">
			<tr>
				<td>${paginationInfo.totalRecordCount - (((vo.pageIndex) - 1) * vo.pageUnit) - status.count + 1}</td>
				<td>${item.qualName }</td>
				<td>${item.seriesName }</td>
				<td>${item.subjectName }</td>
				<td>${item.jobfieldName }</td>
				<td>${item.mjobfieldName }</td>
				<td><a href="#" onclick="detail('${item.subjectCd}')">관리</a></td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
		<p class="pn" >
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
		</p>
		<div style="width:100%;text-align:right;margin-top:20px;">
			<a href="/admin/dataAdd.do" class="btn_excel" style="background-color: rgb(15, 53, 132);">자격증 추가하기</a>
		</div>
		
		
	</jsp:attribute>
	
	<jsp:attribute name="script_area">
		<script src="/_js/_js/loading.js" type="text/javascript" charset="utf-8"></script>
		<script>
			function detail(cd){
				location.href = "licenseDetail.do?subjectCd="+cd;
			}
			
			function crawler(){
				if(confirm("크롤링 하시겠습니까?"))
					result = location.href = "/admin/dataCrawler.do";
				else{
					alert("취소했어요");
					return false;
				}
			    loading("크롤링중입니다...이 작업은 3분정도 소요됩니다.");
			}
			
			const urlParams = new URL(location.href).searchParams;
			const msg = urlParams.get('msg');
			if(msg) {
				alert(msg);
				location.replace("/admin/licenseList.do");
			}
	 	</script>
	</jsp:attribute>
	
</t:searchable_board_list>