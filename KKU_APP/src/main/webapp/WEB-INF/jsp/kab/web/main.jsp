 <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="utf-8">
	<head>
		<link rel="stylesheet" href="/smartsys/_css/main.css">
		<link rel="stylesheet" href="_css/main.css">
		<%@include file="_inc/tit.jsp" %>
	</head>
	<script>
		function chkSession(){
			if('${orgSessionVo.orgId}'==''){
				location.href = "/web/login.do";
			}else{
				var url = "https://kcis.kab.or.kr/ICIS.Web/Gate.aspx?id=${orgSessionVo.orgId}";
				window.open(url);
			}
		}
	</script>
<body>
	<div class="wrap">
		<%@include file="_inc/header.jsp" %>
		
		<div class="visual_wrap">
			<!-- 리스트디자인 -->
			<div class="visual">
				<p class="vs_txt">SMART RECOGNITION BUSINESS SYSTEM</p>
<!--				<p class="vs_txt"><img src="/smartsys/_img/web/cont/vs_title.png" alt="" /></p>-->
				<p class="vs_txt"><img src="../_img/web/cont/vs_title.png" alt="스마트 인정업무시스템" /></p>
				<p class="vs_txt">고객의 신뢰를 바탕으로 공정한 검증을 통해<br> 가치있는 서비스를 제공합니다.</p>
			</div>

			<!-- 슬릭자리 -->
			<!-- <div class="slick">
				<a class="prev font_0" href="#">이전버튼</a>
				<ul>
					<li><a href="#" class="on font_0">배너1</a></li>
					<li><a href="#" class="font_0" >배너2</a></li>
					<li><a href="#" class="font_0">배너3</a></li>
				</ul>
				<a class="next font_0" href="#">다음버튼</a>
			</div> -->
			
			<ul class="q_menu">
				<li><a href="javascript:chkLogin('/web/application/applicationList.do','${orgSessionVo.orgIdx}')">인정신청</a></li>
				<li><a href="javascript:chkLogin('/web/eval/evalList.do','${orgSessionVo.orgIdx}')">인정평가</a></li>
				<li><a href="javascript:chkLogin('/web/eval/evalList.do','${orgSessionVo.orgIdx}')">인정서 발급</a></li>
				<li><a href="/web/support/boardList.do?bbsDiv=qna">QnA</a></li>
				<li class="my_data"><a href="javascript:chkSession();">인증실적등록</a></li>
			</ul>
		</div>

		<div class="board_wrap">
			<div class="notice">
				<div class="board_top">
					<h4>공지사항</h4>
					<a href="/web/support/boardList.do?bbsDiv=notices"><img src="../_img/web/cont/board_plus.png" alt="더보기"></a>
				</div>
				<ul>
					<c:forEach var="noticeList" items="${noticeList}">
						<li>
							<a href="/web/support/boardView.do?bbsDiv=notices&bbsIdx=${noticeList.bbsIdx}">${noticeList.bbsTitle}</a>
							<c:if test="${noticeList.regDate eq today}"><span class="new">NEW</span></c:if>
							<span class="date">${noticeList.regDate}</span>
						</li>
					</c:forEach>
				</ul>
				
			</div>
			
			<div class="faq">
				<div class="board_top">
					<h4>FAQ</h4>
					<a href="/web/support/faq.do"><img src="../_img/web/cont/board_plus.png" alt="더보기"></a>
				</div>
				<ul>
					<c:forEach var="faqList" items="${faqList}">
						<li>
							<p><a href="/web/support/faq.do">${faqList.bbsTitle}</a></p>
							<a class="faq_more" href="/web/support/faq.do">더보기</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>

	</div>
	<%@include file="_inc/footer.jsp" %>

</body>

</html>