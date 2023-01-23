package egovframework.cms.com.interceptor;

import java.rmi.server.ServerRef;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.kku.adm.service.EgovKkuAdmLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityService;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.kku.usr.service.EgovKkuChatService;


/**
 * 인증여부 체크 인터셉터
 * @author 공통서비스 개발팀 서준식
 * @since 2011.07.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2011.07.01  서준식          최초 생성
 *  2011.09.07  서준식          인증이 필요없는 URL을 패스하는 로직 추가
 *  </pre>
 */

public class EgovCmsAuthenticInterceptor extends HandlerInterceptorAdapter {
	
	
	@Resource(name="commService")
	private EgovKkuAppCommunityService communityService;
	
	@Resource(name="kkuUserService")
	private EgovKkuAppUserService kkuUserService;
	
	@Resource(name = "chatService")
	private EgovKkuChatService chatService;


	private String siteType;
	private String siteLang;

	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}
	
	public void setSiteLang(String siteLang) {
		this.siteLang = siteLang;
	}
	
	/**
	 * 세션에 사용자 계정정보(LoginVO)가 있는지 여부로 인증 여부를 체크한다.
	 * 계정정보(LoginVO)가 없다면, 로그인 페이지로 이동한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
		Locale loc = localeResolver.resolveLocale(request);
		if(!loc.equals(siteLang)) {
			//localeResolver.setLocale(request, response, StringUtils.parseLocaleString(siteLang));
		}
		if("kkucheckApp".equals(siteType))
			kkucheckApp(request);
		else if("kkuappAdmin".equals(siteType))
			kkucheckAdmin(request);
		else
			return false;

		return true;
	}
	
	
	private String kkucheckApp(HttpServletRequest request) throws Exception {
		// 요청 URI

	
		String requestURI = request.getRequestURI();
		//context root path 가져오기
		String requestContextPath = request.getContextPath();
		//request mapping URL 데이터 골라내기
		String mapURL = requestURI.substring(requestContextPath.length());
		Enumeration params = request.getParameterNames();
		
		String fullUrl = "";
		//사용자 로그인 확인
		//
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();

		if (sessionVO == null){
			System.err.println("sessionVO is NULL!!!!!!!!!!!!!!!!!!!!!");
			
			/*throw new ModelAndViewDefiningException(modelAndView);*/
			return "forward:/member/join01.do";
	
		}else{
			//세션이 존재
			
			System.err.println(sessionVO.getUsrEmail());
			EgovKkuAppUserVO uVO = new EgovKkuAppUserVO();
			uVO.setUsrEmail(sessionVO.getUsrEmail());
			kkuUserService.selectUserDevice(uVO);
			// 다른 디바이스 아이디 일때 
			sessionVO.setAlarmNum(communityService.cntAlarm(sessionVO.getUsrEmail())); 
    		// 안읽은 개수 실어주기
    		sessionVO.setChatNum(chatService.selectNotReadMessage(sessionVO.getUsrIdx()));
    		System.err.println("mapURL:        " + mapURL);

    		//ModelAndView modelAndView = new ModelAndView();

    		System.err.println(sessionVO.toString());
    	
    		//modelAndView.setViewName(mapURL);
    		return "forward:" + mapURL;

		}
	}
	//관리자 로그인 확인
		private void kkucheckAdmin(HttpServletRequest request) throws Exception {

			String requestURI = request.getRequestURI();
			//context root path 가져오기
			String requestContextPath = request.getContextPath();
			//request mapping URL 데이터 골라내기
			Enumeration params = request.getParameterNames();
			
			
			EgovKkuAdmLoginSessionVO sessionVO = (EgovKkuAdmLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUserInfo();
			
			if (sessionVO == null){
				ModelAndView modelAndView = new ModelAndView("redirect:/admin/login.do");
				throw new ModelAndViewDefiningException(modelAndView);
			
			}else{
			}
		}
		
		
		
		
	
	
	
	

	/**
	 * 사용자 로그인 확인
	 */	
	@SuppressWarnings("unused")
	private void checkOrg(HttpServletRequest request) throws Exception {
		/*// 요청 URI
		String requestURI = request.getRequestURI();
		//context root path 가져오기
		String requestContextPath = request.getContextPath();
		//request mapping URL 데이터 골라내기
		String mapURL = requestURI.substring(requestContextPath.length());
		
		//사용자 로그인 확인
		EgovKabWebCompanyLoginVO sessionVO = (EgovKabWebCompanyLoginVO) EgovCmsUserDetailsHelper.getAuthenticatedWebUserInfo();
		
		//로그인 세션이 있을 경우 권한 확인
		if (sessionVO != null){
			
		}else{
			EgovKabWebCompanyLoginVO sessionVO2 = (EgovKabWebCompanyLoginVO) EgovCmsUserDetailsHelper.getAuthenticatedAdmisUserInfo();
			if(sessionVO2==null) {
				if(!mapURL.equals("/web/error.do")) {
					ModelAndView modelAndView = new ModelAndView("redirect:/web/login.do");
					throw new ModelAndViewDefiningException(modelAndView);
				}
			}			
		}*/
		
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		super.postHandle(request, response, handler, modelAndView);
	}

	/*public EgovMap getSiteConfig(HttpServletRequest request, String siteCd) throws Exception {
		
		EgovCmsWebMainVO bvo = new EgovCmsWebMainVO();

		//요청 URI
		String requestURI = request.getRequestURI();

		//context root path 가져오기
		String requestContextPath = request.getContextPath();

		//request mapping URL 데이터 골라내기
		String mapURL = requestURI.substring(requestContextPath.length());

		EgovMap siteConf = null;
		if(!mapURL.equals("/"+siteCd+"/error.do")) {
			siteConf = webComService.getSiteConfig(bvo);
		}
		return siteConf;
	}*/
	
	/*public void userBlockIp(HttpServletRequest request, String siteCd) throws Exception {
		
		EgovCmsWebMainVO bvo = new EgovCmsWebMainVO();
		
		//요청 URI
		String requestURI = request.getRequestURI();
		
		//context root path 가져오기
		String requestContextPath = request.getContextPath();
		
		//request mapping URL 데이터 골라내기
		String mapURL = requestURI.substring(requestContextPath.length());
		
		if(!mapURL.equals("/"+siteCd+"/error.do")) {
			// 메뉴 목록
			List<EgovMap> blockIpList = webComService.blockIpList(bvo);
			bvo.setSiteCd(siteCd);
			
			for (int i = 0; i < blockIpList.size(); i++) {
				EgovMap map = blockIpList.get(i);
				if(EgovCmsCommonUtil.getClientIP(request).equals(map.get("blwIp"))) {
					ModelAndView modelAndView = new ModelAndView("redirect:/"+siteCd+"/error.do");
					throw new ModelAndViewDefiningException(modelAndView);
				}
			}
		}
	}*/
}
