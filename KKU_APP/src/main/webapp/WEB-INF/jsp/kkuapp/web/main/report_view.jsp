<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../_inc/title.jsp" %>
</head>
<script>

$(function(){
	  if( ${usrLogincheck} == 0){
		  var inputString = prompt('로그인이 필요합니다.', '');
		  $.ajax({
				type : "POST",
				url : "/facilityLoginAction.do",
				data: {
					loginName : inputString
				},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",            // * 중요 *             // * 중요 * // * 중요 *
					success: function(tmp) {
						if(tmp == "success"){
							alert("로그인 되었습니다!");
							location.reload();
						}
						else if(tmp == "fail"){
							location.href="/main.do";
						}
					}
					 
			});
	  
	}
})
var processState = 0;
function fixCommentModDel(mod, idx){
	if(mod == "mod"){
		layer_open('modokPop','modok_Pop');
		$("#modifyBtn").click(function(){
			var selected = $("#modifyOption").val();
			if(selected == "선택"){
				return;
			} else if(selected == "처리중"){
				processState = 2;
			}else if(selected == "처리불가"){
				processState = 3;
			}else if(selected == "처리완료"){
				processState = 4;
			}
			
			if($("#modifyInput").val() != ""){
				var sessionId = '${loginVO.usrEmail}';
				 $.ajax({
						type : "POST",
						url : "/reportFixCommentAction.do",
						data: {
							commentWriter : sessionId,
							reportIdx : idx,
							fixComment : $("#modifyInput").val(),
							processState: processState
						},
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",            // * 중요 *             // * 중요 * // * 중요 *
							success: function(tmp) {
								if(tmp == "success"){
									alert("수정되었습니다.");
									setTimeout(function() {
										location.reload();
										}, 1000);
								}
							}
							 
					});
			}
		})
	}
	else if(mod="del"){
		layer_open('deleteePop','deletee_Pop');
			var sessionId = '${loginVO.usrEmail}';
			 $.ajax({
					type : "POST",
					url : "/reportFixCommentAction.do",
					data: {
						reportIdx : idx,
						processState: 1
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",            // * 중요 *             // * 중요 * // * 중요 *
						success: function(tmp) {
							if(tmp == "success"){
								alert("삭제되었습니다.");
								setTimeout(function() {
									location.reload();
									}, 1000);
							}
						}
						 
				});
	}
}


function insertFixComment(idx){
	var selected = $("#option").val();
	if(selected == "선택"){
		alert("처리상태를 선택해주세요.");
	}else if(selected == "처리중"){
		var processState = 2;
	}else if(selected == "처리불가"){
		var processState = 3;
	}else if(selected == "처리완료"){
		var processState = 4;
	}
	
	var reportIdx = idx;
	var sessionId = '${loginVO.usrEmail}';
	var fixComment = $("#comment").val();
	$.ajax({
		type : "POST",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",   
		url : "/reportFixCommentAction.do",
		data : {reportIdx : reportIdx ,
				commentWriter : sessionId,
				fixComment : fixComment,
				processState: processState
		},
			success: function(tmp) {
				if(tmp == "success"){
					layer_open('comokPop','comok_Pop');
					document.getElementById("comment").value='';
				}
			}
			 
	});
	
}

/* function changeOption(idx, processState){
	var selected = $("#option").val();
	if(selected == "선택"){
		return;
	}
	if(selected == "처리완료"){
		var processState = 3;
	}
	else if(selected == "처리불가"){
		var processState = 2;
	}
	$.ajax({
		type : "POST",
		url : "/reportStatusUpdate.do",
		data: {
			reportIdx : idx,
			processState : processState
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",            // * 중요 *             // * 중요 * // * 중요 *
			success: function(tmp) {
				if(tmp == "success"){
					setTimeout(function() {
						location.reload();
						}, 1000);
				}
			}
	});
	
} */
</script>
<body>

	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="board head_mg  mb140">
			<div class="navi">
				<div class="top_navi"><a href="/campusReportList.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>학교시설 고장 신고</h2></div>
			</div>
			<div class="bbs_view">
			<c:forEach var="result" items="${boardList}">
				<div class="view_top">
					<div class="writer"> 
						
						<div class="info">
							<a href="#" class="name">${result.usrName}</a>
						<a href="#" class="name">${result.reporterPnum}</a>
							<p><p><span> ${result.reportDate} </span>
							<c:if test="${result.processState eq '0' }">
								<span class="ok_label">접수대기중</span>
							</c:if>
							<c:if test="${result.processState eq '1' }">
								<span class="ok_label">접수완료</span>
							</c:if>
							<c:if test="${result.processState eq '2' }">
								<span class="ok_label">처리중</span>
							</c:if>
							<c:if test="${result.processState eq '3' }">
								<span class="ok_label">처리불가</span>
							</c:if>
							<c:if test="${result.processState eq '4' }">
								<span class="ok_label">처리완료</span>
							</c:if>
						</div>
					</div>
				</div>
				<div class="view_bottom">
					<div class="view_cont">
					
							<%-- <c:choose>
									<c:when test="${result.first ne null }">
											<p><img src="/upload/tboard/${result.first}"></p>
									</c:when>
								
							</c:choose>		 --%>
					
						<br/>
						
						<p>${result.reportContent }</p>
					</div>
				
					<p class="btn nk_btn mt15">
						
						<a href="/campusReportList.do" class="bt_greenL">목록</a>
			
						
						
					</p>
				</div>

				<div class="bbs_comment">

				<c:if test ="${result.fixCommenttype eq 'Isnull' }">
					<span><!-- onchange="changeOption(${result.reportIdx},${result.processState});" -->
						<select id="option" >
							<option>선택</option>
							<option>처리중</option>
							<option>처리불가</option>
							<option>처리완료</option>
						</select>
					</span>
					<textarea rows="4" placeholder="처리에 관한 사항을 적어주세요&#13;&#10;ex)처리 완료 되었습니다.&#13;&#10;ex)프로젝터를 교체를 해야해 3일후 교체될 예정입니다." id= "comment"></textarea>
					<p class="btn mt5"><a href="#" onclick="insertFixComment('${result.reportIdx}')">등록</a></p>
				</c:if>
				<c:if test ="${result.fixCommenttype eq 'Notnull' }">
				<ul>
					<li>
						<div class="con">
							<p>${result.fixComment }</p>
						</div>
						<div class="info">
							<p><span>${result.commentWriter }</span> <!-- 시설팀 관리자 이름  -->
							<c:if test="${result.commentWriter eq usrEmail}">
								<span><a href="#" onclick="fixCommentModDel('mod','${result.reportIdx}')">수정</a></span>
							</c:if>
							</p>
						</div>
					</li>
				</ul>
				</c:if>
				
			
				</div>
				</c:forEach>
				
			
				
		
			</div>
			</div>

			
				
			<%@include file="../_inc/bottom_menu.jsp" %>
			<%@ include file="../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->

	<!-- POPUP BEGIN -->
	
	<!-- 처리완료 버튼 클릭 시 노출 -->
	<div class="layer" id="delok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="delokPop">
			<div class="pop_cont text">
				<p class="tit c">처리여부 변경완료</p>
				<p class="mb20 c">처리여부가 성공적으로 변경 되었습니다.</p>
				<p class="btn"><a href="#" class="cbtn">확인</a></p>
			</div> 
		</div>
	</div>

	<!-- 댓글 등록시 노출 -->
	<div class="layer" id="comok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="comokPop">
		
			<div class="pop_cont text">
				<p class="mb20 c">처리에 관한 사항이 등록되었습니다.</p>
				<p class="btn"><a href="#" onclick="location.reload()">확인</a></p>
			</div> 
			
		</div>
	</div>
	<!-- POPUP END -->
	
	<!-- 수정시 노출 -->
	<div class="layer" id="modok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="modokPop">
		
			<div class="pop_cont text">
				<select id="modifyOption" >
					<option value="선택">선택</option>
					<option value="처리중">처리중</option>
					<option value="처리불가">처리불가</option>
					<option value="처리완료">처리완료</option>
				</select>
				<p class="mb20 c"><input id="modifyInput" type = "text" placeholder="수정 입력"></p>
				<p class="btn"><a href="#" id ="modifyBtn" class="btn">확인</a></p>
			</div> 
			
		</div>
	</div>
	
	<!-- POPUP END -->
<!-- 댓글 등록시 노출 -->
	<div class="layer" id="deleteeok_Pop">
		<div class="bg"></div>
		<div class="pop-layer" id="deleteeokPop">
		
			<div class="pop_cont text">
				<p class="mb20 c">삭제 하시겠습니까</p>
				<p class="btn"><a href="#" id ="deleteBtn" >확인</a></p>
			</div> 
			
		</div>
	</div>
	<!-- POPUP END -->
</div>
<!-- //wrap -->

</body>
</html>