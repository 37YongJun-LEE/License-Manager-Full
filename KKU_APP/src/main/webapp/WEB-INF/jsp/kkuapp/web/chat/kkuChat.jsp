<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script src="/_js/_js/loadingChat.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>

	<div id="wrap">
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
	<!-- CONTENTS BEGIN -->
		<div id="chat_room">
			<div class="navi">
				<div class="top_navi">
					<a href="javascript:return false;" id="exit"><img src="/_img/_img/cont/navi_arrow.png"></a>
					<p class="img"><img class="friendPro" alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background:url('/upload/mypage/${yourInfo.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p>
					<h2>${yourInfo.usrNickname }</h2>
				</div>
		</div>
					
			<!-- 채팅 내용 시작 -->
			 <div class="chat_content">

				<div class="main_chat" id="msgArea">
				
				<c:forEach var="message" items="${messageHistory }" varStatus="status">
      
                <fmt:parseDate value="${message.messageTime}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:formatDate value="${dateValue }" var="time" pattern="a h:mm"/>
                <fmt:formatDate value="${dateValue }" var="date" pattern="yyyy년 M월 dd일"/>
      
      
      
      			<c:if test="${date != beforeDate}">
	                <!-- 메시지 시작 날짜 --> 
	                <div class="date_line">
	                    <time>${date }</time>
	                </div>
                </c:if>
				
				
				
					<c:choose>
						<c:when test="${message.writer == myInfo.writer}">
							<div class="me_chat">
                        	<div class="me_chat_col">
						</c:when>
						<c:otherwise>
                   			<div class="friend_chat">
                   			<c:if test="${message.writer != beforeWriter }">
                        		<p class="img"><img class="friendPro" alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/upload/mypage/${yourInfo.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p>
							</c:if>
							<c:if test="${message.writer == beforeWriter  }">
								<p class="img" style="visibility: hidden;"></p>
							</c:if>				
							<div class="friend_chat_col">
						</c:otherwise>
					</c:choose>
                        <c:if test="${message.message != ''}"> <p><span class="balloon">${message.message }</span></p></c:if>
                        <c:if test="${message.imageFile != null }"><p><img width="180" height="180" src="/upload/chat/${message.imageFile }"</p></c:if>
                    </div>
                    <div class="message_time_box">
                    	<c:if test="${message.readCheck == 1 }"><p class="readCheck" style="color: #228B22">1</p></c:if> 
             			<time>${time }</time>
                    <c:set var="beforeWriter" value="${message.writer }"/>
                    <c:set var="beforeDate" value="${date }"/>
                    </div>
                  </div>			
				</c:forEach>


			</div>
     			<div class="add_preview">
	     			<div class="pre">
						<ul class="file_wrap file_margin_0"></ul>
					</div>
				</div>			
			</div>
		

				
			 <!-- 채팅 입력창 -->
            <div class="insert_content">
				<input type="file" class="file" name="image" id="image" accept="image/*" onchange="addFile(this);" style="display: none"/>
				<a href="javascript:return false;" onclick="javascript:openFile();" id="sendFile" class="add_photo"><img src="/_img/_img/cont/add_photo.png" width="20"></a>
                <div class="submit_wrap">
					<p class="chat_insert">
						<!-- <textarea name="chat_insert" required placeholder="메세지를 입력하세요"></textarea>-->
						<input type="text" id="msg" class="textarea" placeholder="메세지를 입력하세요"/>
						<!-- <a href="javascript:return false;" class="emoticon"><img src="/_img/_img/cont/emoticon.png" width="20"></a> -->
					</p>
					<a href="javascript:return false;" id="send" class="chat_submit"><img src="/_img/_img/cont/send_icon.png" width="21"></a>
                </div>
            </div>
			 <!--// 채팅 입력창 -->
		</div>
	<!-- CONTENTS END -->
	
	<!-- 상대프로필 누를 시 노출 -->
	<div class="bottom_layer class_pop">
		<div class="bg"></div>
		<div class="bottom-pop-layer">
			<div id="sub_contents" class="my_main head_mg">
				<div class="w_box no_line">
					<div class="profile"> 
						<p class="photo">
							<span>
								<c:if test="${yourInfo.usrSrvprofilepic != null}">
									<img src="/_img/_img/cont/photo_bg.png" style="background:url('/upload/mypage/${yourInfo.usrSrvprofilepic }')no-repeat 50% 50% /cover" width="85">
									<img src="" alt="" style="width: 80px; height: 80px; object-fit: cover; object-position: top; border-radius: 50%;" />		
								</c:if>
								<!-- 기본이미지 -->
								<c:if test="${yourInfo.usrSrvprofilepic == null}">	
									<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
								</c:if>
							</span>
						</p>
	
						<p class="info">
							<span class="name">${yourInfo.usrNickname }<c:if test="${friendYN eq 1}">(${yourInfo.usrName })</c:if></span>
							<span class="depart">${yourInfo.usrMajor }</span>
							<span class="depart">${yourInfo.hackbun }학번</span>
						</p>
					</div>

				</div>
				<ul class="fd_menu">
				<c:if test="${friendYN eq null}">
					<li class="f_admin state01"><a href="javascript:return false;" onclick="javascript:addFriendCheck()">친구신청</a></li>
				</c:if>
				<c:if test="${friendYN eq 0}">
					<li class="f_admin state02"><a href="javascript:return false;" onclick="javascript:cancle()">친구취소</a></li>
				</c:if>
				
				<c:if test="${friendYN eq 1}">
					<!-- <li class="f_admin state03"><a href="#" onclick="javascript:cancle()">친구사이</a></li> -->
					<li class="f_admin timetable"><a href="/friendTimetable.do?timetableUsridx=${yourInfo.usrIdx }">시간표보기</a></li>
				</c:if>
					<li class="chat off" onclick="javascript:chatSubmit();"><a href="javascript:return false;">채팅하기</a></li>
					<li class="report"><a href="/report.do?reviewIdx=${yourInfo.usrIdx }&usrNick=${yourInfo.usrNickname}">신고하기</a></li>
				</ul>
				
			</div>
		<!-- 유저정보 끝  -->
		</div>
	</div>	
	<!-- 유저정보 팝업 끝 -->
		<!-- POPUP BEGIN -->
	<!--  닉네임 없을 시 -->
	<div class="layer" id="ok1_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok1Pop">
			<div class="pop_cont text">
				<p class="mb20 c">유효하지 않은 사용자입니다.</p>
				<p class="btn"><a href="#" onclick="location.reload();" class="btn">확인</a></p>
			</div> 
		</div>
	</div>

	<!--  친구신청 완료 시   -->
	<div class="layer" id="ok2_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok2Pop">
			<div class="pop_cont text">
				<p class="mb20 c">친구 신청되었습니다.</p>
				<p class="btn"><a href="#" onclick="location.reload();" class="btn">확인</a></p>
			</div> 
		</div>
	</div>
	
	<!--  이미 신청한 상대일 시   -->
	<div class="layer" id="ok3_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok3Pop">
			<div class="pop_cont text">
				<p class="mb20 c">이미 신청한 상태입니다.</p>
				<p class="btn"><a href="#" onclick="location.reload();" class="cbtn" >확인</a></p>
			</div> 
		</div>
	</div>
	
	<!--  요청 취소 시   -->
	<div class="layer" id="ok4_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="ok4Pop">
			<div class="pop_cont text">
				<p class="mb20 c">요청 취소되었습니다.</p>
				<p class="btn"><a href="#" onclick="location.reload();" class="cbtn" >확인</a></p>
			</div> 
		</div>
	</div>
	<!-- POPUP END -->		
	
	
	
<!-- //wrap -->

</body>
</html>



    <!-- websocket javascript -->
    
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>    
<script>

function addFriendCheck(){
	var check = 0;
	var name = "${yourInfo.usrName }";
	var phoneNumber = "${yourInfo.phoneNumber }";
	
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type: "POST",
		url: "/mypage/addFriendCheck.do",
		data: {
			usrName : name,
			phoneNumber : phoneNumber
		},
		success: function(data) {
			check = data; // check  0:닉네임정보없음   1:신청성공   2:이미신청한상대 
			if(check == '1') { // 유효한 닉네임일 때
				layer_open('ok2Pop','ok2_Pop');
			} else if(check == '0') {
				layer_open('ok1Pop','ok1_Pop');
			} else {
				layer_open('ok3Pop','ok3_Pop');
			}
				
		}
	});
	
}
function cancle(){
	var usrIdx = "${yourInfo.usrIdx }";
	
	$.ajax({
		type: "POST",
		url: "/mypage/cancleFriend.do",
		data: {
			frdIdx : usrIdx
		},
		success: function(data) {
			check = data; // check  0:삭제실패 1:삭제성공
			if(check == '1') { // 유효한 닉네임일 때
				layer_open('ok4Pop','ok4_Pop');
			} else{
			}
		}				
	});
}






//이미지

function openFile(){
	$("#image").trigger("click");
}	

var filesArr = new Array();
var arrayBuffer = new ArrayBuffer();
var img;
var img2;

function addFile(obj){
   		 const file = obj.files[0];
         if (validation(file)) {


	         /*
        	 // 파일 배열에 담기
	         var reader = new FileReader();
	         //미리보기
	         reader.onload = function (e) {
	             img = e.target.result;
	   	     	document.getElementById('preview').src = img;
	             filesArr.push(file);
	         }
	         reader.readAsDataURL(file)
			    */
			const reader = new FileReader();
			
			reader.onload = function(base64){
				const image = new Image();
				
				image.src = base64.target.result;
				
				image.onload = function(e) {
					const $canvas = document.createElement(`canvas`);
					const ctx = $canvas.getContext(`2d`);
					
					$canvas.width = e.target.width;
					$canvas.height = e.target.height;
					
					ctx.drawImage(e.target, 0, 0);
					
					// 용량이 줄어든 base64 이미지
					img = $canvas.toDataURL(`image/jpeg`, 0.5);
		   	     	document.getElementById('preview').src = img;
			 }
			}
		    reader.readAsDataURL(file);

	         // 목록 추가 + 미리보기
			let htmlData = '';
	     	var html = 
			       	'<li id="file' + 0 + '" class="filebox">'
						+'<span><img id="preview" width="65" height="65" src="'	
						+'")no-repeat 50% 50% / cover"></span>'
						+'<a onclick="deleteFile(' + 0 + ');" class="close"></a>'+
					'</li>';
			if($(".file_wrap").children().length > 0){
			    document.querySelector("li#file0").remove();
			    filesArr.pop();
			}
			$(".file_wrap").append(html);
			
         }

		window.scrollTo(0,document.body.scrollHeight);
}

/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif'];
    if (obj.name.length > 100) {
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (100 * 1024 * 1024)) {
        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
        return false;
    } else if (obj.name.lastIndexOf('.') == -1) {
        alert("확장자가 없는 파일은 제외되었습니다.");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        alert("이미지만 첨부 가능합니다.");
        return false;
    } else {
        return true;
    }
}


/* 첨부파일 삭제 */
function deleteFile(num) {
	var num = 0;
    filesArr.pop();
    document.querySelector("li#file" + num).remove();
}




//null, undefined 체크
function isNotEmpty(str){
	
	if(typeof str == "undefined" || str == null || str == "")
		return false;
	else
		return true ;
}

//채팅턴    0 : 없음 / 1 : 접속한유저   /  2 : 상대방
var turn = 0;
var ifOtherConnect = 0;
var now = "";
var temp = "";
var onOff = true;

function checkReadMessage(){
    if(ifOtherConnect == 1)
    	$(".readCheck").css("display" ,"none");
	$(".friend_chat .readCheck").css("display" ,"none");
}
function uuidv4() {
	  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
	    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
	    return v.toString(16);
	  });
}
function imgLoading(imgId){
	loadingChat("이미지 전송중입니다...");
	$('#loadingImg').attr('id', imgId);
}


$(document).ready(function(){
	window.scrollTo(0,document.body.scrollHeight);
	var roomId = "${myInfo.roomId }";
	//var usrNick = ${room.usrNick}; or usrIdx
	var usrNick = "${myInfo.usrNickname}"; // 임시값
	var sock = new SockJS("/stomp/stomp.do"); // endpoint
	var usrIdx = "${myInfo.writer}";
	var client = Stomp.over(sock);
    var message = '';
    var turn = 0;
    ifOtherConnect = "${ifOtherConnect}";
    // 상대방 접속여부 0:연결 x 1:연결o
    
    checkReadMessage();

    //1. connection이 맺어지면 실행 
	client.connect({roomId: roomId, writer: usrIdx}, function (data) {	
        
       //2. 상대가 (접속 + 퇴장 + 메세지) 보낼 때 실행 됨.
		client.subscribe("/sub/chat/room/" + roomId, function (chat) {
			/* 여기가 중요 구독된 소켓을 parse로 content가져온다.  */
		    var content = JSON.parse(chat.body);
		    var nick = content.usrNick;	
	        var message = content.message;
		    var check = content.usrCount;
		    var readCheck = content.readCheck;
		    var reciveImg = content.base64;
		    var imgId = content.imgId;
		    var str1 = '';
		    var str2 = '';
		    if(!(typeof content.ifOtherConnect == "undefined"))
		    	ifOtherConnect = content.ifOtherConnect;
	
		    checkReadMessage();
			if (isNotEmpty(message) || isNotEmpty(reciveImg)){
		        var today = new Date();  
		        now = today.toLocaleTimeString().slice(0,-3);
	
		        
		        if(nick === usrNick){ // 현재 페이지 소켓 닉네임이랑 메세지 보낸사람 닉네임이랑 일치하는지 검사.
		        	onOff=true;
		        	if(turn != 1) {turn = 1; onOff=false;}
		        	//html 요소 css 적용 필요
		        	str1 += '<div class="me_chat">';
			        str1 += '<div class="me_chat_col">';
		        } else {
		        	onOff=true;
			        str1 += '<div class="friend_chat">';
	        		if(turn != 2){
				        onOff=false;
	        			str1 += '<p class="img"><img class="friendPro" alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background:url' 
		        			+ '(/upload/mypage/${yourInfo.usrSrvprofilepic })no-repeat 50% 50%/ cover;"></p>';
	        			turn = 2;
	        		} else
	       				str1 += '<p class="img" style="visibility: hidden;" ></p>';
			        str1 += '<div class="friend_chat_col">';
		        }
	        	if(isNotEmpty(message) && isNotEmpty(reciveImg)){
	        		str2 += '<p><span class="balloon">' + message + '</span></p>'
	        			 + '<p><img width="180" height="180" src="'+ reciveImg+'" )no-repeat="" 50%="" cover"=""></p></div>';
	        	} else if(isNotEmpty(message)){
	        		str2 += '<p><span class="balloon">' + message + '</span></p></div>';
				}else if(isNotEmpty(reciveImg)){
	        		closeLoadingById(imgId);
	        		str2 += '<p><img width="180" height="180" src="'+ reciveImg+'"</p></div>';
	        	}
	        	str2 += '<div class="message_time_box">'
	        	if(readCheck == 1) 
	        		str2 += '<p class="readCheck" style="color: #228B22">1</p>';
        		str2 += '<time class="time">' + now + '</time></div></div>';
			}
	        if(now != temp)
	        	temp = now;
	        else if(now == temp && onOff){
	        	$(".time").last().remove();
	       	}						
			
			$("#msgArea").append(str1+str2);
			
	        
			window.scrollTo(0,document.body.scrollHeight);
		
	});		
	
    
	$('#send').on('click', function(evt){
        var msg = document.getElementById("msg");
        if(image = $('#preview').attr('src')){
			var imgId = uuidv4();
        	imgLoading(imgId);
        }
        if(isNotEmpty(msg.value) && !isNotEmpty(image)) {
	        readCheck = 1;
	        if(ifOtherConnect == 1)
	        	readCheck = 0;
	        client.send('/pub/chat/message/'+roomId, {}, JSON.stringify({roomId: roomId, message: msg.value, writer: usrIdx, readCheck: readCheck, usrNick: usrNick}));
		} else if(isNotEmpty(image)){
	        readCheck = 1;
	        if(ifOtherConnect == 1)
	        	readCheck = 0;
	        client.send('/pub/chat/message/'+roomId, {}, JSON.stringify({roomId: roomId, imgId: imgId, message: msg.value, writer: usrIdx, readCheck: readCheck, usrNick: usrNick, base64: image}));
	        deleteFile(0);			
		}
        msg.value = '';	
	});
	
	
	$("input[type='text']").keyup(function(e) {
		if(e.keyCode == "13") {
	        var msg = document.getElementById("msg");
	        var image = $('#preview').attr('src');
	        if(isNotEmpty(msg.value) && (filesArr.length == 0)) {
		        readCheck = 1;
		        if(ifOtherConnect == 1)
		        	readCheck = 0;
		        client.send('/pub/chat/message/'+roomId, {}, JSON.stringify({roomId: roomId, message: msg.value, writer: usrIdx, readCheck: readCheck, usrNick: usrNick}));
			} else if(filesArr.length > 0){
				
		        readCheck = 1;
		        if(ifOtherConnect == 1)
		        	readCheck = 0;
		        client.send('/pub/chat/message/'+roomId, {}, JSON.stringify({roomId: roomId, message: msg.value, writer: usrIdx, readCheck: readCheck, usrNick: usrNick, base64: image}));
		        deleteFile(0);		
			}
	        msg.value = '';	
		}
	});
	
 	$('.textarea').on('keyup', function (e) { 
		window.scrollTo(0,document.body.scrollHeight);
/* 	    $('#msgArea').css('height', '45px');
	    $('#msgArea').height(this.scrollHeight - 24); */
	});		
 	

 	$('.textarea').on("focus" , function() { 
		window.scrollTo(0,document.body.scrollHeight);
 	});
	
	$("#exit").on('click', function(evt){
		client.disconnect(function (chat) {
			window.location.href = '/chat/chatList.do';
		},{roomId:roomId});
	});
	
	$(".friendPro").click(function(){    
		$(".class_pop").addClass("active");
	});	
	$(".cbtn, .bg").click(function(){    
		$(".bottom_layer").removeClass("active");
	});	


	
});
});
  </script>

  
  <!-- <script src="/_js/_js/image.js" type="text/javascript" charset="utf-8"></script> -->