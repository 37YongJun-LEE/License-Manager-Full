<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../_inc/title.jsp" %>
<script>
function galDelete(){
	var cBoardIdx = '${galleryDetail.clubBoardIdx }';
	var cBoardType ='${galleryDetail.clubBoardType }';
	var cIdx = '${galleryDetail.clubIdx }';
	var data = new FormData();
	data.append("clubBoardIdx",cBoardIdx);
	data.append("clubBoardType",cBoardType);
	data.append("clubIdx",cIdx);
	
	$.ajax({
	    url: '/club_gallery_delete_process.do',
	    type: 'POST',
	    contentType: false,               // * 중요 *
        processData: false,  
	    data: data,
	    enctype : 'multipart/form-data',
	    success: function (data) {
	    	console.log(data);
	 			if(data == "success"){
	 				layer_open('delokPop','delok_Pop');
	 			}
	 			else{
	 				layer_open('delfailPop','delfail_Pop');
	 			}

	        }
	});
}
</script>
<body>
	<div id="wrap">
		<!-- HEADER BEGIN -->
			<header class="sub">
			<%@include file="../_inc/header.jsp" %>
			</header>
		<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="javascript:history.back(-1)"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>갤러리</h2></div>
			</div>
			<div class="bbs_view">
				<div class="view_top">
					<p class="tit">${galleryDetail.clubBoardTitle }</p>
					<div class="writer"> 
						<a href="#" class="photo">
							<span>
								<!-- 기본이미지 -->
								<img src="/_img/_img/cont/photo_bg.png" style="background:url('/upload/mypage/${result.usrSrvprofilepic}')no-repeat 50% 50% / cover" width="85">
								<!-- 이미지 예시 : 권장이미지 225 * 225-->
								<!-- <img src="_img/cont/photo_bg.png" style="background:url('_img/cont/ex_photo.jpg')no-repeat 50% 50% /cover" width="85"> -->
							</span>
						</a>
						<div class="info">
							<a href="#" class="name">${galleryDetail.usrName }</a>
							<p><span>2022.05.20</span><span>11:00</span><span>조회수 ${galleryDetail.viewnum }</span></p>
						</div>
					</div>
				</div>
				<div class="view_bottom">
					<div class="view_cont">
						<p><img src="/upload/clubBoard/${galleryDetail.servFile }"></p>
						<br/>
						<p>${galleryDetail.clubBoardContent }</p>
					</div>
					<p class="btn nk_btn mt15">
						<a href="/club_gallery.do?clubIdx=${galleryDetail.clubIdx }" class="bt_greenL">목록</a>
			

					<c:if test="${galleryDetail.regIdx eq sessionIdx }">
						<a href="/club_gallery_modify.do?clubIdx=${galleryDetail.clubIdx }&clubBoardIdx=${galleryDetail.clubBoardIdx}" class="bt_gray02">수정</a>
						<a  href="#none" class="bt_grayL" onclick="layer_open('delPop','del_Pop')">삭제</a>
					</c:if>
					</p>
				</div>
			</div>

			</div>
	<!-- CONTENTS END -->
		<!-- POPUP BEGIN -->
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
						<a href="#" onclick="galDelete()">확인</a><a
							href="#" class="bt_red cbtn">취소</a>
					</p>
				</div>
			</div>
		</div>

		<!-- 삭제 팝업 확인 선택 시 노출 -->
		<div class="layer" id="delok_Pop">
			<div class="bg"></div>
			<div class="pop-layer" id="delokPop">
				<div class="pop_cont text">
					<p class="tit c">게시물 삭제 완료</p>
					<p class="mb20 c">게시물이 삭제되었습니다.</p>
					<p class="btn">
						<a href="#" onclick="location.href='/club_gallery.do?clubIdx=${clubVO.clubIdx}'">확인</a>
					</p>
				</div>
			</div>
		</div>
		<!-- 삭제 실패 시 노출 -->
		<div class="layer" id="delfail_Pop">
			<div class="bg"></div>
			<div class="pop-layer" id="delfailPop">
				<div class="pop_cont text">
					<p class="tit c">게시물 삭제 실패</p>
					<p class="mb20 c">게시물을 삭제할 수 없습니다.</p>
					<p class="btn">
						<a href="#" onclick="location.reload()">확인</a>
					</p>
				</div>
			</div>
		</div>
		<!-- POPUP END -->
	</div>
</body>
<%@include file="../_inc/bottom_menu.jsp" %>
<%@include file="../_inc/footer.jsp" %>
</html>






