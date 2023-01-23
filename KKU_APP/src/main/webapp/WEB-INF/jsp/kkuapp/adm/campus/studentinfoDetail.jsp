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
			<li>학과 정보 관리</li>
			<li>학과 정보 관리</li>
			<li>학과 정보 수정</li>
		</ol>
		<h2>학과 정보 관리</h2>
	</jsp:attribute>

	<jsp:attribute name="body_area">
		<table class="table02" summary="관리자 기본정보 등록">
						<caption>관리자 기본정보 등록</caption>
						<colgroup><col width="8%"><col width="20%"><col width="12%"><col width="70%"></colgroup>
						<tbody>
							<tr>
								<th scope="row">NO<span class="star">*</span></th>
								<td>
									
									
									<!-- <a class="sm_line" id="chkDupUsrIdBtn" href="javascript:void(0);">중복확인</a> -->
									<input style="width:100%" id="mnoticeNum" name="mnoticeNum" type="text" value="${studentInfo.mnoticeNum }" readonly="readonly" />    
									<p id="dupUsrIdYn" class="pass"> </p>
									
								</td>
								
								<th scope="row">제목<span class="star">*</span></th>
								<td>
									<input style="width:100%" type="text" id="mnoticeTitle" name="mnoticeTitle" value="${studentInfo.mnoticeTitle }" />
									<label class="f_0" for="">제목 입력</label>
								</td>
							</tr>
							
							<tr>
								<th scope="row">작성자<span class="star">*</span></th>
								<td>
									<input style="width:100%"type="text" id="mnoticeName" name="mnoticeName" value="${studentInfo.mnoticeName}" >
									<label class="f_0" for="">작성자입력</label>
								</td>
								<th scope="row">학과<span class="star">*</span></th>
								<td>
									<input style="width:110px"type="text" id="mnoticeCategory" name="mnoticeCategory" value="${studentInfo.mnoticeCategory}" readonly="readonly" >
									
								</td>
								
							</tr>
							<tr>
								<th scope="row">작성일<span class="star">*</span></th>
								<td>
									<input style="width:100%"type="text" id="mnoticeDate" name="mnoticeDate" value="${studentInfo.mnoticeDate}"  >
									
								</td>
								
								<th scope="row">업데이트 날짜<span class="star">*</span></th>
								<td>
									<input style="width:150px"type="text" id="mnoticeUpdated" name="mnoticeUpdated" value="${studentInfo.mnoticeUpdated}" readonly="readonly" >
									
								</td>
							</tr>
							<tr>
							
								<th scope="row">내용<span class="star">*</span></th>
								<td colspan="3" >
								
									 <textarea id="mnoticeContent" name="mnoticeContent"  style="width:100%;height:890px;">${studentInfo.kc }</textarea>
									 
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
					<a href="/admin/studentinfo.do" class="l btn_list">목록</a>
						
					
					<a href="javascript:submit();" class="btn_submit">저장</a>
				</p>
	</jsp:attribute>

	<jsp:attribute name="script_area">
		<script type="text/javascript" src="/_js/adm/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		<script type="text/javascript">
			var oEditors = []
			nhn.husky.EZCreator.createInIFrame({
				oAppRef:oEditors,
				elPlaceHolder:"mnoticeContent",
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
			oEditors.getById["mnoticeContent"].exec("UPDATE_CONTENTS_FIELD",[])
			var num = $("#mnoticeNum").val();
			var title = $("#mnoticeTitle").val();
			var content = document.getElementById("mnoticeContent").value;
			var category = $("#mnoticeCategory").val();
			var name = $("#mnoticeName").val();
			var date = $("#mnoticeDate").val();
			console.log(content);
			$.ajax({
				type:"POST",
				data:{
					mnoticeIdx: "${studentInfo.mnoticeIdx}",
					mnoticeNum: num,
					mnoticeTitle: title,
					mnoticeContent: content,
					mnoticeCategory: category,
					mnoticeName: name,
					mnoticeDate: date,
					mnoticeUpdated: "${studentInfo.mnoticeUpdated}"
				},
				url:"/admin/studentinfoModifyAction.do",
				dataType:"text",
				success: function(data){				
					if(data=="success"){
						alert("저장되었습니다.");
						location.href="/admin/studentinfo.do";
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

