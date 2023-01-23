<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="../_inc/title2.jsp"%>
</head>
<style>
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
	div.cont_view table.table02 tr td.center {
		text-align:center;
	}
	div.tit {
		background:#3f68b1; 
		overflow:hidden; 
		color:#666; 
		width:100%;
		border-radius:5px 5px;
	}
	ul.tabs {
		float:left; 
		margin: 0px; 
		padding: 0px; 
		list-style: none; 
		position:relative;
	}
	ul.tabs li {
		background: none; 
		color: #fff; 
		display: inline-block; 
		padding: 10px 10px; 
		cursor: pointer; 
		font:15px/21px "NanumGothic_b","malgun gothic","Dotum"," Gulim","Arial","verdana","Helvetica",sans-serif;
	}
	ul.tabs li.current {
		background: #ededed; 
		color: #222; 
	}
	
</style>
<script>
function detail(cd){
	location.href = "licenseDetail.do?qualCd="+cd;
}
</script>
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
				<div class="tit">
					<ul class="tabs">
						<li onclick="detail('${result.qualCd}')" <c:if test="${depth02 eq 'default' }">class="current"</c:if>>자격증정보</li>
						<li>추천학과</li>
						<li>추천자격증</li>
						<li>기출문제</li>
						<li>게시판</li>
					</ul>
				</div>
				<table class="table02" >
					<caption>자격증 관리</caption>
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<tbody>
						<tr>
							<th colspan="2">자격구분명</th>
							<td colspan="3">${result.qualName }</td>
						</tr>
						<tr>
							<th colspan="2">설명</th>
							<td colspan="3">${result.description }</td>
						</tr>
						<tr>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th colspan="5">응시자격</th>
						</tr>
						<tr>
							<td colspan="5"><textarea style="width:100%"></textarea></td>
						</tr>
						<tr>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th>시행년도</th>
							<td>${result.testYear }</td>
							<th>시행회차</th>
							<td colspan="2">${result.testSeq }</td>
						</tr>
						<tr>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th></th>
							<th colspan="2">필기</th>
							<th colspan="2">실기</th>
						</tr>
						<tr>
							<th>원서접수</th>
							<td class="center" colspan="2">${result.wasDate } ~ ${result.waeDate }</td>
							<td class="center" colspan="2">${result.pasDate } ~ ${result.paeDate }</td>
						</tr>
						<tr>
							<th>시험일</th>
							<td class="center" colspan="2">${result.wsDate } ~ ${result.weDate }</td>
							<td class="center" colspan="2">${result.psDate } ~ ${result.peDate }</td>
						</tr>
						<tr>
							<th>합격발표일</th>
							<td class="center" colspan="2">${result.wpDate }</td>
							<td class="center" colspan="2">${result.ppDate }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<%@include file="../_inc/footer2.jsp"%>
</body>
</html>