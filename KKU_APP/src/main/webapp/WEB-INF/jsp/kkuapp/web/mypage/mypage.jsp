<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script>

$(document).ready(function() {
	$("#input_usr_img").on("change", handleImgFileSelect);	
});

function openImg(){
	$("#input_usr_img").trigger("click");
}

sel_files = [];
function handleImgFileSelect(e) {
    // 이미지 정보들을 초기화

    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var index = 0;
    filesArr.forEach(function(f) {


        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
        	var html = "<img src=\"" + e.target.result +"\"style=\"width: 116px; height: 116px; object-fit: cover; object-position: top; border-radius: 50%;\" >";
            $("#usrImg").append(html);
            index++;
        }
        reader.readAsDataURL(f);
        //결과 처리 함수 추가 필요 ex) 성공 ->변경되었습니다, 실패->파일의 확장자가 이미지가 아닙니다.
        if(sel_files){
    		if(confirm("프로필이미지를 변경하시겠습니까?")){
    			$("#fileForm").attr("action", "/mypage/addPhoto.do");
    			$("#fileForm").submit();
    		}
        }
        
    });
}


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
		<div id="sub_contents" class="my_main head_mg">
			<div class="navi">
				<div class="top_navi"><a href="javascript:history.back();"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>마이페이지</h2></div>
			</div>
			<div class="w_box">
				<div class="profile"> 
					<p class="photo">
						<span>
							<c:if test="${userInfo.usrSrvprofilepic != null}">
								<img src="/_img/_img/cont/photo_bg.png" style="background:url('/upload/mypage/${userInfo.usrSrvprofilepic }')no-repeat 50% 50% /cover" width="85">
								<img src="" alt="" style="width: 80px; height: 80px; object-fit: cover; object-position: top; border-radius: 50%;" />		
							</c:if>
							<!-- 기본이미지 -->
							<c:if test="${userInfo.usrSrvprofilepic == null}">	
								<img src="/_img/_img/cont/photo_bg.png" style="background:url('/_img/_img/cont/friend_bg2.png')no-repeat 50% 50% / cover" width="85">
							</c:if>
							<!-- 이미지 예시 : 권장이미지 225 * 225-->
							
						</span>
					</p>

					<p class="info">
						<!-- 이름 / 메일 / 학과 / 학번 -->
						<span class="name">${userInfo.usrNickname }(${userInfo.usrName })</span>
						<span class="mail">${userInfo.usrEmail }</span>
						<span class="depart">${userInfo.usrMajor }</span>
						<span class="depart">${userInfo.usrStdnum }학번</span>
					</p>
				</div>
				<ul class="my_data">
					<li onclick="location.href='/mypage/myCommunity.do'"><span>게시물</span><p>${boardCnt}<b>건</b></p></li>
					<li onclick="location.href='/mypage/myTrade01.do'"><span>거래내역</span><p>${userInfo.tradeCnt }<b>건</b></p></li>
					<li onclick="location.href='/mypage/myFriend.do'"><span>친구</span><p>${friendCnt.frdCnt }<b>명</b></p></li>
				</ul>
				<ul class="my_quick">
					
					<li onclick="location.href='/mypage/myCommunity.do'">
						<p class="icon"></p>
						<p>게시글 관리</p>
					</li>
					<li onclick="location.href='/mypage/myTrade01.do'">
						<p class="icon"></p>
						<p>거래내역</p>
					</li>
					<li onclick="location.href='/mypage/myFriend.do'">
						<p class="icon"></p>
						<p>친구 목록</p>
					</li>
					
				</ul>
			</div>

			<div class="w_box no_line">
				<div class="my_list">
					<p class="tit">내 정보</p>
					<ul>

						<li>
							<form id="fileForm" name="fileForm" autocomplete="off" method="post" enctype="multipart/form-data">
								<input type="file" accept="image/*" class="file" name="input_usr_img" id="input_usr_img"  style="display: none"/>
								<a href="javascript:openImg();">
									<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="19"><path d="M512 32H64C28.65 32 0 60.65 0 96v320c0 35.35 28.65 64 64 64h448c35.35 0 64-28.65 64-64V96C576 60.65 547.3 32 512 32zM176 128c35.35 0 64 28.65 64 64s-28.65 64-64 64s-64-28.65-64-64S140.7 128 176 128zM272 384h-192C71.16 384 64 376.8 64 368C64 323.8 99.82 288 144 288h64c44.18 0 80 35.82 80 80C288 376.8 280.8 384 272 384zM496 320h-128C359.2 320 352 312.8 352 304S359.2 288 368 288h128C504.8 288 512 295.2 512 304S504.8 320 496 320zM496 256h-128C359.2 256 352 248.8 352 240S359.2 224 368 224h128C504.8 224 512 231.2 512 240S504.8 256 496 256zM496 192h-128C359.2 192 352 184.8 352 176S359.2 160 368 160h128C504.8 160 512 167.2 512 176S504.8 192 496 192z"/></svg>
									프로필 사진 변경
								</a>
							</form>
						</li>

						<li>
							<a href="/mypage/changeNick.do">
								<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="16"><path d="M511.1 63.1v287.1c0 35.25-28.75 63.1-64 63.1h-144l-124.9 93.68c-7.875 5.75-19.12 .0497-19.12-9.7v-83.98h-96c-35.25 0-64-28.75-64-63.1V63.1c0-35.25 28.75-63.1 64-63.1h384C483.2 0 511.1 28.75 511.1 63.1z"/></svg>
								닉네임 변경
							</a>
						</li>
						<li>
							<a href="/mypage/changePw.do">
								<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="17"><path d="M282.3 343.7L248.1 376.1C244.5 381.5 238.4 384 232 384H192V424C192 437.3 181.3 448 168 448H128V488C128 501.3 117.3 512 104 512H24C10.75 512 0 501.3 0 488V408C0 401.6 2.529 395.5 7.029 391L168.3 229.7C162.9 212.8 160 194.7 160 176C160 78.8 238.8 0 336 0C433.2 0 512 78.8 512 176C512 273.2 433.2 352 336 352C317.3 352 299.2 349.1 282.3 343.7zM376 176C398.1 176 416 158.1 416 136C416 113.9 398.1 96 376 96C353.9 96 336 113.9 336 136C336 158.1 353.9 176 376 176z"/></svg>
								비밀번호 변경
							</a>
						</li>
					</ul>
				</div>
				<div class="my_list">
					<p class="tit">이용 안내</p>
					<ul>
					<!-- 
						<li>
							<a href="/member/myReportList.do">
								
								내 신고 리스트
							</a>
						</li>
					 -->
						<li>
							<a href="/member/actionLogout.do">
								<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="15"><path d="M144 192H384C419.3 192 448 220.7 448 256V448C448 483.3 419.3 512 384 512H64C28.65 512 0 483.3 0 448V256C0 220.7 28.65 192 64 192H80V144C80 64.47 144.5 0 224 0C281.5 0 331 33.69 354.1 82.27C361.7 98.23 354.9 117.3 338.1 124.9C322.1 132.5 303.9 125.7 296.3 109.7C283.4 82.63 255.9 64 224 64C179.8 64 144 99.82 144 144L144 192z"/></svg>
								로그아웃
							</a>
						</li>
						<li>
							<a href="/mypage/service.do">
								<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" width="15"><path d="M256 0v128h128L256 0zM224 128L224 0H48C21.49 0 0 21.49 0 48v416C0 490.5 21.49 512 48 512h288c26.51 0 48-21.49 48-48V160h-127.1C238.3 160 224 145.7 224 128zM272 416h-160C103.2 416 96 408.8 96 400C96 391.2 103.2 384 112 384h160c8.836 0 16 7.162 16 16C288 408.8 280.8 416 272 416zM272 352h-160C103.2 352 96 344.8 96 336C96 327.2 103.2 320 112 320h160c8.836 0 16 7.162 16 16C288 344.8 280.8 352 272 352zM288 272C288 280.8 280.8 288 272 288h-160C103.2 288 96 280.8 96 272C96 263.2 103.2 256 112 256h160C280.8 256 288 263.2 288 272z"/></svg>
								서비스 이용약관
							</a>
						</li>
						<li>
							<a href="/mypage/withdrawal.do">
								<svg  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="20"><path d="M284.9 320l-60.9-.0002c-88.36 0-160 71.63-160 159.1C63.1 497.7 78.33 512 95.1 512l448-.0039c.0137 0-.0137 0 0 0l-14.13-.0013L284.9 320zM630.8 469.1l-249.5-195.5c48.74-22.1 82.65-72.1 82.65-129.6c0-79.53-64.47-143.1-143.1-143.1c-69.64 0-127.3 49.57-140.6 115.3L38.81 5.109C34.41 1.672 29.19 0 24.03 0C16.91 0 9.845 3.156 5.127 9.187c-8.187 10.44-6.375 25.53 4.062 33.7L601.2 506.9c10.5 8.203 25.56 6.328 33.69-4.078C643.1 492.4 641.2 477.3 630.8 469.1z"/></svg>
								회원 탈퇴
							</a>
						</li>
					</ul>
				</div>
				
			</div>
			
			<%@include file="../_inc/bottom_menu.jsp" %>
			<%@include file="../_inc/footer.jsp" %>
		</div>
</div>
<!-- //wrap -->

</body>
</html>