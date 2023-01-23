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
			color: black;
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
		<form id="frm01" action="/admin/questionsAdd.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="subjectCd" name="subjectCd" value="${vo.subjectCd}">
			<table class="table02" >
				<caption>자격증 관리</caption>
				<colgroup>
					<col width="25%">
					<col width="auto">
				</colgroup>
				<thead>
					<tr>
						<th colspan="2" style="text-align:center;">${result.subjectName }</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" id="quesTitle" name="quesTitle" placeholder="제목 입력" value="${result.quesTitle }"/></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<div><input type="text" id="quesFileName" name="quesFileName" placeholder="파일명 입력" value="${result.quesFileName }"/></div>
							<div><a href="${result.quesFileUrl}">${result.quesFileName }</a></div>
							<input type="file" id="file1" name="file1" onchange="filechange(this.value)" />
							<input type="hidden" id="fileNameBefore" name="fileNameBefore" value="${result.quesFileName}" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div style="width:100%;text-align:center;margin-top:20px;">
			<c:if test="${result.idx eq null }"><a href="javascript:;" class="listBtn" onclick="fnSelect('')">등록</a></c:if>
			<c:if test="${result.idx ne null }"><a href="javascript:;" class="listBtn" onclick="fnSelect(${vo.idx})">수정</a></c:if>
			<a href="javascript:;" onclick="document.location.href='javascript:window.close();'"class="listBtn">취소</a>
		</div>
	</div>
<script>
	function fnSelect(cd) {
		if($('#quesTitle').val()==''){
			alert("제목을 입력해주세요.");
		} else if($('#quesFileName').val()==''){
			alert("파일명을 입력해주세요.");
		} else {
			if(cd==''){
				if($('#file1').val()==''){
					alert("파일을 첨부해주세요.");
				} else {
					$("#frm01").attr("action", "/admin/questionsAdd.do");
					$('#frm01').submit();
				}
			}else{
				$("#frm01").attr("action", "/admin/questionsAdd.do?idx="+cd);
				$('#frm01').submit();
			}
		}
		
	}

	function filechange(name){
		$('#quesFileName').val(name.replace(/c:\\fakepath\\/i,''));
	}
		
</script>
</body>

</html>