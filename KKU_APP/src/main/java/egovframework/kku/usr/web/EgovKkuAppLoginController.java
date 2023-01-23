package egovframework.kku.usr.web;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.util.WebUtils;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.cms.com.util.PmsComService;
import egovframework.com.cmm.EgovCmsCommonUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovComcmmUtil;
import egovframework.kku.adm.service.EgovKkuAdmLoginSessionVO;
import egovframework.kku.adm.service.EgovKkuUserEmailVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityService;
import egovframework.kku.usr.service.EgovKkuAppDeviceVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class EgovKkuAppLoginController {

	@Resource(name="kkuUserService")
	private EgovKkuAppUserService userService;
	
	@Resource(name="commService")
	private EgovKkuAppCommunityService communityService;
	
	@Resource(name = "pmsComService")
	private PmsComService pmsComService; 
	
	@RequestMapping(value="/member/login.do")
	public String loginControllerTest(EgovKkuAppUserVO loginVo,HttpServletRequest request,  Model model){
		
		System.err.println("---------------------login.do webUtils------------------------------------");
		System.err.println(WebUtils.getSessionAttribute(request, "loginVO"));
		EgovKkuAppLoginSessionVO loginVO = (EgovKkuAppLoginSessionVO)request.getSession().getAttribute("loginVO");

		if(loginVO != null){
			System.err.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			return "redirect:/main.do";
		}
		System.err.println("Asdasdadasdadasd");
		System.err.println("login.do 진입");
		
		model.addAttribute("deviceID", loginVo.getDeviceId());
		System.err.println("login.do 리턴");
		return "kkuapp/web/login/login";
	}
	/**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value="/member/actionLogin.do",produces = "application/text; charset=utf8")
	public String actionLogin(  EgovKkuAppUserVO loginVo, HttpServletRequest request, 
    		HttpServletResponse response, ModelMap model) throws Exception {
		

		
    	String refererUrl = "";

    	String loginId = loginVo.getUsrEmail();
    	String loginPass = loginVo.getUsrPassword();
    	
    	if(loginVo!=null && loginVo.getDeviceUpdateYn()!=null && loginVo.getDeviceUpdateYn().equals("Y") ){
    		
    	}
    	else{
    		String md5Pwd = EgovComcmmUtil.genMD5(loginPass);
    		loginVo.setUsrPassword(md5Pwd);
    	}
    	
    	int loginCheck = userService.Login(loginVo);
    	EgovMap test = userService.selectUser(loginVo);
    	
    		//!test.get("deviceId").equals(null)
    		System.err.println(loginCheck);
    	if (loginCheck == 1  ) {
    		System.err.println("@@@@@");
    	
    			/*
    			userService.updateDeviceUser(loginVo);*/
    
    			String usrRank = test.get("usrRank").toString();
        		
    	    	
    			EgovKkuAppLoginSessionVO sessionVO = new EgovKkuAppLoginSessionVO();
    			if(test.get("deviceId") != null){
    				sessionVO.setDeviceId(test.get("deviceId").toString());
    			}
    			loginVo.setUsrIdx(test.get("usrIdx").toString());
    			//userService.userLoginUpdate(loginVo);
    			
    			sessionVO.setUsrIdx(test.get("usrIdx").toString());
        		sessionVO.setUsrEmail(test.get("usrEmail").toString());
        		sessionVO.setUsrNickname(test.get("usrNickname").toString());
        		sessionVO.setAlarmNum(communityService.cntAlarm(test.get("usrEmail").toString())); 
    			request.getSession().setAttribute("loginVO", request.getSession().getAttribute("loginVO"));
    			
    			WebUtils.setSessionAttribute(request, "loginVO", sessionVO);
    			request.getSession().setAttribute(request.getSession().getId(), request.getSession().getAttribute("loginVO"));
    			System.err.println("id / session 세팅 -- 액션로그인");

    			
    			
    			
    			
    			//model.addAttribute("result", "/main.do");
    			return "forward:/main.do";
   
    
    		}
    	else{
			return "N" ;
			}
    

	}
	/**
	 * 비밀번호 재설정 인증
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param 
	 * @return 페이지 
	 * @exception Exception
	 */
	@RequestMapping(value="/member/certificate.do")
	public String certificationSelf() throws Exception{
		return "kkuapp/web/login/certification/selfCertification";
	}
	
	/*
	 * 비밀번호 재설정 인증 ajax
	 * return 인증번호  
	 * 
	 * */
	@RequestMapping(value="/member/certificateEmail.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String emailCertifcationSelf(Model model, EgovKkuAppUserVO SignUpVO, HttpServletRequest request, EgovKkuUserEmailVO EmailVO) throws Exception{
		String strRan ="";
			if(userService.chkDuplicateUser(SignUpVO) == 1){
				HtmlEmail email = new HtmlEmail();
				email.setHostName(EmailVO.getHostName());  
				email.setSmtpPort(Integer.parseInt(EmailVO.getPortNumber())  ); 
				email.setStartTLSEnabled(true);
				email.setSSLOnConnect(true); //smtp 연결 설정 
				
				email.addTo(SignUpVO.getUsrEmail(),"User"); //받는사람 주소
				
				java.util.Random generator = new java.util.Random();//인증숫자 생성
			    generator.setSeed(System.currentTimeMillis());
			    int ran = generator.nextInt(1000000) % 1000000; 
			    strRan = Integer.toString(ran);
				String Content = "<html lang=\"en\">" + "<head> <meta charset=\"UTF-8\"> "
						+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
						+ "<meta name=\"Generator\" content=\"EditPlus®\">"
						+ "<meta name=\"Author\" content=\"건국대학교 커뮤니티 앱\">"
						+ "<meta name=\"Keywords\" content=\"건국대학교 커뮤니티 앱\">"
						+ "<meta name=\"Description\" content=\"건국대학교 커뮤니티 앱\">"
						+ "</head>"
						+ " <link href=\"https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:wght@100;300;400;500;700;900&display=swap\" rel=\"stylesheet\">"
						+ "<title>건국대학교 커뮤니티 앱</title> </head> <body>"
						+ "<div class=\"m_mail_container\" style=\" display: flex; align-items: center; justify-content: center; padding: 15px;\"> <div class=\"m_mail_box\" style=\"position: relative; width: 100%; padding: 0 0 30px; background: #fff; box-sizing: border-box; border-left: 1px solid #ddd; border-bottom: 1px solid #ddd; border-right: 1px solid #ddd;\">"
						+ "<p class=\"logo\" style = \"width: 100%; margin-bottom: 30px; background: #005228; padding: 10px 14px; box-sizing: border-box; \"> <img src=\"https://kuapp.smartcampus.life/_img/_img/comn/logo.png\" alt=\"건국대학교 커뮤니티 앱\" style=\"display: block; width: 80px; \"></p> <p class=\"mail_tit\" style=\" margin: 0 15px; margin-bottom: 12px; font: 400 17px/24px 'Roboto','Noto Sans KR', 'sans-serif', 'Malgun Gothic','맑은고딕','굴림','serif'; color: #333; \"><span style=\"font-weight: 600; color: #005228;\">KU 슬기로운 대학생활</span>에서<br>요청하신 인증번호를 발송해드립니다. </p>"
						+ "<p class=\"text\" style =\"margin: 0 15px; font: 400 13px/20px \"Roboto\", \"Noto Sans KR\", sans-serif; color: #333; \">아래 인증번호 6자리를<br>인증번호 입력창에 입력해주세요.</p>"
						+ "	<p class=\"num_box\" style=\"margin: 20px 10px; background: #f8f8f8; padding: 10px 15px; border-radius: 5px; font: 400 18px/27px \"Roboto\", \"Noto Sans KR\", sans-serif; color: #333;\">"+ strRan +"</p>"
						+ "<ul s> <li>본 메일은 발신 전용 입니다.</li> <li>계정관련하여 궁금한 점이 있으시다면<br> 관리자(<a href=\"mailto: shkim@withsystem.com\">shkim@withsystem.com</a>)에게 문의주세요</li> </ul></div></div> </body </html>";
						
				email.setFrom("kukuteamnoreply@gmail.com","KuKuTeam_Admin");
				email.setSubject("[비밀번호 재설정 인증 메일] KUKU Community"); // 메일 제목
				email.setContent(Content , "text/html; charset=euc-kr");
				email.setAuthentication("kukuteamnoreply@gmail.com", "amqfezccvpmvyxay");
				email.send();
				
				EmailVO.setReceiverAddress(SignUpVO.getUsrEmail());
				EmailVO.setElogContent(strRan);
				EmailVO.setElogType("RESET");
				userService.insertEmailLog(EmailVO);
				return strRan;
			}
			else{
				strRan = "-1";
				return strRan;
			}
	}
	
	/*
	 * 비밀번호 재설정 페이지 
	 * @param 
	 * @return 페이지 
	 * @exception Exception
	 * */
	@RequestMapping(value="/member/resetPW.do")
	public String certificationResetPW( HttpServletRequest request,Model model) throws Exception{
		String usrEmail = request.getParameter("em");
		model.addAttribute("email", usrEmail);
		return "kkuapp/web/login/certification/resetPW";
	}
	/*
	 * ajax로 비밀번호 재설정 
	 * */
	@RequestMapping(value="/member/resetPWajax.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String certificationResetPWAjax(EgovKkuAppUserVO loginVo, HttpServletRequest request)throws Exception{
		String usrPass = loginVo.getUsrPassword();
		String md5Pwd = EgovComcmmUtil.genMD5(usrPass);
		loginVo.setUsrPassword(md5Pwd);
		int result = userService.usrPassUpdate(loginVo);
		
		if(result == 1){
			return result +"";
		}
		return "failed";
	}
	
	@RequestMapping("/member/actionLogout.do")
	public String LogOut( HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		request.getSession().setAttribute("loginVO", null);
		
		if (sessionVO != null) {
			EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
			userVO.setUsrEmail(sessionVO.getUsrEmail());
			userVO.setDeviceId("");
			userService.updateDeviceUser(userVO);
		}
		
		return "redirect:/member/login.do";
	}
	
	@RequestMapping("/member/deviceUpdate.do")
	@ResponseBody
	public String deviceUpdate(@ModelAttribute("appDeviceVO") EgovKkuAppDeviceVO appDeviceVO,
			 HttpServletRequest request) throws Exception {
		
		if(userService.deviceCnt(appDeviceVO) != 0) {
			appDeviceVO.setModIp(EgovCmsCommonUtil.getClientIP(request));
			userService.updateDevice(appDeviceVO);

			EgovMap test = userService.selectByDeviceId(appDeviceVO.getDeviceId());
			
	    	if (test!=null && test.get("deviceId")!=null) {
	    		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
	    		userVO.setDeviceId(appDeviceVO.getDeviceId());
	    		userVO.setUsrEmail(test.get("usrEmail").toString());
    			userService.updateDeviceUser(userVO);
    			
        		EgovKkuAppLoginSessionVO sessionVO = new EgovKkuAppLoginSessionVO();
    			sessionVO.setUsrIdx(test.get("usrIdx").toString());
    			sessionVO.setDeviceId(test.get("deviceId").toString());
        		sessionVO.setUsrEmail(test.get("usrEmail").toString());
        		sessionVO.setUsrNickname(test.get("usrNickname").toString());
        		sessionVO.setAlarmNum(communityService.cntAlarm(test.get("usrEmail").toString()));
        		
    			request.getSession().setAttribute("loginVO", sessionVO);
    			
    			return "{ \"success\": true, \"location\": \"/main.do\" }";
    		}
		} else {
			appDeviceVO.setRegIp(EgovCmsCommonUtil.getClientIP(request));
			userService.insertDevice(appDeviceVO);
		}
		
		return "{ \"success\": false }";
	}
	
}
