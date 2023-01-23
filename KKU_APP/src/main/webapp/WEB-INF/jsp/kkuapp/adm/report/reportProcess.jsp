<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html lang="utf-8">
<head>
	<%@include file="../_inc/title2.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function formSubmit(){
	var formData = new FormData(frm);
	$.ajax({
			type : 'post',
			url : "<c:url value='/admin/reportModifyAction.do'/>",
			data : formData,
			async: false,
			contentType : false,
			processData : false,
			success : function(data) {
					if($.trim(data) == "Y") {
						
						alert("성공적으로 수정되었습니다.");
						location.reload();
					}
					else if($.trim(data) == "N") {
						alert("비밀번호가 틀립니다. ");
					}
				
				}
		}); 
}

function deleteForm(){
	var formData = new FormData(frm);
	$.ajax({
			type : 'post',
			url : "<c:url value='/admin/reportDeleteAction.do'/>",
			data : formData,
			async: false,
			contentType : false,
			processData : false,
			success : function(data) {
					if($.trim(data) == "Y") {
						
						alert("성공적으로 삭제되었습니다.");
						location.href='<c:url value="/admin/report.do"/>';
					}
				
				}
		}); 
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
						<li>신고 관리</li>
						<li>게시물 신고 관리</li>
						<li>신고된 게시물 관리</li>
					</ol>
					<h2>게시물 신고 관리</h2>
				</div>
									<div class="cont_view max_width pt0">
				<form name="frm" id="frm" autocomplete="off" method="post">
					<input type="hidden" name="reportIdx" value="${map.reportIdx }">
					<!-- 이메일, 닉네임, 비밀번호, 이름, 단과대, 학과, 학번-->
					<table class="table02" summary="관리자 기본정보 등록">
						<caption>관리자 기본정보 등록</caption>
						<colgroup><col width="12%"><col width="38%"><col width="12%"><col width="38%"></colgroup>
						<tbody>
							<tr>
								<th scope="row">게시자 아이디<span class="star">*</span></th>
								<td>
									
									
									<!-- <a class="sm_line" id="chkDupUsrIdBtn" href="javascript:void(0);">중복확인</a> -->
									<input style="width:180px" id="reporterId" name="reporterId" type="text" value="${map.reporterId }" />    
						
									
								</td>
								
								<th scope="row">게시판명 <span class="star">*</span></th>
								<td>
								<input type="hidden" id="reportTblCode" name="reportTblCode" value="${map.reportTblCode}"/>
								<c:choose>
								
									<c:when test="${map.reportTblCode eq 0}">
										
										<input style="width:180px" type="text"  value="중고거래" readonly/>
									</c:when>
									<c:when test="${map.reportTblCode eq 1}">
										<input style="width:180px" type="text"  value="자유게시판" readonly/>
									</c:when>
									<c:when test="${map.reportTblCode eq 2}">
										<input style="width:180px" type="text"  value="강의정보" readonly/>
									</c:when>
									<c:when test="${map.reportTblCode eq 3}">
										<input style="width:180px" type="text"  value="자료공유" readonly/>		
									</c:when>
						
								</c:choose> 			
							
								</td>
							</tr>

							<tr>
								<th scope="row">게시글 제목<span class="star">*</span></th>
								<td>
									<c:choose>
									<c:when test="${map.reportTblCode eq 0}">
										<input style="width:180px" type="text" id="boardTitle" name="boardTitle" value="" />
									</c:when>
									
									 <c:when test="${map.reportTblCode eq 1}">
										<input style="width:180px" type="text" id="boardTitle" name="boardTitle" value="${map.boardTitle }" />
									</c:when>
									<c:when test="${map.reportTblCode eq 2}">
										<input style="width:180px" type="text" id="boardTitle" name="boardTitle" value="${map.boardTitle }" />
									</c:when>
									<c:when test="${map.reportTblCode eq 3}">
										<input style="width:180px" type="text" id="boardTitle" name="boardTitle" value="${map.boardTitle }" />		
									</c:when>
						
								</c:choose> 	
								</td>
								<th scope="row">게시글 내용<span class="star">*</span></th>
								<td>
									<c:choose>
									<c:when test="${map.reportTblCode eq 0}">
										<input style="width:180px" type="text" id="boardContent" name="boardContent" value="" />
									</c:when>
									
									 <c:when test="${map.reportTblCode eq 1}">
										<input style="width:180px" type="text" id="boardContent" name="boardContent" value="${map.boardContent }" />
						
												<a class="btn_submit" onclick="location.href='/board_view.do?boardIdx=${map.boardIdx}&boardName=${map.boardName }'">게시물 보기</a>
									</c:when>
									
						
								</c:choose> 	
								</td>
							</tr>
							<tr>

							<th scope="row">신고글 처리<span class="star">*</span></th>
								<td class="ra_base" colspan="3">
								<input type="radio" id="id01" name="reportState" value="1" <c:if test="${map.reportState eq 1 }"> checked </c:if>>
      							<label for="id01">접수완료</label>
      							<input type="radio" id="id02" name="reportState" value="2" <c:if test="${map.reportState eq 2 }"> checked </c:if>>
      							<label for="id02">처리중</label>
      							
      							<input type="radio" id="id03" name="reportState" value="3" <c:if test="${map.reportState eq 3 }"> checked </c:if>>
      							<label for="id03">처리불가</label>
      							<input type="radio" id="id04" name="reportState" value="4" <c:if test="${map.reportState eq 4 }"> checked </c:if>>
      							<label for="id04">처리완료</label>
								</td>
							</tr>
							<tr>

							<th scope="row">관리자 코멘트<span class="star">*</span></th>
								<td class="ra_base" colspan="3">
								<textarea style="width:300px" id="reportProcesscomment" name="reportProcesscomment"> ${map.reportProcesscomment }</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				</div>
				<p class="btn_area max_width">
					<a href="/admin/report.do" class="l btn_list">목록</a>
						
					
					<a href="javascript:deleteForm();" class="btn_del">삭제</a>
					<a class="btn_submit" onclick="formSubmit()">저장</a>
					
				</p>
			
		
				
				</div>
			</div>
			
		</div>
	</div>
<%@include file="../_inc/footer2.jsp"%>
</body>
</html>