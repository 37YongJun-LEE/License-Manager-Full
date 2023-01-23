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
		div.popupWrap {
			width:570px;
			height:550px;
			background: white;
			padding-top: 5px;
			padding-left: 5px;
			padding-right: 10px;
		}
		a.listBtn {
			background: #3f68b1;
			border-radius: 5px;
			padding: 5px;
			color: #f8f8f8;
		}
		a.listBtn:hover {
			text-decoration: none;
		}
		table.table02 tbody td a {
			background: #3f68b1;
			border-radius: 5px;
		}
		table.table02 tbody td a:hover {
			text-decoration: none;
		}
		table.table02 tbody td.center {
			text-align:center;
		}
	</style>
</head>
<body>
	<div class="popupWrap">
		<form name="schFrm" id="schFrm" method="post" autocomplete="off" action="<c:url value='/admin/licensePopup.do?subjectCd=${vo.subjectCd }'/>">
			<input type="hidden" name="pageIndex" id="pageIndex" value="${vo.pageIndex}" />
			<div class="t_search" style="margin-top: 10px;">
				<table class="tb_search" summary="항목구분영역">
					<caption>항목별 검색영역</caption>
						<colgroup>
							<col width="100%">
						</colgroup>
						<tbody>
						<tr>
							<td class="ra_base" style="text-align:center;">
								<input style="width:100%"type="text" class="search_box" name="searchKeyword" id="searchKeyword" value="${vo.searchKeyword}" placeholder="${search_keyword_placeholder }"><!--
								--><a href="javascript:void(0)" class="search_btn f_0" id="schButton">검색하기</a>
								<label class="f_0" for="search_box">검색어를 입력해주세요</label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		<table class="table02" >
			<caption>자격증 관리</caption>
			<colgroup>
				<col width="10%">
				<col width="auto">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>NO</th>
					<th>자격증명</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${resultList}" varStatus="status">
					<tr>
						<td class="center">${status.count }</td>
						<td>${item.subjectName }</td>
						<td class="center"><a href="#" onclick="fnselect('${vo.subjectCd }','${item.subjectCd}','${item.subjectName }')">선택</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p class="pn" >
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
		</p>
		<div style="width:100%;text-align:center;margin-top:20px;">
			<a href="javascript:;" onclick="document.location.href='javascript:window.close();'"class="listBtn">취소</a>
		</div>
	</div>
<script>
	function fnselect(cd1,cd2,name) {
		if(confirm("추천자격증을 추가하시겠습니까?")){
			if(cd1==cd2){
				alert("같은 자격증을 추천 자격증으로 등록 할 수 없습니다.");
			} else {
				$.ajax({
					type: "POST",
					url:"/admin/licenseRecAdd.do",
					data:{
						subjectCd: cd1,
						recSubjectCd: cd2,
						recSubjectName: name
					},
					success: function(msg) {
						if (msg == "success") {
							alert("추가가 완료되었습니다.");
							opener.location.reload(true);
							window.close();
						} else if(msg == "already"){
							alert("이미 등록된 자격증 입니다.")
						} else {
							alert("실패");
						}
					}
				})
			}
		}
	}
</script>
</body>

</html>