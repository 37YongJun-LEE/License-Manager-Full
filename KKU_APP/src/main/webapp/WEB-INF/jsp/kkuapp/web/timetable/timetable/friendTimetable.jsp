<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
</head>
<body>
	<div id="wrap">
	<!-- HEADER BEGIN -->
	<header class="sub">
			<%@include file="../../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->
	<!-- CONTENTS BEGIN -->
	
		<div class="navi">
			<div class="top_navi"><a href="/timetable.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>시간표</h2></div>
		</div>	
	
		<div id="sub_contents" class="schedule mb140">

			<div class="w_box no_line">
				<p class="green_date">${thisSemester }</p>
				<div class="name_tit">
					<p class="name">${usrInfo.usrNickname }님의 시간표</p>
					<div class="right">
						<p>
						</p>
					</div>
				</div>

				<div class="schedule_box" style="height:auto;">
					<table id="timetable">
						<caption>시간표</caption>
						<colgroup><col width="*"><col width="18%"><col width="18%"><col width="18%"><col width="18%"><col width="18%"></colgroup>
						<tbody>
							<tr class="top">
								<th></th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
							</tr>

							<c:set var="days" value="${fn:split('월,화,수,목,금',',')}" />
							
							<tr>
							<c:forEach var="t" items="${time}" varStatus="ss">
								<th<c:if test="${t%100 == 0}"> style="border-bottom:1px;"</c:if>><c:if test="${t%100 == 0}">${t}</c:if></th>
								<c:forEach var="day" items="${days }" varStatus="idx" >
								<td>
								<c:if test="${timetable != null}">
									<c:forEach var="tt" items="${timetable}" varStatus="status">
										<c:if test="${tt.timetblDay==day && tt.timetblStarttime <= t && tt.timetblEndtime > t}">
											<p class="tit">${tt.timetblSubname}</p>
											<p class="tt">${tt.timetblLectureroom}</p>
										</c:if>
									</c:forEach>
								</c:if>
								</td>	
										
								</c:forEach>

							</tr>
							<tr>
							</c:forEach>
							</tr>
							
						</tbody>
					</table>
				</div>
				<%@include file="../../_inc/footer.jsp" %>
				<%@include file="../../_inc/bottom_menu.jsp" %>
			</div>
<!-- //wrap -->

<script>

	// 업 다운
	$(document).ready(function() { 
		$('#timetable').rowspan([0,1,2,3,4]);
		$(".del").click(function(){    
			$(".del_pop").addClass("active");
		});

		$(".class").click(function(){    
			$(".class_pop").addClass("active");
		});
		

		$(".cbtn, .bg").click(function(){    
			$(".bottom_layer").removeClass("active");
		});
	});

	/* 
	 * 
	 * 같은 값이 있는 열을 병합함
	 * Author : mecca0515
	 * 사용법 : $('#테이블 ID').rowspan([0,1]);
	 * 
	 */     
	 $.fn.rowspan = function(colIdx) {
		    return this.each(function(){      
		        var $table = this;
		    	if ($.isArray(colIdx)) {
		    		$.each(colIdx, function(index, value) {
		    			$.rowspan($table, value);
		    		});
		    	}
		        else {
				$.rowspan($table, colIdx);
			}
		    	$('#' + $table.id + ' tr td.tempRow').remove();
		    	$(".rowspan").has('p').attr("class", "hasP class bg01");
				var arr = [];
				var color = ["#fff8cc", "#f2e8e8", "#dcf2e9", "#eff9cc", "#ffe9e9", "#dee8f6", "#FFA500"];
				$('.hasP').each(function(index,item){
		  			var sub = $(this).find("p").text();
		  			if(!arr.includes(sub))
						arr.push(sub);
				});
				
				var map = new Map();
				for(var i=0;i<arr.length;i++)
					map.set(arr[i],color[i]);
				
				
				var i = 0;

				
	 			$('.hasP').each(function(index,item){
					var sub = $(this).find("p").text();
		  			if(arr.includes(sub)){
		  				$(this).css("background-color", map.get(sub));
		  			}
				}); 
				
		    	
		    });  
		};

		$.rowspan = function(table, colIdx, isStats) {
		    var that;
		    
		    $('tr', table).each(function(row) {
		        $('td:eq(' + colIdx + ')', this).filter(':visible').each(function(col) {
		            if ($(this).html() == $(that).html()&& ($(that).html().trim()!='')
		               && ($(this).siblings('.rMerge').html() == $(that).siblings('.rMerge').html())) {
		                    rowspan = $(that).attr("rowspan") || 1;
		                    rowspan = Number(rowspan) + 1;

				    		$(that).attr("rowspan", rowspan);
				    		$(that).addClass("rowspan");
		                    // do your action for the colspan cell here
		                    $(this).addClass('tempRow');
		                }
				else {            
					that = this;
				}          
						
				// set the that if not already set
				that = (that == null) ? this : that;
			   });
		     });
		} 
	
</script>


</body>
</html>

