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
			height:150px;
			background: white;
			padding-top: 5px;
			padding-left: 5px;
			padding-right: 10px;
			padding-bottom: 5px;
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
		table.table02 tbody td.center input {
			-webkit-appearance: button;
			margin-top: 3px;
		}
	</style>
</head>
<body>
	<div class="popupWrap">
		<table class="table02" >
			<caption>자격증 관리</caption>
			<colgroup>
				<col width="auto">
				<col width="30%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>학과명</th>
					<th>필수여부</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
					<select id="major" style="width:100%">
						<option value="">선택</option>
						<c:forEach var="item" items="${resultList}" varStatus="status">
						<option value="${item.idx }" <c:if test="${result.uniIdx eq item.idx}">selected</c:if>>${item.uniMajor }</option>
						</c:forEach>
					</select>
					<td class="center">
						<input type="radio" name="pilsooYn" value="Y" <c:if test="${result.pilsoo eq '필수추천'}">checked</c:if>>필수추천</input>
						<input type="radio" name="pilsooYn" value="N" <c:if test="${result.pilsoo eq '일반추천' || result eq null}">checked</c:if>>일반추천</input>
					</td>
					</td>
					<td class="center">
					<c:if test="${result.idx eq null}"><a href="#" onclick="fnSelect('${vo.subjectCd}','')">추가</a></c:if>
					<c:if test="${result.idx ne null}"><a href="#" onclick="fnSelect('${vo.subjectCd}','${result.idx }')">수정</a></c:if>
					</td>
					
				</tr>
			</tbody>
		</table>
		<div style="width:100%;text-align:center;margin-top:20px;">
			<a href="javascript:;" onclick="document.location.href='javascript:window.close();'"class="listBtn">취소</a>
		</div>
	</div>
<script>
	function fnSelect(cd1,cd2) {
		var majorCd = $('#major').val();
		var pilsoo = $('input[name=pilsooYn]:checked').val();
		var mode = "";
		if(cd2 == ''){
			mode = 'ins';
		}else {
			mode = 'upd';
		}
		
		if(majorCd == ""){
			alert("학과를 선택해주세요.");
		}else{
			if(confirm("선택 사항을 저장하시겠습니까?")){
				$.ajax({
					type: "POST",
					url:"/admin/majorRecAdd.do",
					data:{
						uniIdx: majorCd,
						subjectCd: cd1,
						pilsooYn: pilsoo,
						idx: cd2,
						mode: mode
					},
					success: function(msg) {
						if (msg == "insSuccess") {
							alert("추가가 완료되었습니다.");
							opener.location.reload(true);
							window.close();
						} else if(msg == "updSuccess"){
							alert("수정이 완료되었습니다.");
							opener.location.reload(true);
							window.close();
						} else if(msg == "already"){
							alert("이미 등록된 학과 입니다.")
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