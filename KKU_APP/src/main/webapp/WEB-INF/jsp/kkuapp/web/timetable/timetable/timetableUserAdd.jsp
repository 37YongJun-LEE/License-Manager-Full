<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>

</head>
<script>
function fnLinkPage(pageNo) {
	$("#pageIndex").val(pageNo);
	$("#schFrm").submit();
}
$(document).on("click", "#schButton", function() {
	$("#pageIndex").val('1');
	$("#schFrm").submit();
});
function addTimetable(count){
	var num = document.getElementById("num"+count).textContent;
	var name = document.getElementById("name"+count).textContent;
	
	$.ajax({
		type: "POST",
		url:"/addTimetable2.do",
		data:{
			subnum: num,
			subname: name
		},
		success: function(msg) {
			if (msg == "error") {
				layer_open('addPop','add_Pop');
				$("#pop_cont1").show();
				$("#pop_cont2").hide();
			} else if(msg == "error2"){
				alert("error")
			} else {
				layer_open('addPop','add_Pop');
				$("#pop_cont1").hide();
				$("#pop_cont2").show();
			}
		}
	})
	
}

</script>
<body>
	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
	<div id="sub_contents" class="schedule head_mg"">
		<div class="navi">
			<div class="top_navi"><a href="/timetable.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>시간표 추가</h2></div>
		</div>	
		
		<div class="w_box no_line">
			<p class="green_date">${thisSemester }</p>
				<div class="name_tit">
					<p class="name">${nickname}님의 시간표</p>
					<a class="btn_mini bt_green" href="customTimetable.do">직접추가</a>
				</div>
				
				<div class="schedule_box" style="position:relative;">
					<table id="timetable" id="timetable" style="position:absolute;z-index:2;opacity:0.8;">
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
								<c:forEach var="day" items="${days}" varStatus="idx" >
								<td id="id${ss.count*10}${idx.count*10}">
								<c:if test="${timetable != null}">
									<c:forEach var="tt" items="${timetable}" varStatus="status">
										<c:if test="${tt.timetblDay==day && tt.timetblStarttime <= t && tt.timetblEndtime > t}">
											<p class="tit" id="${tt.timetblSubnum}">${tt.timetblSubname}</p>
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
					<table id="timetable" id="blankTimetable" style="position:absolute;z-index:1;">
						<caption>시간표</caption>
						<colgroup><col width="*"><col width="18%"><col width="18%"><col width="18%"><col width="18%"><col width="18%"></colgroup>
						<tbody style="border:none;">
							<tr class="top" style="border:none;">
								<th></th>
								<th style="opacity:0;">월</th>
								<th style="opacity:0;">화</th>
								<th style="opacity:0;">수</th>
								<th style="opacity:0;">목</th>
								<th style="opacity:0;">금</th>
							</tr>

							<c:set var="days" value="${fn:split('월,화,수,목,금',',')}" />
							
							<tr style="border:none;">
							<c:forEach var="t" items="${time}" varStatus="ss">
								<th style="border:none;opacity:0;" >${t}</th>
								<c:forEach var="day" items="${days}" varStatus="idx" >
								<td id="id${ss.count}${idx.count}" style="border:none;">
								<c:if test="${timetable != null}">
									<c:forEach var="tt" items="${timetable}" varStatus="status">
										<c:if test="${tt.timetblDay==day && tt.timetblStarttime <= t && tt.timetblEndtime > t}">
										</c:if>
									</c:forEach>
								</c:if>
								</td>
								</c:forEach>
							</tr>
							<tr style="border:none;">
							</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="schedule_add mt30">
					<form name="schFrm" id="schFrm" method="post" autocomplete="off" action="<c:url value='/addTimetable.do#test'/>">
						<input type="hidden" name="pageIndex" id="pageIndex" value="${timetableVO.pageIndex}" />
						<div class="search block_search">
							<div class="block_select">
								<select name="searchMajor">
									<option value="" selected="">전체 학과</option>
									<c:forEach var="result" items="${resultList}">
									<option value="${result.uniMajor}" <c:if test="${timetableVO.searchMajor == result.uniMajor}">selected="selected"</c:if>>${result.uniMajor}</option>
									</c:forEach> 
								</select>
								<select name="searchGrade">
									<option value="" selected="">전체 학년</option>
									<option value="1" <c:if test="${timetableVO.searchGrade eq '1'}">selected="selected"</c:if>>1학년</option>
									<option value="2" <c:if test="${timetableVO.searchGrade eq '2'}">selected="selected"</c:if>>2학년</option>
									<option value="3" <c:if test="${timetableVO.searchGrade eq '3'}">selected="selected"</c:if>>3학년</option>
									<option value="4" <c:if test="${timetableVO.searchGrade eq '4'}">selected="selected"</c:if>>4학년</option>
								</select>
								<select name="searchCondition">
									<option value="All" selected="">전체</option>
									<option value="lectureSubnum" <c:if test="${timetableVO.searchCondition eq 'lectureSubnum'}">selected="selected"</c:if>>강의번호</option>
									<option value="lectureName" <c:if test="${timetableVO.searchCondition eq 'lectureName'}">selected="selected"</c:if>>강의명</option>
									<option value="lectureProfname" <c:if test="${timetableVO.searchCondition eq 'lectureProfname'}">selected="selected"</c:if>>교수명</option>
								</select>
							</div>
							<p class="input_box one">
								<input name="searchKeyword" id="focus"value="${timetableVO.searchKeyword}" type="text" placeholder="강의정보 검색">
								<a href="#"id="schButton"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"></path></svg></a>
							</p>
						</div>
					</form>
				
					<div class="table_list add" id="test" >
						<ul>
							<c:forEach var="lecture" items="${lectureList}" varStatus="status">
								<li id="${status.count}">
									<div class="basic">
										<div>
											<p class="num" id="num${status.count}" >${lecture.lectureSubnum}</p>
											<p class="tit" id="name${status.count}" >${lecture.lectureName}</p>
										</div>
										<p class="name">${lecture.lectureProfname}</p>
									</div>
									<div class="open">
										<div class="left">
											<p class="time">${lecture.lectureTime}</p>
											<p class="info">
												<span>${lecture.lectureStdgrade}학년</span><span>${lecture.lectureCategory}</span><span>${lecture.lectureCredit}학점</span>
											</p>
										</div>
										<a href="#none" class="btn_mini bt_green" id="btn" onclick="addTimetable('${status.count}')">추가</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
			
					<p class="paging" id="paging">
						<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
					</p>
				</div> 
			</div>
	</div>

			<%@include file="../../_inc/footer.jsp" %>
			<%@include file="../../_inc/bottom_menu.jsp" %>
</div>
<!-- //wrap -->
<div class="layer" id="add_Pop">
	<div class="bg"></div>
	<div class="pop-layer" id="addPop">
		<div class="pop_cont text" id="pop_cont1">
			<p class="mb20 c">선택한 강의는 시간표 중복 입니다.</p>
			<p class="btn"><a href="#" class="cbtn">확인</a></p>
		</div> 
		<div class="pop_cont text" id="pop_cont2">
			<p class="mb20 c">시간표 추가가 완료되었습니다.</p>
			<p class="two_btn btn"><a href="/timetable.do" class="bt_grayL">시간표로 이동</a><a href="#" class="cbtn">확인</a></p>
		</div> 
	</div>
</div>
	
<!-- 강의정보 선택 시 노출 -->
<div class="bottom_layer class_pop">
	<div class="bg"></div>
	<div class="bottom-pop-layer">
		<p class="box_btn line">
			<!-- <a href="#" class="plus_btn" id="lectureDetail">강의정보 보기</a> -->
			<!-- <a href="#" class="cbtn">수정</a> -->
			<a href="#" id="deleteSelected">삭제</a>
		</p>
	</div>
</div>
<!-- POPUP END -->
<script>
function preview(count){
	var num = document.getElementById("num"+count).textContent;
	var name = document.getElementById("name"+count).textContent;
	
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type: "POST",
		url:"/preview.do",
		data:{
			subnum: num,
			subname: name
		},
		success: function(ids) {
			var result = ids.split(':::');
			
			var start = new Array();
			var end = new Array();
			for(var i=0; i<result.length; i++){
				if(i%2 == 0){
					start.push(result[i]);
				} else {
					end.push(result[i]);
				}
			}
			
			if(document.getElementsByClassName('preview')[0] != null){
				$(".preview").removeAttr("style");
			}
			var scrollId;
			for(var i=0; i<start.length; i++) {
				for(var j=start[i]; j*1<end[i]; j=j*1+10){
					
					var id = "id"+j;
					if(scrollId == null || scrollId > id){
						scrollId = id;
					}
					

					document.getElementById(id).setAttribute("style","background-color: #808080; border:3px dashed; border-color:#808080;");
					document.getElementById(id).setAttribute("class","preview");
				}
			}
			document.getElementById(scrollId).scrollIntoView({behavior: 'smooth',block: 'nearest'});
		}
	});

}

// 업 다운
$(document).ready(function() { 
	$('#timetable').rowspan([0,1,2,3,4]);
	$(".del").click(function(){    
		$(".del_pop").addClass("active");
	})

	var selectedId;
	$(".class").click(function(){    
		$(".class_pop").addClass("active");
		var thisId = this.id;
		selectedId = $("#"+thisId+" p").attr("id");
	})

	$("#deleteSelected").click(function(){
		location.href = "timetable_deleteSelected.do?timetableSubnum="+selectedId;
	});
	
	$("#lectureDetail").click(function(){
		location.href = "lectureInfo_view.do?lectureSubnum="+selectedId;
	})
	
	$(".plus_btn, .bg").click(function(){    
		$(".bottom_layer").removeClass("active");
	})
	
	$(".cbtn").click(function(){    
		$(".bottom_layer").removeClass("active");
		location.reload();
	})
});

//강의추가 선택 클래스 옮기기
$(document).ready(function(){
	$(".table_list ul li").click(function(){
		var tb_line = $(this);
		
		preview(tb_line.attr('id'))
		
		if(tb_line.hasClass("on")){
		}else{
			tb_line.addClass("on");
			tb_line.siblings().removeClass("on"); //중복체크가 필요할 경우 삭제
		}
	})
});

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

