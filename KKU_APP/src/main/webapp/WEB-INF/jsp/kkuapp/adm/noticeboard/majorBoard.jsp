<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<html lang="utf-8">
<head>
	<%@include file="../_inc/tit.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
<%@include file="../_inc/header.jsp"%>
<div id="container">
<%@include file="../_inc/left.jsp"%>
<div id="contents">
<div class="cont_top">				
					<ol class="loca">
						<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
						<li>게시판관리</li>
						<li>학과 게시판 관리</li>
					</ol>
					<h2>학과 게시판 관리</h2>
				</div>
				<div class="cont_view max_width pt0">
					<form name="schFrm" id="schFrm" method="get" autocomplete="off" action="<c:url value='/admin/userList.do'/>">
					<input type="hidden" name="pageIndex" id="pageIndex" value="" />
					
					<div class="t_search" style="margin-top: 10px; /* margin-left: 20px; */"> <!-- 검색 인풋이 없는 경우 -->
						<table class="tb_search" summary="항목구분영역">
							<caption>항목별 검색영역</caption>
							<colgroup><col width="8%"><col width="15%"><col width="20%"><col width="15%"><col width="15%"><col width="*"></colgroup>
							<tbody>
							<tr>
								<th scope="row">전체</th>
				
								<td>
									<div class="search_list">
										<select name="searchCondition">
											<option value="ALL" selected="">전체</option>
											<option value="StdNum" <c:if test="">selected="selected"</c:if>>학번별</option>
											<option value="name"   <c:if test="">selected="selected"</c:if> >이름별</option>
											<option value="depart"   <c:if test="">selected="selected"</c:if>>단과대/소속</option>
											<option value="major"   <c:if test="">selected="selected"</c:if>>학과/부서별</option>
										</select>
									</div>
								</td>
								
								<th scope="row">가입일</th>
								<td >
									<input name="searchSdate" class="w100 date" id="searchSdate"  type="text" placeholder="시작일" value="${UserVO.searchSdate}" readonly="readonly" /><!-- 
									 --><a href="javascript:void(0);" onclick="$('#searchSdate').focus()" class="cal f_0 scal">시작 날짜선택</a>
									<span class="hyphen">~</span>
									<input name="searchEdate" class="w100 date" id="searchEdate"  type="text" placeholder="종료일" value="${UserVO.searchEdate}" readonly="readonly"/><!-- 
									 --><a href="javascript:void(0);" onclick="$('#searchEdate').focus()" class="cal f_0 scal">종료 날짜선택</a>
								</td>
								<td class="ra_base"  colspan="3" >
								<div  style="margin-left: 35px;" >
									<input type="text" class="search_box" name="searchKeyword" id="searchKeyword" value="${UserVO.searchKeyword}" placeholder="검색어 입력"><!--
									--><a href="javascript:void(0)" class="search_btn f_0" id="schButton">검색하기</a>
									<label class="f_0" for="search_box">검색어를 입력해주세요</label>
								</div>
								</td>
							</tr>
							
							</tbody>
						</table>
					</div>
						<p class="btn_area">
							<a href="javascript:void(0);" id="excelDown" class="btn_excel">엑셀 다운로드</a>
						</p>	
				<table class="table01" summary="회원 목록" >
					<caption>관리자 목록</caption>
					<colgroup>
						<col width="65px">
						<col width="65px">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					
					</colgroup>
					
					<thead>
						<tr>
							<th scope="col">
								<input class="checkbox" type="checkbox" value="" id="ck1" onclick="allCheck();">
								<label for="ck1" class="font_0 chk_all"></label>
							</th>
								<th>NO</th>
								<th>게시판 명</th>
								<th>오늘의 게시물 수</th>
								<th>총 게시물 수</th>
								<th>댓글 수</th>
								<th>등록자</th>
								<th>신청일</th>
								<th>처리자</th>
								<th>처리일</th>
								<th>공개여부</th>
						</tr>
					</thead>
					<tbody>
				 	<c:forEach var="result" items="${majorBoardList}">
						
							<tr>
								<td>
								<input class="checkbox" type="checkbox" value="${result.usrIdx}" name="usrIdxArr" id="${result.usrIdx}" >
								<label <%-- for="${result.usrIdx}" --%> class="font_0 chk_all"></label>
								</td>
						
								<td></td>
								<td>${result.mnoticeCategory} </td>
								<td></td>
								<td>${result.replyNum }</td>
								<td></td>
								<td></td>
								<td></td>
								<td><p class="btn">
					<a href="#}"  class="line" >수정</a><br>
					
				
				</p></td>
							</tr>
							
						</c:forEach> 
					</tbody>
				</table>
				
<%-- 				<p class="pn">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p>
				<c:if test="${adminSessionVo.cmntIdx == -1 }">
					<p class="btn_area max_width">
						<a href="javascript:void(0)" onclick="selectDelete(); return false" class="btn_del">삭제</a>
					</p>
				</c:if> --%>
				</form>
				
				</div>
</div>
</div>
</div>

</body>
</html>