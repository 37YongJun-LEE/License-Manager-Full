<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="../../_inc/title.jsp" %>
<script>
function deleteAll(){
	if(confirm("시간표를 초기화 하시겠습니까?")){
		location.href = "timetable_delete.do";
	}
}
</script>
</head>
<body>
	<div id="wrap">
	<!-- HEADER BEGIN -->
		<header class="sub">
			<%@include file="../../_inc/header.jsp" %>
		</header>
	<!-- HEADER END -->

	<!-- CONTENTS BEGIN -->
		<div id="sub_contents" class="schedule head_mg">
			<div class="tab">
				<ul>
					<li><a href="/timetable.do" class="on">시간표 보기</a></li>
					<li><a href="/lectureInfo.do?lectureMajor=first">강의정보</a></li>
				</ul>
			</div>
			
			<div class="w_box no_line">
				<p class="green_date">${thisSemester }</p>
				<div class="name_tit">
					<p class="name">${nickname}님의 시간표</p>
					<div class="right">
						<p>
							<a href="timetable_create.do" class="plus">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M160 32V64H288V32C288 14.33 302.3 0 320 0C337.7 0 352 14.33 352 32V64H400C426.5 64 448 85.49 448 112V160H0V112C0 85.49 21.49 64 48 64H96V32C96 14.33 110.3 0 128 0C145.7 0 160 14.33 160 32zM0 192H448V464C448 490.5 426.5 512 400 512H48C21.49 512 0 490.5 0 464V192zM64 304C64 312.8 71.16 320 80 320H112C120.8 320 128 312.8 128 304V272C128 263.2 120.8 256 112 256H80C71.16 256 64 263.2 64 272V304zM192 304C192 312.8 199.2 320 208 320H240C248.8 320 256 312.8 256 304V272C256 263.2 248.8 256 240 256H208C199.2 256 192 263.2 192 272V304zM336 256C327.2 256 320 263.2 320 272V304C320 312.8 327.2 320 336 320H368C376.8 320 384 312.8 384 304V272C384 263.2 376.8 256 368 256H336zM64 432C64 440.8 71.16 448 80 448H112C120.8 448 128 440.8 128 432V400C128 391.2 120.8 384 112 384H80C71.16 384 64 391.2 64 400V432zM208 384C199.2 384 192 391.2 192 400V432C192 440.8 199.2 448 208 448H240C248.8 448 256 440.8 256 432V400C256 391.2 248.8 384 240 384H208zM320 432C320 440.8 327.2 448 336 448H368C376.8 448 384 440.8 384 432V400C384 391.2 376.8 384 368 384H336C327.2 384 320 391.2 320 400V432z"></path></svg>
							</a>
							<a href="/addTimetable.do?lectureMajor=first" class="plus">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M96 32C96 14.33 110.3 0 128 0C145.7 0 160 14.33 160 32V64H288V32C288 14.33 302.3 0 320 0C337.7 0 352 14.33 352 32V64H400C426.5 64 448 85.49 448 112V160H0V112C0 85.49 21.49 64 48 64H96V32zM448 464C448 490.5 426.5 512 400 512H48C21.49 512 0 490.5 0 464V192H448V464zM200 272V328H144C130.7 328 120 338.7 120 352C120 365.3 130.7 376 144 376H200V432C200 445.3 210.7 456 224 456C237.3 456 248 445.3 248 432V376H304C317.3 376 328 365.3 328 352C328 338.7 317.3 328 304 328H248V272C248 258.7 237.3 248 224 248C210.7 248 200 258.7 200 272z"/></svg>
							</a>
							<a href="#" class="del">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M495.9 166.6C499.2 175.2 496.4 184.9 489.6 191.2L446.3 230.6C447.4 238.9 448 247.4 448 256C448 264.6 447.4 273.1 446.3 281.4L489.6 320.8C496.4 327.1 499.2 336.8 495.9 345.4C491.5 357.3 486.2 368.8 480.2 379.7L475.5 387.8C468.9 398.8 461.5 409.2 453.4 419.1C447.4 426.2 437.7 428.7 428.9 425.9L373.2 408.1C359.8 418.4 344.1 427 329.2 433.6L316.7 490.7C314.7 499.7 307.7 506.1 298.5 508.5C284.7 510.8 270.5 512 255.1 512C241.5 512 227.3 510.8 213.5 508.5C204.3 506.1 197.3 499.7 195.3 490.7L182.8 433.6C167 427 152.2 418.4 138.8 408.1L83.14 425.9C74.3 428.7 64.55 426.2 58.63 419.1C50.52 409.2 43.12 398.8 36.52 387.8L31.84 379.7C25.77 368.8 20.49 357.3 16.06 345.4C12.82 336.8 15.55 327.1 22.41 320.8L65.67 281.4C64.57 273.1 64 264.6 64 256C64 247.4 64.57 238.9 65.67 230.6L22.41 191.2C15.55 184.9 12.82 175.3 16.06 166.6C20.49 154.7 25.78 143.2 31.84 132.3L36.51 124.2C43.12 113.2 50.52 102.8 58.63 92.95C64.55 85.8 74.3 83.32 83.14 86.14L138.8 103.9C152.2 93.56 167 84.96 182.8 78.43L195.3 21.33C197.3 12.25 204.3 5.04 213.5 3.51C227.3 1.201 241.5 0 256 0C270.5 0 284.7 1.201 298.5 3.51C307.7 5.04 314.7 12.25 316.7 21.33L329.2 78.43C344.1 84.96 359.8 93.56 373.2 103.9L428.9 86.14C437.7 83.32 447.4 85.8 453.4 92.95C461.5 102.8 468.9 113.2 475.5 124.2L480.2 132.3C486.2 143.2 491.5 154.7 495.9 166.6V166.6zM256 336C300.2 336 336 300.2 336 255.1C336 211.8 300.2 175.1 256 175.1C211.8 175.1 176 211.8 176 255.1C176 300.2 211.8 336 256 336z"/></svg>
							</a>
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
								<c:forEach var="day" items="${days}" varStatus="idx" >
								<td id="id${ss.count}${idx.count}" >
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
				</div>
			</div>
			<div class="w_box pb0" style="border-top:6px solid #eee;">
				<div class="top_tit">
					<p class="tit">친구 목록<span class="date">${now }</span></p>
					<p class="more"><a href="/mypage/myFriend.do">더보기<span></span><span></span></a></p>
				</div>

				<div class="friend">
				
				<ul class= "top">
				<c:forEach var="friend" items="${friendList}">
					<li>
						<div class="img" onclick="location.href='/friendView.do?usrIdx=${friend.usrIdx }'">
						<c:if test="${friend.friendIsfav eq 1}">
							<span class="star">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"></path></svg>
							</span>
						</c:if>
							<c:if test="${friend.usrSrvprofilepic != null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/upload/mypage/${friend.usrSrvprofilepic }')no-repeat 50% 50% / cover;"></p></c:if>
							<c:if test="${friend.usrSrvprofilepic == null}"><p class="img"><img alt="내 친구" src="/_img/_img/cont/friend_bg.png" style="background: url('/_img/_img/cont/no_photo.png')no-repeat 50% 50% / cover;"></p></c:if>
							
							<c:if test="${friend.nowstatus == 'N' }"><p class="border blue"></p></c:if> 
							<c:if test="${friend.nowstatus == 'A' }"><p class="border red"></p></c:if>
							<c:if test="${friend.nowstatus == 'B' }"><p class="border green"></p></c:if>
						</div>
						
						<div class="name" onclick="location.href='/friendView.do?usrIdx=${friend.usrIdx }'">
							<p class="list">${friend.usrNickname }(${friend.usrName })</p>
							<!-- 임시수업상태  -->
							<c:if test="${friend.nowstatus == 'N' }"><p class="ing">오늘 수업 없음</p></c:if> 
							<c:if test="${friend.nowstatus == 'A' }"><p class="ing">수업 중</p></c:if>
							<c:if test="${friend.nowstatus == 'B' }"><p class="ing">현재 수업 없음</p></c:if>	
						</div>
						<div>
							<a class="time" href="/friendTimetable.do?timetableUsridx=${friend.usrIdx }">시간표보기</a>
						</div>
					</li>
				</c:forEach>
				</ul>
				</div>
			</div>
			<%@include file="../../_inc/bottom_menu.jsp" %>
			<%@include file="../../_inc/footer.jsp" %>
		</div>
		<!-- CONTENTS END -->

		<!-- 초기화 아이콘 선택 시 노출 -->
		<div class="bottom_layer del_pop">
			<div class="bg"></div>
			<div class="bottom-pop-layer">
				<p class="box_btn"><a href="javascript:void(0)" onclick="deleteAll();" class="red cbtn">시간표 초기화</a></p>
			</div>
		</div>
		<!-- POPUP END -->

		<!-- 강의정보 선택 시 노출 -->
		<div class="bottom_layer class_pop">
			<div class="bg"></div>
			<div class="bottom-pop-layer">
				<p class="box_btn line">
					<a href="#" class="plus_btn" id="lectureDetail">강의정보 보기</a>
					<!-- <a href="#" class="cbtn">수정</a> -->
					<a href="#" class="cbtn" id="deleteSelected">삭제</a>
				</p>
			</div>
		</div>
		<!-- POPUP END -->

</div>
<!-- //wrap -->

<script>

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
	})
	
	$("#lectureDetail").click(function(){
		location.href = "lectureInfo_view.do?lectureSubnum="+selectedId;
	})
	
	$(".plus_btn, .cbtn, .bg").click(function(){    
		$(".bottom_layer").removeClass("active");
	})
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
<script>

/* 
 * 
 * 같은 값이 있는 열을 병합함
 * 
 * 사용법 : $('#테이블 ID').rowspan(0);
 * 
 */
 
 /* $.fn.rowspan = function(colIdx, isStats) {
     return this.each(function() {
         var that;
         $('tr', this).each(function(row) {
             $('td:eq(' + colIdx + ')', this).filter(':visible').each(function(col) {

                 if ($(this).html() == $(that).html() && (!isStats|| isStats && $(this).prev().html() == $(that).prev().html()) ) {
                     rowspan = $(that).attr("rowspan") || 1;
                     rowspan = Number(rowspan) + 1;

                     $(that).attr("rowspan", rowspan);

                     // do your action for the colspan cell here            
                     $(this).hide();

                     //$(this).remove(); 
                     // do your action for the old cell here

                 } else {
                     that = this;
                 }

                 // set the that if not already set
                 that = (that == null) ? this : that;
             });
         });
     });
 };




 $.fn.colspan = function(rowIdx) {
     return this.each(function() {

         var that;
         $('tr', this).filter(":eq(" + rowIdx + ")").each(function(row) {
             $(this).find('td').filter(':visible').each(function(col) {
                 if ($(this).html() == $(that).html()) {
                     colspan = $(that).attr("colSpan");
                     if (colspan == undefined) {
                         $(that).attr("colSpan", 1);
                         colspan = $(that).attr("colSpan");
                     }
                     colspan = Number(colspan) + 1;
                     $(that).attr("colSpan", colspan);
                     $(this).hide(); // .remove();  
                 } else {
                     that = this;
                 }

                 that = (that == null) ? this : that; // set the that if not already set  
             });
         });

     });
 } */

/*  $('#timetable').rowspan(3);
 $('#timetable').rowspan(0);
 $('#timetable').rowspan(1);
 $('#timetable').rowspan(2); */
</script>



</body>
</html>

