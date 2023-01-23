<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../_inc/title2.jsp"%>
<style>
	/* 검색 테이블 */
	table.searchbox{
		width:100%;
		background: #eef4ff;
		border-top: 1px solid #ced6e5;
    	border-bottom: 1px solid #ced6e5;
		font:bold 13px/17px "malgun gothic","Dotum"," Gulim","Arial","verdana","Helvetica",sans-serif;
	}
	table.searchbox td {
		box-sizing:border-box; 
		text-align:center;
		vertical-align:middle; 
		color:#222; 
		height:40px;
	}
	table.searchbox .keywordbox {
		width:80%;
	}
	table.searchbox .left {
		padding-left: 10px;
		text-align:left;
	}
	table.searchbox .search_btn	{
		display:inline-block !important; 
		width:26px; height:26px; 
		box-sizing:border-box; 
		background:#3e6cc0 url("/_img/adm/comn/search.png") no-repeat 50% 50%;
	}
	table.searchbox .selectbox01 {
		width:90%;
	}
	
	/* 목록 테이블 */
	div.cont_view table.table02	{
		margin-top:10px; 
		border:1px solid #ddd;
	}
	div.cont_view table.table02 thead th {
		background:#f5f5f5; 
		border-right:1px solid #e3e3e3;
	}
	div.cont_view table.table02 thead th:last-child	{
		border-right:none;
	}
	div.cont_view table.table02 tr {
		cursor:default;
	}
	div.cont_view table.table02.choose tr {
		cursor:pointer;
	}
	div.cont_view table.table02 tr th {
		text-align:center;
	}
	div.cont_view table.table02 tr td {
		text-align:center;
	}
</style>
</head>
<body>
<div id="wrap">
	<%@include file="../_inc/header2.jsp"%>
	<div id="container">
		<%@include file="../_inc/left2.jsp"%>
		<div id="contents">
			<div class="cont_top">				
				<ol class="loca">
					<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
					<li>자격증 관리</li>
					<li>자격증 관리</li>
				</ol>
				<h2>자격증 관리</h2>
			</div>
			
			<div class="cont_view max_width pt0">
				<form id="schFrm" action="/admin/licenseList.do">
				<input type="hidden" id="pageIndex" name="pageIndex" value=""/>
				<table class="searchbox">
					<caption>검색</caption>
					<colgroup>
						<col width="8%">
						<col width="20%">
						<col width="8%">
						<col width="20%">
						<col width="8%">
						<col width="auto">
					</colgroup>
					<tbody>
						<tr>
							<td>전공</td>
							<td>
								<select id="searchMajor" name="searchMajor" class="selectbox01">
									<option value="ALL" selected="">전체</option>
								</select>
							</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>시험일</td>
							<td class="left" colspan="3">
								<input name="searchSdate" class="w150 date" id="searchSdate" type="text" placeholder="시작일" value="" readonly="readonly">
								<a href="javascript:void(0);" onclick="$('#searchSdate').focus()" class="cal f_0 scal">시작 날짜선택</a>
								<span class="hyphen">~</span>
								<input name="searchEdate" class="w150 date" id="searchEdate" type="text" placeholder="종료일" value="" readonly="readonly">
								<a href="javascript:void(0);" onclick="$('#searchEdate').focus()" class="cal f_0 scal">종료 날짜선택</a>
							</td>
							<td>검색어</td>
							<td>
								<input type="text" class="keywordbox" name="searchKeyword" id="searchKeyword" value="" placeholder="자격증명 검색">
								<a href="javascript:void(0)" class="search_btn f_0" id="schButton">검색하기</a>
							</td>
						</tr>
					</tbody>
				</table>
				
				<table class="table02" summary="회원 목록" >
				<caption>관리자 목록</caption>
				<colgroup>
					<col width="4%">
					<col width="auto">
					<col width="12%">
					<col width="11%">
					<col width="11%">
					<col width="10%">
					<col width="11%">
					<col width="11%">
					<col width="10%">
					<col width="6%">
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">NO</th>
						<th rowspan="2">자격구분명</th>
						<th rowspan="2">시행년도/회차</th>
						<th colspan="3">필기</th>
						<th colspan="3">실기</th>
						<th rowspan="2">관리</th>
					</tr>
					<tr>
						<th>원서접수</th>
						<th>시험일</th>
						<th>합격발표일</th>
						<th>원서접수</th>
						<th>시험일</th>
						<th>합격발표일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${resultList }" varStatus="status">
					<tr>
						<td>1</td>
						<td>${item.qualName }</td>
						<td>${item.testYear }/${item.testSeq }</td>
						<td>${item.wasDate }<br>~ ${item.waeDate }</td>
						<td>${item.wsDate }<br>~ ${item.weDate }</td>
						<td>${item.wpDate }</td>
						<td>${item.pasDate }<br>~ ${item.paeDate }</td>
						<td>${item.psDate }<br>~ ${item.peDate }</td>
						<td>${item.ppDate }</td>
						<td><button type="button" onclick="detail('${item.qualCd}')">관리</button></td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
				<p class="pn" >
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="../_inc/footer2.jsp"%>
<script>
	function detail(cd){
		location.href = "licenseDetail.do?qualCd="+cd;
	}

	$(document).on("click", "#schButton", function() {
		$("#pageIndex").val('1');
		$("#schFrm").submit();
	});
	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});
	$(document).ready(function() {
		//datepicker 세팅
		$(".date").datepicker({
			changeMonth: true,
			changeYear: true
		});
		
	});
	$(document).on("click", "#excelDown", function() {
		$("#schFrm").attr("action","<c:url value='/kpcceo/community/excelDownload.do'/>");
		$("#schFrm").submit();
	});
</script>
</body>
</html>