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
		<div class="navi">
			<div class="top_navi"><a href="timetable.do"><img src="/_img/_img/cont/navi_arrow.png"></a><h2>시간표 추가</h2></div>
		</div>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="schedule mb140">
			
			<div class="w_box no_line">
				<p class="green_date">${thisSemester }</p>
					<div class="name_tit">
						<p class="name">${nickname}님의 시간표</p>
						<a class="btn_mini bt_green" href="#">완료</a>
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

				<ul class="form2 mt30">
					<li>
						<input type="text" id="scheduleName" name="scheduleName" placeholder="수업명">
					</li>
					<li class="time line">
						<input type="text" id="location" name="location" placeholder="강의실" class="mb10">
						<div class="flex">
							<select id="selectDay" name="selectDay" class="mr5">
								<option value="mon">월</option>
								<option value="tue">화</option>
								<option value="wed">수</option>
								<option value="thr">목</option>
								<option value="fri">금</option>
								<option value="sat">토</option>
								<option value="sun">일</option>
							</select>
							<select id="startTime" name="startTime" onchange="preview(1)">
								<option value="0900">09:00</option>
								<option value="0930">09:30</option>
								<option value="1000">10:00</option>
								<option value="1030">10:30</option>
								<option value="1100">11:00</option>
								<option value="1130">11:30</option>
								<option value="1200">12:00</option>
								<option value="1230">12:30</option>
								<option value="1300">13:00</option>
								<option value="1330">13:30</option>
								<option value="1400">14:00</option>
								<option value="1430">14:30</option>
								<option value="1500">15:00</option>
								<option value="1530">15:30</option>
								<option value="1600">16:00</option>
								<option value="1630">16:30</option>
								<option value="1700">17:00</option>
								<option value="1730">17:30</option>
								<option value="1800">18:00</option>
							</select>
							<p>~</p>
							<select id="endTime" name="endTime">
								<option value="0900">09:00</option>
								<option value="0930">09:30</option>
								<option value="1000">10:00</option>
								<option value="1030">10:30</option>
								<option value="1100">11:00</option>
								<option value="1130">11:30</option>
								<option value="1200">12:00</option>
								<option value="1230">12:30</option>
								<option value="1300">13:00</option>
								<option value="1330">13:30</option>
								<option value="1400">14:00</option>
								<option value="1430">14:30</option>
								<option value="1500">15:00</option>
								<option value="1530">15:30</option>
								<option value="1600">16:00</option>
								<option value="1630">16:30</option>
								<option value="1700">17:00</option>
								<option value="1730">17:30</option>
								<option value="1800">18:00</option>
							</select>
							<a href="javascript:delSchedule(1);" class="del2"><span></span></a>
						</div>
					</li>
					<div id="tagArea">
					
					</div>
					<li class="plus mt10"><a href="javascript:addSchedule(1);">시간 및 장소 추가<span></span><span></span></a></li>
				</ul>
			</div>
			
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
		</div>
	<!-- CONTENTS END -->

</div>
<!-- //wrap -->
<script>
function addSchedule(ele){
	let tagArea = document.getElementById('tagArea');
	let new_liTag = document.createElement('li');
	
	new_liTag.setAttribute('class', 'time line');
	new_liTag.setAttribute('id', 'time_line'+ele);
	new_liTag.innerHTML = ""+
"	<input type='text' id='location' name='location' placeholder='강의실' class='mb10'><div class='flex'>"+
"	<select id='selectDay' name='selectDay' class='mr5'><option value='mon'>월</option>"+
"		<option value='tue'>화</option>"+
"		<option value='wed'>수</option>"+
"		<option value='thr'>목</option>"+
"		<option value='fri'>금</option>"+
"		<option value='sat'>토</option>"+
"		<option value='sun'>일</option>"+
"	</select>"+
"	<select id='startTime' name='startTime'>"+
"		<option value='0900'>09:00</option>"+
"		<option value='0930'>09:30</option>"+
"		<option value='1000'>10:00</option>"+
"		<option value='1030'>10:30</option>"+
"		<option value='1100'>11:00</option>"+
"		<option value='1130'>11:30</option>"+
"		<option value='1200'>12:00</option>"+
"		<option value='1230'>12:30</option>"+
"		<option value='1300'>13:00</option>"+
"		<option value='1330'>13:30</option>"+
"		<option value='1400'>14:00</option>"+
"		<option value='1430'>14:30</option>"+
"		<option value='1500'>15:00</option>"+
"		<option value='1530'>15:30</option>"+
"		<option value='1600'>16:00</option>"+
"		<option value='1630'>16:30</option>"+
"		<option value='1700'>17:00</option>"+
"		<option value='1730'>17:30</option>"+
"		<option value='1800'>18:00</option>"+
"	</select>"+
"	<p>~</p>"+
"	<select id='endTime' name='endTime'>"+
"		<option value='0900'>09:00</option>"+
"		<option value='0930'>09:30</option>"+
"		<option value='1000'>10:00</option>"+
"		<option value='1030'>10:30</option>"+
"		<option value='1100'>11:00</option>"+
"		<option value='1130'>11:30</option>"+
"		<option value='1200'>12:00</option>"+
"		<option value='1230'>12:30</option>"+
"		<option value='1300'>13:00</option>"+
"		<option value='1330'>13:30</option>"+
"		<option value='1400'>14:00</option>"+
"		<option value='1430'>14:30</option>"+
"		<option value='1500'>15:00</option>"+
"		<option value='1530'>15:30</option>"+
"		<option value='1600'>16:00</option>"+
"		<option value='1630'>16:30</option>"+
"		<option value='1700'>17:00</option>"+
"		<option value='1730'>17:30</option>"+
"		<option value='1800'>18:00</option>"+
"	</select>"+
"	<a href='javascript:delSchedule(1);' class='del2'><span></span></a>"+
"</div>";
	
	tagArea.appendChild(new_liTag);
}
function delSchedule(ele){
	let test = document.getElementById('time_line'+ele);
	
	test.parentNode.removeChild(test);
}
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