 <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="page_num_depth_01" value="5"/>
<c:if test="${boardVO.bbsDiv eq 'notices'}"><c:set var="page_num_depth_02" value="1"/></c:if>
<c:if test="${boardVO.bbsDiv eq 'qna'}"><c:set var="page_num_depth_02" value="2"/></c:if>

<html lang="utf-8">
	<head>
		<%@include file="../_inc/tit.jsp" %>
		<script>
			function cmtInsert(bbsIdx){
				var cmtCont = $('#cmtCont').val();
				if(confirm("댓글을 등록하시겠습니까?")){
					if(bbsIdx == ""){
						alert("잘못된 요청 입니다.");
					} else {
						$.ajax({
							type: "post",
							url : "/web/support/ajaxCmtInsert.do",
							data: {
								cmtCont : cmtCont,
								bbsIdx : bbsIdx
							},
							async : false,
							success: function(data){
								alert("정상적으로 등록되었습니다.");
								location.reload();
							},
							error: function(xhr, status, error){
								alert("error");
							}
						});
					}
				}
			}
			
			function delCmt(cmtIdx){
				if(confirm("댓글을 삭제하시겠습니까?")){
					if(cmtIdx == ""){
						alert("잘못된 요청 입니다.");
					} else {
						$.ajax({
							type: "post",
							url : "/web/support/ajaxCmtDelete.do",
							data: {
								cmtIdx : cmtIdx
							},
							async : false,
							success: function(data){
								alert("정상적으로 삭제되었습니다.");
								location.reload();
							},
							error: function(xhr, status, error){
								alert("error");
							}
						});
					}
				}
			}
			function changeForm(date,name,cont,cmtIdx){
				var id = '#cmt_'+ cmtIdx;
				$(id).html('');
				$(id).prop('class','edit');
				/* var str = '<li class="edit">'; */
				var str = 		'<div class="rp_info">';
				str += 				'<p class="name">';
				str +=					'<span>'+name+'</span>';
				str += 					'<span class="date">'+date+'</span>';
				str +=				'</p>';
				str +=			'</div>';
				str +=			'<div class="rp_txt">';
				str +=				'<textarea rows="2" id="qnaCmt">'+'${fn:replace(cont, newLineChar, "<br/>")}'+'</textarea>';
				str +=				'<label class="f_0"></label>';
				str +=				'<a href="javascript:cmtUpdate('+cmtIdx+')" class="submit">확인</a>';
				str +=			'</div>';
			
				$(id).html(str);
			}
			
			function cmtUpdate(cmtIdx){
				var cmtCont = $("#qnaCmt").val();
				if(confirm("댓글을 수정하시겠습니까?")){
					if(cmtIdx == ""){
						alert("잘못된 요청 입니다.");
					} else {
						$.ajax({
							type: "post",
							url : "/web/support/ajaxCmtUpdate.do",
							data: {
								cmtIdx : cmtIdx,
								cmtCont : cmtCont
							},
							async : false,
							success: function(data){
								if(data!='false'){
									alert("정상적으로 수정되었습니다.");
									location.reload();
								}else{
									alert("변경내용을 다시 확인해주세요.")
								}
							},
							error: function(xhr, status, error){
								alert("error");
							}
						});
					}
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
				<c:if test="${boardVO.bbsDiv eq 'notices'}"><h2>공지사항</h2></c:if>
				<c:if test="${boardVO.bbsDiv eq 'qna'}"><h2>Q&A</h2></c:if>
			     <ol class="loca">
                    <li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
                    <li>고객센터</li>
                    <c:if test="${boardVO.bbsDiv eq 'notices'}"><li>공지사항</li></c:if>
					<c:if test="${boardVO.bbsDiv eq 'qna'}"><li>Q&A</li></c:if>
                </ol>
			</div>
			
			<div class="view_top">
				<p class="view_tt">${resultVO.bbsTitle}</p>
				<div class="view_if">
					<p><b>작성자</b>${resultVO.regName}</p>
					<p><b>작성일</b>${resultVO.regDate}</p>
					<p><b>조회수</b>${resultVO.viewCnt}</p>
					<c:if test="${fn:length(fileList) > 0}">
						<p class="file"><b>파일첨부</b>
						<c:forEach var="fileList" items="${fileList}">
							<c:url value="/fileDownload.do" var="fileUrl">
								<c:param name="srvFile" value="${fileList.filSvrName}" />
								<c:param name="usrFile" value="${fileList.filUsrName}" />
								<c:param name="folder" value="${bbsDiv}" />
							</c:url>
							<a href="${fileUrl}" target="_blank" class="file"><span class="ti-clip"></span>${fileList.filUsrName}</a>
							<%-- <a href="<c:url value='/fileDownload.do'/>?srvFile=${fileList.filSvrName}&usrFile=${fileList.filUsrName}&folder=${bbsDiv}" class="file">${fileList.filUsrName}</a> --%>
						</c:forEach>
						</p>
					</c:if>
				</div>
			</div>
			<div class="view_cont">${resultVO.bbsCont}</div>
			
			<c:if test="${boardVO.bbsDiv eq 'qna'}">
				<!-- 댓글작성 -->
				<div class="input_reply mt20">
					<textarea cols="30" rows="10" placeholder="내용을 입력해주세요." id="cmtCont"></textarea>
					<label class="f_0"></label>
					<a href="javascript:cmtInsert(${boardVO.bbsIdx})" class="submit">댓글등록</a>
				</div>
				<c:if test="${fn:length(resultCmtList) > 0}">
					<!-- 댓글목록 -->
					<p class="rp_count">댓글 ${totalCmt}건</p>
					<ul class="rp">
						<c:forEach var="resultCmtList" items="${resultCmtList}">
							<c:choose>
								<c:when test="${resultCmtList.regName eq '운영자'}">
									<li class="admin">
										<div class="rp_info">
											<p class="name">
												${resultCmtList.regName}
												<span class="date">${resultCmtList.regDate}</span>
											</p>
										</div>
										<div class="rp_txt">
											${fn:replace(resultCmtList.cmtCont, newLineChar, "<br/>")}
										</div>
									</li>
								</c:when>
								<c:otherwise>
									<li id ="cmt_${resultCmtList.cmtIdx}"><!-- rp_info -->
										<div class="rp_info">
											<p class="name">
												<span>${resultCmtList.regName}</span>
												<span class="date">${resultCmtList.regDate}</span>
											</p>
											<a class="rp_del" href="javascript:delCmt(${resultCmtList.cmtIdx})">삭제</a>
											<a class="rp_edit" href="javascript:changeForm('${resultCmtList.regDate}','${resultCmtList.regName}','${resultCmtList.cmtCont}',${resultCmtList.cmtIdx});">수정</a>
										</div>
										<div class="rp_txt">
											${fn:replace(resultCmtList.cmtCont, newLineChar, "<br/>")}
										</div>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						
						
					</ul>
				</c:if>
				
			</c:if>

			<!-- 이전글 다음글 -->
			<div class="prev_next">
				<c:choose>
					<c:when test="${empty prev}">
						<p class="prev">
							이전글
							<span>이전글이 없습니다.</span>
						</p>
					</c:when>
					<c:otherwise>
						<p class="prev">
							이전글
							<span><a href="/web/support/boardView.do?bbsIdx=${prev.bbsIdx}&bbsDiv=${boardVO.bbsDiv}">${prev.bbsTitle}</a></span>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty next}">
						<p class="next">
							다음글
							<span>다음글이 없습니다.</span>
						</p>
					</c:when>
					<c:otherwise>
						<p class="next">
							다음글
							<span><a href="/web/support/boardView.do?bbsIdx=${next.bbsIdx}&bbsDiv=${boardVO.bbsDiv}">${next.bbsTitle}</a></span>
						</p>
					</c:otherwise>
				</c:choose>
			</div>

			<p class="btn_area">
 				<a href="/web/support/boardList.do?bbsDiv=${boardVO.bbsDiv}" class="btn_list">목록</a>
<!-- 				<a href="#" class="btn_submit">저장</a> -->
			</p>
		</div>
		<%@include file="../_inc/footer.jsp" %>
	</div>
</body>

</html>