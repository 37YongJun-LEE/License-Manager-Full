<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
</head>

<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
		</header>
		<div id="sub_contents" class="board head_mg mb140">
		<div class="w_box no_line">
		<ul class="best_list basic">
		<c:choose>
				<c:when test="${boardList ne null}">
				 <c:forEach var="result" items="${boardList}">
						<li onclick="location.href='reportView.do?reportIdx=${result.reportIdx}'">
							<div>
								<div>
									<p class="con">${result.reportContent }</p>
								</div>
								<p class="bottom">
									<span>${result.usrName }</span>
									<span>
										${result.reporterPnum}
									</span>
									<span>${result.reportDate}</span>
									<c:if test="${result.processState eq '0' }">
										<span class="ok_label">접수대기중</span>
									</c:if>
									<c:if test="${result.processState eq '1' }">
										<span class="ok_label">접수완료</span>
									</c:if>
									<c:if test="${result.processState eq '2' }">
										<span class="ok_label">처리중</span>
									</c:if>
									<c:if test="${result.processState eq '3' }">
										<span class="ok_label">처리불가</span>
									</c:if>
									<c:if test="${result.processState eq '4' }">
										<span class="ok_label">처리완료</span>
									</c:if>
								</p>
							</div>
								<p class="img">
									<c:if test="${result.first != null}">									
											<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url(/upload/board/${result.first })no-repeat 50% 50% / cover;">
									</c:if>
									<c:if test="${result.first == null}">
											<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/best_bg.png')no-repeat 50% 50% / cover;">
									  </c:if>	
								</p> 
						</li>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<li class="nodata">등록된 게시글이 없습니다.</li>
				</c:otherwise>
					
					</c:choose>
				</ul>
				</div>
		</div>
			<%@include file="../_inc/bottom_menu.jsp" %>
			<%@include file="../_inc/footer.jsp" %>
		
	<!-- CONTENTS END -->
<!--layer_open('okPop','ok_Pop')  -->


</div>
<!-- //wrap -->

</body>
</html>


