<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:default>
	<jsp:attribute name="head_area">
		<!-- 헤더 링크 -->
	</jsp:attribute>

  	<jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>자격증 관리</li>
			<li>자격증 관리</li>
			<li>자격증게시판 게시물 수정</li>
		</ol>
		<h2>자격증게시판 게시물 수정</h2>
	</jsp:attribute>

	<jsp:attribute name="body_area">
		<table class="table02" summary="관리자 기본정보 등록">
						<caption>관리자 기본정보 등록</caption>
						<colgroup><col width="8%"><col width="20%"><col width="12%"><col width="70%"></colgroup>
						<tbody>
							<tr>
								<th scope="row">NO<span class="star">*</span></th>
								<td>
									<input style="width:100%" id="boardIdx" name="boardIdx" type="text" value="${boardInfo.boardIdx }" readonly="readonly"/>    
									<p id="dupUsrIdYn" class="pass"> </p>
								</td>
								
								<th scope="row">제목<span class="star">*</span></th>
								<td>
									<input style="width:100%" type="text" id="boardTitle" name="boardTitle" value="${boardInfo.boardTitle }" />
									<label class="f_0" for="">제목 입력</label>
								</td>
							</tr>
							
							<tr>
								<th scope="row">작성자<span class="star">*</span></th>
								<td>
									<input style="width:100%"type="text" id="boardWriter" name="boardWriter" value="${boardInfo.boardWriter}" >
									<label class="f_0" for="">입력</label>
								</td>
								<th scope="row">작성일<span class="star">*</span></th>
								<td>
									<input style="width:180px"type="text" id="boardWritedate" name="boardWritedate" value="${boardInfo.boardWritedate}" readonly="readonly" >
									
								</td>
								
							</tr>
							<tr>
								<th scope="col">상태<span class="star">*</span></th>
								<td class="ra_base" colspan="3" >
									<input type="radio" id="boardStatusY" name="boardStatusYN" value="1" checked="checked">
									<label for="boardStatusY" class="mr15">사용</label>
									<input type="radio" id="boardStatusN" name="boardStatusYN" value="0"  <c:if test="${boardInfo.boardStatus eq 0 }">checked</c:if>>
									<label for="boardStatusN" class="mr15">미사용</label>
									
								</td>
							</tr>
							<tr>
							
								<th scope="row">내용<span class="star">*</span></th>
								<td colspan="3" >
									 <textarea id="boardContent" name="boardContent"  style="width:100%;height:890px;">${boardInfo.boardContent }</textarea>
								</td>
								
							</tr>
							<%-- <tr>
								<th scope="row">첨부된 파일<span class="star">*</span></th>
								<td>
								
									<textarea style="width:1187px;height:50px;resize: none;"  type="text" id="noticeFiles" name="noticeFiles" value="${campusInfo.noticeFiles}"
									  ></textarea>
								</td>
								
							</tr> --%>
						</tbody>
					</table>
					<p class="btn_area max_width">
					
					<a href="javascript:history.back();" class="l btn_list">목록</a>
					
					<a href="javascript:submit(1);" class="btn_del">삭제</a>
					<a href="javascript:submit(0);" class="btn_submit">저장</a>
					
				</p>
	</jsp:attribute>

	<jsp:attribute name="script_area">
		<script type="text/javascript" src="/_js/adm/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		<script type="text/javascript">
			var oEditors = []
			nhn.husky.EZCreator.createInIFrame({
				oAppRef:oEditors,
				elPlaceHolder:"boardContent",
				sSkinURI:"/_js/adm/smarteditor2/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true,
					bUseVerticalResizer : false,
					fOnBeforeUnload : function(){}
				},
				
				
				fCreator:"createSEditor2"
			});
		
		
		</script>
		<script>
		function submit(index){
			if(index != 1) {
				oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD",[])
	
				var title = $("#boardTitle").val();
				var content = document.getElementById("boardContent").value;
				var writer = $("#boardWriter").val();
				var writedate = $("#boardWritedate").val();
				var status = $('input[name=boardStatusYN]:checked').val();
				console.log(title, content, writer, writedate, status);
				$.ajax({
					type:"POST",
					data:{
						boardIdx: "${boardInfo.boardIdx}",
						boardTitle: title,
						boardWriter: writer,
						boardWritedate: writedate,
						boardContent: content
					},
					url:"/admin/licenseBoardAction.do",
					dataType:"text",
					success: function(data){				
						if(data=="success"){
							alert("저장되었습니다.");
							location.href="/admin/licenseBoard.do?subjectCd="+${boardInfo.subjectCd };
						}
						else{
							alert("오류발생");
						}
					},
					error: function(){
						alert("ajax is not working");
					}
					
					
				}); 
			} else {
				$.ajax({
					type:"POST",
					data:{
						boardIdx: "${boardInfo.boardIdx}",
						delYn: "Y"
					},
					url:"/admin/licenseBoardAction.do",
					dataType:"text",
					success: function(data){				
						if(data=="success"){
							alert("저장되었습니다.");
							location.href="/admin/licenseBoard.do?subjectCd="+${boardInfo.subjectCd };
						}
						else{
							alert("오류발생");
						}
					},
					error: function(){
						alert("ajax is not working");
					}
					
					
				}); 
			}
		}
		function del(){
			$.ajax({
				type:"POST",
				data:{
					boardIdx: "${boardInfo.boardIdx}"
				},
				url:"/admin/freenoticeDeleteAction.do",
				dataType:"text",
				success: function(data){				
					if(data=="success"){
						alert("삭제되었습니다.");
						location.href="/admin/freenoticeList.do";
					}
					else{
						alert("?");
					}
				},
				error: function(){
					alert("ajax is not working");
				}
				
				
			});
		}
		</script> 
	</jsp:attribute>
</t:default>

