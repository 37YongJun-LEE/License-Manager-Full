<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="page_num_depth_01" value="2" />
<c:set var="page_num_depth_02" value="2" />

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
			     <h2>국내 인증기관</h2>
			     <ol class="loca">
                    <li><img src="/_img/web/comn/loca_home.png" alt="홈페이지 메인으로"></li>
                    <li>인증기관정보</li>
                    <li>국내 인증기관</li>
                </ol>
			</div>
			
			<!-- <div class="list_top">
                <p class="count">검색총건수 <span>63</span>건</p>
                <div class="bbs_search_bar">
                    <p class="s_sel">
                        <select style="width:175px; padding-right:25px !important;">
                            <option value="alla" selected="">인증기관</option>
                            <option value="tit">인증표준</option>
                            <option value="cont">인증수행범위(CODE)</option>
                        </select>
                    </p>

                   <p class="word">
                        <input type="text" style="display:none;">
                        <input type="text" placeholder="검색어를 입력해주세요">
                    </p>

                    <p class="search_btn">
                        <a href="javascript:void(0);"><img src="/../_img/web/comn/search.png" alt="검색하기"></a>
                    </p>
                </div>
                
            </div>		 -->	
			<table class="baselist">
				<colgroup><col style="width:8%"><col style="width:22%"><col style="width:auto"></colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>인증기관</th>
						<th>인증표준</th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td>1</td>
					<td class="l domestic"><span>(재)한국품질재단 [kfq]</span></td>
					<td class="l domestic">품질경영, 환경경영, 정보통신, 안전보건, 식품안전, 정보보안, 녹색경영, 에너지, FSSC, 비즈니스연속성 반부패, 항공우주</td>
				</tr>
						
				<tr>
					<td>2</td>
					<td class="l domestic"><span>크레비즈큐엠 [CreBiz QM]</span></td>
					<td class="l">품질경영, 환경경영, 정보통신, 안전보건</td>
				</tr>
						
				<tr>
					<td>3</td>
					<td class="l domestic"><span>한국생산성본부인증원 [KPC-QA]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 식품안전, 비즈니스연속성, 반부패</td>
				</tr>
						
				<tr>
					<td>4</td>
					<td class="l domestic"><span>한국품질보증원 [KQA]</span></td>
					<td class="l">품질경영, 환경경영, 정보통신, 안전보건, 식품안전, 정보보안</td>
				</tr>
						
				<tr>
					<td>5</td>
					<td class="l domestic"><span>케이티씨인증원 [KTC-QA]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>6</td>
					<td class="l domestic"><span>KTR 인증센터 [KTR-CC]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>7</td>
					<td class="l domestic"><span>에스비씨인증원 [SBCR]</span></td>
					<td class="l">품질경영, 환경경영, 정보통신, 안전보건, 식품안전, 반부패</td>
				</tr>
						
				<tr>
					<td>8</td>
					<td class="l domestic"><span>한국선급 [KR]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 비즈니스연속성</td>
				</tr>
						
				<tr>
					<td>9</td>
					<td class="l domestic"><span>디엔브이지엘 비즈니스 어슈어런스 코리아[DNV GL]</span></td>
					<td class="l">런스 코리아[DNV GL]	품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>10</td>
					<td class="l domestic"><span>건연인증원[CRK-RS]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>11</td>
					<td class="l domestic"><span>로이드인증원[LRQA]</span></td>
					<td class="l">품질경영, 환경경영, 반부패, 항공우주</td>
				</tr>
						
				<tr>
					<td>12</td>
					<td class="l domestic"><span>한국건설품질인증원[KICM-QA]</span></td>
					<td class="l">품질경영</td>
				</tr>
						
				<tr>
					<td>13</td>
					<td class="l domestic"><span>한국경영인증원[KMR]</span></td>
					<td class="l">품질경영, 환경경영, 정보통신, 안전보건, 식품안전, 정보보안, FSSC, 비즈니스연속성, 반부패, 의료기기</td>
				</tr>
						
				<tr>
					<td>14</td>
					<td class="l domestic"><span>기술사인증원(주)[SPEC]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 식품안전, 반부패, 교육경영</td>
				</tr>
						
				<tr>
					<td>15</td>
					<td class="l domestic"><span>한국뷰로베리타스 주식회사[BVC]</span></td>
					<td class="l"></td>
				</tr>
						
				<tr>
					<td>16</td>
					<td class="l domestic"><span>한국가스안전공사[KGS]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>17</td>
					<td class="l domestic"><span>(주)한국경총인증원[KEF-CR]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>18</td>
					<td class="l domestic"><span>에스에이아이 글로벌(주)[SAI]</span></td>
					<td class="l">품질경영, 항공우주</td>
				</tr>
						
				<tr>
					<td>19</td>
					<td class="l domestic"><span>한국에스지에스[SGS]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>20</td>
					<td class="l domestic"><span>국제기술품질인증원[ITQA]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>21</td>
					<td class="l domestic"><span>국제표준인증원[ISC]</span></td>
					<td class="l">품질경영, 환경경영, 정보통신</td>
				</tr>
						
				<tr>
					<td>22</td>
					<td class="l domestic"><span>케이에스알인증원[KSR]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 비즈니스연속성, 반부패</td>
				</tr>
						
				<tr>
					<td>23</td>
					<td class="l domestic"><span>한국표준협회[KSA]</span></td>
					<td class="l">품질경영, 환경경영, 정보통신, 안전보건, 식품안전, 녹색경영, 에너지, FSSC, 비즈니스연속성
반부패</td>
				</tr>
						
				<tr>
					<td>24</td>
					<td class="l domestic"><span>시스템코리아인증원[SYSKO]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 비즈니스연속성</td>
				</tr>
						
				<tr>
					<td>25</td>
					<td class="l domestic"><span>세계표준인증원[WSCS]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>26</td>
					<td class="l domestic"><span>키와 코리아(주)[Kiwa Korea]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 비즈니스연속성, 항공우주</td>
				</tr>
						
				<tr>
					<td>27</td>
					<td class="l domestic"><span>한국인증원(주)[KCR]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 식품안전</td>
				</tr>
						
				<tr>
					<td>28</td>
					<td class="l domestic"><span>케이큐엘인증원[KQL]</span></td>
					<td class="l">품질경영, 환경경영, 정보통신, 안전보건</td>
				</tr>
						
				<tr>
					<td>29</td>
					<td class="l domestic"><span>한국국제규격인증원[KIC]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>30</td>
					<td class="l domestic"><span>저먼서트(주)[GCK]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 식품안전</td>
				</tr>
						
				<tr>
					<td>31</td>
					<td class="l domestic"><span>한국품질진흥원(주)[KSQ]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 식품안전</td>
				</tr>
						
				<tr>
					<td>32</td>
					<td class="l domestic"><span>지속가능인증원[CSR]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>33</td>
					<td class="l domestic"><span>에이케이인증원(주)[AKR]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 비즈니스연속성</td>
				</tr>
						
				<tr>
					<td>34</td>
					<td class="l domestic"><span>아이엠에스인증원(주)[IMS]</span></td>
					<td class="l">안전보건</td>
				</tr>
						
				<tr>
					<td>35</td>
					<td class="l domestic"><span>(주)한국표준경영원[SMI]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>36</td>
					<td class="l domestic"><span>글로벌경영인증원(주)[GMR]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>37</td>
					<td class="l domestic"><span>(주)한국경제인증원[KECR]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>38</td>
					<td class="l domestic"><span>케이티엘엠에스인증원(주)[KTLMS]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>39</td>
					<td class="l domestic"><span>(주)오큐에스인증원[OQS]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>40</td>
					<td class="l domestic"><span>국방기술품질원[DTaQ]</span></td>
					<td class="l">품질경영</td>
				</tr>
						
				<tr>
					<td>41</td>
					<td class="l domestic"><span>(주)ICR[ICR]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 식품안전, FSSC</td>
				</tr>
						
				<tr>
					<td>42</td>
					<td class="l domestic"><span>(주)지써티[GCT]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>43</td>
					<td class="l domestic"><span>(주)한국산업인증원[KICR]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>44</td>
					<td class="l domestic"><span>트라국제인증원(주)[TRACI]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>45</td>
					<td class="l domestic"><span>디큐에스코리아(유)[DQS]</span></td>
					<td class="l">품질경영</td>
				</tr>
						
				<tr>
					<td>46</td>
					<td class="l domestic"><span>(주)한국가치경영인증원[KVM]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>47</td>
					<td class="l domestic"><span>한국시스템인증원(주)[KSC]</span></td>
					<td class="l">품질경영, 환경경영, 식품안전</td>
				</tr>
						
				<tr>
					<td>48</td>
					<td class="l domestic"><span>(주)로열서트국제인증원[ROYALCERT]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>49</td>
					<td class="l domestic"><span>한국적합성평가원(주)[KCA]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>50</td>
					<td class="l domestic"><span>티유브이노르트코리아[TUV-Nord]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건, 비즈니스연속성</td>
				</tr>
						
				<tr>
					<td>51</td>
					<td class="l domestic"><span>한국컴플라이언스인증원(주)[KCCA]</span></td>
					<td class="l">품질경영, 환경경영, 반부패</td>
				</tr>
						
				<tr>
					<td>52</td>
					<td class="l domestic"><span>Food Safety Institute International[FSI]</span></td>
					<td class="l">FSSC</td>
				</tr>
						
				<tr>
					<td>53</td>
					<td class="l domestic"><span>(주)한국기업인증원[KOCI]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>54</td>
					<td class="l domestic"><span>한국검인증(주)[KCV]</span></td>
					<td class="l">산림경영</td>
				</tr>
						
				<tr>
					<td>55</td>
					<td class="l domestic"><span>(주)글로벌표준인증원[GSC]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>56</td>
					<td class="l domestic"><span>이큐인증원(주)[EQ]</span></td>
					<td class="l">품질경영, 환경경영</td>
				</tr>
						
				<tr>
					<td>57</td>
					<td class="l domestic"><span>피닉스인증원(주)[PR]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>58</td>
					<td class="l domestic"><span>㈜한국경영시스템인증원[KMSC]</span></td>
					<td class="l">품질경영, 환경경영, 안전보건</td>
				</tr>
						
				<tr>
					<td>59</td>
					<td class="l domestic"><span>(주)국제식품안전공사(IFSC)</span></td>
					<td class="l">식품안전</td>
				</tr>
						
				<tr>
					<td>60</td>
					<td class="l domestic"><span>한국심사자격인증원 [KAR]  - 자격인증기관  </span></td>
					<td class="l">기타1</td>
				</tr>
						
				<tr>
					<td>61</td>
					<td class="l domestic"><span>한국비파괴검사학회 [KSNT] - 자격인증기관</span></td>
					<td class="l">기타1</td>
				</tr>
						
				<tr>
					<td>62</td>
					<td class="l domestic"><span>한국설비진단자격인증원 [KCI-MD]  - 자격인증기관  </span></td>
					<td class="l">기타1</td>
				</tr>
						
				<tr>
					<td>63</td>
					<td class="l domestic"><span>피씨에이에이 [PCAA]</span></td>
					<td class="l">기타1</td>
				</tr>
			</tbody>		
			</table>
			<!-- 리스트디자인 끝 -->
           
		</div>

	</div>
		<%@include file="../_inc/footer.jsp"%>
	</div>
</body>

</html>