<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
<script src="/_js/_js/loading.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

function openFile(){
	$("#input_usr_file").trigger("click");
}

var fileNo = 0;
var filesArr = new Array();
var img;
var maxFileCnt = 5;   // 첨부파일 최대 개수

/* 첨부파일 추가 */
function addFile(obj){
	var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
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
            var reader = new FileReader();
            reader.onload = function (e) {
                img = e.target.result;
      	     	document.getElementById('preview').src = img;
                filesArr.push(file);
            };
            reader.readAsDataURL(file)

            // 목록 추가 + 미리보기
            let htmlData = '';
        	var html = 
		       	'<li id="file' + fileNo + '" class="filebox">'
					+'<span><img id="preview" width="65" height="65" src="'	
					+ img
					+'")no-repeat 50% 50% / cover"></span>'
					+'<a onclick="deleteFile(' + fileNo + ');" class="close"></a>'+
				'</li>';
            $(".file_wrap").append(html);
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
    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
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


/* 폼 전송 */
 
var isRun = false;
function submitForm(mode) {
	if(isRun == true){ // 중복실행방지
		layer_open('loadPop','load_Pop');
		return;
	}
    isRun = true;
    $('#mode').val(mode);
	if (isSubmit()) {
	    loading("판매글을 등록 중입니다...");
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
	        url: "/trade/tradeProc.do",
	        data: formData,
	        contentType: false,               // * 중요 *
	        processData: false,               // * 중요 *
	        enctype : 'multipart/form-data',  // * 중요 *
	        success: function (data) { // data    1: 등록/수정 완료    2: 거래완료 / 삭제완료
	        	isRun = false;
				location.href="/trade/tradeList.do";
	        },
	        error: function (xhr, desc, err) {
	            alert('에러가 발생 하였습니다.');
	            return;
	        }
	    });
	}else{
		isRun = false;
		return;
	}
}

//사진 업로드 끝



function isSubmit() {
	var isPass = true;

	if(isPass){	
		if($('#trdTitle').val() == ''){
			layer_open('faildPop','faild_Pop');
			$("#one").show();
			$("#two").hide();
			$("#three").hide();
			$("#four").hide();
			$("#trdTitle").focus();
			return false;
		}

		if($('#trdPrice').val() == ''){
			layer_open('faildPop','faild_Pop');
			$("#one").hide();
			$("#two").show();
			$("#three").hide();
			$("#four").hide();
			$("#trdPrice").focus();
			return false;
		}
		if(isNaN($('#trdPrice').val())){
			layer_open('faildPop','faild_Pop');
			$("#one").hide();
			$("#two").hide();
			$("#three").show();
			$("#four").hide();
			$("#trdPrice").focus();
			return false;
		}
		if($('#trdContent').val() == ''){
			layer_open('faildPop','faild_Pop');
			$("#one").hide();
			$("#two").hide();
			$("#three").hide();
			$("#four").show();
			$("#trdContent").focus();
			return false;
		}
	}
	return isPass;
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
		<div id="sub_contents" class="board head_mg mb140">
		

			<div class="navi">
				<div class="top_navi"><a href="/trade/tradeList.do"><img src="/_img/_img/cont/navi_arrow.png"></a>
					<c:if test="${tradeInfo == null }">
						<h2>중고 거래 글쓰기</h2>
					</c:if>	
					<c:if test="${tradeInfo != null }">
						<h2>중고 거래 수정하기</h2>
					</c:if>		
				</div>
			</div>
			<div class="bbs_write w_box top no_line">
				<form name="frm" id="frm" autocomplete="off" method="post" enctype="multipart/form-data">
				
					<input type="hidden" name="trdIdx" value="${tradeInfo.trdIdx }"/>
					<input type="hidden" name="mode" id="mode" />
					
					<input type="text" id="trdTitle" name="trdTitle" placeholder="제목을 입력해주세요" value="${tradeInfo.trdTitle }" class="mb10"/>
					<input type="text" id="trdPrice" name="trdPrice" placeholder="￦  가격을 입력하세요" value="${tradeInfo.trdPrice }" class="mb10"/>
					<textarea type="text" rows="7" id="trdContent" name="trdContent" placeholder="상품에 대한 설명을 입력해주세요.&#13;&#10;예) 오후 6시 이후로 단월에서 거래 가능합니다.">${tradeInfo.trdContent }</textarea>
					
					<div class="add_photo">
						<input type="file"  accept="image/*" class="file" name="input_usr_file" id="input_usr_file" onchange="addFile(this);" style="display: none" multiple/>
						<a href="javascript:openFile();" class="add">
							<span class="icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M194.6 32H317.4C338.1 32 356.4 45.22 362.9 64.82L373.3 96H448C483.3 96 512 124.7 512 160V416C512 451.3 483.3 480 448 480H64C28.65 480 0 451.3 0 416V160C0 124.7 28.65 96 64 96H138.7L149.1 64.82C155.6 45.22 173.9 32 194.6 32H194.6zM256 384C309 384 352 341 352 288C352 234.1 309 192 256 192C202.1 192 160 234.1 160 288C160 341 202.1 384 256 384z"/></svg></span>
							<c:if test="${tradeInfo == null }">
								<span class="count" id="count"><b>0</b> /5</span>
							</c:if>
							<c:if test="${tradeInfo != null }">
								<span class="count" id="count"><b>${tradeInfo.fileCnt }</b> /5</span>
							</c:if>	
						</a>
	
						<ul class="file_wrap">
							<c:forEach var="file" items="${fileList }">
									<li id="file_id_${file.fileIdx }" class="filebox">
									<!--
										<span class="file_name">${fn:split(file.fileUsrFile,'|')[0]}</span>
									-->
										<span><img src="/_img/_img/cont/photo_thum.png" width="65" height="65" style="background:url(/upload/trade/${file.fileSrvFile })no-repeat 50% 50% / cover"></span>
										<a href="javascript:delfile(${file.fileIdx });" class="close"></a>
										<input type="hidden" name="fileIdxArr" value="${file.fileIdx }"/>
						 				<input type="hidden"  name="delArr" value="N" id="${file.fileIdx }_del"/>
									</li>	
							</c:forEach>
							</td>									
							
						</ul>
					</div>

				</form>
				<p class="btn mt25">
					<c:if test="${tradeInfo == null }">
						<a href="#" onclick="javascript:submitForm('reg');" class="btn">등록</a>
					</c:if>
					<c:if test="${tradeInfo != null }">
						<a href="#" onclick="javascript:submitForm('mod');" class="btn">저장</a>
					</c:if>
				</p>			

			</div>
			

			
			
			<%@include file="../_inc/bottom_menu.jsp" %>
		</div>
	<!-- CONTENTS END -->

	<!-- POPUP BEGIN -->
	<!-- 작성완료 선택 시 노출 -->
	<div class="layer" id="ok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="okPop">
			<div class="pop_cont text">
				<p class="tit c">게시물 작성 완료</p>
				<p class="mb20 c">게시물이 등록되었습니다.</p>
				<p class="btn"><a href="/trade/tradeList.do">확인</a></p>
			</div> 
		</div>
	</div>
		<div class="layer" id="faild_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="faildPop">
			<div class="pop_cont text" id="one">
				<p class="mb20 c">제목을 입력해 주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
			<div class="pop_cont text" id="two">
				<p class="mb20 c">가격을 입력해 주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
			<div class="pop_cont text" id="three">
				<p class="mb20 c">가격을 숫자로 입력해주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
			<div class="pop_cont text" id="four">
				<p class="mb20 c">내용을 입력해 주세요.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
		</div>
	</div>
	
	<div class="layer" id="load_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="loadPop">
			<div class="pop_cont text">
				<p class="mb20 c">등록중입니다 잠시만 기다려주세요.</p>
				<p class="btn"><a href="javascript:return false;">확인</a></p>
			</div> 
		</div>
	</div>	
	
	
	
	<!-- POPUP END -->

</div>
<!-- //wrap -->

</body>
</html>