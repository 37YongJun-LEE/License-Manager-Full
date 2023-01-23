<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>

<script>

function submit(mode, idx, status) {

	var id = "frm"+idx;
	
	
	if(mode == "done"){
		 
		if(confirm("판매 완료로 변경하시겠습니까?")){
			$('#'+id).children('input[name=mode]').val(mode);
			$('#'+id).children('input[name=trdStatus]').val(status);
			$('#' + id).attr("action", "/trade/tradeProc2.do");
			$('#' + id).submit();
		}
	}
	
	if(mode == "del"){
		if(confirm("정말 삭제하시겠습니까?")){
			$('#'+id).children('input[name=mode]').val(mode);
			$('#' + id).attr("action", "/trade/tradeProc2.do");
			$('#' + id).submit();
		}
	}
}

function displayedAt(createdAt) {
	
	  const milliSeconds = new Date() - Date.parse(createdAt)
	  
	  const seconds = milliSeconds / 1000
	  if (seconds < 60) return document.write( "방금 전");
	  
	  const minutes = seconds / 60
	  if (minutes < 60) return document.write(Math.floor(minutes)+"분 전");
	  
	  const hours = minutes / 60
	  if (hours < 24) return document.write(Math.floor(hours)+"시간 전");
	  const days = hours / 24
	  if (days < 7) return document.write(Math.floor(days)+"일 전");
	  const weeks = days / 7

	  if (weeks < 5) return document.write(Math.floor(weeks)+"주 전");
	  const months = days / 30
	  if (months < 12) return document.write(Math.floor(months)+"개월 전");
	  const years = days / 365
	  return document.write(Math.floor(years)+"년 전");
};

</script>

</head>


<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
			
		</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="/mypage.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>거래내역</h2></div>
			</div>
			<div class="tab">
				<ul>
					<li><a href="#" class="on">판매 내역</a></li>
					<li><a href="/mypage/myTrade02.do">찜 목록</a></li>
				</ul>
			</div>
			
			
			
			
			
			<ul class="mp_list mydeal">
			
				<c:forEach var="trade" items="${tradeList }">
				
					<li <c:if test="${trade.trdStatus == 3 }">class="ok" </c:if>>
						<div class="list_area" onclick="location.href='/trade/trade.do?trdIdx=${trade.trdIdx }';">
							<p class="img">
								<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url(/upload/trade/${trade.first })no-repeat 50% 50% / cover;">
							</p>
							<div>
								<div>
									<p class="tit">${trade.trdTitle }</p>
									<p class="price">
									<fmt:formatNumber maxFractionDigits="3" value="${trade.trdPrice }" />원
										<c:if test="${trade.trdStatus == 2 }">
											<span class="ok_label">예약중</span>
										</c:if>
										<c:if test="${trade.trdStatus == 3 }">
											<span class="ok_label">거래완료</span>
										</c:if>
									</p>
								</div>
								<p class="bottom">
									<span>${trade.trdUsrnick }</span>
									<span>
										<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg>
										${trade.likeCnt }
									</span>
									<span>
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M256 32C114.6 32 .0272 125.1 .0272 240c0 49.63 21.35 94.98 56.97 130.7c-12.5 50.37-54.27 95.27-54.77 95.77c-2.25 2.25-2.875 5.734-1.5 8.734C1.979 478.2 4.75 480 8 480c66.25 0 115.1-31.76 140.6-51.39C181.2 440.9 217.6 448 256 448c141.4 0 255.1-93.13 255.1-208S397.4 32 256 32z"/></svg>
										3
									</span>
									<span> <script> displayedAt("${trade.trdWritedate}") </script>  </span>
								</p>
							</div>
						</div>
						<p class="btn_area">
							<a href="/trade/tradeWrite.do?trdIdx=${trade.trdIdx }" >수정</a>
							<a href="javascript:submit('del', ${trade.trdIdx });" >삭제</a>
							<c:if test="${trade.trdStatus == 3 }">
								<a class="deal" href="javascript:void(0);" >거래완료</a>
							</c:if>
							<c:if test="${trade.trdStatus != 3 }">
								<a class="deal" href="javascript:submit('done', ${trade.trdIdx }, '3');" >거래완료</a>
							</c:if>
							<form name="frm${trade.trdIdx }" id="frm${trade.trdIdx }" autocomplete="off" method="post" enctype="multipart/form-data">
								<input type="hidden" name="trdIdx" value="${trade.trdIdx }"/>
								<input type="hidden" name="mode" id="mode"/>
								<input type="hidden" name="trdStatus" id="trdStatus"/>
							</form>
						</p>							
					</li>
				</c:forEach>	
			</ul>
			<%@include file="../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->

</div>
<!-- //wrap -->

</body>
</html>
