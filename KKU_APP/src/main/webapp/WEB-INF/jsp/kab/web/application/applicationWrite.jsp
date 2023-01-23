<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="page_num_depth_01" value="1" />
<c:set var="page_num_depth_02" value="3" />

<html>
<head>
	<%@include file="../_inc/tit.jsp"%>
	<script>
		
		$(document).ready(function(){
			//페이지 스크롤 기억
			var scroll = getCookie("oldScroll");
			if(scroll != null){
				window.scrollTo(0,scroll);
				deleteCookie("oldScroll");
				scroll=null;
			}
		
			//초기 셋팅
			if('${reqVO.locIdx}'==""){
				$('#num_1').attr("checked","checked");
			}
			if('${reqVO.reqIdx}'==""){
				$('#applicationWrite_2').hide();
				$('#preliVisitY').attr("checked","checked");
			}		
			
			//분야선택
			if('${schDiv}'==""){
				$('#schDiv_1').attr("selected","selected");
				$("#schDiv").val("1");
			}else{
				$("#schDiv").val("${schDiv}");
				clickDiv('${schDiv}');
			}			
			
			//신청 유형 
			if('${reqType}'==""){
				if('${fn:length(orgHasSch)}'> 0){
					location.href="/web/application/applicationWrite.do?schDiv=1&reqType=2&locIdx=${companySchemeVO.locIdx}";
				} else {
					$('#req_1').attr("checked","checked");
					$("#reqType").val("1");
				}
			}else {
				$("#reqType").val('${reqType}');
			}
			
			
			$('input[name=locChange]').on("click",function(){
				$('#locIdx').val($(this).val());
 				location.href = "/web/application/applicationWrite.do?locIdx="+$('#locIdx').val();
			});
			
			$('.date').datepicker({
				changeMonth : true,
				changeYear : true
			});
			$('.date').on("click",function(){
				$(this).datepicker('show');
			});
			
			//제출 서류 변경
			var number = 1;
			$('tr[class^=doc_]').each(function(){
				var reqType = $('#reqType').val();
				var classNm = $(this).attr("class");
				
				if(classNm.indexOf(reqType) == -1){
					$(this).children('td').children('p').children('input[type=text]').val('');
					$(this).children('td').children('p').children('input[type=file]').val('');
					$(this).children('td').children('p').children('input[type=text]').attr("required",false);
					$(this).hide();
				} else {
					$(this).children('td[id^=number_]').html(number);
					number++;
				}
			});
		});
		
		function deleteCookie(cookieName){
			var expireDate = new Date();
			expireDate.setDate( expireDate.getDate() - 1 );
			document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
		}
		
		
		
		
		//신청 유형 변경시
		$(document).on("change","input[name=reqType1]",function(){
			var reqType = $(this).val();
			var schDiv = $('#schDiv').val();
			var orgIdx = "${companySchemeVO.orgIdx}";
			var locIdx = "${companySchemeVO.locIdx}";
			
			//임시테이블 초기화
			$.ajax({
				type: "post",
				url: "/web/application/reqTempRemoveAjax.do",
				data:{
					orgIdx : orgIdx,
					locIdx : locIdx
				},
				async: false,
				success: function(data) {
					//현재 스크롤 기억
					var scroll = window.scrollY;
					setCookie("oldScroll",scroll,1);
					
					location.href="/web/application/applicationWrite.do?schDiv="+schDiv+"&reqType="+reqType+"&locIdx="+locIdx;
				},
				error: function(xhr, status, error) {
					alert("error");
				}
			});			
		});
		
		
		$(document).on("click","a[id^=srhFil]",function(){
			var idx = $(this).attr("id").split('_')[1];
			$('input[name=Doc'+idx+']').click();
		});
		
		$(document).on("change","input[type=file]", function(){
			var fileSplit = $(this).val().split('\\');
			var fileName = fileSplit[fileSplit.length -1];
			$(this).prev('input').val(fileName);
		});
		
		function submitReq(mode){
			if(mode=="temp"){
				if(confirm("인정신청 범위는 수정이 불가능합니다.\n저장 하시겠습니까?")){
					$('#reqStatus').val("T")//임시
					$("#frm").attr("action","/web/application/applicationInsert.do");
					$("#frm").submit();
				}
			} else if (mode=="tempUpdate"){
				if(confirm("임시 저장 하시겠습니까?")){
					$('#reqStatus').val("T")//임시
					$("#frm").attr("action","/web/application/applicationUpdate.do?reqIdx=${reqVO.reqIdx}");
					$("#frm").submit();
				}
			} else if (mode == "submit"){
				if(isSubmit()){
					$("#frm").attr("action","/web/application/applicationFinal.do?reqIdx=${reqVO.reqIdx}");
					$("#frm").submit();
				}
			} else if (mode == "del"){
				if(confirm("정말 인정신청 내용을 삭제하시겠습니까?")){
					$("#frm").attr("action","/web/application/RequestDelete.do?reqIdx=${reqVO.reqIdx}");
					$("#frm").submit();	
				}
			}	
		}
		
		
		//필수 체크
		function isSubmit(){
			var isPass = true;
			$("input[required]").each(function() {
				if(compactTrim($(this).val()) == "") {
					$(this).focus();
					alert("필수항목입니다. " + $(this).data("msg") + " 확인해주세요.");
					return isPass = false;
				}
			});
			
			//범위확대가 아닌경우 대바표체크
			if($('#reqType').val()!='4'){ 
				//문서대비표 체크
				if(isPass){
					var locIdx = '${companySchemeVO.locIdx}';
					var reqIdx = '${reqVO.reqIdx}';
					
					$.ajax({
						type: "post",
						url: "/web/application/reqDocChkAjax.do",
						data: {
							locIdx : locIdx,
							reqIdx : reqIdx
						},
						async: false,
						success: function(data) {
							var data = compactTrim(data).replace(/\n/gi,'');
							if(data == 'N'){
								$('#btn_reqDoc').focus();
								alert("문서대비표를 확인해주시고, 최종확인 버튼을 눌러주세요.");
								return isPass = false;
							}
						},
						error: function(xhr, status, error) {
							alert("error");
						}
					});
				}
			}
			
			function compactTrim(str) {
				return str.replace( /(\s*)/g, "" );
			}
			
			return isPass;
		}
		
		
		var schemeIdx;
		var schDiv = $('#schDiv').val();				// 인정분야
		var schCd; 				// 스킴 분류코드
		var schEn; 				// 스킴 영문
		var schEnPjt; 			// 스킴 영문 약자
		var schNm = "";
		var schCdType1 = "";	// 분류1 코드
		var schCdType2 = ""; 	// 분류2 코드
		var schCdType3 = ""; 	// 분류3 코드
		var schIdxType1 = "";	// 분류1 고유번호
		var schIdxType2 = "";   // 분류2 고유번호
		var schIdxType3 = "";   // 분류3 고유번호
		var reqType = $('#reqType').val(); //신청유형 

		// 인정분야 클릭
		function clickDiv(idx) {
			if(idx == null) {
				alert("잘못된 접근입니다.");
			} else {
				$("#div li a").removeClass("on");
				$("#div_"+idx).attr("class", "on");
				schDiv = $("#div_"+idx).data("idx");
				$('#schDiv').val(idx);
				reqType = $('#reqType').val();
				
				
				// 인정스킴 비우기
				$("#scheme").html("");
				// 분류1 비우기
				$("#schemeType1").html("");
				// 분류2 비우기
				$("#schemeType2").html("");
				// 분류3 비우기
				$("#schemeType3").html("");
				
				$.ajax({
					type: "post",
					url: "/web/application/orgSchemeAjaxList.do",
					data: {
						schParent : idx,
						schConfig : "SCH_DIV",
						reqType : reqType
					},
					async: false,
					success: function(data) {
						var html = "";
						var data = JSON.parse(data);
						if (data.length > 0) {
							for (var i = 0; i < data.length; i++) {
								html += '<li>';
								// 식품안전경영시스템은 뒤에 (영문추가)
								if(data[i].schIdx == "9" || data[i].schIdx == "10") {
									html += '	<a id="scheme_'+data[i].schIdx+'" href="javascript:clickScheme('+data[i].schIdx+');" data-idx="'+data[i].schIdx+'" data-cd="'+data[i].schCd+'" data-en="'+data[i].schEn+'" data-enpjt="'+data[i].schEnPjt+'">'+data[i].schNm+' ('+data[i].schEn+')</a>';
								} else {
									html += '	<a id="scheme_'+data[i].schIdx+'" href="javascript:clickScheme('+data[i].schIdx+');" data-idx="'+data[i].schIdx+'" data-cd="'+data[i].schCd+'" data-en="'+data[i].schEn+'" data-enpjt="'+data[i].schEnPjt+'">'+data[i].schNm+'</a>';
								}
								html += '</li>';
								$("#scheme").append(html);
								html = "";
							}
						} else {
							
						}
					},
					error: function(xhr, status, error) {
						alert("error");
					}
				});
			}
		}
		
		
		//인정스킴 클릭
		function clickScheme(idx) {
			var reqType= $('#reqType').val();
			if(reqType!="2"){
				if(idx == null) {
					alert("잘못된 접근입니다.");
				} else {
					
					$("#scheme li a").removeClass("on");
					$("#scheme_"+idx).attr("class", "on");
					schCd = $("#scheme_"+idx).data("cd");
					schEn = $("#scheme_"+idx).data("en");
					schEnPjt = $("#scheme_"+idx).data("enpjt");
					schemeIdx = $("#scheme_"+idx).data("idx");
					reqType = $('#reqType').val();
					
					// 분류 비우기
					$("#schemeType1").html("");
					$("#schemeType2").html("");
					$("#schemeType3").html("");
					
					$.ajax({
						type: "post",
						url: "/web/application/orgSchemeAjaxList.do",
						data: {
							schParent : idx,
							schConfig : "SCH_SCHEME",
							reqType : reqType
						},
						async: false,
						success: function(data) {
							var html = "";
							
							try{
								var data = JSON.parse(data);
									if (data.length > 0) {
										for (var i = 0; i < data.length; i++) {
											html += '<li>';
											if(data[i].depth2 == "5" || data[i].depth2 == "6" || data[i].depth2 == "13" || data[i].depth2 == "14") {
												html += '	<a id="scheme_type1_'+data[i].schIdx+'" href="javascript:clickSchemeType1('+data[i].schIdx+');" data-idx="'+data[i].schIdx+'" data-cd="'+data[i].schCd+'">'+data[i].schCd+' '+data[i].schNm+'</a>';
											} else {
												html += '	<a id="scheme_type1_'+data[i].schIdx+'" href="javascript:clickSchemeType1('+data[i].schIdx+');" data-idx="'+data[i].schIdx+'" data-cd="'+data[i].schCd+'">'+data[i].schNm+'</a>';
											}
											html += '</li>';
											$("#schemeType1").append(html);
											html = "";
										}
									} else {
										
									}	
							} catch (error) {
								var btnYn = data.replace(/\n/gi,'');
								$("#btnYn").val(btnYn);
							}
							
						},
						error: function(xhr, status, error) {
							alert("error");
						}
					});
				}
			} else {
				$("#scheme li a").removeClass("on");
				$("#scheme_"+idx).attr("class", "on");
				$.ajax({
					type: "post",
					url: "/web/application/tempSchemeChkAjax.do",
					data: {
						schParent : idx,
						locIdx : "${companySchemeVO.locIdx}",
						reqType : reqType
					},
					async: false,
					success: function(data) {
						var btnYn = data.replace(/\n/gi,'');
						$("#btnYn").val(btnYn);
					},
					error: function(xhr, status, error) {
						alert("error");
					}
				});
			}
			
		}
		
		function clickSchemeType1(idx) {
			if(idx == null) {
				alert("잘못된 접근입니다.");
			} else {
				reqType = $('#reqType').val();
				$("#schemeType1 li a").removeClass("on");
				$("#scheme_type1_"+idx).attr("class", "on");
				schNm = $("#scheme_type1_"+idx).text();
				schIdxType1 = $("#scheme_type1_"+idx).data("idx");
				schCdType1 = $("#scheme_type1_"+idx).data("cd");
				
				// 분류 비우기
				$("#schemeType2").html("");
				$("#schemeType3").html("");
				$.ajax({
					type: "post",
					url: "/web/application/orgSchemeAjaxList.do",
					data: {
						schParent : idx,
						orgIdx : "${companySchemeVO.orgIdx}",
						locIdx : "${companySchemeVO.locIdx}",
						schConfig : "SCH_TYPE_IDX_1",
						depthCheck : "Y",
						reqType : reqType
					},
					async: false,
					success: function(data) {
						var html = "";
						
						try {
							var data = JSON.parse(data);
							var schCdList = data[0].schCdList;
							if(schCdList[0]!=null){
								var schCdArr = schCdList[0].split(',');	
							}
							
							if (data.length > 0) {
								for (var i = 0; i < data.length; i++) {
									html += '<li>';
									
									// 식품안전경영시스템은 분류 3까지 노출
									if(data[i].depth2 == "9" || data[i].depth2 == "10") {
										// 식품안전겅영시스템에서 3분류 없는거
										if(data[i].depth3 == "89" || data[i].depth3 == "91" || data[i].depth3 == "92") {
											html += '	<input class="checkbox" type="checkbox" value="'+data[i].schCd+'" name="schemeType2" id="schemeType2_'+data[i].schIdx+'" data-idx="'+data[i].schIdx+'" data-cd="'+data[i].schCd+'"';
											
											if(data[0].schCdList[0] != null){
												if(reqType == '1' || reqType == '2' || reqType == '3' || reqType == '4'){
													for(var j=0;j<schCdArr.length;j++){
														if(data[i].schIdx == schCdArr[j]){
															if(reqType=='2'){
																html+='checked disabled';	
															} else {
																html+='disabled';
															}
														}
													}
												}	
											}
											
											html += '>';
											html += '	<label for="schemeType2_'+data[i].schIdx+'">'+data[i].schCd+' '+data[i].schNm+'</label>';
										} else {
											html += '	<a id="scheme_type2_'+data[i].schIdx+'" href="javascript:clickSchemeType2('+data[i].schIdx+');" data-idx="'+data[i].schIdx+'" data-cd="'+data[i].schCd+'">'+data[i].schNm+'</a>';
										}
									} else {
										html += '	<input class="checkbox" type="checkbox" value="'+data[i].schCd+'" name="schemeType2" id="schemeType2_'+data[i].schIdx+'" data-idx="'+data[i].schIdx+'" data-cd="'+data[i].schCd+'"';
										if(data[0].schCdList[0] != null){
											if(reqType == '1' || reqType == '2' || reqType == '3' || reqType == '4'){
												for(var j=0;j<schCdArr.length;j++){
													if(data[i].schIdx == schCdArr[j]){
														if(reqType=='2'){
															html+='checked disabled';	
														} else {
															html+='disabled';
														}
													}
												}
											}	
										}
										
										html += '>';
										if(schDiv == '1'){
											html += '	<label for="schemeType2_'+data[i].schIdx+'">'+data[i].schCd+' '+data[i].schNm+'</label>';	
										}else{
											html += '	<label for="schemeType2_'+data[i].schIdx+'">'+data[i].schNm+'</label>';	
										}
										
									}
									html += '</li>';
									$("#schemeType2").append(html);
									
									html = "";
								}
							} else {
								
							}
						} catch (error) { 
							var btnYn = data.replace(/\n/gi,'');
							$("#btnYn").val(btnYn);
						}
						
						
						
						
						
					},
					error: function(xhr, status, error) {
						alert("error");
					}
				});
			}
		}
		
		
		// 분류 2 클릭
		function clickSchemeType2(idx) {
			if(idx == null) {
				alert("잘못된 접근입니다.");
			} else {
				
				$("#schemeType2 li a").removeClass("on");
				$("#scheme_type2_"+idx).attr("class", "on");
				schNm = $("#scheme_type2_"+idx).text();
				schIdxType2 = $("#scheme_type2_"+idx).data("idx");
				schCdType2 = $("#scheme_type2_"+idx).data("cd");
				reqType = $('#reqType').val();
				
				// 분류 비우기
				$("#schemeType3").html("");
				
				$.ajax({
					type: "post",
					url: "/web/application/orgSchemeAjaxList.do",
					data: {
						schParent : idx,
						schConfig : "SCH_TYPE_IDX_2",
						reqType : reqType
					},
					async: false,
					success: function(data) {
						var html = "";
						
						
						try { 
							var data = JSON.parse(data);
							var schCdList = data[0].schCdList;
							if(schCdList[0]!=null){
								var schCdArr = schCdList[0].split(',');	
							}
							
							if (data.length > 0) {
								for (var i = 0; i < data.length; i++) {
									html += '<li>';
									html += '	<input class="checkbox" type="checkbox" value="'+data[i].schCd+'" name="schemeType3" id="schemeType3_'+data[i].schIdx+'" data-idx="'+data[i].schIdx+'" data-cd="'+data[i].schCd+'"';
									
									if(data[0].schCdList[0] != null){
										if(reqType == '1' || reqType=='2' || reqType == '3' || reqType == '4'){
											for(var j=0;j<schCdArr.length;j++){
												if(data[i].schIdx == schCdArr[j]){
													if(reqType=='2'){
														html+='checked disabled';	
													} else {
														html+='disabled';
													}
												}
											}
										}	
									}
									
									html += '>';
									html += '	<label for="schemeType3_'+data[i].schIdx+'">'+data[i].schCd+' '+data[i].schNm+'</label>';
									html += '</li>';
									$("#schemeType3").append(html);
									html = "";
								}
							} else {
								
							}
						} catch (error) { 
							var btnYn = data.replace(/\n/gi,'');
							$("#btnYn").val(btnYn);
						}
					},
					error: function(xhr, status, error) {
						alert("error");
					}
				});
			}
		}
		
		// 범위 추가
		function fnAdd() {
			if($('#btnYn').val()=="N"){
				alert("이미 신청중이거나 보유중인 스킴입니다.");
				return false;
			}
			var reqType = $('#reqType').val();
			if(reqType!='2'){
				// 분류 2 (분류 3 이 없을때)
				if($("input:checkbox[name='schemeType3']:checked").length == 0) {
					$("input:checkbox[name='schemeType2']:checked").each(function() {
						schCdType2 = schCdType2 + $(this).val() + ",";
						schIdxType2 = schIdxType2 + $(this).data("idx") + ",";
					});
					
					schCdType2 = schCdType2.substring(0, schCdType2.length -1);
					schIdxType2 = schIdxType2.substring(0, schIdxType2.length -1);
				}

				// 분류 3
				if($("input:checkbox[name='schemeType3']:checked").length > 0) {
					$("input:checkbox[name='schemeType3']:checked").each(function() {
						schCdType3 = schCdType3 + $(this).val() + ",";
						schIdxType3 = schIdxType3 + $(this).data("idx") + ",";
					});
					
					schCdType3 = schCdType3.substring(0, schCdType3.length -1);
					schIdxType3 = schIdxType3.substring(0, schIdxType3.length -1);
					
				}
				
				var schFullName = "";
				schDiv = $('#schDiv').val();
				
				// 분류2, 분류3 없을때
				if(schCdType2 == "" && schCdType3 == "") {
					// 인정스킴 하부(분류1) 없을때
					if(schNm == "") {
						schFullName = schEn;
					// 인정스킴 하부(분류1) 있을때
					} else {
						schFullName = schEn + " : " + schNm ;
					}
				// 분류 2
				} else if(schCdType2 != "" && schCdType3 == "") {
					schFullName = schEn + " : " + schNm + "(" +schCdType2+ ")";
				// 분류 3
				} else {
					schFullName = schEn + " : " + schNm + "(" +schCdType3+ ")";
					schIdxDepth2 = schIdxType2;
				}
				
				$.ajax({
					type: "post",
					url: "/web/application/tempSchemeInsertAjax.do",
					data: {
						orgIdx : "${companySchemeVO.orgIdx}",
						locIdx : "${companySchemeVO.locIdx}",
						reqType : reqType,
						schDiv : schDiv,  
						schScheme : schemeIdx,
						schType1 : schCdType1,
						schType2 : schCdType2,
						schType3 : schCdType3,
						schTypeIdx1 : schIdxType1, 
						schTypeIdx2 : schIdxType2, 
						schTypeIdx3 : schIdxType3, 
						schFullName : schFullName,
					},
					async: false,
					success: function(data) {
						var result = JSON.parse(data);
						schFullName += '<button class="sm_del" onclick="fnDelete(\''+result.idx+'\', \'\', \''+schemeIdx+'\')"></button><br>';
						$(".cate_range").append(schFullName);
						
						schemeIdx = "";
						schIdxType1 = "";
						schIdxType2 = "";
						schIdxType3 = "";

						schNm = "";
						schCd = ""; // 스킴 분류코드
						schEn = ""; // 스킴 영문
						schCdType1 = ""; // 분류1 코드
						schCdType2 = ""; // 분류2 코드
						schCdType3 = ""; // 분류3 코드
						schIdxType1 = ""; // 분류1 고유번호
						schIdxType2 = ""; // 분류2 고유번호
						schIdxType3 = ""; // 분류3 고유번호
						
						//초기화
						$("#schemeType1").html("");
						$("#schemeType2").html("");
						$("#schemeType3").html("");
						$("#scheme li a").removeClass("on");
						
						//현재 스크롤 기억
						var scroll = window.scrollY;
						setCookie("oldScroll",scroll,1);
						
						location.reload();
						
					},
					error: function(xhr, status, error) {
						alert("error");
					}
				});
			} else {  //갱신신청일 때 
				//ajax로 얻은 idx의 스킴을 기관보유 스킴에서 찾아서 실사용테이블에 인서트후 목록 추가 
				//페이지 리로드
				var schIdx = $('#scheme').find('.on').attr('data-idx'); 
				$.ajax({
					type: "post",
					url: "/web/application/renewalSchemeInsertAjax.do",
					data: {
						locIdx : "${companySchemeVO.locIdx}",
						reqType : reqType,
						schDiv : schDiv,  
						schIdx : schIdx
					},
					async: false,
					success: function(data) {
						/* var result = JSON.parse(data);
						schFullName += '<button class="sm_del" onclick="fnDelete(\''+result.idx+'\', \'\', \''+schemeIdx+'\')"></button><br>';
						$(".cate_range").append(schFullName); */
						
						schIdx = "";
						schDiv = "";
						
						$("#scheme li a").removeClass("on");
						
						//현재 스크롤 기억
						var scroll = window.scrollY;
						setCookie("oldScroll",scroll,1);
						
						location.reload();
						
					},
					error: function(xhr, status, error) {
						alert("error");
					}
				});
			}
			
			
		} 
		
		// 스킴 삭제 Ajax (갱신신청시)
		function fnRenewalDelete(schScheme) {
			
			if(confirm("삭제하시겠습니까?")) {
				if(schScheme == "") {
					alert("잘못된 요청 입니다.");
				} else {
					$.ajax({
						type: "post",
						url: "/web/application/fnRenewalDelete.do",
						data: {
							schScheme : schScheme,
							locIdx : "${companySchemeVO.locIdx}"
						},
						async: false,
						success: function(data) {
							alert("정상적으로 삭제되었습니다.");
							
							//현재 스크롤 기억
							var scroll = window.scrollY;
							setCookie("oldScroll",scroll,1);
							
							location.reload();
						},
						error: function(xhr, status, error) {
							alert("error");
						}
					});
				}
			}
		}
		
		// 스킴 삭제 Ajax (임시테이블 내용 삭제시)
		function fnTempDelete(schArr, stanIdx, scheme) {
			
			if(confirm("삭제하시겠습니까?")) {
				if(schArr == "") {
					alert("잘못된 요청 입니다.");
				} else {
					$.ajax({
						type: "post",
						url: "/web/application/tempSchemeDeleteAjax.do",
						data: {
							schArr : schArr,
							schStanIdx : stanIdx,
							schScheme : scheme,
							orgIdx : "${companySchemeVO.orgIdx}",
							locIdx : "${companySchemeVO.locIdx}"
						},
						async: false,
						success: function(data) {
							alert("정상적으로 삭제되었습니다.");
							
							//현재 스크롤 기억
							var scroll = window.scrollY;
							setCookie("oldScroll",scroll,1);
							
							location.reload();
						},
						error: function(xhr, status, error) {
							alert("error");
						}
					});
				}
			}
		}
		
		// 스킴 삭제 Ajax (실제 테이블 내용 삭제시)
		function fnDelete(schArr, stanIdx, scheme) {
			if(confirm("삭제하시겠습니까?")) {
				if(schArr == "") {
					alert("잘못된 요청 입니다.");
				} else {
					$.ajax({
						type: "post",
						url: "/web/application/SchemeDeleteAjax.do",
						data: {
							schArr : schArr,
							schStanIdx : stanIdx,
							schScheme : scheme,
							reqIdx : "${reqVO.reqIdx}",
							orgIdx : "${companySchemeVO.orgIdx}",
							locIdx : "${companySchemeVO.locIdx}"
						},
						async: false,
						success: function(data) {
							alert("정상적으로 삭제되었습니다.");
							
							//현재 스크롤 기억
							var scroll = window.scrollY;
							setCookie("oldScroll",scroll,1);
							
							location.reload();
						},
						error: function(xhr, status, error) {
							alert("error");
						}
					});
				}
			}
		}
		
		//파일 삭제
		function ajaxDelFile(fileIdx){
			if(confirm("삭제하시겠습니까?")) {
				if(fileIdx == "") {
					alert("잘못된 요청 입니다.");
				} else {
					$.ajax({
						type: "post",
						url: "/web/application/ajaxDelFile.do",
						data: {
							filIdx : fileIdx								
						},
						async: false,
						success: function(data) {
							alert("정상적으로 삭제되었습니다.");
							
							//현재 스크롤 기억
							var scroll = window.scrollY;
							setCookie("oldScroll",scroll,1);
							
							location.reload();
						},
						error: function(xhr, status, error) {
							alert("error");
						}
					});
				}
			}
		}
		
		function gotoDoc(){
			if(confirm('저장하지 않은 내용은 사라집니다.\n계속 진행하시겠습니까?')){
				$('#frm').attr("action","/web/application/docRegister.do?reqIdx=${reqVO.reqIdx}");
				$('#frm').submit();
			}
		}
	</script>
</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp"%>
		<%@include file="../_inc/smn01.jsp"%>


		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
				<h2>인정신청</h2>
				<ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인정관리</li>
					<li>인정신청</li>
				</ol>
			</div>
			
			<div class="attention overflow">
				<p class="f_l">입력된 정보와 현재 정보가 상이할 경우 반드시 <b>기본정보 수정 후 인정신청을 진행</b>해 주세요.</p>
				<p class="f_r"><a class="sm_red" href="/web/joinInfo.do">기본정보 수정</a></p>
			</div>

			<h4>일반정보</h4>
			<form name="frm" id="frm" autocomplete="off" method="post" encType="multipart/form-data">
			<input type="hidden" name="locIdx" id="locIdx" value="${reqVO.locIdx}">
			<input type="hidden" name="pjtScheme" id="pjtScheme">
			<input type="hidden" name="pjtId" id="pjtId">
			<input type="hidden" id="schDiv" name="schDiv" value="${schDiv}">
			<input type="hidden" id="reqType" name="reqType" value="${reqType}">
			
			
			<table class="table02" summary="일반정보 입력">
				<caption>일반정보 입력</caption>
				<colgroup><col width="15%"><col width="10%"><col width="15%"><col width="10%"><col width="15%"><col width="10%"><col width="10%"><col width="*"></colgroup>
				<tbody>
					<tr>
						<th scope="row" rowspan="2">신청기관 법인명칭</th>
						<th class="sub_th">국문</th>
						<td colspan="2">${resultCompVO.orgNmKr}</td>
						<th scope="row">사업자등록번호</th>
						<td colspan="3">${resultCompVO.bsnsNo}</td>
					</tr>
					<tr>
						<th class="sub_th">영문</th>
						<td colspan="2">${resultCompVO.orgNmEn}</td>
						<th scope="row">대표전화</th>
						<td colspan="3">${resultCompVO.telNo}</td>
					</tr>
					<tr>
						<th scope="row">대표자</th>
						<td colspan="3">${resultCompVO.ceoNm}</td>
						<th scope="row">홈페이지</th>
						<td colspan="3">${resultCompVO.homepage}</td>
					</tr>
					<tr>
						<th scope="row">설립근거</th>
						<td colspan="3">${resultCompVO.foundedRef}</td>
						<th scope="row">설립일</th>
						<td colspan="3">${resultCompVO.foundedDate}</td>
					</tr>
					<tr>
						<th scope="row">담당자</th>
						<th class="sub_th">성명(직책)</th>
						<td>${resultCompVO.personNm}(${resultCompVO.personPosition})</td>
						<th class="sub_th">전화</th>
						<td>${resultCompVO.personTelNo}</td>
						<th class="sub_th">이메일</th>
						<td colspan="2">${resultCompVO.personEmail}</td>
					</tr>
				</tbody>
			</table>


			<h4>사업장 정보</h4>
			<table class="table02" summary="주사업장 이외의 사업장 정보">
			<caption>주사업장 이외의 사업장 정보</caption>
			<colgroup>
				<c:if test="${reqVO.reqIdx eq '' }">
					<col width="7%">
					<col width="8%">
				</c:if>
				<col width="20%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<c:if test="${reqVO.reqIdx eq '' }">
						<th>선택</th>
						<th>No</th>
					</c:if>
					<th>소재지명</th>
					<th>소재지</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${resultCompLocList}" varStatus="stat">
					<tr>
					<c:if test="${reqVO.reqIdx eq '' }">
						<td class="ra_base" style="padding:10 0 29 28;">
							<input type="radio" id="num_${stat.count}" name="locChange" value="${item.locIdx}" <c:if test="${reqVO.locIdx eq item.locIdx}">checked</c:if>>
							<label for="num_${stat.count}" class="f_0"></label>
						</td>
						<td class="c">${stat.count}</td>
					</c:if>
						<td class="c">${item.locNm}</td>
						<td class="c">${fn:replace(item.adrKr,'|',' ')}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<c:if test="${reqVO.reqIdx eq ''}">
			<h4>인정신청 범위 선택</h4>
			<table class="table02" summary="인정신청 범위 선택">
				<caption>인정신청 범위 선택</caption>
				<colgroup><col width="130px"><col width="220px"><col width="*"></colgroup>
				<tbody>
					<tr>
						<th colspan="2">적합성평가기관의 경영시스템에 대한 선택사항</th>
						<td class="sel">
								<select id="schDiv1" style="width:200px" name="schDiv1" onChange="clickDiv(this.value);">
									<c:forEach var="item" items="${codeSchemeList}" varStatus="stat">
										<c:if test="${item.schParent eq '0'}">
											<option id="schDiv_${stat.count}" value="${item.schIdx}" <c:if test="${companySchemeVO.schDiv eq item.schIdx }">selected</c:if>>${item.schNm}</option>
										</c:if>
									</c:forEach>
								</select>
						</td>				
					</tr>
					<tr>
						<th>신청유형</th>
						<td colspan="2" class="ra_base">
							<c:forEach var="item" items="${req_type}" varStatus="stat">
								<c:choose>
									<c:when test="${fn:length(orgHasSch) > 0 }">
										<c:if test="${item.cdVal2 ne '1' }">
											<input type="radio" id="req_${stat.count}" name="reqType1" value="${item.cdVal2}" <c:if test="${item.cdVal2 eq reqVO.reqType }">checked</c:if>>
											<label for="req_${stat.count}" class="mr15">${item.cdName2}</label>
										</c:if>
									</c:when>
									<c:otherwise>
										<input type="radio" id="req_${stat.count}" name="reqType1" value="${item.cdVal2}" <c:if test="${item.cdVal2 eq reqVO.reqType }">checked</c:if>>
										<label for="req_${stat.count}" class="mr15">${item.cdName2}</label>
									</c:otherwise>
								</c:choose>
								
									
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>기존 인정범위</th>
						<td colspan="2" class="ra_base">
							<table class="table02" summary="기존인정범위">
								<caption>기존인정범위</caption>
								<colgroup><col width="130px"><col width="*"></colgroup>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(resultListFinal) > 0 }">
											<c:forEach var="item" items="${resultListFinal}">
												<tr>
													<td class="c">${item.schEn}</td>
													<td><c:if test="${not empty item.schFullNameStuff}">${item.schFullNameStuff }</c:if></td>	
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr class="c">
												<td colspan="2">기존인정정보가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<th rowspan="2">신청범위<span class="star">*</span></th>
						<td class="overflow" colspan="2" id="reqRange">
							<div class="cate_wrap" style="width:100%;" id="addSch">
								<div class="category">
									<p class="tt">인정스킴</p>
									<ul id="scheme">
										<c:forEach var="item" items="${codeSchemeList }">
											<c:if test="${item.schParent eq '1' }">
												<c:choose>
													<c:when test="${item.schIdx eq '9' or item.schIdx eq '10' }">
														<li><a id="scheme_${item.schIdx }" href="javascript:clickScheme('${item.schIdx }');" data-cd="${item.schCd }" data-en="${item.schEn }" data-idx="${item.schIdx }" data-enpjt="${item.schEnPjt }">${item.schNm }(${item.schEn })</a></li>	
													</c:when>
													<c:otherwise>
														<li><a id="scheme_${item.schIdx }" href="javascript:clickScheme('${item.schIdx }');" data-cd="${item.schCd }" data-en="${item.schEn }" data-idx="${item.schIdx }" data-enpjt="${item.schEnPjt }">${item.schNm }</a></li>	
													</c:otherwise>
												</c:choose>				
											</c:if>
										</c:forEach>
									</ul>
								</div>

								<div class="category02">
									<p class="tt">분류1</p>
									<ul class="cate_sel" id="schemeType1">
									</ul>	
								</div>

								<div class="category02">
									<p class="tt">분류2</p>
									<ul class="cate_sel" id="schemeType2">
									</ul>	
								</div>

								<div class="category02">
									<p class="tt">분류3</p>
									<ul class="cate_sel" id="schemeType3">
									</ul>	
								</div>
								<p class="cate_btn">
									<input type="hidden" id="btnYn" value="Y">
									<a href="javascript:fnAdd();" class="sm_plus">신청범위 추가</a>
								</p>
							</div>
						
						</td>
					</tr>
					<tr>
					<c:choose>
						<c:when test="${reqType eq '2' }">
							<td colspan="2" id="resultView">
								<c:if test="${fn:length(resultListTempFinal) > 0 }">
									<c:forEach var="item" items="${resultListTempFinal}">
										<p class="cate_range">${item.schEn}<c:if test="${not empty item.schFullNameStuff}"> : ${item.schFullNameStuff}</c:if><button class="sm_del" onclick="fnRenewalDelete('${item.schScheme}')"></button></p>
									</c:forEach>
								</c:if>
							</td>
						</c:when>
						<c:otherwise> 
							<td colspan="2" id="resultView">
								<c:set var="schemeChk1" value="N"/>
								<c:set var="schemeChk2" value="N"/>
								<c:if test="${reqVO.reqIdx ne '' }">
									<c:if test="${fn:length(reqSchemeList) > 0}"> <!-- 실사용테이블내용 -->
										<c:forEach var="item" items="${reqSchemeList}">
											<c:set var="schemeChk1" value="Y"/>
											<p class="cate_range">${item.schFullName }<button class="sm_del" onclick="fnDelete('${item.schFullIdx}', '${item.schStanIdx }', '')"></button></p>
										</c:forEach>
									</c:if>
								</c:if>
								<c:if test="${fn:length(resultTempList) > 0 }"> <!-- 임시테이블내용 -->
									<c:forEach var="item" items="${resultTempList }">
										<c:set var="schemeChk2" value="Y"/>
										<p class="cate_range">${item.schFullName }<button class="sm_del" onclick="fnTempDelete('${item.schFullIdx}', '${item.schStanIdx }', '')"></button></p>
									</c:forEach>
								</c:if>
							</td>
						 </c:otherwise>
					</c:choose>
					</tr>
				</tbody>
			</table>
		</c:if>
		<c:if test="${reqVO.reqIdx ne ''}">
			<h4>인정신청 범위 선택</h4>
			<table class="table02" summary="인정신청 범위 선택">
				<caption>인정신청 범위 선택</caption>
				<colgroup><col width="130px"><col width="220px"><col width="*"></colgroup>
				<tbody>
					<tr>
						<th colspan="2">적합성평가기관의 경영시스템에 대한 선택사항</th>
						<td class="sel">
							<c:choose>
								<c:when test="${resultReqVO.reqType eq '2' }">
									${renewalSchFinal[0].schDiv}
								</c:when>	
								<c:otherwise>
									${resultReqSchemeInfo.schCd}
								</c:otherwise>
							</c:choose>
						</td>				
					</tr>
					<tr>
						<th>신청유형</th>
						<td colspan="2">
							<c:forEach var="item" items="${req_type}" varStatus="stat">
								<c:if test="${item.cdVal2 eq resultReqVO.reqType }">${item.cdName2}</c:if>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th rowspan="2">최종신청범위</th>
						<td class="overflow" colspan="2">
							<c:forEach var="item" items="${resultReqSchemeFullName}" varStatus="stat">
								<c:choose>
									<c:when test="${item.schFullNameStuff ne null}">
										${item.schEn} : ${item.schFullNameStuff}
										<c:if test="${fn:length(item) ne stat.index}"><br></c:if>
									</c:when>
									<c:otherwise>
										${item.schEn}<c:if test="${fn:length(item) ne stat.index}"><br></c:if>
									</c:otherwise>
								</c:choose>
							</c:forEach>	
						</td>
					</tr>
				</tbody>
			</table>
		</c:if>
			
		<div id="applicationWrite_2">
			<h4>평가 희망사항</h4>
			<table class="table02" summary="평가 희망사항">
				<caption>평가 희망사항</caption>
				<colgroup><col width="18%"><col width="14%"><col width="16%"><col width="14%"><col width="*"><col width="14%"></colgroup>
				<tbody>
					<tr>
						<th>KAB의 예비 방문 희망여부</th>
						<td colspan="5" class="ra_base">
							<input type="radio" id="preliVisitY" name="preliVisit" value="Y" <c:if test="${resultReqVO.preliVisit eq 'Y' }">checked="checked"</c:if>>
							<label for="preliVisitY" class="mr15">희망함</label>
							<input type="radio" id="preliVisitN" name="preliVisit" value="N" <c:if test="${resultReqVO.preliVisit eq 'N' }">checked="checked"</c:if>>
							<label for="preliVisitN" class="mr15">희망하지않음</label>
						</td>				
					</tr>
					<tr>
						<th>문서평가 희망시기</th>
						<td class="c">
							<c:choose>
								<c:when test="${reqVO.reqType eq '4'}">-
									<input type="hidden" value="-" name="docEval">
								</c:when>
								<c:otherwise>
									<input class="date" id="docEval" name="docEval" type="text" value="${resultReqVO.docEval}" data-msg="문서평가 희망시기를" readonly required>
								</c:otherwise>
							</c:choose>
							
						</td>				
						<th>사무소평가 희망시기</th>
						<td>
							<input class="date" id="OffEval" name="OffEval" type="text" value="${resultReqVO.offEval}" data-msg="사무소평가 희망시기를" readonly required>
						</td>				
						<th>인정결정 및 인정서 발행 희망시기</th>
						<td>
							<input class="date" id="certiIssue" name="certiIssue" type="text" value="${resultReqVO.certiIssue}" data-msg="인정결정 및 인정서 발행 희망시기를" readonly required>
						</td>	
					</tr>
				</tbody>
			</table>
			
			<h4>제출 필요서류</h4>
			<%-- <table class="table02 info" summary="제출 필요 서류 신청유형">
				<caption>제출 필요 서류 신청유형</caption>
				<colgroup><col width="18%"><col width="*"></colgroup>
				<tbody>
					<tr>
						<th>신청유형</th>
						<td>최초인정</td>				
					</tr>
				</tbody>
			</table> --%>
			<table class="table02"  summary="제출 필요 서류">
				<caption>제출 필요 서류</caption>
				<colgroup><col width="10%"><col width="25%"><col width="15%"><col width="15%"><col width="*"></colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>필요서류</th>
						<th>양식</th>
						<th>양식 다운로드</th>
						<th>첨부</th>
					</tr>
				</thead>
				<tbody id="submitDoc">				
					<c:forEach var="reqDoc" items="${reqDoc}" varStatus="stat">
						<c:set var="listLen" value="${fn:length(reqDoc)}"/>
						<tr class="doc_${reqDoc.etc}">
							<td class="c" id="number_${stat.count}">${1}</td>							<!-- 순번 -->
							<td class="l">${reqDoc.cdName2 }</td> 									<!-- 필요서류 -->
							<td class="c"> 															<!-- 양식 -->
								<c:choose>
									<%-- <c:when test="${reqDoc.cdVal2 eq '2' }">KAB-AM-F01</c:when> --%>
									<c:when test="${reqDoc.cdVal2 eq '5' }">KAB-AM-F02</c:when>
									<c:when test="${reqDoc.cdVal2 eq '6' }">KAB-AM-F03</c:when>
									<c:when test="${reqDoc.cdVal2 eq '11' }">KAB-AM-F05</c:when>
									<%-- <c:when test="${reqDoc.cdVal2 eq '12' }">KAB-AM-F06</c:when> --%>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</td>
							<td class="c"> 															<!-- 양식다운로드 -->
								<c:choose>
									<c:when test="${reqDoc.cdVal2 eq '5'or reqDoc.cdVal2 eq '6' or reqDoc.cdVal2 eq '11' or reqDoc.cdVal2 eq '12'}">
										<c:if test="${reqDoc.cdVal2 eq '5'}">
											<a href="/upload/applyDoc/KAB-AM-F02%20신청기관%20현황%20및%20사업계획서.docx" class="sm_line">다운로드</a>
										</c:if>
										<c:if test="${reqDoc.cdVal2 eq '6'}">
											<a href="/upload/applyDoc/KAB-AM-F03%20인정범위%20별%20인적자원%20확보%20현황.docx" class="sm_line">다운로드</a>
										</c:if>
										<c:if test="${reqDoc.cdVal2 eq '11'}">
											<a href="/upload/applyDoc/KAB-AM-F05%20인정기준%20및%20인정절차%20준수서약서.docx" class="sm_line">다운로드</a>
										</c:if>
										<c:if test="${reqDoc.cdVal2 eq '12'}">
											<a href="javascript:gotoDoc();" id="btn_reqDoc" class="sm_blue">문서대비표 작성</a>
										</c:if>		
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose>
								
							</td>
							<td class="files" id="td_${reqDoc.cdVal2}"> 							<!-- 파일첨부 -->
								<c:if test="${reqDoc.cdVal2 ne '12'}">
									<c:set var="chk" value="0"/>
									<c:forEach var="item" items="${fileList}">
										<c:if test="${fn:split(item.filPath,'Doc')[0] eq stat.index}">
											<c:set var="chk" value="1"/>
											<p>
												<c:url value="/fileDownload.do" var="fileUrl">
													<c:param name="srvFile" value="${item.filSvrName}" />
													<c:param name="usrFile" value="${item.filUsrName}" />
													<c:param name="folder" value="${item.filPath}" />
												</c:url>
												<a href="${fileUrl}" target="_blank" class="file"><span class="ti-clip"></span>${item.filUsrName}</a>
												<button class="sm_del" onClick="ajaxDelFile('${item.filIdx}')"></button>
											</p>
										</c:if>
									</c:forEach>
									<c:if test="${chk eq '0'}">
										<c:choose>
											<c:when test="${reqVO.reqType eq '4' and stat.count eq 2}">-</c:when>
											<c:when test="${reqVO.reqType eq '5' and stat.count eq 6}">-</c:when>
											<c:otherwise>
												<p class="upload">
													<a href="javascript:void(0);" id="srhFil_${stat.index}" class="sm_line">파일검색</a>
													<input class="file" type="text" placeholder="등록된 파일 없음" data-msg="서류 제출을" readonly required>
													
													<input type="file" name="Doc${stat.index}" style="display:none;">									
												</p>
											</c:otherwise>
										</c:choose>
												
									</c:if> 
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<p class="mt10"> 상기의 인정신청정보는 사실과 다름이 없음을 확인하며, 신청기관의 권한 있는 대표자 또는 권한을 위임 받은 책임자의 명의로 적합성평가기관 인정매뉴얼(KAB-AM-CAB) 4.2에 따라 한국인정지원센터(KAB)의 인정을 신청합니다.</p>
				
			<div class="repre_area mt25">
				<dl class="repre_cont">
				  <dt>신청일</dt>
				  <dd>
				  	<input type="hidden" name="reqDate" id="reqDate" value="${today}">
					<span>${fn:split(today,'-')[0]}</span>
					<span>년</span>
					<span>${fn:split(today,'-')[1]}</span>
					<span>월</span>
					<span>${fn:split(today,'-')[2]}</span>
					<span>일</span>
				  </dd>
				</dl>
				<dl class="repre_cont">
				  <dt>성명</dt>
				  <dd>
				  	<c:choose>
				  		<c:when test="${reqVO.reqStatus eq 'Y' }">
				  			<span>${resultReqVO.reqName}</span>
				  		</c:when>
				  		<c:otherwise>
				  			<input class="c w300" id="reqName" name="reqName" type="text" value="${resultReqVO.reqName}" style="ime-mode:active;" data-msg="성명을" required>
				  		</c:otherwise>
				  	</c:choose>					
				  </dd>
				</dl>
			</div>
		</div>

			<p class="btn_area">
				<input type="hidden" name="reqStatus" id="reqStatus">
				<!-- <a href="#" class="btn_del">취소</a> -->
						<a href="/web/application/applicationList.do" class="l btn_list">목록</a>
				<c:choose>
					<c:when test="${reqVO.reqIdx eq ''}">
						<a href="javascript:submitReq('temp');" class="btn_submit">저장</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:submitReq('submit');" class="l btn_submit" style="margin-left:10;">인정 신청</a>
						<a href="javascript:submitReq('del');" class="l btn_del" style="margin-left:10;">삭제</a>
						<a href="javascript:submitReq('tempUpdate');" class="btn_line">임시저장</a> 
					</c:otherwise>
				</c:choose>
	 			<!-- <a href="notice.html" class="btn_list">목록</a> -->
			</p>
		</form>
	</div>
		<%@include file="../_inc/footer.jsp"%>
	</div>
</body>

</html>