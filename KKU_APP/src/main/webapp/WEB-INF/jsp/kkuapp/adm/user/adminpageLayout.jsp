<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<c:set var="page_num_depth_01" value="1"/>
<c:set var="page_num_depth_02" value="13"/>


<html lang="utf-8">
<head>
	<%@include file="../_inc/tit.jsp"%>
<script>

	$(document).on("click", "#schButton", function() {
		$("#pageIndex").val('1');
		$("#schFrm").submit();
	});
	
	/* $(document).on("click", "#schButton", function() {
		$("#pageIndex").val(1);
		$("#schFrm").submit();
	});
	 */
	function allCheck(){
		if($("input:checkbox[id='ck1']").prop("checked")){
	        $("input:checkbox[name='usrIdxArr']").prop("checked",true);
	    }else{
	        $("input:checkbox[name='usrIdxArr']").prop("checked",false);
	    } 
	}
	 
	 function selectDelete(){
			if(confirm('정말 삭제하시겠습니까?')){
				$("input:checkbox[name='usrIdxArr']").each(function() {
					if($(this).is(':checked')){
						$.ajax({ 
							type : "POST",
							url : "/kpcceo/admin/userDelete.do",
							data : {
								usrIdx : $(this).val(),
							},
							success : function() {}
						});
					}

				});
				alert("정상적으로 삭제되었습니다.");
				location.reload();
			}	
		}
	
	
</script>
</head>
<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp"%>
		<div id="container">
			<%@include file="../_inc/left.jsp"%>
			<div id="contents">
				<div class="cont_top">				
					<ol class="loca">
						<li><img src="/_img/adm/comn/loca_home.png" alt="홈페이지 메인으로"/></li>
						<li>회원관리</li>
						<li>회원관리</li>
					</ol>
					<h2>회원관리</h2>
				</div>
				
				
				</div>
						
				
			</div>
		</div>
	</div>
	<%@include file="../_inc/footer.jsp"%>

</body>

</html>