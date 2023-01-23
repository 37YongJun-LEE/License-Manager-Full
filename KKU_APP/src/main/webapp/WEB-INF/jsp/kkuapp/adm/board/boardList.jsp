<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

<%@ include file="../_inc/title.jsp" %>


</head>
<script>

function test(id,name){
}
</script>
<body>

<%@ include file="../_inc/header.jsp" %>
<!-- HEADER BEGIN -->
		<div class="navi">
		<div class="top_navi"><h2>게시물 관리</h2></div>
			<ul>
				<li >홈</li>
				<li>게시판 관리</li>
				<li class="on">게시물 관리</li>
			</ul>
		</div>
	<!-- HEADER END -->
	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			
			
			<div class="w_box top no_line">
	
				<div class="bus_time">
					<table>
						<tbody>
							<tr>
								<th>c</th>
								<th>NO</th>
								<th>게시판 종류</th>
								<th>게시판 이름</th>
								<th>제목 </th>
								<th>내용</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>관리</th>
								
								
							</tr>
							
						<c:forEach var="result" items="${boardList}">
					
							<tr>
							
								<td><input type="checkbox" id="agree01"><label for="agree01"> ㄱ</label></td>
								<td>${result.boardIdx}</td>
								<c:choose>
									<c:when test="${result.boardName eq  'Tboard'}" > 
										<td>주제별게시판</td>
									</c:when>
									<c:when test="${result.boardName eq  'Cboard'}">
										<td>자유게시판</td>
									</c:when>
									<c:when test="${result.boardName eq  'Mboard'}">
										<td>학과</td>
									</c:when>
								</c:choose>
								
								<td>${result.boardDetailname}</td>
								<td>${result.boardTitle}</td>
								<td>${result.boardContent}</td>
								<td>${result.boardWritedate}</td>
								<td>${result.boardViewnum}</td>
								<td><p class="btn">
					<a href="#"  class="line" onclick="test(${result.boardIdx},${result.boardName} )" >수정</a>
				
				</p></td>
								
							</tr>
						
						</c:forEach> 
						</tbody>
					</table>
				</div>

				
				
			</div>
				
				</div>
	<!-- CONTENTS END -->
</body>
</html>