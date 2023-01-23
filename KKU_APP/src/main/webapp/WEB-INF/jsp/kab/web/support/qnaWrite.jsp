 <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="page_num_depth_01" value="5"/>
<c:set var="page_num_depth_02" value="2"/>

<c:set var="page_num_depth_01" value="5" />
<c:set var="page_num_depth_02" value="2" />

<html lang="utf-8">
<head>
	<%@include file="../_inc/tit.jsp" %>
	<script type="text/javascript">
		function submit(mode){
			if(mode=="ins"){
				if(frmChk()){
					$("#frm").attr("action","/web/support/qnaInsert.do?bbsDiv=qna");
					$("#frm").submit();
				}	
			}
			
			function frmChk(){
				var isPass = true;
				if($("#bbsTitle").val()==""){
					alert("제목을 입력해주세요.");
					$("#bbsTitle").focus();
					isPass = false;
				}else if( $('#qnaType').val()==""){
					alert("구분을 선택해주세요.");
					$("#qnaType").focus();
					isPass = false;
				} else {
					if($("#bbsCont").val()==""){
						alert("내용을 입력해주세요.");
						$("#bbsCont").focus();
						isPass = false;
					}
				}
				return isPass;	
			}
			
		}
	
	
		/* 30MB-30720 */
		var cnt = 0;
		var fileLen = 0;
		var maxSize = 30720;
		var nowSize = 0;
		
		$(function(){
			if('${resultVO.noticeType}' == ''){
				$('#normalNoti').attr("checked","checked");
			}
			$('input[id=fileUp]').attr('id','fileUp'+cnt);
			//파일 선택
			$('#btn-upload').on("click", function(){
				$("#fileUp"+cnt).click();
			});
		});//document.ready
		
		//파일 정보 추가
		$(document).on("change", ".fileUp", function(){
			var fileObj = document.getElementById("fileUp"+cnt).files[0];
			fileLen = $("#fileList").children('input').length;
			nowSize += (fileObj.size/1024);
			if(fileFormChk(fileObj)){
				fileChk(fileObj);
			}
			
		});
		
		//파일 형식 체크
		function fileFormChk(file){
			var fileName = file.name;
			var splitFileName = fileName.split('.');
			var regex = /^(jpg|jpeg|png|gif|bmp|pdf|hwp|doc|docx|ppt|pptx|xls|xlsx)$/;
			if(splitFileName[splitFileName.length-1].match(regex)){
				return true;
			} else {
				alert("지원하지 않는 형식의 파일입니다.");
				return false;
			}
		}
		
		
		//파일 정보 설정 
		function fileChk(file){
			if(nowSize >= maxSize){
				nowSize -= (file.size/1024);
				initFile();
				alert("파일 업로드는 30MB까지 가능합니다.");
			} else if ( fileLen >= 4){
				initFile();
				alert("파일은 최대 3개까지 업로드 가능합니다.");
			} else {
				var str = '<p class="file_note" id="fileUp'+cnt+'"><span id="fileUp'+cnt+'">'+file.name+'<a class="lg_del" href="javascript:void(0);" id="delFile"></a></span></p>'
				$("#fileList").append(str);
				cnt ++;
				str = '<input class="file fileUp" type="file" id="fileUp'+cnt+'" name="fileUp'+cnt+'" style="display: none;">';
				$("#fileList").append(str);
			}
		}
		//파일 삭제
		$(document).on("click","[id=delFile]", function(){
			if(confirm("정말 파일을 삭제하시겠습니까?")){
				var id = $(this).closest('p').attr("id");
				$("input[id="+id+"]").remove();
				//삭제
				$(this).closest('p').remove();
			}
		});
		
		function initFile(){
			//input[type=file] 초기화
			var agent = navigator.userAgent.toLowerCase();
			if ((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) { // ie 일때  
				$("#fileUp"+cnt).replaceWith( $("#fileUp"+cnt).clone(true) ); 
			} else { // other browser 일때
				$("#fileUp"+cnt).val(""); 
			}
		}
	</script>
</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp" %>
		<%@include file="../_inc/smn05.jsp" %>


		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
				<h2>Q&A</h2>
				<ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png"
						alt="홈페이지 메인으로"></li>
					<li>고객센터</li>
					<li>Q&A</li>
				</ol>
			</div>
			<form name="frm" id="frm" autocomplete="off" method="post" encType="multipart/form-data">
				<table class="write_tt">
					<colgroup>
						<col width="150px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text" id="bbsTitle" name="bbsTitle" placeholder="제목을 입력하세요."></td>
						</tr>
					</tbody>
				</table>
				<table class="write_editor">
					<colgroup>
						<col width="150px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>구분</th>
							<td>
								<select name="qnaType"  style="width:12%" id="qnaType">
									<option value="">선택</option>
									<c:forEach var="qnaType" items="${qnaType}">
										<option value="${qnaType.cdVal2}">${qnaType.cdName2}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="write_editor">
					<colgroup>
						<col width="150px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>내용</th>
							<td><textarea cols="30" rows="12"
									style="width: 100%; box-sizing: border-box;"
									placeholder="내용을 입력해주세요." id="bbsCont" name="bbsCont"></textarea></td>
						</tr>
					</tbody>
				</table>
				<table class="write_editor">
					<colgroup>
						<col width="150px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>첨부파일</th>
							<td colspan="3">
								<a href="javascript:void(0);" class="file_up" id="btn-upload">파일검색</a>
								<input class="file" type="text" id="fileName" name="fileName" value="선택된 파일 없음" readonly="readonly">
								 
								
								<div id="fileList">
									<input class="file fileUp" type="file" id="fileUp" name="fileUp" style="display: none;"> 
									<c:if test="${fn:length(fileList) > 0}">
										<c:forEach var="fileList" items="${fileList}" varStatus="status">
											<input type="hidden" name="fileIdx" value="${fileList.filIdx}" style="display: none;">
											<p class="file_note" id="fileUp${status.index}"><span id="fileUp${status.index}">${fileList.filUsrName}<a class="lg_del" href="javascript:ajaxDelFile(${fileList.filIdx},'${bbsDiv}');"></a></span></p>
										</c:forEach>
									</c:if>
								</div>
								<p class="file_note">* 첨부파일은 <span class="red">3개</span> 까지만 가능합니다.(용량 30MB 제한)</p>
							</td>
						</tr>
					</tbody>
				</table>
	
				<p class="btn_area">
					<a href="javascript:submit('ins');" class="btn_submit">등록</a> 
					<a href="/web/support/boardList.do?bbsDiv=qna" class="btn_list">목록</a>
				</p>
			</form>
		</div>
		<%@include file="../_inc/footer.jsp" %>
	</div>
</body>

</html>