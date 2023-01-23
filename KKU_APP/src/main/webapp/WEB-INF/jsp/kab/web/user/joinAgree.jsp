 <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="utf-8">
	<head>
		<%@include file="../_inc/tit.jsp" %>
		<script>
			$(document).ready(function(){
				$("#joinYn").val("N");
				$("#joinN").attr("checked","checked");
			});
			
			$(document).on("change","input[type=radio]",function(){
				$("input[type=radio]").removeAttr("checked");
				$(this).attr("checked","checked");
				$("#joinYn").val($(this).val());
			});
			function joinAgr(){
				if($("#joinYn").val()=="0"){
					return location.href="/web/joinInfo.do"
				} else{
					alert("약관에 동의해주세요.");
					return false;
				}
			}
		</script>
	</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp" %>
		<p class="top_line"></p>

		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
			     <h2>회원가입약관</h2>
			     <ol class="loca">
                    <li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
                    <li>회원가입</li>
                    <li>동의</li>
                </ol>
			</div>
			
			<h3>개인정보수집 및 이용안내</h3>
			
			<div class="agree_check2">
				<div class="agree_t">
					<h4>가. 개인정보 수집 및 이용목적</h4>
					<p>홈페이지 회원가입 및 관리회원 : 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리,각종 고지·통지, 고충처리 등을 목적으로 개인정보를 처리합니다. 민원사무처리민원인의 신원 확인, 처리결과 통보 등을 목적으로 개인정보를 처리합니다. 학술 및 연구개발 관련 업무 수행 : 학술 및 연구개발 활동 지원, 학술 및 연구개발 인력 양성, 외국박사학위 취득 신고 업무 등을 목적으로 개인정보를 처리합니다.</p>

					<h4>나. 수집하는 개인정보의 항목</h4>
					<h5 class="nomv">일반회원</h5>
					<ul class="basic_dot">
						<li>필수항목 : 아이디, 비밀번호, 이름, 연락처, 이메일, 이메일수신여부</li>
						<li>선택항목 : 없음</li>
						<li>홈페이지를 통한 만 14세 미만 아동의 회원가입 불가</li>
					</ul>
					<h5>연구자회원</h5>
					<ul class="basic_dot">
						<li>필수항목 : 성명, 이메일, 이메일수신여부, 연구실전화번호, 재직여부, 임용일, 타 기관 정보제공여부, 정보공개여부</li>
						<li>선택항목 : 핸드폰, FAX, 홈페이지주소, 소속정보(기관명, 분교/캠퍼스, 대학원, 학과, 세부전공 직급, 임용일자 등), 국적, 거주국가, 연구분야, 학위, 경력, 자격, 수상, 연구실적(논문, 저역서, 연구비, 전시 및 작품 발표, 학술활동, 기술이전)</li>
					</ul>

					<h4>다. 수집하는 개인정보의 보유 및 이용기간</h4>
					<ul class="basic_dot">
						<li>일반 회원 및 관리 : 2년 또는 회원탈퇴 시 까지</li>
						<li>연구자 회원 및 관리 : 준영구</li>
						<li>학술진흥법 제 14조(학술정보의 축적 등) 및 과학기술기본법 시행령 제47조 (과학기술인의 등록)에 근거</li>
						<li>다만, 관계법령 위반에 따른 수사 및 조사 등이 진행 중인 경우에는 해당 수사 및 조사 종료 시까지</li>
						<li>민원사무처리 :준영구</li>
						<li>학술 및 연구개발 관련업무 수행 :준영구</li>
					</ul>

					<h4>라. 개인정보 수집 및 이용에 대한 동의거부권 및 불이익에 대한 안내</h4>
					<p>이용자는 한국연구재단에서 수집하는 개인정보에 대해 동의를 거부할 권리가 있으며, 동의 거부 시 회원가입 및 한국연구재단에서 제공하는 서비스가 제한됩니다.</p>
				</div>
				<div class="agree_gray">				
					<p class="agree_tit">위 조건에 따른 개인정보 수집 및 이용에 동의 하십니까?</p>
					<div class="ag_check_w">		
						<input type="hidden" id="joinYn">		
						<p class="agc_box ra_base">
							<input type="radio" name="joinAgr" id="joinY" value="0">
							<label for="joinY" class="mr15">동의함</label>						
						</p>
						<p class="agc_box ra_base">
							<input type="radio" name="joinAgr" id="joinN" value="1">
							<label for="joinN" class="mr15">동의하지 않음</label>
						</p>
					</div>
				</div>
			</div>

			<p class="btn_area c">
				<a href="javascript:joinAgr();" class="btn_submit">가입하기</a>
			</p>
		</div>
	<%@include file="../_inc/footer.jsp" %>
	</div>
</body>

</html>