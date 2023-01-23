<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
</head>
<script>
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
	
	
	function deleteAction(bidx) {
		layer_open('delPop', 'del_Pop')
		$("#cfrm").click(function(){
			$.ajax({
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						type : "POST",
						url : "/boardDelete.do",
						data : {
							boardIdx : bidx
						},
						success : function(tmp) {
							if (tmp == "t") {
								location.reload();
		
							}
						}

					});
			});
		
	}
</script>
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
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>내 게시글</h2></div>
			</div>
			<ul class="mp_list mypost">
				<c:choose>
					<c:when test="${BoardList ne null}">
					<c:forEach var="result" items="${BoardList}">
						<c:choose>
							<c:when test="${result.boardTitle ne null}"><!-- 제목이 null 이 아닐때 = 자유게시판용  -->
								<li>
									<div class="list_area"  onclick="location.href='/board_view.do?boardIdx=${result.boardIdx}&boardName=${result.boardName}'">
										<div>
										<div>
										<p class="blue">#${result.boardDetailname}</p>
											<p class="tit">${result.boardTitle }</p>
											
										</div>
										<p class="bottom">
							
											<span>
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="luv"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg>
												${result.likeNum }
											</span>
											<span>
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M256 32C114.6 32 .0272 125.1 .0272 240c0 49.63 21.35 94.98 56.97 130.7c-12.5 50.37-54.27 95.27-54.77 95.77c-2.25 2.25-2.875 5.734-1.5 8.734C1.979 478.2 4.75 480 8 480c66.25 0 115.1-31.76 140.6-51.39C181.2 440.9 217.6 448 256 448c141.4 0 255.1-93.13 255.1-208S397.4 32 256 32z"/></svg>
												${result.replyNum }
											</span>
											<span><script> displayedAt("${result.boardWritedate}") </script> </span>
											<span>조회수 ${result.boardViewnum }</span>
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
									</div>
									<p class="btn_area">
										<a href="/board_modify.do?boardIdx=${result.boardIdx}&boardName=${result.boardName}">수정</a>
										<a hrerf="#" onclick="deleteAction(${result.boardIdx})">삭제</a>
									</p>
								</li>
							</c:when>
							<c:otherwise>
								<li>
								<div class="list_area" onclick="location.href='themeboard_view.do?boardIdx=${result.boardIdx}'">
									<div>
										<div>
												<p class="blue">#${result.boardDetailname}</p>
												<p class="tit">${result.boardContent }</p>
											
 											
										</div>
										<p class="bottom">
								
											<span>
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="luv"><path d="M0 190.9V185.1C0 115.2 50.52 55.58 119.4 44.1C164.1 36.51 211.4 51.37 244 84.02L256 96L267.1 84.02C300.6 51.37 347 36.51 392.6 44.1C461.5 55.58 512 115.2 512 185.1V190.9C512 232.4 494.8 272.1 464.4 300.4L283.7 469.1C276.2 476.1 266.3 480 256 480C245.7 480 235.8 476.1 228.3 469.1L47.59 300.4C17.23 272.1 .0003 232.4 .0003 190.9L0 190.9z"/></svg>
												${result.likeNum }
											</span>
											<span>
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M256 32C114.6 32 .0272 125.1 .0272 240c0 49.63 21.35 94.98 56.97 130.7c-12.5 50.37-54.27 95.27-54.77 95.77c-2.25 2.25-2.875 5.734-1.5 8.734C1.979 478.2 4.75 480 8 480c66.25 0 115.1-31.76 140.6-51.39C181.2 440.9 217.6 448 256 448c141.4 0 255.1-93.13 255.1-208S397.4 32 256 32z"/></svg>
												${result.replyNum }
											</span>
											<span><script> displayedAt("${result.boardWritedate}") </script> </span>
											<span>조회수 ${result.boardViewnum }</span>
										</p>
									</div>
									<p class="img">
									<c:if test="${result.first != null}">									
											<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url(/upload/board/${result.first })no-repeat 50% 50% / cover;">
									</c:if>
									<c:if test="${result.first == null}">
											<img alt="중고거래" src="/_img/_img/cont/best_bg.png" style="background: url('/_img/_img/cont/eye-slash-solid.png')no-repeat 50% 50% / cover;">
									  </c:if>	
									</p>
									</div>
									<p class="btn_area">
										<a href="#">수정</a>
										<a href="#">삭제</a>
									</p>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<li class="nodata">등록된 게시글이 없습니다.</li>
				</c:otherwise>	
			</c:choose>
				
		
	
				
			</ul>
			<%@include file="../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->
<!-- 삭제 선택 시 노출 -->
		<div class="layer" id="del_Pop">
			<div class="bg"></div>
			<div class="pop-layer" id="delPop">
				<div class="pop_cont text">
					<p class="tit c">게시물 삭제</p>
					<p class="mb20 c">
						게시물 삭제 후 복구가 불가합니다.<br />정말 삭제하시겠습니까?
					</p>
					<p class="two_btn btn">
						<a href="#" id="cfrm">확인</a><a
							href="#" class="bt_red cbtn">취소</a>
					</p>
				</div>
			</div>
		</div>
</div>
<!-- //wrap -->

</body>
</html>