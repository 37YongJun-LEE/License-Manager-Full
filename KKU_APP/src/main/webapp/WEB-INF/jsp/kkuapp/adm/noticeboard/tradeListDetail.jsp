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
			<li>게시판 관리</li>
			<li>중고거래 게시물관리</li>
			<li>중고거래 게시물 수정</li>
		</ol>
		<h2>중고거래 게시물 수정</h2>
	</jsp:attribute>

	<jsp:attribute name="body_area">
		<table class="table02" summary="관리자 기본정보 등록">
						<caption>관리자 기본정보 등록</caption>
						<colgroup><col width="8%"><col width="20%"><col width="12%"><col width="70%"></colgroup>
						<tbody>
							<tr>
								<th scope="row">NO<span class="star">*</span></th>
								<td>
									<input style="width:100%" id="trdIdx" name="trdIdx" type="text" value="${tradeInfo.trdIdx }" readonly="readonly"/>    
									<p id="dupUsrIdYn" class="pass"> </p>
								</td>
								
								<th scope="row">제목<span class="star">*</span></th>
								<td>
									<input style="width:100%" type="text" id="trdTitle" name="trdTitle" value="${tradeInfo.trdTitle }" />
									<label class="f_0" for="">제목 입력</label>
								</td>
							</tr>
							
							<tr>
								<th scope="row">작성자<span class="star">*</span></th>
								<td>
									<input style="width:100%"type="text" id="trdWriter" name="trdWriter" value="${tradeInfo.trdWriter}" >
									<label class="f_0" for="">입력</label>
								</td>
								<th scope="row">작성일<span class="star">*</span></th>
								<td>
									<input style="width:180px"type="text" id="trdWritedate" name="trdWritedate" value="${tradeInfo.trdWritedate}" readonly="readonly" >
									
								</td>
								
							</tr>
							<tr>
								<th scope="col">상태<span class="star">*</span></th>
								<td class="ra_base" colspan="3" >
									<input type="radio" id="tradeStatusY" name="tradeStatusYN" value="1" checked="checked">
									<label for="tradeStatusY" class="mr15">사용</label>
									<input type="radio" id="tradeStatusN" name="tradeStatusYN" value="0"  <c:if test="${tradeInfo.trdStatus eq 0 }">checked</c:if>>
									<label for="tradeStatusN" class="mr15">미사용</label>
									
								</td>
							</tr>
							<tr>
							
								<th scope="row">내용<span class="star">*</span></th>
								<td colspan="3" >
									 <textarea id="trdContent" name="trdContent"  style="width:100%;height:890px;">${tradeInfo.trdContent }</textarea>
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
					
					<a href="/admin/tradeList.do" class="l btn_list">목록</a>
					
					<a href="javascript:del();" class="btn_del">삭제</a>
					<a href="javascript:submit();" class="btn_submit">저장</a>
					
				</p>
	</jsp:attribute>

	<jsp:attribute name="script_area">
		<script type="text/javascript" src="/_js/adm/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		<script type="text/javascript">
			var oEditors = []
			nhn.husky.EZCreator.createInIFrame({
				oAppRef:oEditors,
				elPlaceHolder:"trdContent",
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
		function submit(){
			oEditors.getById["trdContent"].exec("UPDATE_CONTENTS_FIELD",[])

			var title = $("#trdTitle").val();
			var content = document.getElementById("trdContent").value;
			var writer = $("#trdWriter").val();
			var writedate = $("#trdWritedate").val();
			var status = $('input[name=trdStatusYN]:checked').val();
			$.ajax({
				type:"POST",
				data:{
					trdIdx: "${tradeInfo.trdIdx}",
					trdTitle: title,
					trdWriter: writer,
					trdWritedate: writedate,
					trdStatus: status,
					trdContent: content
				},
				url:"/admin/tradeListModifyAction.do",
				dataType:"text",
				success: function(data){				
					if(data=="success"){
						alert("저장되었습니다.");
						location.href="/admin/tradeList.do";
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
		function del(){
			$.ajax({
				type:"POST",
				data:{
					boardIdx: "${tradeInfo.trdIdx}"
				},
				url:"/admin/tradeListDeleteAction.do",
				dataType:"text",
				success: function(data){				
					if(data=="success"){
						alert("삭제되었습니다.");
						location.href="/admin/tradeList.do";
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

