<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

//레프트메뉴
$(function(){
	$(".depth").hide();
	$(".depth02").hide();
	$('ul.left_menu li:has(.depth)').children('a').addClass('more'); 
	$('ul.depth li:has(.depth02)').children('a').addClass('more');

	//서브메뉴 조작
	$("ul.left_menu > li > a").on("click",function() {
		if($(this).is(".on")){
			$(this).removeClass("on");
		}else{
			$("ul.left_menu > li > a").removeClass("on");
			$(this).addClass("on");
		}
		$(this).next("ul.depth").slideToggle();
	});

	//서브메뉴2 조작
	$("ul.depth > li > a").on("click",function() {
		$("depth02").hide();
		$("ul.depth li a").removeClass("on");
		$(this).addClass("on");
		$(this).next("depth02").slideToggle();
	});

	$(function(){
		$("ul.left_menu > li > a.on").next("ul").css("display","block");
		$("ul.depth > li > a.on").next("ul").css("display","block");
	});
});
</script>
<div id="left">
	<ul class="left_menu">
		<c:set var="usrLevelCdChk" value="N"/>
		<c:forEach var="usrLevelCd" items="${fn:split(userSessionVo.usrLevelCd, ',')}">
			<c:if test="${usrLevelCd eq 'u6'}">
				<c:set var="usrLevelCdChk" value="Y"/>
			</c:if>
		</c:forEach>
		<c:choose>
			<c:when test="${usrLevelCdChk eq 'Y'}">
				<li>
					<a href="/kabadm/deliberate/reqList.do" <c:if test="${page_num_depth_02 eq 37}">class="on"</c:if>>심의관리</a>
					<ul class="depth02">
						<li><a href="/kabadm/deliberate/reqList.do" <c:if test="${page_num_depth_03 eq 2}">class="on"</c:if>>심의진행</a></li>
					</ul>
				</li>
			</c:when>
			<c:otherwise>
				<li>
					<a href="javascript:void(0);" <c:if test="${page_num_depth_01 eq 1}">class="on"</c:if>>회원관리</a>
					<ul class="depth">
						<li><a href="/kabadm/user/userList.do" <c:if test="${page_num_depth_02 eq 11}">class="on"</c:if>>자원관리</a></li>
						<li><a href="/kabadm/edu/eduList.do" <c:if test="${page_num_depth_02 eq 12}">class="on"</c:if>>교육훈련관리</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0);" <c:if test="${page_num_depth_01 eq 2}">class="on"</c:if>> 기관관리</a>
					<ul class="depth">
						<li><a href="/kabadm/company/orgList.do" <c:if test="${page_num_depth_02 eq 21}">class="on"</c:if>>인증기관관리</a></li>
						<li><a href="/kabadm/application/appliHistoryList.do" <c:if test="${page_num_depth_02 eq 22}">class="on"</c:if>>인정신청내역관리</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0);" <c:if test="${page_num_depth_01 eq 3}">class="on"</c:if>>인정평가관리</a>		
					<ul class="depth">
						<li><a href="/kabadm/project/projectDateListAll.do" <c:if test="${page_num_depth_02 eq 30}">class="on"</c:if>>프로젝트관리</a></li>
						
						<li>
							<a href="/kabadm/schedule/scheduleList.do" <c:if test="${page_num_depth_02 eq 31}">class="on"</c:if>>스케줄관리</a>
							<ul class="depth02">
								<li><a href="/kabadm/schedule/scheduleList.do" <c:if test="${page_num_depth_03 eq 1}">class="on"</c:if>>스케줄관리</a></li>
								<li><a href="/kabadm/user/availableList.do" <c:if test="${page_num_depth_03 eq 2}">class="on"</c:if>>평가사가용현황</a></li>
							</ul>
						</li>
						
						<li>
							<a href="/kabadm/planTemp/planTempList.do" <c:if test="${page_num_depth_02 eq 32}">class="on"</c:if>>평가계획관리</a>
							<ul class="depth02">
								<li><a href="/kabadm/planTemp/planTempList.do" <c:if test="${page_num_depth_03 eq 1}">class="on"</c:if>>평가대상관리</a></li>
								<li><a href="/kabadm/plan/planList.do" <c:if test="${page_num_depth_03 eq 2}">class="on"</c:if>>평가계획수립</a></li>
							</ul>
						</li>
						<li><a href="/kabadm/perform/performList.do" <c:if test="${page_num_depth_02 eq 34}">class="on"</c:if>>평가수행관리</a></li>
						<li>
							<a href="/kabadm/report/reportList.do" <c:if test="${page_num_depth_02 eq 35}">class="on"</c:if>>결과보고서관리</a>
							<ul class="depth02">
								<li><a href="/kabadm/report/reportList.do" <c:if test="${page_num_depth_03 eq 1}">class="on"</c:if>>결과보고대상관리</a></li>
								<li><a href="/kabadm/report/reportResultList.do" <c:if test="${page_num_depth_03 eq 2}">class="on"</c:if>>결과보고서관리</a></li>
							</ul>
						</li>
						<li>
							<a href="/kabadm/verify/verifyListAd.do" <c:if test="${page_num_depth_02 eq 36}">class="on"</c:if>>검증관리</a>
							<ul class="depth02">
								<li><a href="/kabadm/verify/verifyListAd.do" <c:if test="${page_num_depth_03 eq 1}">class="on"</c:if>>검증관리</a></li>
								<li><a href="/kabadm/verify/verifyListCo.do" <c:if test="${page_num_depth_03 eq 2}">class="on"</c:if>>검증진행 및 확인</a></li>
							</ul>
						</li>
						<c:set var="authChk" value="N"/>
						<c:forEach var="authItem" items="${fn:split(userSessionVo.auth, ',')}">
							<c:if test="${authItem eq '1' or authItem eq '4'}">
								<c:set var="authChk" value="Y"/>
							</c:if>
						</c:forEach>
						
						<c:if test="${authChk eq 'Y'}">
							<li><a href="/kabadm/deliberate/deliList.do" <c:if test="${page_num_depth_02 eq 37}">class="on"</c:if>>심의관리</a></li>
						</c:if>
					</ul>
				</li>
				<c:if test="${authChk eq 'Y'}">
					<li>
						<a href="javascript:void(0);" <c:if test="${page_num_depth_01 eq 7}">class="on"</c:if>>인정서관리</a>
						<ul class="depth">
							<li><a href="/kabadm/certi/certiList.do" <c:if test="${page_num_depth_02 eq 71}">class="on"</c:if>>인정서 발급 및 관리</a></li>
						</ul>
					</li>
				</c:if>
				<li>
					<a href="javascript:void(0);" <c:if test="${page_num_depth_01 eq 4}">class="on"</c:if>>통계관리</a>
					<ul class="depth">
						<li><a href="/kabadm/stat/orgMdStatistics.do" <c:if test="${page_num_depth_02 eq 41}">class="on"</c:if>>평가 MD 통계</a></li>
						<%-- <li><a href="/kabadm/stat/orgMdStatistics.do" <c:if test="${page_num_depth_02 eq 41}">class="on"</c:if>>기관별 MD 통계</a></li>
						<li><a href="/kabadm/stat/usrMdStatistics.do" <c:if test="${page_num_depth_02 eq 42}">class="on"</c:if>>평가사별 MD 통계</a></li> --%>
						<li><a href="/kabadm/stat/disBreakdown.do" <c:if test="${page_num_depth_02 eq 43}">class="on"</c:if>>발견사항 내역</a></li>
						<li><a href="/kabadm/stat/disStatistics.do" <c:if test="${page_num_depth_02 eq 44}">class="on"</c:if>>발견사항 통계</a></li>
					</ul>
				</li>
				<%-- <li>
					<a href="javascript:alert('준비중입니다.');" <c:if test="${page_num_depth_01 eq 4}">class="on"</c:if>>통계관리</a>
				</li> --%>
				<%-- <li>
					<a href="javascript:void(0);" <c:if test="${page_num_depth_01 eq 6}">class="on"</c:if>>결과보고</a>
					<ul class="depth">
						<li><a href="javascript:alert('준비중입니다.');" <c:if test="${page_num_depth_02 eq 1}">class="on"</c:if>>결과보고 대상관리</a></li>
					</ul>
				</li> --%>
				<li>
					<a href="javascript:void(0);" <c:if test="${page_num_depth_01 eq 5}">class="on"</c:if>>게시판관리</a>
					<ul class="depth">
						<li><a href="/kabadm/board/boardList.do?bbsDiv=notices" <c:if test="${page_num_depth_02 eq 51}">class="on"</c:if>>공지사항</a></li>
						<li><a href="/kabadm/board/boardList.do?bbsDiv=qna" <c:if test="${page_num_depth_02 eq 52}">class="on"</c:if>>Q&A</a></li>
						<li><a href="/kabadm/board/boardList.do?bbsDiv=faq" <c:if test="${page_num_depth_02 eq 53}">class="on"</c:if>>FAQ</a></li> 
						<!-- http://sian.pms.or.kr/ics/evaluation/evnote01.html -->
					</ul>
				</li>
				<%-- <li>
					<a href="javascript:alert('준비중입니다.');" <c:if test="${page_num_depth_01 eq 6}">class="on"</c:if>>기타관리</a>
				</li> --%>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
