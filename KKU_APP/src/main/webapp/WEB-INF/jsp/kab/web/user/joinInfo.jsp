 <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="utf-8">
	<head>
		<%@include file="../_inc/tit.jsp" %>
		<script>
			//주소 동적 할당 ID값 IDX
			if('${resultVO.orgIdx}' == ''){
				var cnt = 0;
			}else{
				var cnt = '${locCnt-1}';
			}
			
			$(document).ready(function(){
				/*auto focus*/
			    $('.inputNext').keyup(function(){
					var charLimit = $(this).attr('maxlength');
					if(this.value.length >= charLimit){
						$(this).next().next('.inputNext').focus();
						return false;
					}
				});
				
				//이메일 셀렉터
			    $("#personEmail3").change(function() {
					$("#personEmail2").attr("readonly", $(this).val() != "");
					$("#personEmail2").val($(this).val());
					$("#personEmail2").focus();
				});
			    $("#email3").change(function() {
					$("#email2").attr("readonly", $(this).val() != "");
					$("#email2").val($(this).val());
					$("#email2").focus();
				});
				
				/*필수체크 해제*/
				if('${orgSessionVo.orgIdx}'!=null){
					$('input[type=password]').prop('required',false);
				}
				
			    /*달력 사용*/
				$.datepicker.setDefaults({
				        prevText: '이전달',
				        nextText: '다음달',
				        currentText: '오늘',
				        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				        dayNames: ['일','월','화','수','목','금','토'],
				        dayNamesShort: ['일','월','화','수','목','금','토'],
				        dayNamesMin: ['일','월','화','수','목','금','토'],
				        dateFormat: 'yy-mm-dd',
				        changeYear: true,
				        changeMonth: true,
				        firstDay: 0,
				        showMonthAfterYear: true,
				        yearSuffix: '년',
				    });
			    $('#foundedDate').datepicker({
			        changeYear: true,
			        yearRange: "-100:+0",
			    });
			    
			  //기관구분 값 셋팅
				$("input[name='orgType1']").change(function(){
					$("#orgType").val($(this).val());
					$(this).attr("checked","checked");
				});
				
			}); // document.ready
			
			//돈 3자리마다 ','
			$(document).on("change",'#orgCapital',function(){
				var num = $('#orgCapital').val();
				num = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$('#orgCapital').val(num);
			});
			$(document).on("change",'#orgTouch',function(){
				var num = $('#orgTouch').val();
				num = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$('#orgTouch').val(num);
			});
			$(document).on("change",'#orgCertTouch',function(){
				var num = $('#orgCertTouch').val();
				num = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$('#orgCertTouch').val(num);
			});
			
			function fn_submit(mode) {
		    	
	 			if(isSubmit()) {
					if(mode == 'ins') {
						$("#frm").attr("action", "/web/joinInfoInsert.do");
						$("#frm").submit();
					} else if(mode == 'mod') {
						$("#frm").attr("action", "/web/joinInfoUpdate.do?orgIdx=${resultVO.orgIdx}");
						$("#frm").submit();
					}
	 			}
	 			
				
			}
			    
			function isSubmit() {
				if($("#personEmail1").val()!="" ||$("#personEmail2").val()!=""){
					$("#personEmail").val($("#personEmail1").val()+"@"+$("#personEmail2").val());	
				}
				if($("#email1").val()!="" ||$("#email2").val()!=""){
					$("#email").val($("#email1").val()+"@"+$("#email2").val());	
				}
				
				$("#bsnsNo").val($("#bsnsNo1").val() + "-" + $("#bsnsNo2").val() + "-" + $("#bsnsNo3").val());
				$("#telNo").val($("#telNo1").val()+"-"+$("#telNo2").val()+"-"+$("#telNo3").val());
				$("#personTelNo").val($("#personTelNo1").val()+"-"+$("#personTelNo2").val()+"-"+$("#personTelNo3").val());
				if($("#faxNo2").val()!="" && $("#faxNo3").val()!=""){
					$("#faxNo").val($("#faxNo1").val()+"-"+$("#faxNo2").val()+"-"+$("#faxNo3").val());	
				}
				
				
				var isPass = true;
				$("input[required]").each(function() {
					if(compactTrim($(this).val()) == "") {
						$(this).focus();
						alert("필수항목입니다. " + $(this).data("msg") + " 입력해주세요.");
						return isPass = false;
					}
				});
				
				if(isPass){
					if($("#personEmail1").val() != ""){
						if(!checkEmail($("#personEmail").val())) {
							$("#personEmail").focus();
							alert("이메일형식이 올바르지 않습니다.");
							return isPass = false;
						}
					}
					if($("#email1").val() != ""){
						if(!checkEmail($("#email").val())) {c
							$("#email").focus();
							alert("이메일형식이 올바르지 않습니다.");
							return isPass = false;
						}
					}
					if($("#chkDupOrgId").val()=="N"){
						$('#chkDupOrgId').focus();
						alert("아이디 중복확인을 해주세요.");
						return isPass = false;
					}
					if($("#chkDupBsnsNo").val()=="N"){
						$('#chkDupBsnsNo').focus();
						alert("사업자등록번호 중복확인을 해주세요.");
						return isPass = false;
					}
					if($("#orgPw").val()!=""){
						if($("#orgPwChkMsg1").hasClass('unpass') || $("#orgPwChkMsg2").hasClass('unpass')){
							$('#orgPw').focus();
							alert("비밀번호 입력이 정확하지 않습니다.");
							return isPass = false;
						}
					}
				}
				
				
				
					
				function compactTrim(str) {
					return str.replace( /(\s*)/g, "" );
				}
					
				return isPass;	
			}
			
			$(document).on("click","#chkDupBsnsNoBtn",function(){
				var chkBool = true;
				if($("#bsnsNo1").val().length!=3|| $("#bsnsNo2").val().length!=2|| $("#bsnsNo3").val().length!=5){
					alert("사업자등록번호를 확인해주세요.");
					$("#bsnsNo").focus();
					chkBool = false;
				}
				$("#bsnsNo").val($("#bsnsNo1").val() + "-" + $("#bsnsNo2").val() + "-" + $("#bsnsNo3").val());
				if(chkBool){
					$.ajax({
						type:"POST",
						url : "/web/chkDupBsnsNo.do",
						data : {
							bsnsNo : $("#bsnsNo").val()
						},
						success : function(tmp){
							if(tmp > -1){
								if(tmp == 0){
									$("#dupBsnsNoYn").removeClass("unpass");
									$("#dupBsnsNoYn").addClass("pass");
									$("#dupBsnsNoYn").text("확인 완료 되었습니다.");
									$("#chkDupBsnsNo").val("Y");
								} else {
									$("#dupBsnsNoYn").removeClass("pass");
									$("#dupBsnsNoYn").addClass("unpass");
									$("#dupBsnsNoYn").text("이미 등록된 사업자등록번호입니다.");
									$("#chkDupBsnsNo").val("N");
								}
							}
						}
						
					});
				}
			});
			
			$(document).on("click","#chkDupOrgIdBtn",function(){
				var chkBool = true;
				var idReg1 = /^[a-zA-Z0-9]*$/;
				/* if(chkLength($("#orgId"), 0, 5)){
					alert("아이디를 6자리 이상으로 입력해주세요.");
					$("#orgId").focus();
					chkBool = false;
				} */
				/* if(!idReg1.test($("#orgId").val())){
					alert("아이디는 영문, 숫자 조합으로 입력해주세요.");
					$("#orgId").focus();
					chkBool = false;
				} */
				if($("#orgId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#orgId").focus();
					chkBool = false;
				}	
				
				var orgId = $("#orgId").val().replace(/ /gi, "");
				
				if(chkBool){
					$.ajax({
						type : "POST",
						url : "/kabadm/company/chkDupOrgId.do",
						data : {
							orgId : $("#orgId").val()
						},
						success : function(tmp){
							if(tmp > -1){
								if(tmp == 0){
									$("#dupOrgIdYn").removeClass("unpass");
									$("#dupOrgIdYn").addClass("pass");
									$("#dupOrgIdYn").text("사용 가능한 아이디입니다.");
									$("#chkDupOrgId").val("Y");
								} else {
									$("#dupOrgIdYn").removeClass("pass");
									$("#dupOrgIdYn").addClass("unpass");
									$("#dupOrgIdYn").text("이미 사용중인 아이디입니다.");
									$("#chkDupOrgId").val("N");
								}	
							}
						}
					});
				}
				
			});
			
			function chkLength(obj, min, max) {
				if (obj.val().length < min || obj.val().length > max) {
					return false;
				} else {
					return true;
				}
			}
			
			/*소재지 추가*/
			function addLocation(){
					
					cnt++;
					var rowItem = '<table class="table02" summary="인증기관 정보 조회">'
					rowItem += '<caption>인증기관 정보 조회</caption>'
					rowItem += '<colgroup>'
					rowItem +=	 '<col width="11%">'
					rowItem +=	 '<col width="39%">'
					rowItem +=	 '<col width="10%">'
					rowItem += '<col width="40%">'
					rowItem += '</colgroup>'
					rowItem += '<tbody>'
					rowItem +=	 '<tr>'
					rowItem +=		 '<th scope="row">소재지명<span class="star">*</span></th>'
					rowItem +=		 '<td colspan="3 "><input class="w300" type="text" id="locNm_'+ cnt +'" name="locNm" value="" placeholder="Ex) 본사, 지사 etc." data-msg="소재지명을" required> <label class="f_0" for="locNm">소재지명 입력</label><input type="hidden" id="locIdx_"'+cnt+'" name="locIdx"> <a class="f_r sm_red" href="javascript:void(0);" id="deltable">삭제</a> </td>'
					rowItem +=	 '</tr>'
					rowItem +=	 '<tr>'
					rowItem +=		 '<th scope="row">국문주소<span class="star">*</span></th>'
					rowItem +=		 '<td colspan="3"><input class="gray" style="width: 180px" type="text" id="zipCode_'+ cnt +'" value="" name="zipCode"  data-msg="우편번호를" readonly required> <label class="f_0" for="t2">우편번호 입력</label> <a id="'+cnt+'" class="sm_line adrSearch" href="javascript:void(0);">우편번호 검색</a><br /> <input type="hidden" id="adrKr_'+cnt+'" name="adrKr" value=""><input class="w500 gray mr5 mt7" type="text" id="adrKr1_'+cnt+'" value="" data-msg="국문주소를" readonly required><input class="w500 mt7" type="text" id="adrKr2_'+cnt+'" value="" placeholder="상세주소" data-msg="상세주소를" required></td>'
					rowItem +=	 '</tr>'
					rowItem +=	 '<tr>'
					rowItem +=		 '<th scope="row">영문주소<span class="star">*</span></th>'
					rowItem +=		 '<td colspan="3"><input style="width: 1005px" type="text" id="adrEn_'+cnt+'" value="" name="adrEn" data-msg="영문주소를"  required> <label class="f_0" for="t1">영문주소 입력</label></td>'
					rowItem +=	 '</tr>'
					rowItem +=	 '<tr>'
					rowItem +=	 '	<th scope="row">인증업무범위</th>'
					rowItem +=	 '	<td colspan="3">'
					rowItem +=	 '		<input type="hidden" name="certAgrYnArr" id="certAgrYnArr_'+cnt+'" value="">'
					rowItem +=	 '		<input class="checkbox chk" type="checkbox" id="agYn_'+cnt+'" onchange=\"certCheckChange('+cnt+', '+"'"+'ag'+"'"+');\">'
					rowItem +=	 '		<label for="agYn_'+cnt+'" class="mt3">인증체결계약</label>'
					
					rowItem +=	 '		<input type="hidden" name="certAdtYnArr" id="certAdtYnArr_'+cnt+'" value="">'
					rowItem +=	 '		<input class="checkbox chk" type="checkbox" id="adYn_'+cnt+'" onchange=\"certCheckChange('+cnt+', '+"'"+'ad'+"'"+');\">'
					rowItem +=	 '		<label for="adYn_'+cnt+'" class="mt3">인증심사수행</label>'
					
					rowItem +=	 '		<input type="hidden" name="certDcsIssuYnArr" id="certDcsIssuYnArr_'+cnt+'" value="">'
					rowItem +=	 '		<input class="checkbox chk" type="checkbox" id="dcYn_'+cnt+'" onchange=\"certCheckChange('+cnt+', '+"'"+'dc'+"'"+');\">'
					rowItem +=	 '		<label for="dcYn_'+cnt+'" class="mt3">인증결정 및 인증서발행</label>'
					rowItem +=	 '	</td>'
					rowItem +=	 '</tr>'
					rowItem += '</tbody>'
					rowItem += '</table>'
					$('#location_manager:last').append(rowItem);
			};
			
			//주소합치기
			$(document).on("keyup", "input[id^='adrKr2_']", function() {
				var code=$(this).attr('id').split('_')[1];
				$("#adrKr_"+code).val($("#adrKr1_"+code).val() + "|" + $("#adrKr2_"+code).val());
			});
			
			//주소 삭제 버튼
			$(document).on("click","[id=deltable]",function(){
				if($(this).siblings('input[id^="locIdx_"]').attr('value')!=null){											//해당 주소 DB Idx 값이 null이 아니면
					if($('#delLocIdx').val()==""){																			//delLocIdx의 value가 비어있는지 확인
						$('#delLocIdx').val($(this).siblings('input[id^="locIdx_"]').val());								//비어있으면 그냥 idx만 추가
					}else{
						$('#delLocIdx').val($('#delLocIdx').val() +"/"+$(this).siblings('input[id^="locIdx_"]').val());		//비어있지 않으면 '|' 붙인 뒤 idx 추가	
					} 
					 
				}
				$(this).closest("table").remove();
			});
			
			//우편번호 검색 
			$(document).on("click", ".adrSearch", function() {
				var code=$(this).attr("id");
				execDaumPostcode(code);
			});
			
			/*주소검색api*/
		    function execDaumPostcode(code) {
		        new daum.Postcode({
		        	theme:{
		            	searchBgColor: "#3E6CC0", //검색창 배경색
						queryTextColor: "#FDFDFD" //검색창 글자색
		            },
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		                var addr = ''; // 주소 변수
		                var addrEn = ''; // 영문 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                	addrEn = data.roadAddressEnglish;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                	addrEn = data.jibunAddressEnglish;	                
		                }
		              
		          	   // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('zipCode_'+code).value = data.zonecode;
		                document.getElementById('adrKr1_'+code).value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('adrKr2_'+code).focus();
		                document.getElementById('adrEn_'+code).value = addrEn;
		            }
		        }).open();
		    }
			
		 // 비밀번호 체크
			var passwordCheck = function(pw) {
			 	pwChk();
				var $msgObj = $('.pass_msg_1');
				
				if (!pw) {
					return false;
				}

				// 연번 4개 이상 사용 불가 체크
				var last_w = '';
				var last_w_cnt = 0;
				for (var i = 0; i < pw.length; i++) {
					var cur_w = pw.substr(i, 1);
					if (last_w == cur_w)
						last_w_cnt++;
					else
						last_w = cur_w;
					if (last_w_cnt >= 3) {
						$msgObj.html("<font color='#e45555' style=\"vertical-align: unset;\">4자이상 연속된 번호로 사용 불가합니다.<font>");
						$("#orgPwChkMsg1").removeClass("pass");
						$("#orgPwChkMsg1").addClass("unpass");
						return false;
						break;
					}
				}
				
				// 6자리 이상 체크
				if (chkLength($("#orgPw"), 0, 5)) {
					$msgObj.html("<font color='#e45555' style=\"vertical-align: unset;\">6자리이상 입력해 주십시오.<font>");
					$("#orgPwChkMsg1").removeClass("pass");
					$("#orgPwChkMsg1").addClass("unpass");
					return false;
				}

				/* // 6자이상, 특수 문자
				var chk_num = $("#orgPw").val().search(/[0-9]/g);
				var chk_eng = $("#orgPw").val().search(/[a-z]/ig);
				var chk_schar = $("#orgPw").val().search(/[$@$~!%*#?&^()_+]/g); */

				/* if (!/^(?=.*)(?=.*\d)(?=.*[$@$~!%*#?&^()_+])[\d$@$~!%*#?&^()_+]{6,}$/.test($("#orgPw").val())) {
					$msgObj.html("<font color='#e45555' style=\"vertical-align: unset;\">특수문자를 사용해주세요.(6자이상)<font>");
					$("#orgPwChkMsg1").removeClass("pass");
					$("#orgPwChkMsg1").addClass("unpass");
					return false;
				} */

				/* if (chk_num < 0 || chk_eng < 0 || chk_schar < 0) { 
					$msgObj.html("<font color='#e45555' style=\"vertical-align: unset;\">영문, 숫자, 특수문자를 모두 조합해주세요.<font>");
					$("#orgPwChkMsg1").removeClass("pass");
					$("#orgPwChkMsg1").addClass("unpass");
					return false;
				} */

					$msgObj.html("");
					$("#orgPwChkMsg1").text("사용 가능한 비밀번호입니다.");
					$("#orgPwChkMsg1").removeClass("unpass");
					$("#orgPwChkMsg1").addClass("pass");
					return true;
			}
		 
		 	$(document).on("keyup","#orgPwChk",function(){
		 		pwChk();
		 	});
		 	
		 	function pwChk(){
		 		var $msgObj = $('.pass_msg_2');
				// 비밀번호와 비밀번호 확인 비교
				if ($("#orgPw").val().trim() != $("#orgPwChk").val().trim()) {
					$msgObj.html("<font color='#e45555' style=\"vertical-align: unset;\">비밀번호가 서로 일치하지 않습니다.<font>");
					$("#orgPwChkMsg2").removeClass("pass");
					$("#orgPwChkMsg2").addClass("unpass");
					return false;
				} else {
					$msgObj.html("");
					$("#orgPwChkMsg2").text("비밀번호가 서로 일치합니다.");
					$("#orgPwChkMsg2").removeClass("unpass");
					$("#orgPwChkMsg2").addClass("pass");
					return true;
				}
		 	}
		 	
		 	function certCheckChange(cnt, type) {
				
				if(type == "ag") {
					if($("#agYn_"+cnt).is(":checked")) {
						$("#certAgrYnArr_"+cnt).val("Y");
					} else {
						$("#certAgrYnArr_"+cnt).val("N");
					}
					
				}
				
				if(type == "ad") {
					if($("#adYn_"+cnt).is(":checked")) {
						$("#certAdtYnArr_"+cnt).val("Y");
					} else {
						$("#certAdtYnArr_"+cnt).val("N");
					}
				}
				
				if(type == "dc") {
					if($("#dcYn_"+cnt).is(":checked")) {
						$("#certDcsIssuYnArr_"+cnt).val("Y");
					} else {
						$("#certDcsIssuYnArr_"+cnt).val("N");
					}
				}
			}
		 	
		</script>
	</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp" %>
		<p class="top_line"></p>
		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
				 <h2>
				 	<c:if test="${orgSessionVo.orgIdx eq null}">회원가입</c:if>
				 	<c:if test="${orgSessionVo.orgIdx ne null}">회원정보</c:if>
				 </h2>
				 <ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>
						<c:if test="${orgSessionVo.orgIdx eq null}">회원가입</c:if>
				 		<c:if test="${orgSessionVo.orgIdx ne null}">회원정보</c:if>
					</li>
					<li>
						<c:if test="${orgSessionVo.orgIdx eq null}">정보입력</c:if>
				 		<c:if test="${orgSessionVo.orgIdx ne null}">정보수정</c:if>	
					</li>
				</ol>
			</div>
			
			<h3>인증기관 정보</h3>
			<form name="frm" id="frm" autocomplete="off" method="post">
				<input type="hidden" name="useYn" value="${resultVO.useYn}">
				<input type="hidden" name="closeBsnsYn" value="${resultVO.closeBsnsYn}">
				<input type="hidden" name="closeBsnsDate" value="${resultVO.closeBsnsDate}">
			
			<table class="table02" summary="회원가입 인증기관 정보입력">
				<caption>회원가입 인증기관 정보입력</caption>
				<colgroup><col width="14%"><col width="38%"><col width="14%"><col width="38%"></colgroup>
				<tbody>
					<tr>
						<th scope="row">인증기관 ID<span class="star">*</span></th>
						<td colspan="3">
							<c:choose>
								<c:when test="${empty resultVO.orgIdx}">
									<input id="orgId" name="orgId" style="width: 200px;" type="text" placeholder="아이디를 입력해주세요." data-msg="아이디를" required/>
									<input type="hidden" id="chkDupOrgId" value="N"/>
									<label class="f_0" for="orgId">아이디 선택</label> 
									<a class="sm_line" href="javascript:void(0);" id="chkDupOrgIdBtn">ID Check</a> 
									<span id="dupOrgIdYn" class="pass"></span> 
								</c:when>
								<c:otherwise>
									<input class="gray" id="orgId" name="orgId" value="${resultVO.orgId}" style="width: 200px;" type="text" readonly="readonly" />
									<input type="hidden" id="chkDupOrgId" value="Y"/>
									<label class="f_0" for="orgId">아이디</label> 
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th scope="row">사업자등록번호<span class="star">*</span></th>
						<td colspan="3">
							
							<input type="hidden" id="bsnsNo" name="bsnsNo" value="">
							<input class="c inputNext" style="width:50px" type="text" id="bsnsNo1" value="${fn:split(resultVO.bsnsNo,'-')[0]}" maxlength="3" data-msg="사업자등록번호를" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
							<span class="v_middle">-</span>
							<input class="c inputNext" style="width:50px" type="text" id="bsnsNo2" value="${fn:split(resultVO.bsnsNo,'-')[1]}" maxlength="2" data-msg="사업자등록번호를" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
							<span class="v_middle">-</span>
							<input class="c inputNext" style="width:70px" type="text" id="bsnsNo3" value="${fn:split(resultVO.bsnsNo,'-')[2]}" maxlength="5" data-msg="사업자등록번호를" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
							<c:if test="${empty resultVO.orgIdx}">
								<input type="hidden" id="chkDupBsnsNo" value="N"/>
								<a class="sm_line" href="javascript:void(0);" id="chkDupBsnsNoBtn">중복확인</a>
								<span id="dupBsnsNoYn" class="pass"></span>
							</c:if>
							
						</td>		
					</tr>
					<tr>
						<th scope="row">비밀번호<span class="star">*</span></th>
						<td>
							<input type="password" id="orgPw" name="orgPw" maxlength="25" style="width: 200px" onclick="passwordCheck(this.value)" onkeydown="passwordCheck(this.value)" onblur="passwordCheck(this.value)" placeholder="비밀번호를 입력해주세요." data-msg="비밀번호를" required />
							<label class="f_0" for="orgPw">비밀번호 입력</label> 
							<c:choose>
								<c:when test="${empty resultVO.orgIdx}">
									<p style="padding-top:6px; font: 12px/16px &quot;malgun gothic&quot;,&quot;Dotum&quot;,&quot; Gulim&quot;,&quot;Arial&quot;,&quot;verdana&quot;,&quot;Helvetica&quot;,sans-serif; display: inline-block; color:#2573cf;">※ 6자 이상의 대소문자, 숫자, 특수문자</p>
								</c:when>
								<c:otherwise>
									<p style="padding-top:6px; font: 12px/16px &quot;malgun gothic&quot;,&quot;Dotum&quot;,&quot; Gulim&quot;,&quot;Arial&quot;,&quot;verdana&quot;,&quot;Helvetica&quot;,sans-serif; display: inline-block; color:#2573cf;">※ 비밀번호 변경시 입력해주세요.</p>
								</c:otherwise>
							</c:choose>
							<br>
							<span id="orgPwChkMsg1" class="unpass pass_msg_1"></span> 
						</td>
						<th scope="row">비밀번호 확인<span class="star">*</span></th>
						<td>
							<input type="password" id="orgPwChk" style="width: 200px" maxlength="25"  data-msg="비밀번호를 다시" required />
							<label class="f_0" for="orgPwChk">비밀번호 확인 입력</label>
							<br>
							<span id="orgPwChkMsg2" class="unpass pass_msg_2"></span> 
						</td>
					</tr>

					<tr>
						<th scope="row">인증기관명(국문)<span class="star">*</span></th>
						<td>
							<input class="w300" type="text" id="orgNmKr" value="${resultVO.orgNmKr}" name="orgNmKr" data-msg="인증기관명(국문)을" required>
							<label class="f_0" for="orgNmKr">인증기관명(국문) 입력</label>
						</td>
						<th scope="row">인증기관명(영문)<span class="star">*</span></th>
						<td>
							<input class="w300" type="text" id="orgNmEn" value="${resultVO.orgNmEn}" name="orgNmEn" data-msg="인증기관명(영문)을" required>
							<label class="f_0" for="t4">인증기관명(영문) 입력</label>
						</td>
					</tr>
					
					<tr>
						<th scope="row">인증기관 구분<span class="star">*</span></th>
						<td class="ra_base" colspan="3">
							<input type="hidden" id="orgType" name="orgType" value="${resultVO.orgType}" data-msg="인증기관 구분을" required>
							<c:forEach var = "orgType" items = "${orgType}">
								<input type="radio" name="orgType1" id="orgType${orgType.cdSort}" value="${orgType.cdVal2}"	<c:if test="${resultVO.orgType eq orgType.cdVal2}">checked="checked"</c:if>>
								<label for="orgType${orgType.cdSort}" class="mr15"><span></span>${orgType.cdName2}</label>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="row">대표자명<span class="star">*</span></th>
						<td>
							<input class="w300" type="text" id="ceoNm" value="${resultVO.ceoNm}" name="ceoNm" data-msg="대표자명을" required>
							<label class="f_0">대표자명 입력</label>
						</td>
						<th scope="row">대표자명(영문)<span class="star">*</span></th>
						<td>
							<input class="w300" type="text" id="ceoNmEn" value="${resultVO.ceoNmEn}" name="ceoNmEn" data-msg="대표자명(영문)을" required>
							<label class="f_0">대표자명(영문) 입력</label>
						</td>
					</tr>
					<tr>
						<th scope="row">설립근거<span class="star">*</span></th>
						<td>
							<input class="w300" type="text" name="foundedRef" id="foundedRef" value="${resultVO.foundedRef}" data-msg="설립근거를" required>
							<label class="f_0">설립근거 입력</label>
						</td>
						<th scope="row">설립일<span class="star">*</span></th>
						<td>
							<input class="w150 brn" type="text" name="foundedDate" id="foundedDate" value="${resultVO.foundedDate}" data-msg="설립일을" readonly required>
							<label class="f_0">설립일 선택</label>
							<a href="javascript:void(0);" class="cal f_0" onclick="$('#foundedDate').datepicker('show');">날짜선택</a>
						</td>
					</tr>
					
					<tr>
						<th scope="row">자본금(원)</th>
						<td>
							<input class="w300" type="text" id="orgCapital" name="orgCapital" value="${resultVO.orgCapital}" placeholder="단위 : 원(￦)">
							<label class="f_0">자본금 입력</label>
						</td>
						<th scope="row">대표이메일<span class="star">*</span></th>
						<td >
							<input type="hidden" name="email" id="email" value="" data-msg="대표 이메일 주소를" required> 
							<input type="text" id="email1" name="email1" value="${fn:split(resultVO.email,'@')[0]}" class="w100"/>
							<label class="f_0">이메일 입력</label> 
							<span class="hyphen">@</span> 
							<input type="text" id="email2" name="email2" value="${fn:split(resultVO.email,'@')[1]}" class="w100"/>
							<label class="f_0">이메일 입력</label> 
							<select id="email3" name="email3" class="select01" style="cursor: pointer; width:120px;">
								<option value="">직접입력</option>
									<c:forEach var="emailList" items="${emailList}">
										<option value="${emailList.cdVal2}" <c:if test="${fn:split(resultVO.email,'@')[1] eq emailList.cdVal2}">selected</c:if>>
											${emailList.cdName2}
										</option>
									</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<th scope="row">매출액(원)</th>
						<td>
							<input class="w300" type="text" id="orgTouch" name="orgTouch" value="${resultVO.orgTouch}" placeholder="단위 : 원(￦)">
							<label class="f_0">매출액 입력</label>
						</td>
						<th scope="row">대표전화<span class="star">*</span></th>
						<td>
							<input type="hidden" name="telNo" id="telNo" value="" />
								<select id="telNo1" name="telNo1" class="select01" style="width: 70px" style="cursor: pointer;">
									<c:forEach var="hpTel" items="${hpTel}">
										<option value="${hpTel.cdVal2}" <c:if test="${fn:split(resultVO.telNo,'-')[0] eq hpTel.cdVal2}">selected</c:if>>
											${hpTel.cdName2}
										</option>
									</c:forEach>
								</select>
							<span class="v_middle">-</span> 
							<input type="text" id="telNo2" name="telNo2" value="${fn:split(resultVO.telNo,'-')[1]}" class="w300" style="width: 100px" maxlength="4" data-msg="전화번호를" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required />
							<span class="v_middle">-</span> 
							<input type="text" id="telNo3" name="telNo3" value="${fn:split(resultVO.telNo,'-')[2]}" class="w300" style="width: 100px" maxlength="4" data-msg="전화번호를" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required />
						</td>
						
					</tr>
					<tr>
						<th>인증매출액(원)</th>
						<td>
							<input class="w300" type="text" id="orgCertTouch" name="orgCertTouch" value="${resultVO.orgCertTouch}" placeholder="단위 : 원(￦)">
							<label class="f_0">인증매출액 입력</label>
						</td>
						<th>FAX</th>
						<td>
							<input type="hidden" name="faxNo" id="faxNo" value="" />
								<select id="faxNo1" name="faxNo1" class="select01" style="width: 70px" style="cursor: pointer;">
									<c:forEach var="faxTel" items="${faxTel}">
										<option value="${faxTel.cdVal2}" <c:if test="${fn:split(resultVO.faxNo,'-')[0] eq faxTel.cdVal2}">selected</c:if>>
											${faxTel.cdName2}
										</option>
									</c:forEach>
								</select>
							<span class="v_middle">-</span> 
							<input type="text" id="faxNo2" name="faxNo2" value="${fn:split(resultVO.faxNo,'-')[1]}" class="w300" style="width: 100px" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
							<span class="v_middle">-</span> 
							<input type="text" id="faxNo3" name="faxNo3" value="${fn:split(resultVO.faxNo,'-')[2]}" class="w300" style="width: 100px" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9][-~]/g,'');" />
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td>
							<input type="text" id="homepage" class="w300" name="homepage" value="${resultVO.homepage}">
							<label class="f_0" for="homepage">홈페이지 주소 입력</label>
						</td>
						<th scope="row">관계회사</th>
						<td>
							<input type="text" id="affiliate" class="w300" name="affiliate" value="${resultVO.affiliate}">
							<label class="f_0" for="affiliate">관계회사 입력</label>
						</td>
					</tr>
				</tbody>
			</table>

			<h3>담당자 정보</h3>
			<table class="table02" summary="회원가입 담당자 정보입력">
				<caption>회원가입 담당자 정보입력</caption>
				<colgroup><col width="12%"><col width="38%"><col width="12%"><col width="38%"></colgroup>
				<tbody>
					<tr>
						<th scope="row">성명<span class="star">*</span></th>
						<td>
							<input class="w300" type="text" id="personNm" value="${resultVO.personNm}" name="personNm" data-msg="담당자명을" required>
							<label class="f_0">담당자명 입력</label>
						</td>
						<th scope="row">직위<span class="star">*</span></th>
						<td>
							<input class="w300" type="text" name="personPosition" id="personPosition" value="${resultVO.personPosition}" data-msg="담당자 직위를" required>
							<label class="f_0">직위 입력</label>
						</td>
					</tr>

					<tr>
						<th scope="row">전화번호<span class="star">*</span></th>
						<td>
							<input type="hidden" name="personTelNo" id="personTelNo" value="" />
								<select id="personTelNo1" name="personTelNo1" class="select01" style="width: 70px" style="cursor: pointer;">
									<c:forEach var="hpTel" items="${hpTel}">
										<option value="${hpTel.cdVal2}" <c:if test="${fn:split(resultVO.personTelNo,'-')[0] eq hpTel.cdVal2}">selected</c:if>>
											${hpTel.cdName2}
										</option>
									</c:forEach>
								</select>
							<span class="v_middle">-</span> 
							<input type="text" id="personTelNo2" name="personTelNo2" value="${fn:split(resultVO.personTelNo,'-')[1]}" class="w300" style="width: 100px" maxlength="4" data-msg="담당자 전화번호를" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required />
							<span class="v_middle">-</span> 
							<input type="text" id="personTelNo3" name="personTelNo3" value="${fn:split(resultVO.personTelNo,'-')[2]}" class="w300" style="width: 100px" maxlength="4" data-msg="담당자 전화번호를" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required />
						</td>
						<th scope="row">메일주소<span class="star">*</span></th>
						<td>
							<input type="hidden" name="personEmail" id="personEmail" value="" data-msg="담당자 메일 주소를" required> 
							<input type="text" id="personEmail1" name="personEmail1" value="${fn:split(resultVO.personEmail,'@')[0]}" class="w100"/> 
							<span class="hyphen">@</span> 
							<input type="text" id="personEmail2" name="personEmail2" value="${fn:split(resultVO.personEmail,'@')[1]}" class="w100"/> 
							<select id="personEmail3" name="personEmail3" class="select01" style="cursor: pointer; width:120px;">
								<option value="">직접입력</option>
									<c:forEach var="emailList" items="${emailList}">
										<option value="${emailList.cdVal2}" <c:if test="${fn:split(resultVO.personEmail,'@')[1] eq emailList.cdVal2}">selected</c:if>>
											${emailList.cdName2}
										</option>
									</c:forEach>
							</select>
						</td>
					</tr>
				</tbody>
			</table>

			
			<h3>소재지 정보</h3>
			<div id="location_manager">
			<input type="hidden" id="delLocIdx" name="delLocIdx" value="">
			<c:choose>
						<c:when test="${empty resultVO.orgIdx }">
							<table class="table02" summary="회원가입 소재지 정보 입력">
								<caption>인증기관 정보 조회</caption>
								<colgroup>
									<col width="11%">
									<col width="39%">
									<col width="10%">
									<col width="40%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">소재지명<span class="star">*</span></th>
										<td colspan="3">
											<input class="w300" type="text" id="locNm_0" name="locNm" value="" placeholder="Ex) 본사, 지사 etc." data-msg="소재지명을" required>
											<label class="f_0" for="t1">소재지명 입력</label>
										</td>
									</tr>
									<tr>
										<th scope="row">국문주소<span class="star">*</span></th>
										<td colspan="3">
											<input class="gray" style="width: 180px" type="text" id="zipCode_0" value="" name="zipCode" data-msg="우편번호를" readonly required> 
											<label class="f_0" for="zipCode">우편번호 입력</label>
											<a id="0" class="sm_line adrSearch" href="javascript:void(0);">우편번호 검색</a><br/>
											<input type="hidden" id="adrKr_0" name = "adrKr">
											<input class="w500 gray mr5 mt7" type="text" id="adrKr1_0" value="" data-msg="국문주소를" readonly required>
											<input class="w500 mt7" type="text" id="adrKr2_0" value="" placeholder="상세주소" data-msg="상세주소를" required>
										</td>
									</tr>
									<tr>
										<th scope="row">영문주소<span class="star">*</span></th>
										<td colspan="3"><input type="text" id="adrEn_0" name="adrEn" data-msg="영문주소를" required>
											<label class="f_0" for="t1">영문주소 입력</label>
										</td>
									</tr>
									<tr>
										<th scope="row">인증업무범위</th>
										<td colspan="3">
											<input type="hidden" name="certAgrYnArr" id="certAgrYnArr_0" value="">
											<input class="checkbox chk" type="checkbox" id="agYn_0" onchange="certCheckChange(0,'ag');">
											<label for="agYn_0" class="mt3">인증체결계약</label>
											
											<input type="hidden" name="certAdtYnArr" id="certAdtYnArr_0" value="">
											<input class="checkbox chk" type="checkbox" id="adYn_0" onchange="certCheckChange(0,'ad');">
											<label for="adYn_0" class="mt3">인증심사수행</label>
											
											<input type="hidden" name="certDcsIssuYnArr" id="certDcsIssuYnArr_0" value="">
											<input class="checkbox chk" type="checkbox" id="dcYn_0" onchange="certCheckChange(0,'dc');">
											<label for="dcYn_0" class="mt3">인증결정 및 인증서발행</label>
										</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<c:forEach var="resultLocList" items="${resultLocList}" varStatus="status">
							<table class="table02" summary="회원가입 소재지 정보 입력">	
									<caption>인증기관 정보 조회</caption>
									<colgroup>
										<col width="11%">
										<col width="39%">
										<col width="10%">
										<col width="40%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">소재지명<span class="star">*</span></th>
											<td colspan="3">
												<input class="w300" type="text" id="locNm_${status.index}" name="locNm" value="${resultLocList.locNm}" placeholder="Ex) 본사, 지사 etc." data-msg="소재지명을" required>
												<label class="f_0" for="t1">소재지명 입력</label>
											</td>
										</tr>
										<tr>
											<th scope="row">국문주소<span class="star">*</span></th>
											<td colspan="3">
												<input class="gray" style="width: 180px" type="text" id="zipCode_${status.index}" value="${resultLocList.zipCode}" name="zipCode" data-msg="우편번호를" readonly required> 
												<label class="f_0" for="zipCode">우편번호 입력</label>
												<input type="hidden" id="locIdx_${status.index}" name="locIdx" value="${resultLocList.locIdx}">
												<c:if test="${status.index > 0}"> 
													<a class="f_r sm_red" href="javascript:void(0);" id="deltable">삭제</a> 
												</c:if>
												<a id="${status.index}" class="sm_line adrSearch" href="javascript:void(0);">우편번호 검색</a><br/>
												<input type="hidden" id="adrKr_${status.index}" value = "${resultLocList.adrKr}" name = "adrKr">
												<input class="w500 gray mr5 mt7" type="text" id="adrKr1_${status.index}" value="${fn:split(resultLocList.adrKr,'|')[0]}" data-msg="국문주소를" readonly required>
												<input class="w500 mt7" type="text" id="adrKr2_${status.index}" value="${fn:split(resultLocList.adrKr,'|')[1]}" placeholder="상세주소" data-msg="상세주소를" required>
											</td>
										</tr>
										<tr>
											<th scope="row">영문주소<span class="star">*</span></th>
											<td colspan="3"><input type="text" id="adrEn_${status.index}" value="${resultLocList.adrEn}" name="adrEn" data-msg="영문주소를" required>
												<label class="f_0" for="t1">영문주소 입력</label>
											</td>
										</tr>
										<tr>
											<th scope="row">인증업무범위</th>
											<td colspan="3">
												<%-- <input type="hidden" name="certAgrYn" id="certAgrYn" value="${resultVO.certAgrYn}">
												<input class="checkbox chk" type="checkbox" name="certAgrYn1" id="certAgrYn1"	
													<c:if test="${ resultVO.certAgrYn eq 'Y' }">checked="checked"</c:if>>
												<label for="certAgrYn1" class="mt3">인증체결계약</label>
												
												<input type="hidden" name="certAdtYn" id="certAdtYn" value="${resultVO.certAdtYn}">
												<input class="checkbox chk" type="checkbox" name="certAdtYn1" id="certAdtYn1"
													<c:if test="${ resultVO.certAdtYn eq 'Y' }">checked="checked"</c:if>>
												<label for="certAdtYn1" class="mt3">인증심사수행</label>
												
												<input type="hidden" name="certDcsIssuYn" id="certDcsIssuYn" value="${resultVO.certDcsIssuYn}">
												<input class="checkbox chk" type="checkbox" name="certDcsIssuYn1" id="certDcsIssuYn1"
													<c:if test="${ resultVO.certDcsIssuYn eq 'Y' }">checked="checked"</c:if>>
												<label for="certDcsIssuYn1" class="mt3">인증결정 및 인증서발행</label> --%>
												
												
												
												
												<input type="hidden" name="certAgrYnArr" id="certAgrYnArr_${status.index}" value="${resultLocList.certAgrYn}">
												<input class="checkbox chk" type="checkbox" id="agYn_${status.index}" onchange="certCheckChange(${status.index},'ag');"
													<c:if test="${ resultLocList.certAgrYn eq 'Y' }">checked="checked"</c:if>>
												<label for="agYn_${status.index}" class="mt3">인증체결계약</label>
												
												<input type="hidden" name="certAdtYnArr" id="certAdtYnArr_${status.index}" value="${resultLocList.certAdtYn}">
												<input class="checkbox chk" type="checkbox" id="adYn_${status.index}" onchange="certCheckChange(${status.index},'ad');"
													<c:if test="${ resultLocList.certAdtYn eq 'Y' }">checked="checked"</c:if>>
												<label for="adYn_${status.index}" class="mt3">인증심사수행</label>
												
												<input type="hidden" name="certDcsIssuYnArr" id="certDcsIssuYnArr_${status.index}" value="${resultLocList.certDcsIssuYn}">
												<input class="checkbox chk" type="checkbox" id="dcYn_${status.index}" onchange="certCheckChange(${status.index},'dc');"
													<c:if test="${ resultLocList.certDcsIssuYn eq 'Y' }">checked="checked"</c:if>>
												<label for="dcYn_${status.index}" class="mt3">인증결정 및 인증서발행</label>
											</td>
										</tr>	
									</tbody>
								</table>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			<p class="more_adr"><a href="javascript:addLocation();" class="sm_plus">소재지 추가</a></p>
			
			<h3>주요사업</h3>
			<p>
				<textarea style="width: 100%;" name="majorBsns" id="majorBsns" cols="30" rows="4" placeholder="내용을 입력하세요.">${resultVO.majorBsns}</textarea>
				<label for="orgBigo" class="f_0">주요사업 입력</label>
			</p>
					
			<h3>FAB인정현황</h3>
			<p>
				<textarea style="width: 100%;" name="fabHistory" id="fabHistory" cols="30" rows="4" placeholder="내용을 입력하세요.">${resultVO.fabHistory}</textarea>
				<label for="orgBigo" class="f_0">FAB인정현황 입력</label>
			</p>
			
			<h3>연혁</h3>
			<p>
				<textarea style="width: 100%;" name="orgHistory" id="orgHistory" cols="30" rows="4" placeholder="내용을 입력하세요.">${resultVO.orgHistory}</textarea>
				<label for="orgBigo" class="f_0">연혁란입니다</label>
			</p>
			</form>
			<p class="btn_area c">
				<c:if test="${orgSessionVo.orgIdx eq null}">
					<a href="javascript:fn_submit('ins');" class="btn_submit">회원가입</a>
				</c:if>
				<c:if test="${orgSessionVo.orgIdx ne null}">
				 	<a href="javascript:fn_submit('mod');" class="btn_submit">회원정보 수정</a>
				</c:if>
				
			</p>
		</div>		
	</div>
	<%@include file="../_inc/footer.jsp" %>

</body>

</html>