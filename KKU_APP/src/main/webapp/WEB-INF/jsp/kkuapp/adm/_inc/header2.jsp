<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	var chkClickNotice = 0;
	var chkGetNoticeAjax = 0;
	
	$(function(){		
		$('a.bell').mouseover(function(){
			 $('.bell_wrap').css("display","");
		 });
	
		$('.bell_wrap').mouseleave(function(){
			 $('.bell_wrap').css("display","none");
		 });
		
	 	 $('.bell_more').mouseover(function(){
			 $(this).find("a").css("text-decoration","underline");
		 });
		 
		 $('.bell_more').mouseleave(function(){
			 $(this).find("a").css("text-decoration","none");
		 }); 
		 
		 $('.bell_more').click(function(){
			 $(this).find("a").click();
		 });
	
	});
	
	function logout(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href = "/admin/logoutAction.do";
		}
	}
		
	function fnProcess(notIdx, linkUrl){
		if(chkClickNotice==1){
			alter("요청 중입니다. 잠시만 기다려주세요.");
			return false;
		}
		chkClickNotice = 1;
		$.ajax({
			type : "POST",
			url : "/kabadm/notice/noticeUpdate.do",
			data : {
				notIdx : notIdx
			},
			success : function(data) {
				var data = JSON.parse(data);
				chkClickNotice = 0;
				location.reload();
			},
			error : function(xhr, status, error) {
				alert("error");
			}
		});
		
	}	
</script>

<div id="header">
	<div class="menu_wrap">
		<h2><a href="/admin/userList.do"><img src="/_img/_img/comn/logo.png" alt="건국대학교 커뮤니티 앱" width="50%" height="50%"></a></h2> <!--img 293px*27px-->
	</div>

	<p class="gnb">
		<a href="/kabadm/admin/adminInfo.do?admIdx=${adminSessionVO.usrEmail}" class="my"><img class="account" src="/_img/adm/comn/my.png" alt="나의설정"/><span>${adminSessionVO.usrEmail}</span>님 안녕하세요.</a>
		<%-- <a href="#" class="bell"><img src="/_img/adm/comn/bell.png" alt="알림"/><span>${noticeCnt}</span></a> --%>
		<a href="javascript:logout();" class="logout"><img src="/_img/adm/comn/logout.png" alt="로그아웃"/></a>
	</p>
</div>
<div class="bell_wrap" style="display: none;">
	<div class="bell_box"> 
		<input type="hidden" name="pageIndex2" id="pageIndex2" value="${pageIndex}">
		<c:choose>
			<c:when test="${fn:length(noticeList) > 0 }"> 
				<c:forEach var="item" items="${noticeList}">
					<p class="bell_more <c:if test="${item.readYn eq 'N'}">new</c:if>" style="cursor:pointer;">
						<a href="${item.linkUrl}" target="_blank" onclick="fnProcess('${item.notIdx}', '${item.linkUrl}');">
							<span>${item.notMsg}<br>${fn:replace(fn:substring(item.regDate,'0','16'),'-','.')}</span><span class="r"><c:choose><c:when test="${item.readYn eq 'N'}">미확인</c:when><c:otherwise>확인</c:otherwise></c:choose></span>
						</a>
					</p>
				</c:forEach>
			</c:when>	
			<c:otherwise>
				<p class="bell_more"><a href="javascript:void(0);">알림이 없습니다.</a></p>
			</c:otherwise>
		</c:choose>
	</div>	
</div>
<script>
$(".bell_box").scroll(function(){
 	var scrollTop = $(this).scrollTop();
 	var innerHeight = $(this).innerHeight();
 	var scrollHeight = $(this).prop('scrollHeight');
 	var maxHeight = 50; /* ajax 동작시킬 높이 */
 	if((scrollTop + innerHeight + maxHeight) >= scrollHeight){
 		//함수 동작 
 		getNoticeList();
 	}
});		

/* function getNoticeList(){
	if(chkGetNoticeAjax==1){
		return false;
	}
	chkGetNoticeAjax = 1;
	var usrIdx = '${adminSessionVo.usrIdx}';
	var pageIndex2 = $('#pageIndex2').val();
	
	if (pageIndex2 == "1") {
		$("#pageIndex2").val(parseInt(pageIndex2) + 1);
		pageIndex2 = $("#pageIndex2").val();
	} 
	
	$.ajax({
		type : "POST",
		url : "/kabadm/notice/noticeListAjax.do",
		data : {
			admIdx : admIdx,
			pageIndex2 : pageIndex2
		},
		async: false,
		success : function(data) {
			var html = "";
			var data = JSON.parse(data);
			if (data.length > 0) {
				for (var i = 0; i < data.length; i++) { 
					html=	'<p class="bell_more '  
					if(data[i].readYn =='N'){ 
						html+= 	'new" style="cursor:pointer;">';
					}else{
						html+= 	'" style="margin-bottom:10px; cursor:pointer;">';
					}
					html+=		'<a href="'+data[i].linkUrl+'" target="_blank" onclick="fnProcess(\''+data[i].notIdx+'\', \''+data[i].linkUrl+'\');">';
					html+=			'<span>'+data[i].notMsg+'<br>'+data[i].regDate+'</span><span class="r">';
					if(data[i].readYn =='N') html+= '미확인'; else html+= '확인';
					html +=			'</span>';
					html+=		'</a>';
					html+= 	'</p>';
					$('.bell_box').append(html);
					html ="";
				}
				$("#pageIndex2").val(parseInt(pageIndex2) + 1);
				chkGetNoticeAjax = 0;
			} else {
				chkGetNoticeAjax = 1;
			}
			
		},
		error : function(xhr, status, error) {
			alert("알림 목록 불러오기를 실패했습니다.");
		}
	});
} */
</script>

