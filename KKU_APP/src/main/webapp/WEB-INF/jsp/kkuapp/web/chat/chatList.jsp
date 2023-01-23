<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script>
window.setInterval('refresh()', 5000); 	
// Call a function every 10000 milliseconds 
// (OR 10 seconds).

// Refresh or reload page.
function refresh() {
    window .location.reload();
}

$(document).ready(function(){
	if (!location.hash) { 
		location.hash = '#reload';
		refresh();
	}
});

function displayedAt(createdAt) {
	
	  const milliSeconds = new Date() - Date.parse(createdAt);
	  
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
			<div class="w_box top no_line">
				<ul class="chat_list ">
				<c:choose>
					<c:when test="${fn:length(chatList) > 0 and chatList[0].allMsg != 0}">
					<c:forEach var="chat" items="${chatList }">
						<c:if test="${chat.allMsg != 0 }">
							<li onclick="location.href='/chat/room.do?roomId=${chat.roomId }';"> 
								<div>				
									<c:if test="${chat.usrSrvprofilepic != null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/upload/mypage/${chat.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p></c:if>
									<c:if test="${chat.usrSrvprofilepic == null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/_img/_img/cont/no_photo.png')no-repeat 50% 50% / cover;"></p></c:if>
								</div>
								<div class="text">
									<p class="name"><span>${chat.usrNickname }</span><b class="time"><script> displayedAt("${chat.time}") </script></b></p>
									<p class="con">
										<c:if test="${chat.lastImage != null}">(사진)</c:if>
										<c:if test="${chat.lastImage  == null}">${chat.lastMsg }</c:if>
									</p>
								</div>
								<c:if test="${chat.notReadMsg != 0 }"> <p><span class="chat_num">${chat.notReadMsg }</span></p></c:if>
							</li>
						</c:if>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<li class="nodata">아직 채팅이 없어요!</li>
					</c:otherwise>
				</c:choose>
				</ul>
			<%@include file="../_inc/bottom_menu.jsp" %>
			
		</div>
		
	<!-- CONTENTS END -->

</div>
<!-- //wrap -->

</body>
</html>

