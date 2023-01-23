 <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="utf-8">
	<head>
		<%@include file="../_inc/tit.jsp" %>
		<script type="text/javascript">
			$(function(){
				//비밀번호찾기일 경우
				if('${type}'=='P'){
					$('#Id').removeClass("on");
					$('#Id').children("a").removeClass("selected");
					$('#Pw').addClass("on");
					$('#Pw').children("a").addClass("selected");
				}
				
				$(".tab_cont:not("+$(".tab_menu li a.selected").attr("href")+")").hide()
				
				$(".tab_menu li").click(function(){/* mouseover로 바꾸면 오버탭시 아래변경됨 */
				  $(".tab_menu li").removeClass("on");
					$(this).addClass("on");
					$(".tab_cont").hide();
					$($(this).children('a').attr("href")).show();
					return false;
				});	 
				
				/*auto focus*/
			    $('.inputNext').keyup(function(){
					var charLimit = $(this).attr('maxlength');
					if(this.value.length >= charLimit){
						$(this).next().next().focus();
						return false;
					}
				});
				
				
			    //이메일셀렉터 
				$("#personEmail3").change(function() {
					$("#personEmail2").attr("readonly", $(this).val() != "");
					$("#personEmail2").val($(this).val());
					$("#personEmail2").focus();
				});
				
			});
			
			function findInfo(mod){
				if(mod == 'Id'){
					if(frmChk(mod)){
						$('#frmId').attr("action","/web/findIdAction.do");
						$('#frmId').submit();
					}
				} 
				else if(mod=="Pw"){
					if(frmChk(mod)){
						$('#frmPw').attr("action","/web/findPwAction.do");
						$('#frmPw').submit();
					}
				}
				
			}
			
			function frmChk(mod){
				var isPass = true;
				
				if(mod=="Id"){
					$(".find_id input[required]").each(function() {
						if(compactTrim($(this).val()) == "") {
							$(this).focus();
							alert("필수항목입니다. " + $(this).data("msg") + " 입력해주세요.");
							return isPass = false;
						}
					});
					
					if(isPass){
						if($("#bsnsNo1").val().length != 3 || $("#bsnsNo2").val().length != 2 || $("#bsnsNo3").val().length != 5){
							$("#bsnsNo").focus();
							alert("사업자등록번호를 확인해주세요.");
							return isPass = false;
						}
					}
					
					$("#bsnsNo").val($("#bsnsNo1").val() +"-"+ $("#bsnsNo2").val() +"-"+$("#bsnsNo3").val());
				} else if ( mod == "Pw"){
					$(".find_pw input[required]").each(function() {
						if(compactTrim($(this).val()) == "") {
							$(this).focus();
							alert("필수항목입니다. " + $(this).data("msg") + " 입력해주세요.");
							return isPass = false;
						}
					});
					if(isPass){
						//사업자등록번호 필수체크
						if($("#pwBsnsNo1").val().length != 3 || $("#pwBsnsNo2").val().length != 2 || $("#pwBsnsNo3").val().length != 5){
							$("#pwBsnsNo").focus();
							alert("사업자등록번호를 확인해주세요.");
							return isPass = false;
						}
						$("#pwBsnsNo").val($("#pwBsnsNo1").val() +"-"+ $("#pwBsnsNo2").val() +"-"+$("#pwBsnsNo3").val());
						
						//이메일 필수 체크
						if(!checkEmail( $("#personEmail1").val() + "@" + $("#personEmail2").val() )){
							$("#personEmail").focus();
							alert("담당자 이메일을 확인해주세요.");
							return isPass = false;	
						}
						$("#personEmail").val($('#personEmail1').val() + '@' + $('#personEmail2').val());
					}
				}
				function compactTrim(str) {
					return str.replace( /(\s*)/g, "" );
				}
				return isPass;
			}
		</script>
	</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp" %>
		<p class="top_line"></p>
		<div class="cont_view">
			<div class="cont_top">
				 <h2>아이디/비밀번호 찾기</h2>
				 <ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>아이디/비밀번호 찾기</li>
				</ol>
			</div> 
			
			<ul class="tab_menu">
				<li class="on" id="Id"><a href="#findId" class="selected">아이디 찾기</a></li>
				<li id="Pw"><a href="#findPw">비밀번호 찾기</a></li>
			</ul>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////ID -->
			<div class="user_box btn" >
				<div class="find_id tab_cont selected" id="findId">
					<form id="frmId" method="post">
						<p class="user_t01">아이디 찾기</p>
						<p>회원가입 시 등록한 정보를 입력해 주세요.</p>
						<div class="find_box">
							<p>
								<label class="user_label">인증기관명</label>
								<input style="width:250px;" type="text" name="orgNmKr" id="orgNmKr" data-msg="인증기관명을" required>
							</p>
							<p class="mt10">
								<input type="hidden" name="bsnsNo" id="bsnsNo">
								<label class="user_label">사업자 등록번호</label>
								<input class="c inputNext" style="width:70px" type="text" id="bsnsNo1" maxlength="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" data-msg="사업자등록번호를" required>
								<span class="v_middle">-</span> 
								<input class="c inputNext" style="width:70px" type="text" id="bsnsNo2" maxlength="2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" data-msg="사업자등록번호를" required>
								<span class="v_middle">-</span> 
								<input class="c inputNext" style="width:85px" type="text" id="bsnsNo3" maxlength="5" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" data-msg="사업자등록번호를" required>
							</p>
						</div>
						<p class="btn_area c">
							<a href="javascript:findInfo('Id');" class="btn_submit">아이디 찾기</a>
						</p>
						
					</form>
				</div>
				
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////PW -->

				<div class="find_pw tab_cont" id="findPw">
					<p class="user_t01">비밀번호 찾기</p>
					<p>회원가입 시 등록한 정보를 입력해 주세요.</p>
					<form id="frmPw" method="post">
						<div class="find_box">
							<p>
								<label class="user_label">아이디</label>
								<input style="width:445px;" type="text" name="orgId" value="" data-msg="인증기관 아이디를" required>
							</p>
							<p class="mt10">
								<label class="user_label">인증기관명</label>
								<input style="width:445px;" type="text" name="orgNmKr" value="" data-msg="인증기관명을" required>
							</p>
							<p class="mt10">
								<input type="hidden" name="bsnsNo" id="pwBsnsNo">
								<label class="user_label">사업자 등록번호</label>
								<input class="c" style="width:130px" type="text" id="pwBsnsNo1" value="">
								<span class="v_middle">-</span> 
								<input class="c" style="width:130px" type="text" id="pwBsnsNo2" value="">
								<span class="v_middle">-</span> 
								<label class="f_0" >사업자 등록번호 입력(가운데번호)</label>
								<input class="c" style="width:160px" type="text" id="pwBsnsNo3" value="">
								<label class="f_0" >사업자 등록번호 입력(끝번호)</label>
							</p>
							<p class="mt10">
								<input type="hidden" name="personEmail" id="personEmail">
								<label class="user_label">담당자 이메일</label>
								<input class="w150" type="text" id="personEmail1" value="">
								<span class="v_middle">@</span>
								<input class="w150" type="text" id="personEmail2" value="">
								<label class="f_0">이메일 주소 입력</label>
								<select style="width:120px;" id="personEmail3">
									<option value="">직접입력</option>
									<c:forEach var="emailList" items="${emailList}">
										<option value="${emailList.cdVal2}">
											${emailList.cdName2}
										</option>
									</c:forEach>
								</select>
								<span class="f_0">이메일 주소 선택</span>
							</p>
						</div>
						<p class="btn_area c">
							<a href="javascript:findInfo('Pw');" class="btn_submit">비밀번호 찾기</a>
						</p>
					</form>
				</div>
			</div><!-- user_box 끝 -->
		</div><!-- cont_view 끝 -->
	</div>
	<%@include file="../_inc/footer.jsp" %>

</body>

</html>