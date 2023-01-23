<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>

<t:default>
	<jsp:attribute name="head_area">
		<style>
			div.cont_view table.table02	{
				margin-top:10px; 
				border:1px solid #ddd;
			}
			div.cont_view table.table02 thead th {
				background:#f5f5f5; 
				border-right:1px solid #e3e3e3;
			}
			div.cont_view table.table02 thead th:last-child	{
				border-right:none;
			}
			div.cont_view table.table02 tr {
				cursor:default;
			}
			div.cont_view table.table02.choose tr {
				cursor:pointer;
			}
			div.cont_view table.table02 tr th {
				text-align:center;
			}
			div.cont_view table.table02 tr td.center {
				text-align:center;
			}
			table.table02 tbody td a {
				background: #3f68b1;
				border-radius: 5px;
			}
			table.table02 tbody td a:hover {
				text-decoration: none;
			}
			a.listBtn {
				background: #3f68b1;
				border-radius: 5px;
				padding: 5px;
				color: #f8f8f8;
			}
			a.listBtn:hover {
				text-decoration: none;
			}
			a.grayBtn {
				background: #696969;
				border-radius: 5px;
				padding: 5px;
				color: #f8f8f8;
			}
			a.grayBtn:hover {
				text-decoration: none;
			}
			div.tit {
				background:#3f68b1; 
				overflow:hidden; 
				color:#666; 
				width:100%;
				border-radius:5px 5px;
			}
			ul.tabs {
				float:left; 
				margin: 0px; 
				padding: 0px; 
				list-style: none; 
				position:relative;
			}
			ul.tabs li {
				background: none; 
				color: #fff; 
				display: inline-block; 
				padding: 10px 10px; 
				cursor: pointer; 
				font:15px/21px "NanumGothic_b","malgun gothic","Dotum"," Gulim","Arial","verdana","Helvetica",sans-serif;
			}
			ul.tabs li.current {
				background: #ededed; 
				color: #222; 
			}
			
		</style>
		<script>
			const urlParams = new URL(location.href).searchParams;
			const msg = urlParams.get('msg');
			const target = urlParams.get('subjectCd');
			if(msg) {
				alert(msg);
				location.replace("/admin/licenseDetail.do?subjectCd="+target);
			}		
		</script>
	</jsp:attribute>

  	<jsp:attribute name="meta_area">
		<ol class="loca">
			<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
			<li>자격증 관리</li>
			<li>자격증 관리</li>
		</ol>
		<h2>자격증 관리</h2>
	</jsp:attribute>

	<jsp:attribute name="body_area">
		<div class="tit">
			<ul class="tabs">
				<li onclick="detail('default','${result.subjectCd}')" <c:if test="${depth02 eq 'default' }">class="current"</c:if>>자격증정보</li>
				<li onclick="detail('major','${result.subjectCd}')" <c:if test="${depth02 eq 'major' }">class="current"</c:if>>추천학과</li>
				<li onclick="detail('license','${result.subjectCd}')" <c:if test="${depth02 eq 'license' }">class="current"</c:if>>추천자격증</li>
				<li onclick="detail('questions','${result.subjectCd}')" <c:if test="${depth02 eq 'questions' }">class="current"</c:if>>기출문제</li>
				<li onclick="detail('board','${result.subjectCd}')" <c:if test="${depth02 eq 'board' }">class="current"</c:if>>게시판</li>
			</ul>
		</div>
		
		<table class="table02" >
			<caption>자격증 관리</caption>
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="25%">
				<col width="10%">
				<col width="25%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tbody>
				<tr>
					<th>자격증명</th>
					<td colspan="6">${result.subjectName }</td>
				</tr>
				<tr>
					<th>자격구분명</th>
					<td colspan="2">${result.qualName }</td>
					<th>계열명</th>
					<td colspan="3">${result.seriesName }</td>
				</tr>
				<tr>
					<th>직무분야명</th>
					<td colspan="2">${result.jobfieldName }</td>
					<th>중직무분야명</th>
					<td colspan="3">${result.mjobfieldName }</td>
				</tr>
				
				
				<!-- 자격증정보 -->
				<c:if test="${depth02 eq 'default'}">
					<tr>
						<td colspan="7"></td>
					</tr>
					<tr>
						<th colspan="7">응시자격</th>
					</tr>
					<tr>
						<td colspan="7">
						<c:forEach var="result" items="${licenseQual}">• ${result.emqualDescription}<br></c:forEach>
						</td>
					</tr>
					<tr>
						<td colspan="7"></td>
					</tr>
					<tr>
						<th colspan="7">시험일정</th>
					</tr>
					<c:forEach var="item" items="${schedule}">
						<tr>
							<th>시행년도</th>
							<td colspan="2">${item.testYear }</td>
							<th>시행회차</th>
							<td colspan="3">${item.testSeq }</td>
						</tr>
						<tr>
							<th>설명</th>
							<td colspan="5"><input type="text" id="description" name="description" value="${item.description }" /></td>
							<td style="text-align:center;"><a href="#" class="grayBtn" onclick="fnmodify('${item.idx}')">수정</a></td>
						</tr>
						<tr>
							<th></th>
							<th colspan="3">필기</th>
							<th colspan="3">실기</th>
						</tr>
						<tr>
							<th>원서접수</th>
							<td class="center" colspan="3">${item.wasDate } ~ ${item.waeDate }</td>
							<td class="center" colspan="3">${item.pasDate } ~ ${item.paeDate }</td>
						</tr>
						<tr>
							<th>시험일</th>
							<td class="center" colspan="3">${item.wsDate } ~ ${item.weDate }</td>
							<td class="center" colspan="3">${item.psDate } ~ ${item.peDate }</td>
						</tr>
						<tr>
							<th>합격발표일</th>
							<td class="center" colspan="3">${item.wpDate }</td>
							<td class="center" colspan="3">${item.ppDate }</td>
						</tr>
						<tr>
							<td colspan="7"></td>
						</tr>
					</c:forEach>
				</c:if>
				
				<!-- 추천학과 -->
				<c:if test="${depth02 eq 'major'}">
					<tr>
						<td colspan="7"></td>
					</tr>
					<tr>
						<th></th>
						<th colspan="5">학과명</th>
						<th>관리</th>
					</tr>
					<c:forEach var="item" items="${resultList }" varStatus="i">
						<tr>
							<th>추천학과${i.count}</th>
							<td class="center" colspan="5">
								<input type="text" style="width:95%;margin-right:5px;" value="[${item.pilsoo}]${item.uniDepartment}/${item.uniMajor }" readonly/>
							</td>
							<td class="center">
								<a href="#" onclick="addContent('major','${item.subjectCd}','${item.uniIdx }')">수정</a>
								<a href="#" onclick="fndelete('major','${vo.subjectCd}','${item.idx}')">삭제</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td class="center" colspan="7"><a href="#" onclick="addContent('major','${result.subjectCd}','')">+추가</a></td>
					</tr>
				</c:if>
				
				<!-- 추천자격증 -->
				<c:if test="${depth02 eq 'license'}">
					<tr>
						<td colspan="7"></td>
					</tr>
					<tr>
						<th></th>
						<th colspan="5">자격증명</th>
						<th>관리</th>
					</tr>
					<!-- API 추천자격증 -->
					<c:if test="${recLicenseApi.recSubjectNameOne ne null}">
						<tr>
							<th>추천자격증1</th>
							<td class="center" colspan="5"><input type="text" style="width:95%;margin-right:5px;" value="${recLicenseApi.recSubjectNameOne }" readonly></input></td>
							<td class="center">
								<p>API</p>
							</td>
						</tr>
						<tr>
							<th>추천자격증2</th>
							<td class="center" colspan="5"><input type="text" style="width:95%;margin-right:5px;" value="${recLicenseApi.recSubjectNameTwo }" readonly></input></td>
							<td class="center">
								<p>API</p>
							</td>
						</tr>
					</c:if>
					<!-- 관리자 추천자격증 -->
					<c:forEach var="item" items="${recLicense}" varStatus="status">
						<tr>
							<th>추천자격증${status.count+2}</th>
							<td class="center" colspan="5"><input type="text" style="width:95%;margin-right:5px;" value="${item.recSubjectName }" readonly></input></td>
							<td class="center">
								<a href="#" onclick="fndelete('license','${result.subjectCd}','${item.idx}')">삭제</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td class="center" colspan="7"><a href="#" onclick="addContent('license','${result.subjectCd}','')">+추가</a></td>
					</tr>
				</c:if>
				
				<!-- 기출문제 -->
				<c:if test="${depth02 eq 'questions'}">
					<tr>
						<td colspan="7"></td>
					</tr>
					<tr>
						<th></th>
						<th colspan="5">기출문제</th>
						<th>관리</th>
					</tr>
					<c:forEach var="item" items="${resultList }" varStatus="i">
						<tr>
							<th>${i.count}</th>
							<td class="center" colspan="5"><input type="text" style="width:95%;margin-right:5px;" value="${item.quesTitle}" readonly/></td>
							<td class="center">
							<c:if test="${i.count eq '1' }">
								<p>API</p>
							</c:if>
							<c:if test="${i.count ne '1' }">
								<a href="#" onclick="addContent('questions','${result.subjectCd}','${item.idx }')">수정</a>
								<a href="#" onclick="fndelete('questions','${result.subjectCd}','${item.idx}')">삭제</a>
							</c:if>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td class="center" colspan="7"><a href="" onclick="addContent('questions','${result.subjectCd}','')">+추가</a></td>
					</tr>
				</c:if>
				
				<!-- 게시판 -->
				<c:if test="${depth02 eq 'board'}">
					<tr>
						<td colspan="7"></td>
					</tr>
					<tr>
							<th>NO</th>
							<th>자격증</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>삭제여부</th>
							<th>관리</th>
					</tr>
				
				 	<c:forEach var="result" items="${resultList}">
						<tr>
							<td class="center">${result.boardIdx }</td>
							<td>${result.subjectName }</td>
							<td>${result.boardTitle}</td>
							<td>${result.boardWriter} </td>
							<td class="center">${result.boardWritedate }</td>
							<td class="center">${result.delYn}</td>
							<td class="center"><a href="/admin/licenseBoardDetail.do?boardIdx=${result.boardIdx}">수정</a></td>
						</tr>		
					</c:forEach> 
					
				</c:if>
				
			</tbody>
		</table>
		<div style="width:100%;text-align:right;margin-top:20px;">
			<c:if test="${custom_check eq 'C'}">
				<a href="/admin/dataEdit.do?subjectCd=${result.subjectCd}" class="listBtn">수정</a>
			</c:if>
			<a href="/admin/licenseList.do" class="listBtn">목록</a>
		</div>
	</jsp:attribute>
		
	<jsp:attribute name="script_area">
		<script>
			function addContent(mode,cd,idx){
				if(mode == 'major'){
					if(idx == ''){
						window.open('/admin/majorPopup.do?subjectCd='+cd, '', 'width=600, height=150'); //추가
					} else window.open('/admin/majorPopup.do?subjectCd='+cd+'&&uniIdx='+idx, '', 'width=600, height=150'); //수정
				} 
				if(mode == 'license'){
					if(idx == ''){
						window.open('/admin/licensePopup.do?subjectCd='+cd, '', 'width=600, height=550');
					}
				}
				if(mode == 'questions'){
					if(idx == ''){
						window.open('/admin/questionsPopup.do?subjectCd='+cd, '', 'width=600, height=550'); //추가
					} else window.open('/admin/questionsPopup.do?subjectCd='+cd+'&&idx='+idx, '', 'width=600, height=550'); //수정
				}
			}
			
			function fnmodify(idx){
				alert("(주의) 내용을 수정하면 API 정보가 수정됩니다.")
				if(confirm("내용을 수정하시겠습니까?")){
					var desc = $('#description').val();
					$.ajax({
						type: "POST",
						url:"/admin/licenseDetailMod.do",
						data:{
							idx: idx,
							description: desc
						},
						success: function(msg) {
							if (msg == "success") {
								alert("수정이 완료되었습니다.");
								window.location.reload();
							}else {
								alert("실패");
							}
						}
					})
				}
			}
			function fndelete(mode,cd,idx){
				if(confirm("삭제하시겠습니까?")){
					if(mode == 'major'){
						location.href = "/admin/majorRecDelete.do?subjectCd="+cd+"&&idx="+idx;
					}
					if(mode == 'license'){
						location.href = "/admin/licenseRecDelete.do?subjectCd="+cd+"&&idx="+idx;
					}
					if(mode == 'questions'){
						location.href = "/admin/questionsDelete.do?subjectCd="+cd+"&&idx="+idx;
					}
				}
			}
			function detail(cate,cd){
				if(cate == 'default'){
					location.href = "licenseDetail.do?subjectCd="+cd;
				} else if(cate == 'major'){
					location.href = "licenseRecMajor.do?subjectCd="+cd;
				} else if(cate == 'license'){
					location.href = "licenseRecLicense.do?subjectCd="+cd;
				} else if(cate == 'questions'){
					location.href = "licensePrevQuestions.do?subjectCd="+cd;
				} else if(cate == 'board'){
					location.href = "licenseBoard.do?subjectCd="+cd;
				} else {
					alert("error");
				}
				
			
			}
	 	</script>
	</jsp:attribute>
</t:default>

