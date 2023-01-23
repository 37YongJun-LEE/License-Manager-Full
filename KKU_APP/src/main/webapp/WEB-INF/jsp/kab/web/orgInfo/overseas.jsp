<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="page_num_depth_01" value="2" />
<c:set var="page_num_depth_02" value="1" />

<html lang="utf-8">
	<head>
		<%@include file="../_inc/tit.jsp"%>
	</head>

<body>
	<div id="wrap">
		<%@include file="../_inc/header.jsp"%>
		<%@include file="../_inc/smn02.jsp"%>

		
		<div class="cont_view">
			<!-- 리스트디자인 -->
			<div class="cont_top">
				<h2>해외AB</h2>
				<ol class="loca">
					<li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
					<li>인증기관정보</li>
					<li>해외AB</li>
				</ol>
			</div>
			
			<ul class="ab_list">
				<li>
					<p class="ab_img"><img src="/_img/web/cont/ab_01.jpg" alt="IAS(미국)"/></p>
					<div>
					<p class="ab_tt">IAS(미국)</p>
						<p class="ab_name">International Accreditation Service (IAS)</p>
						<p class="ab_add">International Accreditation Service 3060 Saturn Street, Suite 100 Brea, CA 92821-1732 United States of America</p>
						<p class="ab_mail">msabaratnam@iasonline.org</p>
						<p class="ab_home"><a href="http://www.iasonline.org" target="_blank">http://www.iasonline.org</a></p>
					</div>
				</li>
				<li>
					<p class="ab_img"><img src="/_img/web/cont/ab_02.jpg" alt="IAS(미국)"/></p>
					<div>
					<p class="ab_tt">ANAB(미국)</p>
						<p class="ab_name">ANSI National Accreditation Board (ANAB)</p>
						<p class="ab_add">ANSI National Accreditation Board 330 E. Kilbourn Avenue, Suite 925 Milwaukee Wisconsin 53202 United States of America</p>
						<p class="ab_mail">lgillespie@anab.org</p>
						<p class="ab_home"><a href="http://www.anab.org" target="_blank">http://www.anab.org</a></p>
					</div>
				</li>
				<li>
					<p class="ab_img"><img src="/_img/web/cont/ab_03.jpg" alt="IAS(미국)"/></p>
					<div>
					<p class="ab_tt">UKAS(영국)</p>
						<p class="ab_name">United Kingdom Accreditation Service (UKAS)</p>
						<p class="ab_add">United Kingdom Accreditation Service 2 Pine Trees Chertsey Lane Staines-upon-Thames TW18 3HR United Kingdom</p>
						<p class="ab_mail">rob.bettinson@ukas.com</p>
						<p class="ab_home"><a href="http://www.ukas.com" target="_blank">http://www.ukas.com</a></p>
					</div>
				</li>
				<li>
					<p class="ab_img"><img src="/_img/web/cont/ab_04.jpg" alt="IAS(미국)"/></p>
					<div>
					<p class="ab_tt">DAkkS(독일)</p>
						<p class="ab_name">Deutsche Akkreditierungsstelle GmbH (DAkkS)</p>
						<p class="ab_add">German Accreditation Spittelmarkt 10 10117 Berlin Germany</p>
						<p class="ab_mail">international@dakks.de</p>
						<p class="ab_home"><a href="http://www.dakks.de" target="_blank">http://www.dakks.de</a></p>
					</div>
				</li>
	
				<li>
					<p class="ab_img"><img src="/_img/web/cont/ab_05.jpg" alt="IAS(미국)"/></p>
					<div>
					<p class="ab_tt">JAS-ANZ(호주, 뉴질랜드)</p>
						<p class="ab_name">Joint Accreditation System of Australia and New Zealand (JAS-ANZ)</p>
						<p class="ab_add">Joint Accreditation System of Australia and New Zealand Fecca House 4 Phipps Close Deakin, ACT 2600 Australia</p>
						<p class="ab_mail">james.galloway@jas-anz.org</p>
						<p class="ab_home"><a href="http://www.jas-anz.org" target="_blank">http://www.jas-anz.org</a></p>
					</div>
				</li>
				<li>
					<p class="ab_img"><img src="/_img/web/cont/ab_06.jpg" alt="IAS(미국)"/></p>
					<div>
					<p class="ab_tt">ACCREDIA(이탈리아)</p>
						<p class="ab_name">ACCREDIA (Italian National Accreditation Body)</p>
						<p class="ab_add">Italian Accreditation Body Via Guglielmo Saliceto, 7/9 00161 Rome Italy</p>
						<p class="ab_mail">info@accredia.it</p>
						<p class="ab_home"><a href="http://www.accredia.it" target="_blank">http://www.accredia.it</a></p>
					</div>
				</li>
				<li>
					<p class="ab_img"><img src="/_img/web/cont/ab_07.jpg" alt="IAS(미국)"/></p>
					<div>
					<p class="ab_tt">CNAS(중국)</p>
						<p class="ab_name">China National Accreditation Service for Conformity Assessment (CNAS)</p>
						<p class="ab_add">China National Accreditation Service for Conformity Assessment 8 NanHuaShi Dajie Dongcheng District Beijing 100062 P.R. China</p>
						<p class="ab_mail">info@cnas.org.cn</p>
						<p class="ab_home"><a href="http://www.cnas.org.cn" target="_blank">http://www.cnas.org.cn</a></p>
					</div>
				</li>
				<li>
					<p class="ab_img"><img src="/_img/web/cont/ab_08.jpg" alt="IAS(미국)"/></p>
					<div>
					<p class="ab_tt">JAB(일본)</p>
						<p class="ab_name">Japan Accreditation Board (JAB)</p>
						<p class="ab_add">Japan Accreditation Board NMF Shiba BLDG.2F 2-3 Shiba,4-CHOME MINATO-KU, Tokyo 108-0014 Japan</p>
						<p class="ab_mail">Yuko.Yoneoka@jab.or.jp</p>
						<p class="ab_home"><a href="http://www.jab.or.jp" target="_blank">http://www.jab.or.jp</a></p>
					</div>
				</li>
	
				<li>
					<p class="ab_img"><img src="/_img/web/cont/ab_09.jpg" alt="IAS(미국)"/></p>
					<div>
					<p class="ab_tt">TAF(대만)</p>
						<p class="ab_name">Taiwan Accreditation Foundation (TAF)</p>
						<p class="ab_add">Taiwan Accreditation Foundation 23F, 27, Jhong-Jheng E. Road, Sec. 2, Danshuei Dist., New Taipei City 25170, TAIWAN CHINESE TAIPEI</p>
						<p class="ab_mail">taf@taftw.org.tw</p>
						<p class="ab_home"><a href="http://www.taftw.org.tw" target="_blank">http://www.taftw.org.tw</a></p>
					</div>
				</li>
				<li>
					<p class="ab_img"><img src="/_img/web/cont/ab_10.jpg" alt="IAS(미국)"/></p>
					<div>
					<p class="ab_tt">BoA(베트남)</p>
						<p class="ab_name">Bureau of Accreditation (BoA)</p>
						<p class="ab_add">Bureau of Accreditation 8 Hoang Quoc Viet Street Cau Giay District Hanoi, Vietnam</p>
						<p class="ab_mail">vuthuy@boa.gov.vn</p>
						<p class="ab_home"><a href="http://www.boa.gov.vn" target="_blank">http://www.boa.gov.vn</a></p>
					</div>
				</li>
				
			</ul>	
		</div>
		<%@include file="../_inc/footer.jsp"%>
	</div>
</body>

</html>