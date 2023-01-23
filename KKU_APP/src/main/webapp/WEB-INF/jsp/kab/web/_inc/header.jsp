<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../_inc/tit.jsp"%>
<div id="header">
	<%-- <p class="gnb">
			<c:choose>
				<c:when test="${orgSessionVo eq null}">
					<a href="/web/login.do" class="join">로그인</a>
					<a href="/web/joinAgree.do" class="join"><img class="account" src="/_img/web/comn/my.png" alt="나의설정">회원가입</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="my">
						<img class="account" src="/_img/web/comn/my_gray.png" alt="나의설정"><span>${orgSessionVo.orgNmKr}</span>님
					</a>
					<a href="/web/logoutAction.do" class="logout"><span class="ti-power-off power"></span>로그아웃</a>			
				</c:otherwise>
			</c:choose>
		
	</p> --%>
	

	<div class="menu_wrap">
		
		
		<c:choose>
			<c:when test="${admissionSessionVo ne null }">
				<h1 class="logo"><a href="javascript:alert('잘못된 요청입니다.');"><img src="/_img/web/comn/t_logo.png" alt="한국인정지원센터 스마트인정시스템"/></a></h1> <!--img 293px*27px-->
				<ul class="menu">
					<li><a href="/web/eval/evalList.do" <c:if test="${page_num_depth_01 eq 1}">class="on"</c:if>>인정관리</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<h1 class="logo"><a href="/web/main.do"><img src="/_img/web/comn/t_logo.png" alt="한국인정지원센터 스마트인정시스템"/></a></h1> <!--img 293px*27px-->
				<ul class="menu">
					<li><a href="javascript:chkLogin('/web/application/applicationList.do','${orgSessionVo.orgIdx}')" <c:if test="${page_num_depth_01 eq 1}">class="on"</c:if>>인정관리</a></li>
					<%-- <li><a href="/web/orgInfo/overseas.do"<c:if test="${page_num_depth_01 eq 2}">class="on"</c:if>>인증기관 정보</a></li> --%>
					<li><a href="/web/support/boardList.do?bbsDiv=notices" <c:if test="${page_num_depth_01 eq 5}">class="on"</c:if>>고객센터</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
		
		
		 <p class="gnb">
			<c:choose>
				<c:when test="${orgSessionVo ne null}">
					<a href="/web/joinInfo.do" class="my">
						<img class="account" src="/_img/web/comn/my_gray.png" alt="나의설정"><span>${orgSessionVo.orgNmKr}</span>님
					</a>
					<a href="/web/logoutAction.do" class="logout"><span class="ti-power-off power"></span>로그아웃</a>
				</c:when>
				<c:when test="${admissionSessionVo ne null}">
					<a href="javascript:alert('잘못된 요청입니다.');" class="my">
						<img class="account" src="/_img/web/comn/my_gray.png" alt="나의설정"><span>${admissionSessionVo.admissionId}</span>님
					</a>
					<a href="/web/logoutAction.do" class="logout"><span class="ti-power-off power"></span>로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="/web/login.do">로그인</a>
					<a href="/web/joinAgree.do" class="join"><img class="account" src="/_img/web/comn/my.png" alt="나의설정">회원가입</a>		
				</c:otherwise>
			</c:choose>
		</p>
	</div>
   
</div> 
