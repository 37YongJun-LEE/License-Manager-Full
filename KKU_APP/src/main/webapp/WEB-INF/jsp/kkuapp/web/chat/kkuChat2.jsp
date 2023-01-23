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
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
	<!-- CONTENTS BEGIN -->
		<div id="chat_room">
			<div class="navi">
				<div class="top_navi">
					<a href="/chat/chatList.do" id="exit"><img src="/_img/_img/cont/navi_arrow.png"></a>
					<p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover;"></p>
					<h2>${yourInfo.usrNickname }</h2>
				</div>
		</div>
			
			<!-- 채팅 내용 시작 -->
			 <div class="chat_content">
                <!-- 메시지 시작 날짜 --><!-- 
                <div class="date_line">
                    <time datetime="2022-05-01">2022년 5월 01일</time>
                </div> -->
				<div class="main_chat" id="msgArea">
				
				<c:forEach var="message" items="${messageHistory }" varStatus="status">
					<c:choose>
						<c:when test="${message.writer == myInfo.writer}">
							<div class="me_chat">
                        	<div class="me_chat_col">
						</c:when>
						<c:otherwise>
                   			<div class="friend_chat">
                   			<div class="friend_chat_col">
						</c:otherwise>
					</c:choose>
                        <p><span class="balloon">${message.message }</span></p>
                    </div>
                    <fmt:parseDate value="${message.messageTime}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
                    <fmt:formatDate value="${dateValue }" var="date" pattern="a h:mm"/>
               		
               		<!-- 시간 맨 마지막에 뜨는 걸로 수정 필요 -->
					<c:choose>
	               		<c:when test="${date == beforeTime && message.writer == beforeWriter}">
	               			<time>${date }</time>
	           			</c:when>
	           			<c:otherwise>
	           				<time>${date }</time>
	           			</c:otherwise>
           			</c:choose>
                    <c:set var="beforeWriter" value="${message.writer }"/>
                    <c:set var="beforeTime" value="${date }"/>
                    
                    <c:if test="${message.readCheck == 1 }"><p class="readCheck" style="color: #228B22">1</p></c:if> 
                  </div>			

				</c:forEach>
				
                </div><!-- //main-chat -->
             </div><!-- //chat-content -->
			<!-- 채팅 내용 끝 -->
			
			 <!-- 채팅 입력창 -->
            <div class="insert_content">
				<a href="#" class="add_photo"><img src="/_img/_img/cont/add_photo.png" width="20"></a>
                <div class="submit_wrap">
					<p class="chat_insert">
						<!-- <textarea name="chat_insert" required placeholder="메세지를 입력하세요"></textarea>-->
						<input type="text" id="msg" class="textarea" placeholder="메세지를 입력하세요"/>
						<a href="#" class="emoticon"><img src="/_img/_img/cont/emoticon.png" width="20"></a>
					</p>
					<a href="#" id="send" class="chat_submit"><img src="/_img/_img/cont/send_icon.png" width="21"></a>
                </div>
            </div>
			 <!--// 채팅 입력창 -->

		</div>
	<!-- CONTENTS END -->

</div>
<!-- //wrap -->

</body>
</html>



    <!-- websocket javascript -->
    
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>    
<script>

// null, undefined 체크
function isEmpty(str){
	
	if(typeof str == "undefined" || str == null || str == "")
		return false;
	else
		return true ;
}
/* $('.textarea').on('keyup', function (e) { 
    $(this).css('height', '45px');
    $(this).height(this.scrollHeight - 24);
});	 */



//접속 카운트 수 myCnt,yourCnt >> 0 접속안됨, 1접속됨    // sum >> 2면 둘다 접속된 상태
var sum = 0;
//채팅 인덱스 번호
var index = 0;


$(document).ready(function(){
	window.scrollTo(0,document.body.scrollHeight);
	var roomId = "${myInfo.roomId }";
	var usrNick = "${myInfo.usrNickname}";
	var usrIdx = "${myInfo.writer}";
	var sock = new SockJS("/stomp/stomp.do"); // endpoint
	var client = Stomp.over(sock);
    var message = '';
    var turn = 0;
    
    //1. connection이 맺어지면 실행 
	client.connect({roomId: roomId, writer: usrIdx}, function (count) {	
		// 입장메시지 보냄 헤더에 roomId와 writer를 담아서 handler에서 세션 id와 매핑할수있도록 보내 줌.
/* 		client.send('/pub/chat/enter', {roomId: roomId, writer: usrIdx}, JSON.stringify({roomId: roomId, message: msg.value, writer: usrIdx, usrNick: usrNick }));
 */
        //2. subscribe (path, callback)으로 메세지 받음
		client.subscribe("/sub/chat/room/" + roomId, function (chat) {

			/* 여기가 중요 구독된 소켓을 parse로 content가져온다.  */
		    var content = JSON.parse(chat.body);
		    var nick = content.usrNick;
	        var message = content.message;
	        var readCheck = content.readCheck;
		    //var check = content.usrCount;
		    var check = content.socketId;
		    var str1 = '';
		    var str2 = '';
	        if(isEmpty(check)){
			    sum = content.sum;
	        }
	        // sum = 2이면 상대유저가 접속했다는 뜻 임. >> readCheck dis
		    if(sum == 2)
		    	$(".readCheck").css("display" ,"none");
			$(".friend_chat.col > .readCheck").css("display" ,"none");
		    
		    //메세지 html에 추가하는건데 일단 동작만 되도록 만들어 놓음, 나중에 손 좀 보고싶다
		    if (isEmpty(message)){		
		        var today = new Date();  
		        if(nick === usrNick){ // 현재 페이지 소켓 닉네임이랑 메세지 보낸사람 닉네임이랑 일치하는지 검사.
		        	//html 요소 css 적용 필요
			        str2 += '<p>';
			        if(readCheck == 1) 
			        	str2 += '<time class="readCheck" style="color: #228B22">1</time>'; /* 안읽은 메세지 옆에 숫자 1 */
			        str2 += '<time id="time">' + today.toLocaleTimeString().slice(0,-3) + '</time>';
			        str2 += '<span class="balloon">' + message + '</span></div></p></div>';
			        
			    	if(turn != 1){ // 내가 채팅할때 실행되는 코드
				    	if(turn != 0)
				    		index++; // 첫채팅이 아닐 때(상대와 턴이 바뀔 때) 인덱스를 증가시켜서 마지막 div에 채팅을 추가 할수있도록 해준다.
				    	turn = 1;
				        str1 += '<div class="me_chat">';
				        str1 += '<div class="me_chat_col" id="me_chat_col' + index +'">';
				        $("#msgArea").append(str1+str2);
		    			
			    	} else if (turn == 1){
			    		$('#me_chat_col'+index).append(str2);
			    	}
			    } else{ // 친구가 친구 채팅쳤을 때 실행 됨.*/
			        str2 += '<p>';
			        if(readCheck == 1) 
			        	str2 += '<time class="readCheck" style="color: #228B22">1</time>'; /* 안읽은 메세지 옆에 숫자 1 */  
			        str2 += '<time id="time">' + today.toLocaleTimeString().slice(0,-3) + '</time>';
			        str2 += '<span class="balloon">' + message + '</span></div></p></div>';
			    	if(turn != 2){
				    	if(turn != 0)
				    		index++;
				        str1 += '<div class="friend_chat">';
				        str1 += '<div class="friend_chat_col" id="friend_chat_col'+ index +'">';
				        //str1 += '<p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background:url' + "('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50%" + '/ cover;"></p>';
				    	turn = 2; // 연속채팅시 상대 프로필 한번만 뜨게 하기 위해 turn값으로 체크
				        $("#msgArea").append(str1+str2);
		    			
			    	} else if (turn == 2){
			    		$('#friend_chat_col'+index).append(str2);
			    	}
			    }
			}
			window.scrollTo(0,document.body.scrollHeight);
			
			

			
			
		});		
		
		});

    
    
    
		$('#send').on('click', function(evt){
	        var msg = document.getElementById("msg");
	        if(msg != "") {
		        var readCheck = 0;
		        if(sum != 2){
		        	readCheck = 1;
		        }
				window.scrollTo(0,document.body.scrollHeight);
		        client.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: usrIdx, readCheck: readCheck, usrNick: usrNick}));
		        msg.value = '';		
			}
		});
		
		$("#exit").on('click', function(evt){
			client.send('/pub/chat/out', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: usrIdx, usrNick: usrNick }));
			window.location.href = '/main.do';
			
			
		});
		
		
	    
		client.disconnect(function () {
			client.send('/pub/chat/out', {}, JSON.stringify({roomId: roomId, writer: usrIdx, usrNick: usrNick }));
	    }, {roomId : roomId});
		
		
});








  </script>