package egovframework.com.cmm.util;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.Random;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.EncoderException;
import org.apache.commons.codec.net.URLCodec;
import org.springframework.ui.ModelMap;

import egovframework.com.cmm.AES256Util;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class EgovComcmmUtil {
	public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		    ip = request.getHeader("Proxy-Client-IP"); 
		} 
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		    ip = request.getHeader("WL-Proxy-Client-IP"); 
		} 
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		    ip = request.getHeader("HTTP_CLIENT_IP"); 
		} 
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		    ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
		} 
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		    ip = request.getRemoteAddr(); 
		}
		if(ip.contains(",")) {
		    String[] ips = ip.split(",");
		    ip = ips[0];
		}

		return ip;
	}

	public static EgovLmsWebSessionVO getSession(HttpServletRequest request) {
		return (EgovLmsWebSessionVO) request.getSession().getAttribute("session");
	}

	public static String getSessionId(HttpServletRequest request) {
		try {
			return getSession(request).getUserId();
		}
		catch(Exception e) {
			return "";
		}
	}

	public static String filePathBlackList(String value) {
		String returnValue = value;
		if (returnValue == null || returnValue.trim().equals("")) {
			return "";
		}

		returnValue = returnValue.replaceAll("\\.\\./", "");	// ../
		returnValue = returnValue.replaceAll("\\.\\.\\\\", "");	// ..\

		return returnValue;
	}
	
	public static int getDateDifference(String date1, String date2) {
		Calendar c1 = Calendar.getInstance();
		c1.set(getYearInt(date1), getMonthInt(date1), getDayInt(date1));

		Calendar c2 = Calendar.getInstance();
		c2.set(getYearInt(date2), getMonthInt(date2), getDayInt(date2));
		
		long d1 = c1.getTime().getTime();
		long d2 = c2.getTime().getTime();

		return (int) ((d2 - d1) / (1000 * 60 * 60 * 24));
	}
	
	public static String getAddDate(String dateStr, int addDay) {
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date date = null;
		try {
			date = dateFormat.parse(dateStr.replaceAll("-", ""));
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.DATE, addDay);
			dateFormat = new SimpleDateFormat("MM월 dd일");
			return dateFormat.format(cal.getTime());
		} catch (ParseException e) {
			return null;
		}
	}
	
	public static String getDateEng(String dateStr) {
		if(dateStr.contains(".")) {
			String[] tmpStr = dateStr.split(".");
			String y = tmpStr[0];
			String m = tmpStr[1];
			String d = tmpStr[2];
			return d + "." + m + "." + y;
		}
		if(dateStr.contains("-")) {
			String[] tmpStr = dateStr.split("-");
			String y = tmpStr[0];
			String m = tmpStr[1];
			String d = tmpStr[2];
			return d + "-" + m + "-" + y;
		}
		return "";
	}
	
	public static String getDateEngStr(String dateStr) {
		String[] tmpStr;
		String[] monthEngArray = {
			"January",
			"February",
			"March",
			"April",
			"May",
			"June",
			"July",
			"August",
			"September",
			"October",
			"November",
			"December"
		};
		String y;
		String m;
		String d;
		if(dateStr.contains(".")) {
			tmpStr = dateStr.split(".");
			y = tmpStr[0];
			m = tmpStr[1];
			d = tmpStr[2];
		}
		else {
			tmpStr = dateStr.split("-");
			y = tmpStr[0];
			m = tmpStr[1];
			d = tmpStr[2];
		}
		
		return monthEngArray[Integer.parseInt(m) * 1 - 1] + " " + d + "<span>th</span>, " + y;
	}

	public static String getTodayDateTime(int len) {
		Calendar oCalendar = Calendar.getInstance();

		String year  = Integer.toString(oCalendar.get(Calendar.YEAR));
		String month = Integer.toString(oCalendar.get(Calendar.MONTH) + 1);
		String day   = Integer.toString(oCalendar.get(Calendar.DAY_OF_MONTH));
		String hour  = Integer.toString(oCalendar.get(Calendar.HOUR_OF_DAY));
		String min   = Integer.toString(oCalendar.get(Calendar.MINUTE));
		String sec   = Integer.toString(oCalendar.get(Calendar.SECOND));

		if(month.length() == 1) month = "0" + month;
		if(day.length() == 1) day = "0" + day;
		if(hour.length() == 1) hour = "0" + hour;
		if(min.length() == 1) min = "0" + min;
		if(sec.length() == 1) sec = "0" + sec;

		String tmp = year + month + day + hour + min + sec;
		return (len > 0)?tmp.substring(0, len):tmp;
	}
	
	public static String getCompareDateTime(String dateTime) {
		dateTime = dateTime.replaceAll("-", "");
		dateTime = dateTime.replaceAll(":", "");
		dateTime = dateTime.replaceAll(" ", "");

		if(dateTime.contains(".")) {
			String[] rtnValue = dateTime.split("\\.");
			return rtnValue[0];
		}
		else {
			return "";
		}
	}
	
	public static String getTodayDateTime(String separate) {
		Calendar oCalendar = Calendar.getInstance();
		
		String year  = Integer.toString(oCalendar.get(Calendar.YEAR));
		String month = Integer.toString(oCalendar.get(Calendar.MONTH) + 1);
		String day   = Integer.toString(oCalendar.get(Calendar.DAY_OF_MONTH));
		
		if(month.length() == 1) month = "0" + month;
		if(day.length() == 1) day = "0" + day;

		return year + separate + month + separate + day;
	}
	
	public static String yesterDay(String date, int day) {
		if(date != "") {
			date = date.replace(".","");
			try {
				DateFormat df = new SimpleDateFormat("yyyyMMdd");
				long chStart = df.parse(date).getTime();
				
				chStart -= (day * 24 * 60 * 60 * 1000);
				
				Date dt = new Date(chStart);
				df = new SimpleDateFormat("yyyy.MM.dd");
				date = df.format(dt);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return date;
	}
	
	public static String getRand() {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); 
		String today = dateFormat.format(date);
		Random random = new Random();
		return today + String.format("%06d", random.nextInt(999999));
	}

	public static String getYearStr(String date) {
		String[] rtnVal = date.split("-");
		return rtnVal[0];
	}
	public static int getYearInt(String date) {
		String[] rtnVal = date.split("-");
		return Integer.parseInt(rtnVal[0]);
	}
	
	public static String getMonthStr(String date) {
		String[] rtnVal = date.split("-");
		return rtnVal[1];
	}
	public static int getMonthInt(String date) {
		String[] rtnVal = date.split("-");
		return Integer.parseInt(rtnVal[1]);
	}
	
	public static String getDayStr(String date) {
		String[] rtnVal = date.split("-");
		return rtnVal[2];
	}
	public static int getDayInt(String date) {
		String[] rtnVal = date.split("-");
		return Integer.parseInt(rtnVal[2]);
	}
	
    /**
     * MD5 암호화
     * @param str - 암호화 할 문자
     * @return 암호화된 문자
     */
	 public static String genMD5(String str)  { 
	 	byte [] buffer = null; 
	 	java.lang.StringBuffer s = new java.lang.StringBuffer(); 
	
	 	 try 
	 	  { 
	 		// Obtain a message digest object. 
	 		MessageDigest md = MessageDigest.getInstance("MD5"); 
	
	 		// Calculate the digest for the given file. 
	 		md.update(str.getBytes());
	 		
	 		// computing digest 
	 		buffer = md.digest(); 
	
	 		for (int i = 0; i < buffer.length; i++) { 
	 			s.append(Integer.toString((buffer[i] & 0xf0) >> 4, 16)); 
	 			s.append(Integer.toString(buffer[i] & 0x0f, 16)); 
	 		} 
	
	 		md.reset(); 
	   } catch (NoSuchAlgorithmException ns) { 
		  	return ""; 
	   } catch (Exception ex) { 
		  	return ""; 		  	
	  	} 	
	 	return s.toString(); 
	 }

	 public static String alertMove(final ModelMap model, String msg, String moveUrl) {
		model.addAttribute("message", msg);
		model.addAttribute("returnUrl", moveUrl);
		return "/lms/alertMove";
	}
	
	public static String alertMoveRedirect(final ModelMap model, String msgCode, String moveUrl) {
		model.addAttribute("messageCode", msgCode);
		model.addAttribute("returnUrl", moveUrl);
		return "redirect:/web/lms/alertMove.do";
	}
	
	public static String alertClose(final ModelMap model, String msg) {
		model.addAttribute("message", msg);
		return "/lms/alertClose";
	}

	 public static String confirmMove(final ModelMap model, String msg, String confirmUrl, String nonConfirmUrl) {
		model.addAttribute("message", msg);
		model.addAttribute("confirmUrl", confirmUrl);
		model.addAttribute("nonConfirmUrl", nonConfirmUrl);
		return "/lms/confirmMove";
	}
	
	/**
	 * 클라이언트(Client)의 기기 종류를 조회하는 기능
	 * @param HttpServletRequest request Request객체
	 * @return String deviceKind 기기 종류
	 * @exception Exception
	*/
	public static String getClientDeviceKind(HttpServletRequest request) throws Exception {

		String user_agent = request.getHeader("user-agent").toLowerCase();
		
		// 기기 종류 조회
		String deviceKind	=	"";
		if(user_agent.indexOf("mobile") > -1) {
			if(user_agent.indexOf("kcsg_app") > -1) {
				deviceKind	=	"inapp";
			} else {
				deviceKind	=	"mobile";
			}
		} else {
			deviceKind	=	"pc";
		}

		return deviceKind;
	}
	
	/*public static boolean getExternalRefererChk (HttpServletRequest request) {
		boolean result = false;
		
		String siteUrl = EgovLmsProperties.getProperty("Globals.siteUrl");
		String refererUrl = (request.getHeader("Referer") != null) ? request.getHeader("Referer") : "";
		
		if(!refererUrl.contains(siteUrl)) {
			result = true;
		}
		
		return result;
	}*/
	
	/**
	 * AES256 암호화
	 * */
	public static String genAES256Enc(String str) {
		String key = "KCSG-DEVICE-ENC-AES";
		String encStr = "";
		try {
			AES256Util aes256 = new AES256Util(key);
			URLCodec codec = new URLCodec();
			
			encStr = aes256.aesEncode(str);
			
		} catch(InvalidKeyException | UnsupportedEncodingException
				| NoSuchAlgorithmException | NoSuchPaddingException
				| InvalidAlgorithmParameterException
				| IllegalBlockSizeException | BadPaddingException e){
			e.printStackTrace();
		}
		
		return encStr;
	}
	
	/**
	 * AES256 복호화
	 * @throws EncoderException 
	 * */
	public static String degenAES256Enc(String str) throws EncoderException {
		String key = "KCSG-DEVICE-ENC-AES";
		String encStr = "";
		try {
			AES256Util aes256 = new AES256Util(key);
			//URLCodec codec = new URLCodec();
			
			//encStr = codec.encode(AES256Util.aesEncode(str));
			encStr = aes256.aesDecode(str);
			
		} catch(InvalidKeyException | UnsupportedEncodingException
				| NoSuchAlgorithmException | NoSuchPaddingException
				| InvalidAlgorithmParameterException
				| IllegalBlockSizeException | BadPaddingException e){
			e.printStackTrace();
		}
		
		return encStr;
	}
	
	/**
	 * 모든 파라메터 출력
	 * */
	public static void getAllparams(HttpServletRequest re) {
		Enumeration params = re.getParameterNames();
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		}
	}
	
	public static void setCookie(HttpServletResponse res, String key_name, String value) {
		Cookie setCookie = new Cookie(key_name,value);	// 쿠키생성
		setCookie.setMaxAge(60*60*24*365);				// 기간 1년 
		setCookie.setPath("/");
		res.addCookie(setCookie);
	}
	
	public static String getCookie(HttpServletRequest req, String key_name) {
		Cookie[] getCookie = req.getCookies();
		String value = "";
		if(getCookie != null) {
			for(int i=0; i<getCookie.length;i++) {
				Cookie c = getCookie[i];
				if(c.getName().equals(key_name)){
					value = c.getValue();
					break;
				}
			}
		}
		return value;
	}
	
	public static void deleteCookie(HttpServletResponse res, String key_name) {
		Cookie setCookie = new Cookie(key_name,null);	// 쿠키생성
		setCookie.setMaxAge(0);				// 기간 1년 
		setCookie.setPath("/");
		res.addCookie(setCookie);
	}
	
	public static String printAllCookie(HttpServletRequest req) {
		Cookie[] getCookie = req.getCookies();
		String value = "";
		if(getCookie != null) {
			for(int i=0; i<getCookie.length;i++) {
				Cookie c = getCookie[i];
			}
		}
		return value;
	}
	
	/** vo 로 부터 pagination 얻기  */
	/*public static PaginationInfo generatePagination(EgovLmsWebDefaultVO vo) {
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		return paginationInfo;
	}*/
}
