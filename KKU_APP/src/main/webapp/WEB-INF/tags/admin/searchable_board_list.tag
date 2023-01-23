<%@tag description="Default Admin Template" pageEncoding="UTF-8"%>

<!-- 테그 속성 -->

<%@attribute name="head_area" fragment="true" required="false" %>
<%@attribute name="meta_area" fragment="true" %>

<%@attribute name="search_urls" %>
<%@attribute name="search_options" fragment="true" %>
<%@attribute name="search_range_name" %>
<%@attribute name="search_condition_name" %>
<%@attribute name="search_keyword_placeholder" %>

<%@attribute name="body_area" fragment="true" %>
<%@attribute name="script_area" fragment="true" required="false" %>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<%@include file="../../jsp/kkuapp/adm/_inc/title.jsp"%>
		<style>
			table.tb_search th {
				width:auto;
			}
			table.tb_search td {
				width:auto;
			}
			table.tb_search div.search_list select {
				width:auto;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<%@include file="../../jsp/kkuapp/adm/_inc/header.jsp"%>
			<div id="container">
				<%@include file="../../jsp/kkuapp/adm/_inc/left.jsp"%>
				<div id="contents">
					<div class="cont_top">
						<jsp:invoke fragment="meta_area"/>
					</div>
					<div class="cont_view max_width pt0">
						<form name="schFrm" id="schFrm" method="get" autocomplete="off" action="<c:url value='${search_urls }'/>">
							<input type="hidden" name="pageIndex" id="pageIndex" value="" />
							<div class="t_search" style="margin-top: 10px;  /* margin-left: 20px; */"> <!-- 검색 인풋이 없는 경우 -->
								<table class="tb_search" summary="항목구분영역">
									<caption>항목별 검색영역</caption>
										<colgroup>
											<col width="8%">
											<col width="15%">
											<col width="8%">
											<col width="30%">
											<col width="auto">
										</colgroup>
										<tbody>
										<tr>
											<th scope="row">${search_condition_name }</th>
											<td>
												<div class="search_list">
													<select name="searchCondition">
														<jsp:invoke fragment="search_options"/>
													</select>
												</div>
											</td>
											<th scope="row">${search_range_name }</th>
											<td >
												<input name="searchSdate" class="w100 date" id="searchSdate"  type="text" placeholder="시작일" value="${vo.searchSdate}" readonly="readonly" /><!-- 
												 --><a href="javascript:void(0);" onclick="$('#searchSdate').focus()" class="cal f_0 scal">시작 날짜선택</a>
												<span class="hyphen">~</span>
												<input name="searchEdate" class="w100 date" id="searchEdate"  type="text" placeholder="종료일" value="${vo.searchEdate}" readonly="readonly"/><!-- 
												 --><a href="javascript:void(0);" onclick="$('#searchEdate').focus()" class="cal f_0 scal">종료 날짜선택</a>
											</td>
											<td class="ra_base" colspan="3" >
											<div style="margin-left: 35px;" >
												<input style="width:100%"type="text" class="search_box" name="searchKeyword" id="searchKeyword" value="${vo.searchKeyword}" placeholder="${search_keyword_placeholder }"><!--
												--><a href="javascript:void(0)" class="search_btn f_0" id="schButton">검색하기</a>
												<label class="f_0" for="search_box">검색어를 입력해주세요</label>
											</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- <p class="btn_area">
								<a href="javascript:void(0);" id="excelDown" class="btn_excel">엑셀 다운로드</a>
							</p>	 -->
							<jsp:invoke fragment="body_area"/>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../../jsp/kkuapp/adm/_inc/footer.jsp"%>
	
		<div id="script">
			<script>
				$(document).on("click", "#schButton", function() {
					$("#pageIndex").val('1');
					$("#schFrm").submit();
				});
				$('#searchKeyword').on("keyup", function(key) {
					if(key.keyCode==13){
						$("#pageIndex").val('1');
						$("#schFrm").submit();
					}
				});
				$.datepicker.setDefaults({
				    dateFormat: 'yy-mm-dd',
				    prevText: '이전 달',
				    nextText: '다음 달',
				    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				    showMonthAfterYear: true,
				    yearSuffix: '년'
				});
				$(document).ready(function() {
					//datepicker 세팅
					$(".date").datepicker({
						changeMonth: true,
						changeYear: true
					});
					
					
				});
				$(document).on("click", "#excelDown", function() {
					$("#schFrm").attr("action","<c:url value='/kpcceo/community/excelDownload.do'/>");
					$("#schFrm").submit();
				});
				
				/* $(document).on("click", "#schButton", function() {
					$("#pageIndex").val(1);
					$("#schFrm").submit();
				});
				 */
			</script>
			<jsp:invoke fragment="script_area"/>
		</div>
	</body>
</html>