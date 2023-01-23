package egovframework.cms.com.service.impl;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import egovframework.cms.com.service.EgovCmsComEmailVO;
import egovframework.cms.com.service.EgovCmsComService;
import egovframework.cms.com.service.EgovCmsComSmsVO;
import egovframework.cms.com.service.EgovCmsEmTranVo;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("commonService")
public class EgovCmsComServiceImpl implements EgovCmsComService{
	
	@Resource(name = "commonDAO")
	private EgovCmsComDAO dao;
	
	java.util.Calendar cal = java.util.Calendar.getInstance();

	int year = cal.get ( cal.YEAR );

	/*@Resource(name = "siteService")
    private EgovCmsWithcmsSiteService siteService;*/
	
	@Override
	public List<EgovMap> getCommCodeList(String codeVal) throws Exception {
		return dao.getComCodeList(codeVal);
	}
	
	@Override
	public List<EgovMap> getCommCodeList2(String codeVal) throws Exception {
		return dao.getComCodeList2(codeVal);
	}
	@Override
	public List<EgovMap> getCommCodeList3(String codeVal) throws Exception {
		return dao.getComCodeList3(codeVal);
	}
	@Override
	public List<EgovMap> getCommCodeList4(String codeVal) throws Exception {
		return dao.getComCodeList4(codeVal);
	}
	@Override
	public List<EgovMap> getCommMemCodeList(String codeVal) throws Exception {
		return dao.getComMemCodeList(codeVal);
	}

	@Override
	public List<EgovMap> getCommMemberCodeList(String codeVal) throws Exception {
		return dao.getComMemberCodeList(codeVal);
	}

	@Override
	public EgovMap getCommConfigSelectById(String cfgVal) throws Exception {
		return dao.getCommConfigSelectById(cfgVal);
	}

	/*@Override
	public String getMenuName(EgovLmsAdminVO adminVO) throws Exception {
		return lmsAdminDAO.getMenuName(adminVO);
	}
	 */
	
	@Override
	public List<EgovMap> defaultList(String sqlId, Object vo) throws Exception {
		return dao.defaultList(sqlId, vo);
	}

	@Override
	public EgovMap defaultSelectById(String sqlId, Object vo) throws Exception {
		return dao.defaultSelectById(sqlId, vo);
	}

	@Override
	public void defaultInsert(String sqlId, Object vo) throws Exception {
		dao.defaultInsert(sqlId, vo);
	}

	@Override
	public int defaultInsertLastId(String sqlId, Object vo) throws Exception {
		return dao.defaultInsertLastId(sqlId, vo);
	}

	@Override
	public void defaultUpdate(String sqlId, Object vo) throws Exception {
		dao.defaultUpdate(sqlId, vo);
	}
	
	@Override
	public int defaultUpdateInt(String sqlId, Object vo) throws Exception {
		return dao.defaultUpdateInt(sqlId, vo);
	}

	@Override
	public void defaultDelete(String sqlId, Object vo) throws Exception {
		dao.defaultDelete(sqlId, vo);
	}

	@Override
	public int defaultInt(String sqlId, Object vo) throws Exception {
		return dao.defaultInt(sqlId, vo);
	}

	@Override
	public String defaultString(String sqlId, Object vo) throws Exception {
		return dao.defaultString(sqlId, vo);
	}

	@Override
	public EgovMap getBcfInfoByBcfId(String bcfId) throws Exception {
		return dao.getBcfInfoByBcfId(bcfId);
	}
	
	@Override
	public EgovMap getMenuInfoByMenuId(String siteCd, String menuId) throws Exception {
		return dao.getMenuInfoByMenuId(siteCd, menuId);
	}

   
		
	
	public String getEngMonth(String inDate) throws Exception {
    	
    	inDate = inDate.replace("-", "");
    	
    	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
    	Date outDate = format.parse(inDate);
    	format = new SimpleDateFormat("MMM. dd (E)", Locale.ENGLISH);
    	String outMonth = format.format(outDate);
    	
    	if(outMonth.substring(0, 3).equals("Jan")) {
    		outMonth = outMonth.replace("Jan", "January");
    	} else if(outMonth.substring(0, 3).equals("Feb")) {
    		outMonth = outMonth.replace("Feb", "February");
    	} else if(outMonth.substring(0, 3).equals("Mar")) {
    		outMonth = outMonth.replace("Mar", "March");
    	} else if(outMonth.substring(0, 3).equals("Apr")) {
    		outMonth = outMonth.replace("Apr", "April");
    	} else if(outMonth.substring(0, 3).equals("May")) {
    		outMonth = outMonth.replace("May", "May");
    	} else if(outMonth.substring(0, 3).equals("Jun")) {
    		outMonth = outMonth.replace("Jun", "June");
    	} else if(outMonth.substring(0, 3).equals("Jul")) {
    		outMonth = outMonth.replace("Jul", "July");
    	} else if(outMonth.substring(0, 3).equals("Ang")) {
    		outMonth = outMonth.replace("Aug", "August");
    	} else if(outMonth.substring(0, 3).equals("Sep")) {
    		outMonth = outMonth.replace("Sep", "September");
    	} else if(outMonth.substring(0, 3).equals("Oct")) {
    		outMonth = outMonth.replace("Oct", "October");
    	} else if(outMonth.substring(0, 3).equals("Nov")) {
    		outMonth = outMonth.replace("Nov", "November");
    	} else if(outMonth.substring(0, 3).equals("Dec")) {
    		outMonth = outMonth.replace("Dec", "December");
    	}
    	
    	return outMonth;
    }
    
    public String getKorMonth(String inDate) throws Exception {
    	
    	inDate = inDate.replace("-", "");
	   	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	   	Date outDate = format.parse(inDate);
	   	format = new SimpleDateFormat("MM월 dd일 (E)", Locale.KOREA);
   		String outMonth = format.format(outDate);
   	
   		return outMonth;
    }
    
    /**
     * 시스템 메일 발송
     * @param 
     * @return 
     * @exception
     */
    @Override
    public String sendSystemEmail(String email, String receiver, String msg, String type) throws Exception {
    	try {
    		String siteUrl = EgovProperties.getProperty("Globals.siteUrl"); // 사이트 도메인 주소
    		String fromEmail = EgovProperties.getProperty("Globals.SMTP.userId"); // 발신자 이메일 주소
    		String fromName = EgovProperties.getProperty("Globals.SMTP.userName"); // 발신자 이름
    		String mailTitle = "[한국인정지원센터] "; // 메일 제목 title
    		String mailHeader = "";	// 메일 본문 header
    		String mailMsg = "";	// 메일 본문 body
    		String mailFooter = "";	// 메일 본문 footer
    		String[] msgArr;
    		
    		mailHeader += "<!doctype html>";
    		mailHeader += "<html lang=\"en\">";
    		mailHeader += " <head>";
    		mailHeader += "  <meta charset=\"UTF-8\">";
    		mailHeader += "  <meta name=\"Generator\" content=\"EditPlus®\">";
    		mailHeader += "  <meta name=\"Author\" content=\"\">";
    		mailHeader += "  <meta name=\"Keywords\" content=\"\">";
    		mailHeader += "  <meta name=\"Description\" content=\"\">";
    		mailHeader += "  <title>한국인정지원센터 스마트인정시스템 웹메일</title>";
    		mailHeader += " </head>";
    		mailHeader += " <body>";
            mailHeader += "";
    		mailHeader += "<style type=\"text/css\">";
    		mailHeader += "<!--";
    		mailHeader += "*			{padding:0; margin:0; }";
    		mailHeader += "table  		{border-collapse:collapse;}";
    		mailHeader += "//-->";
    		mailHeader += "</style>";
    		mailHeader += "<table style=\"width:700px; margin:0 auto; border-top:4px solid #00418e; border-spacing:0; word-break:keep-all;\">";
    		mailHeader += "<tbody>";
    		
    		// 관리자 > 평가계획의 평가팀원들에게 서약확인요청메일발송
    		if(type.equals("plan")){
    			msgArr = msg.split("_");
    			mailTitle += "평가팀장이 서약확인을 요청했습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "/kabadm/login.do><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요, <span style=\"font-weight:bold; color:#00418e\">" + receiver + "</span>님</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">현재 배정된 평가의 계획서 작성이 완료되었습니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">확인 후 기밀준수 및 이해확인서를 작성해주시기 바랍니다.</p>";
        		mailMsg += "	<table style=\"width:100%; margin:30px auto 0; border-spacing:0; border-top:2px solid #666; font:normal 13px/17px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555;\">";
        		mailMsg += "		<colgroup><col style=\"width:180px\"><col style=\"auto\"><col style=\"width:60px\"><col style=\"width:180px\"><col style=\"width:60px\"></colgroup>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">인증기관</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">스킴</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">평가단계</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">평가기간</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">평가팀장</th>";
        		mailMsg += "		</tr>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[0] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[1] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[2] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[3] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[4] + "</td>";
        		mailMsg += "		</tr>";
        		mailMsg += "	</table>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href=" + siteUrl + msgArr[5] + " style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a></p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
        		
    		}else if("PW".equals(type)){
    			mailTitle += "요청하신 임시 비밀번호 입니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "/><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요, <span style=\"font-weight:bold; color:#00418e\">" + receiver + "</span>님</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">요청하신 임시 비밀번호입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">아래의 비밀번호로 로그인하신 뒤, 새로운 비밀번호로 변경하시길 바랍니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\"> 임시비밀번호는  "+msg+"  입니다.</p>";	
           		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href='" + siteUrl + "/web/login.do' style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
        		
    		}else if(type.equals("eval")){
    			msgArr = msg.split("_");
    			mailTitle += "신규 문서대비표 확인요청이 왔습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "/kabadm/login.do><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요, <span style=\"font-weight:bold; color:#00418e\">" + receiver + "</span>님</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">" + msgArr[0] + "에서 문서대비표 확인을 요청하였습니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">문서대비표를 확인해주시기 바랍니다.</p>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href=" + siteUrl + msgArr[1] + " style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
    		
    		}else if(type.equals("verifyY")){
    			msgArr = msg.split("_");
    			mailTitle += "검증이 최종 완료되었습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "/><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요.";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">검증이 최종 완료되었습니다.</p>";
        		mailMsg += "	<table style=\"width:100%; margin:30px auto 0; border-spacing:0; border-top:2px solid #666; font:normal 13px/17px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555;\">";
        		mailMsg += "		<colgroup><col style=\"width:180px\"><col style=\"auto\"><col style=\"width:60px\"><col style=\"width:180px\"><col style=\"width:60px\"></colgroup>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">인증기관</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">프로젝트 ID</th>";
        		mailMsg += "		</tr>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[0] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[1] + "</td>";
        		mailMsg += "		</tr>";
        		mailMsg += "	</table>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href='"+siteUrl+"/kabadm/verify/verifyListCo.do' style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
        		
    		}else if(type.equals("verifyN")){
    			msgArr = msg.split("_");
    			mailTitle += "검증건에서 부적합사항이 발견되었습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "/><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요.";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">검증건에서 부적합사항이 발견되었습니다.</p>";
        		mailMsg += "	<table style=\"width:100%; margin:30px auto 0; border-spacing:0; border-top:2px solid #666; font:normal 13px/17px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555;\">";
        		mailMsg += "		<colgroup><col style=\"width:180px\"><col style=\"auto\"><col style=\"width:60px\"><col style=\"width:180px\"><col style=\"width:60px\"></colgroup>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">인증기관</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">검증위원</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">검증위원 차수</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">차수</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">검증결과</th>";
        		mailMsg += "		</tr>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[0] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[1] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[2] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[3] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[4] + "</td>";
        		mailMsg += "		</tr>";
        		mailMsg += "	</table>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href='"+siteUrl+"/kabadm/verify/verifyListCo.do' style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
        		
    		}else if(type.equals("verifyUser")){
    			msgArr = msg.split("_");
    			mailTitle += "검증위원으로 배정되었습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "/><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요.";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">검증위원으로 배정되었습니다.</p>";
        		mailMsg += "	<table style=\"width:100%; margin:30px auto 0; border-spacing:0; border-top:2px solid #666; font:normal 13px/17px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555;\">";
        		mailMsg += "		<colgroup><col style=\"width:180px\"><col style=\"auto\"><col style=\"width:60px\"><col style=\"width:180px\"><col style=\"width:60px\"></colgroup>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">인증기관</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">검증위원</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">검증위원 차수</th>";
        		mailMsg += "		</tr>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[0] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + receiver + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[2] + "</td>";
        		mailMsg += "		</tr>";
        		mailMsg += "	</table>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href='"+siteUrl+"/kabadm/verify/verifyListCo.do' style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
        		
    		}else if(type.equals("verifyUserLeader")){
    			msgArr = msg.split("_");
    			mailTitle += "검증위원이 배정되었습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "/><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요.";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">검증위원이 배정되었습니다.</p>";
        		mailMsg += "	<table style=\"width:100%; margin:30px auto 0; border-spacing:0; border-top:2px solid #666; font:normal 13px/17px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555;\">";
        		mailMsg += "		<colgroup><col style=\"width:180px\"><col style=\"auto\"><col style=\"width:60px\"><col style=\"width:180px\"><col style=\"width:60px\"></colgroup>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">인증기관</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">검증위원</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">검증위원 차수</th>";
        		mailMsg += "		</tr>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[0] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[1] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[2] + "</td>";
        		mailMsg += "		</tr>";
        		mailMsg += "	</table>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href='"+siteUrl+"/kabadm/verify/verifyListAd.do' style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
        		
    		}else if(type.equals("verifyDegree")){
    			msgArr = msg.split("_");
    			mailTitle += msgArr[2]+"차 검증건에 평가팀장 코멘트가 등록되었습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "/><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요.";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">" + msgArr[2] + "차 검증건에 평가팀장 코멘트가 등록되었습니다.</p>";
        		mailMsg += "	<table style=\"width:100%; margin:30px auto 0; border-spacing:0; border-top:2px solid #666; font:normal 13px/17px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555;\">";
        		mailMsg += "		<colgroup><col style=\"width:180px\"><col style=\"auto\"><col style=\"width:60px\"><col style=\"width:180px\"><col style=\"width:60px\"></colgroup>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">인증기관</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">검증위원</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">검증위원 차수</th>";
        		mailMsg += "		</tr>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[0] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + receiver + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[2] + "</td>";
        		mailMsg += "		</tr>";
        		mailMsg += "	</table>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href='"+siteUrl+"/kabadm/verify/verifyListCo.do' style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";

    		}else if(type.equals("planAppr")){
    			msgArr = msg.split("_");
    			mailTitle += "신규 평가계획서에 대한 확인요청이 왔습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요, <span style=\"font-weight:bold; color:#00418e\">" + receiver + "</span>님</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">현재 신규 평가계획서가 생성되었습니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">로그인하여 해당 확인사항을 확인 후 작성해주시기 바랍니다.</p>";
        		mailMsg += "	<table style=\"width:100%; margin:30px auto 0; border-spacing:0; border-top:2px solid #666; font:normal 13px/17px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555;\">";
        		mailMsg += "		<colgroup><col style=\"width:180px\"><col style=\"auto\"><col style=\"width:60px\"><col style=\"width:180px\"><col style=\"width:60px\"></colgroup>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">인증기관</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">평가범위</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">평가단계</th>";
        		mailMsg += "			<th style=\"padding:10px; font-size:14px; font-weight:bold; border-bottom:1px solid #ddd;\">평가일정</th>";
        		mailMsg += "		</tr>";
        		mailMsg += "		<tr>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[0] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[1] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[2] + "</td>";
        		mailMsg += "			<td style=\"padding:10px; font-size:13px; text-align:center; border-bottom:1px solid #ddd;\">" + msgArr[3] + "</td>";
        		mailMsg += "		</tr>";
        		mailMsg += "	</table>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href=" + siteUrl + msgArr[4] + " style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
    		}else if(type.equals("disCabConfReq")){
    			msgArr = msg.split("_");
    			mailTitle += "신규 발견사항 확인요청이 왔습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요, <span style=\"font-weight:bold; color:#00418e\">" + receiver + "</span>님</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">현재 신규 발견사항 확인요청이 왔습니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">로그인하여 인정관리 > 평가관리 > "+msgArr[0]+"평가에서 발견사항을 확인해주시기 바랍니다.</p>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href=" + siteUrl + msgArr[1] + " style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
    		}else if(type.equals("disPlanSubmit")){
    			msgArr = msg.split("_");
    			mailTitle += "신규 시정조치계획 확인요청이 왔습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요, <span style=\"font-weight:bold; color:#00418e\">" + receiver + "</span>님</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">현재 <span style=\"font-weight:bold; color:#00418e\">"+msgArr[0]+"</span>의 신규 시정조치계획 확인요청이 왔습니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">로그인하여 수행평가관리 > "+msgArr[2]+"평가 > "+msgArr[3]+"에서 시정조치계획을 확인해주시기 바랍니다.</p>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href=" + siteUrl + msgArr[1] + " style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
    		} else if(type.equals("disPlanSubmitResult")){
    			msgArr = msg.split("_");
    			mailTitle += "신규 시정조치계획 확인결과가 나왔습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요, <span style=\"font-weight:bold; color:#00418e\">" + receiver + "</span>님</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">현재 신규 시정조치계획 확인결과가 나왔습니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">로그인하여 수행평가관리 > "+msgArr[1]+"평가 > "+msgArr[0]+"에서 확인결과를 확인해주시기 바랍니다.</p>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href=" + siteUrl + msgArr[2] + " style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
    		} else if(type.equals("performFinalConfirm")){
    			msgArr = msg.split("_");
    			mailTitle += "신규 평가요약서 최종확인 요청이 왔습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요, <span style=\"font-weight:bold; color:#00418e\">" + receiver + "</span>님</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">현재 신규 평가요약서 최종확인 요청이 왔습니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">로그인하여 평가관리 > "+msgArr[0]+"평가에서 최종 평가내용을 확인하시고 \"평가요약서 최종확인\"버튼을 눌러주시기 바랍니다.</p>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href=" + siteUrl + msgArr[1] + " style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
    		} else if(type.equals("performFinalCabConfirm")){
    			msgArr = msg.split("_");
    			mailTitle += "신규 평가요약서 최종확인 되었습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요, <span style=\"font-weight:bold; color:#00418e\">" + receiver + "</span>님</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">현재 <span style=\"font-weight:bold; color:#00418e\">"+msgArr[0]+"</span>의 "+msgArr[2]+" 평가요약서 최종확인 되었습니다.</p>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href=" + siteUrl + msgArr[1] + " style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
    		} else if(type.equals("evalDocComfirm")){
    			msgArr = msg.split("_");
    			mailTitle += "요청된 문서대비표 결과보고서 최종확인이 완료되었습니다.";
    			mailMsg += "<tr>";
    			mailMsg += "	<td style=\"width:700px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3\"><a href=" + siteUrl + "><img src=\"" + siteUrl + "/_img/adm/cont/kab_webmail.jpg\" alt=\"웹메일이미지\" /></a></td>";
        		mailMsg += "</tr>";
    			mailMsg += "<tr>";
        		mailMsg += "<td style=\"padding:40px 50px 40px; font:normal 14px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#555; word-break:keep-all; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3;\">";
        		mailMsg += "	<p>안녕하세요, <span style=\"font-weight:bold; color:#00418e\">" + receiver + "</span>님</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">한국인정지원센터 스마트인정시스템입니다.</p>";
        		mailMsg += "	<p style=\"margin-top:10px;\">현재 <span style=\"font-weight:bold; color:#00418e\">"+msgArr[0]+"</span>의 요청된 "+msgArr[2]+"평가의 문서대비표 결과보고서 최종확인이 완료되었습니다.</p>";
        		mailMsg += "<p style=\"text-align:center;margin-top:30px\">";
        		mailMsg	+= "<a href=" + siteUrl + msgArr[1] + " style=\"padding:12px 20px;font-weight:bold;background-image: linear-gradient(to right,#3f68b1,#27437b);color:#fff;text-decoration:none;font:14px/22px '\00b098\00b214\00ace0\00b515',NanumGothic,'\00b9d1\00c740\00ace0\00b515','Malgun Gothic',굴림,Arial,serif;\" target=\"_blank\">바로가기</a></p>";
        		mailMsg += "	<p style=\"margin-top:30px; padding:10px 15px 12px; background:#f5f5f5;\"><span style=\"font-weight:bold; margin-right:10px;\">문의</span><span style=\"margin-right:30px;\">인정본부</span>     TEL : 02-6332-2800  /  E-mail : <a title=\"이메일 새창열기\" style=\"color:#555;\" href=\"mailto:flyet@kab.or.kr\">flyet@kab.or.kr</a> </p>";
        		mailMsg += "</td>";
        		mailMsg += "</tr>";
    		} else {
    			// 다른 경우는 여기에 구현하세요.
    		}
    		
    		mailFooter += "<tr>";
    		mailFooter += "<td style=\"background:#363639; padding:30px; border-left:1px solid #e3e3e3; border-right:1px solid #e3e3e3; border-bottom:1px solid #e3e3e3;\">";
    		mailFooter += "	<p style=\"display:inline-block; font:normal 12px/22px '맑은고딕', Malgun Gothic, 'Apple SD Gothic Neo',Sans-serif; color:#999;\">(우)08511 서울시 금천구 벚꽃로 254 월드메르디앙벤처센터 1차 1302호&nbsp;&nbsp;T. 02-6332-2800 / F. 02-6332-7788<br/>KOLAS교육 : 서울시 금천구 벚꽃로 254 월드메르디앙벤처센터 1차 1303호&nbsp;&nbsp;T. 02-6332-3700~3 / F. 02-6332-7788";
    		mailFooter += "	<span style=\"display:block; padding-top:8px; color:#888\">COPYRIGHT(C) KOREA ACCREDITATION BOARD ALL RIGHTS RESERVED.</span></p>";
    		mailFooter += "</td>";
    		mailFooter += "</tr>";
    		mailFooter += "</tbody>";
    		mailFooter += "</table>";
    		mailFooter += "</body>";
    		mailFooter += "</html>";
    			
    		String mailBody = mailHeader + mailMsg + mailFooter;
    		mailBody = mailBody.replaceAll("\\{SITEURL\\}", siteUrl);
    		
    		HtmlEmail mail = new HtmlEmail();
    		mail.setCharset(EgovProperties.getProperty("Globals.SMTP.chatacterSet")); // SMTP 캐릭터셋 정보 설정.
    		mail.setHostName(EgovProperties.getProperty("Globals.SMTP.host")); // SMTP 호스트 정보 설정.
    		mail.setSmtpPort(Integer.parseInt(EgovProperties.getProperty("Globals.SMTP.port"))); // SMTP 포트 설정.
    		mail.setAuthentication(EgovProperties.getProperty("Globals.SMTP.userId"), EgovProperties.getProperty("Globals.SMTP.userPass")); // SMTP 인증할 ID 및 PW 설정.
    		mail.setSSLOnConnect(true); // SSL 관련 설정.
    		mail.setFrom(fromEmail, fromName); // 발신자 정보 설정.
    		mail.setSubject(mailTitle); // 메일 제목 입력.
    		mail.setHtmlMsg(mailBody); // HTML 메세지 설정.
    		
    		
    		if(type.equals("verifyY") || type.equals("verifyN") || type.equals("verifyUserLeader")) {
    			String[] emailArr = email.split(",");
    			String[] receiverArr = receiver.split(",");
    			for(int i = 0; i < emailArr.length; i++) {
    				mail.addTo(emailArr[i], receiverArr[i]); // 수신자 정보 조회.
    			}
    		} else {
    			mail.addTo(email, receiver); // 수신자 정보 조회.
    		}
    		
    		mail.send(); // 메일전송.
    		
    		return "success";
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    		
    		return "fail";
    	}
    }
}
