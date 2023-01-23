 <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<c:set var="page_num_depth_01" value="5"/>
<c:set var="page_num_depth_02" value="3"/>

<html lang="utf-8">
	<head>
		<%@include file="../_inc/tit.jsp" %>
		<script type="text/javascript">
			$(function(){
				$('ul.faq li .ans').hide();
				$(".faq li .qus").click(function() {
					$parent = $(this).parent();
					$parent.toggleClass("on");
					//$parent.toggleClass("open");
					$(this).next(".ans").stop().slideToggle();
				});			
			});		
			$(document).on("click", "#srchFrm", function() {
				$("#pageIndex").val(1);
				$("#schFrm").attr("action","<c:url value='/web/support/faq.do'/>");
				$("#schFrm").submit();
			});
		</script>
	</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp" %>
		<%@include file="../_inc/smn05.jsp" %>
		
<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
			     <h2>FAQ</h2>
			     <ol class="loca">
                    <li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
                    <li>고객센터</li>
                    <li>FAQ</li>
                </ol>
			</div>
			
			<form id="schFrm" method="get" autocomplete="off">
			<input type="hidden" id="pageIndex" name="pageIndex" value="${boardVO.pageIndex}"/>
				<div class="list_top">
	                <p class="count">검색총건수 <span>${paginationInfo.totalRecordCount}</span>건</p>
	                <div class="bbs_search_bar">
	                    <p class="s_sel">
	                        <select name="searchCondition">
	                            <option value="bbsAll" <c:if test="${boardVO.searchCondition eq 'bbsAll'}">selected</c:if>>전체</option>
	                            <option value="bbsTitle" <c:if test="${boardVO.searchCondition eq 'bbsTitle'}">selected</c:if>>제목</option>
	                            <option value="bbsCont" <c:if test="${boardVO.searchCondition eq 'bbsCont'}">selected</c:if>>내용</option>
	                        </select>
	                    </p>
	
	                    <p class="word">
	                        <input type="text" style="display:none;" >
	                        <input type="text" placeholder="검색어를 입력해주세요" value="${boardVO.searchKeyword}" name="searchKeyword">
	                    </p>
	
	                    <p class="search_btn">
	                        <a href="javascript:void(0);" id="srchFrm"><img src="/_img/web/comn/search.png" alt="검색하기"></a>
	                    </p>
	                </div>
	               <!--  <p class="sel">
	                    <select>
	                        <option value="10" selected="">10개씩 보기</option>
	                        <option value="20">20개씩 보기</option>
	                        <option value="30">30개씩 보기</option>
	                    </select>
	                </p> -->
	            </div>
				<!-- faq 시작 -->
				<ul class="faq">
	 				<!-- 리스트 10개  -->
	 				<c:choose>
	 					<c:when test="${fn:length(resultList) > 0 }">
	 						<c:forEach var="resultList" items="${resultList}">
				 				<li>
									<div class="qus">
										<p class="q"><img src="/_img/web/cont/faq_q.png" alt="질문"></p>
										<p class="title">${resultList.bbsTitle}</p>
									</div>
									<div class="ans" style="display: none;">
										<p class="a"><img src="/_img/web/cont/faq_a.png" alt="답변"></p>
										<p class="ans_text">${resultList.bbsCont}</p>
									</div>
								</li>
			 				</c:forEach>
	 					</c:when>
	 					<c:otherwise>
	 						<li><div class="qus c">검색 결과가 없습니다.</div></li>
	 					</c:otherwise>
	 				</c:choose>		
				</ul>
	            <p class="pn">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
				</p>
		
			</form>
		</div>
	</div>
	<%@include file="../_inc/footer.jsp" %>

</body>

</html>