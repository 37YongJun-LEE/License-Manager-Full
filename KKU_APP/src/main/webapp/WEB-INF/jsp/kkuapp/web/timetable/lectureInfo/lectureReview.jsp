<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
<script src="/_js/_js/loading.js" type="text/javascript" charset="utf-8"></script>
</head>
<script>
var fileNo = 0;
var filesArr = new Array();
var img;
var maxFileCnt = 5;   // 첨부파일 최대 개수
function openFile(){
	$("#input_usr_file").trigger("click");
}
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
/* 첨부파일 추가 */
function addFile(obj){
	var attFileCnt = document.querySelectorAll('.box').length;    // 기존 추가된 첨부파일 개수
	var delFileCnt = document.querySelectorAll('.delfile').length; // 삭제된 개수
	var remainFileCnt = maxFileCnt - attFileCnt + delFileCnt;    // 추가로 첨부가능한 개수 (최대 파일 - 현재첨부개수 + 삭제된 수)
	var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
    
    
	// 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    }

    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

        const file = obj.files[i];
		//동기화문제 해결 필요 할 수 있음
        // 첨부파일 검증 + 미리보기
        if (validation(file)) {
            // 파일 배열에 담기
/*          var reader = new FileReader();
            reader.onload = function (e) {
                img = e.target.result;
      	     	document.getElementById('preview').src = img; */
                filesArr.push(file);
 /*           };
            reader.readAsDataURL(file) */

            // 목록 추가 + 미리보기
			var html = '<li id="file' + fileNo + '" class="box">'
					 + '<a herf="#" class="file" download="">'
					 + file.name // 변수로 변경
					 + '</a><button class="close" onclick="deleteFile(' + fileNo + ');"></button></li>';
            $(".filelist").append(html);
			count('plus');
			
            fileNo++;
        } else {
            continue;
        }
    }
    // 초기화
    document.querySelector("input[type=file]").value = "";
}
/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['application/pdf','application/x-zip-compressed',"application/haansoftxlsx",
					  'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
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
        alert("첨부가 불가능한 파일은 제외되었습니다.");
        return false;
    } else {
        return true;
    }
}

/* 첨부파일 삭제 */
function deleteFile(num) {
    document.querySelector("li#file" + num).remove();
    filesArr[num].is_delete = true;
    count('minus');
}

function delfile(index){
    var file_id = "#file_id_"+index;
    $(file_id).hide();
	
    var del_id = "#"+index+"_del";
    $(del_id).val('Y');
    $(del_id).addClass('delfile');
    count('minus');
}

function delfile(index){
    var file_id = "#file_id_"+index;
    $(file_id).hide();
	
    var del_id = "#"+index+"_del";
    $(del_id).val('Y');
    $(del_id).addClass('delfile');
    count('minus');
}



//숫자
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = $('#count').find('b')[0];
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	  }
	  // 결과 출력
	  resultElement.innerText = number;
	}
	
var isRun = false;
function submitForm(mode) {
	if(isRun == true){ // 중복실행방지
		return;
	}
    isRun = true;
    $('#mode').val(mode);
	if (isSubmit()) {
	    loading("글을 등록 중입니다...");
	    // 폼데이터 담기
	    var form = document.querySelector("frm");
	    var formData = new FormData(frm);
	    for (var i = 0; i < filesArr.length; i++) {
	        // 삭제되지 않은 파일만 폼데이터에 담기
	        if (!filesArr[i].is_delete) {
	            formData.append("attach_file", filesArr[i]);
	        }
	    }
	    $.ajax({
	    	type: "POST",
	        url: "/reviewProc.do",
	        data: formData,
	        contentType: false,               // * 중요 *
	        processData: false,               // * 중요 *
	        enctype : 'multipart/form-data',  // * 중요 *
	        success: function (data) { // data    1: 등록/수정 완료    2: 거래완료 / 삭제완료
	        	isRun = false;
				location.href="/lectureInfo_view.do?lectureSubnum=${lectureinfo.lectureSubnum}";
	        },
	        error: function (xhr, desc, err) {
	            alert('에러가 발생 하였습니다.');
	            return;
	        }
	    });
	} else
		isRun = false;
}

function isSubmit(){
	if($("#selecter").val() == "공유 자료 구분 선택"){
		alert("자료 구분을 선택하세요");
		return false;
	}
	else if($("#content").val() == ""){
		alert("내용을 입력하세요");
		return false;
	}else
		return true;
	
}


</script>

<body>
	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="info head_mg mb140">
			<div class="navi">
				<div class="top_navi"><a href="/lectureInfo_view.do?lectureSubnum=${lectureinfo.lectureSubnum}"><img src="/_img/_img/cont/navi_arrow.png"></a>
					<c:if test="${reviewInfo == null }">
						<h2>자료 공유하기</h2></div>
					</c:if>	
					<c:if test="${reviewInfo != null }">
						<h2>자료 공유 수정하기</h2></div>
					</c:if>		
			</div>
			<div class="bbs_write w_box top no_line">
				<form name="frm" id="frm" autocomplete="off" method="post" enctype="multipart/form-data">
					<input type="hidden" name="mode" id="mode" />
					<input type="hidden" name="subNum" id="subNum" value="${lectureinfo.lectureSubnum }"/>
					<input type="hidden" name="lectureName" id="lectureName" value="${lectureinfo.lectureName }"/>
					<input type="hidden" name="lectureProfname" id="lectureProfname" value="${lectureinfo.lectureProfname }"/>
					<input type="hidden" name="reviewIdx" id="reviewIdx" value="${reviewInfo.reviewIdx }"/>
					<p class="path mb10">${lectureinfo.lectureName } (${lectureinfo.lectureProfname} )</p>
					<select class="path mb10" id="selecter" name="selecter">
					<c:if test="${reviewInfo != null }">	
						<option selected="selected" hidden>${reviewInfo.selecter }</option>
					</c:if>
						<option>공유 자료 구분 선택</option>
						<option>수업 내용 정리</option>
						<option>족보</option>
						<option>과제</option>
						<option>기타 자료</option>
					</select>
						<c:if test="${reviewInfo == null }">
							<textarea id="content" name="content" rows="10" placeholder="수강 후기 및 강의 자료에 대한 설명을 작성 해주세요!"></textarea>
						</c:if>	
						<c:if test="${reviewInfo != null }">
							<textarea id="content" name="content" rows="10">${reviewInfo.content }</textarea>
						</c:if>		
		
						<div class="filebox">
						  <input class="upload-name" disabled="disabled">
						  <!-- <input type="file" id="input_file" class="upload-hidden"> -->
						  <input type="file" accept="image/*" class="file" name="input_usr_file" id="input_usr_file" onchange="addFile(this); readURL(this);" style="display: none" multiple/>
						  <label onclick="javascript:openFile();" class="add" for="input_file">File selection.</label> 
							<c:if test="${reviewInfo == null }">
								<span class="count" id="count"><b>0</b> /5</span>
							</c:if>
							<c:if test="${reviewInfo != null }">
								<span class="count" id="count"><b>${reviewInfo.fileCnt }</b> /5</span>
							</c:if>							  
						   
						</div>
						<ul class="filelist">
						<c:forEach var="file" items="${fileList }">
							<li id="file_id_${file.fileIdx }" class="box"><a href="#" class="file" download="">${file.fileUsrFile }</a><button type="button" class="close" onclick="javascript:delfile(${file.fileIdx });"></button></li>
							<input type="hidden" name="fileIdxArr" value="${file.fileIdx }"/>
			 				<input type="hidden"  name="delArr" value="N" id="${file.fileIdx }_del"/>
						</c:forEach>					
						</ul>
						</form>
					<p class="btn mt35">
						<c:if test="${reviewInfo == null }">
							<a href="#" onclick="javascript:submitForm('reg');" class="btn">등록</a>
						</c:if>
						<c:if test="${reviewInfo != null }">
							<a href="#" onclick="javascript:submitForm('mod');" class="btn">저장</a>
						</c:if>
					</p>						
						
					
					
				</div>
			<%@include file="../../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->
	


</div>
<!-- //wrap -->

</body>
</html>

