<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<t:default>
	<jsp:attribute name="head_area">
	</jsp:attribute>

    <jsp:attribute name="meta_area">
    	<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>회원관리</li>
			<li>회원관리</li>
			<li>회원 정보 수정</li>
		</ol>
		<h2>회원관리</h2>
	</jsp:attribute>

	<jsp:attribute name="body_area">
		<form name="frm" id="frm" autocomplete="off" method="post" onsubmit="return isSubmit();">
			<input type="hidden" id="usrIdx" name="usrIdx" value="${modifyUserVO.usrIdx }" />
			
			<!-- 이메일, 닉네임, 비밀번호, 이름, 단과대, 학과, 학번-->
			<table class="table02" summary="관리자 기본정보 등록">
				<caption>관리자 기본정보 등록</caption>
				<colgroup><col width="12%"><col width="38%"><col width="12%"><col width="38%"></colgroup>
				<tbody>
					<tr>
						<th scope="row">사용자 아이디<span class="star">*</span></th>
						<td>
							
							
							<!-- <a class="sm_line" id="chkDupUsrIdBtn" href="javascript:void(0);">중복확인</a> -->
							<input style="width:180px" id="usrEmail" name="usrEmail" type="text" value="${modifyUserVO.usrEmail }" />    
							<p id="dupUsrIdYn" class="pass"> </p>
							
						</td>
						
						<th scope="row">이름<span class="star">*</span></th>
						<td>
							<input style="width:180px" type="text" id="usrName" name="usrName" value="${modifyUserVO.usrName }" />
							<label class="f_0" for="">이름 입력</label>
						</td>
					</tr>
	
					<tr>
						<th scope="row">비밀번호<span class="star">*</span></th>
						<td>
							<input type="password" id="usrPassword" name="usrPassword" value="" class="w300">
							<label class="f_0" for="">비밀번호 입력</label>
						</td>
						<th scope="row">비밀번호 확인<span class="star">*</span></th>
						<td>
							<input type="password" id="usrPwChk" placeholder="" class="w300">
							<label class="f_0" for=""></label>
						</td>
					</tr>
					<tr>	
						<th scope="row">소속 단과대<span class="star">*</span></th>
						<td>
							<input style="width:180px" type="text" id="usrDepartment" name="usrDepartment" value="${modifyUserVO.usrDepartment }">
						</td>
						<th scope="row">학과<span class="star">*</span></th>
						<td >
							<input style="width:180px" type="text" id="usrMajor" name="usrMajor" value="${modifyUserVO.usrMajor }">
						</td>
					</tr>
					
					<tr>	
						<th scope="row">닉네임<span class="star">*</span></th>
						<td>
							<input type="text" class="w300" id="usrNickname" name="usrNickname" value="${modifyUserVO.usrNickname }">
							
						</td>
						<th scope="col">닉네임 변경일<span class="star">*</span></th>
						<td >
						
							<input class="c" class="w300" type="text" id="nickChangedate" value="${modifyUserVO.nickChangedate }">
							
						</td>
					</tr>
					<tr>
						<th scope="col">닉네임 변경일<span class="star">*</span></th>
						<td>
							<select name="usrRank">
								<option value="1" <c:if test="${modifyUserVO.usrRank eq 1} ">selected="selected"</c:if>>일반 유저</option>
								<option value="4" <c:if test="${modifyUserVO.usrRank eq 4} ">selected="selected"</c:if>>관리자</option>
							</select>
						</td>
						<th scope="col">사용여부<span class="star">*</span></th>
						<td class="ra_base">
							<input type="radio" id="usrDeletey" name="usrDeleteyn" value="N" checked="checked">
							<label for="usrDeletey" class="mr15">사용</label>
							<input type="radio" id="usrDeleten" name="usrDeleteyn" value="Y" <c:if test="${modifyUserVO.usrDeleteyn eq 'Y' }">checked</c:if>>
							<label for="usrDeleten" class="mr15">미사용</label>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		</div>
		<p class="btn_area max_width">
			<a href="/admin/${destUrl }.do" class="l btn_list">목록</a>
				
			
			<a href="javascript:submit('del');" class="btn_del">삭제</a>
			<a class="btn_submit" onclick="save()">저장</a>
			
		</p>
	</jsp:attribute>

	<jsp:attribute name="script_area">
<script>

var usrIdx = '${modifyUserVO.usrIdx }';
var usrPwChkflag = false;
$(document).ready(function(){
	$('#usrEmail').attr("readonly",true);
	$('#nickChangedate').attr("readonly",true);
	$('#usrPassword').attr("placeholder","비밀번호 변경시에만 입력해주세요.");
	$('#usrPwChk').attr("placeholder","비밀번호 변경시에만 입력해주세요.");
})

function save(){
	if ($("#usrPassword").val().length > 0 || $("#usrPwChk").val().length > 0) {
		if ($("#usrPassword").val() != $("#usrPwChk").val()) {
			$("#usrPwChk").focus();
			alert("새 비밀번호가 서로 일치하지 않습니다.");
			return false;
		}
	}
	var params = jQuery("#frm").serialize();
	$.ajax({
		type : "POST",
		url : "/admin/usrModifyAction.do",
		data : params,
		success : function(tmp) {
				if(tmp == "success"){
					alert("성공");
				}
				else{
					alert(tmp);
				}
				
			} 
		
	});
}
</script>
	</jsp:attribute>
</t:default>