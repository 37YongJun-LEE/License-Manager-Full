package egovframework.cms.com.interceptor;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.cms.com.service.EgovCmsComLogService;
import egovframework.cms.com.service.EgovCmsComLogUsrStatVO;
import egovframework.cms.com.service.EgovCmsComService;
import egovframework.com.cmm.EgovCmsCommonUtil;
import egovframework.rte.fdl.string.EgovStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;


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

public class EgovCmsLoggingInterceptor extends HandlerInterceptorAdapter {
	

	@Resource(name="comLogService")
	private EgovCmsComLogService comLogService;
	
	@Resource(name="commonService")
	private EgovCmsComService commonService;

	private String logType;

	public void setLogType(String logType) {
		this.logType = logType;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		return true;
	}
	

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		switch (logType) {
		
		case "userLogin":
			insertUserLoginLog(request);
			break;
		/*case "adminLogin":
			insertAdminLoginLog(request);
			break;
		case "adminLog":
			insertAdminLog(request);
			break;*/
		/*case "userLog":
			insertUserLog(request);
			break;*/
		}

	}
	
	// 사용자 로그인 기록
	public  void insertUserLoginLog(HttpServletRequest request) throws Exception {
		
	}
	
	
	/**
	 * 관리자 로그인 로그 기록
	 */
	/*private void insertAdminLoginLog(HttpServletRequest request) throws Exception {
		
		//request mapping URL 값 받아오기
		EgovMap menuMap = (EgovMap) request.getAttribute("menuMap");
		
		//관리자 로그인 확인
		EgovCmsKicadmAdminLoginSessionVO sessionVO = (EgovCmsKicadmAdminLoginSessionVO) EgovCmsUserDetailsHelper.getAdminAuthenticatedUser();
		
		if(menuMap != null) {
			EgovCmsComLogVO lvo = new EgovCmsComLogVO();
			
			lvo.setMenuCd((String) menuMap.get("menuCd"));
			lvo.setMenuName((String) menuMap.get("murName"));
			lvo.setMenuUrl((String) menuMap.get("murUrl"));
			lvo.setLogCont((String) menuMap.get("murCont"));
			lvo.setRegIdx(sessionVO.getAdmIdx());
			lvo.setRegName(sessionVO.getAdmName());
			lvo.setRegIp(EgovCmsCommonUtil.getClientIP(request));
			
			comLogService.insertLogAdm(lvo);
		}
	}*/

	/**
	 * 관리자 로그 기록
	 */
	/*private void insertAdminLog(HttpServletRequest request) throws Exception {

		//request mapping URL 값 받아오기
		EgovMap menuMap = (EgovMap) request.getAttribute("menuMap");

		//관리자 로그인 확인
		EgovCmsKicadmAdminLoginSessionVO sessionVO = (EgovCmsKicadmAdminLoginSessionVO) EgovCmsUserDetailsHelper.getAdminAuthenticatedUser();

		if(menuMap != null) {
			String logYn = (String) menuMap.get("murLogYn");
			if("Y".equals(logYn)) {
				EgovCmsComLogVO lvo = new EgovCmsComLogVO();
				
				lvo.setMenuCd((String) menuMap.get("menuCd"));
				lvo.setMenuName((String) menuMap.get("murName"));
				lvo.setMenuUrl((String) menuMap.get("murUrl"));
				lvo.setLogCont((String) menuMap.get("murCont"));
				lvo.setRegIdx(sessionVO.getAdmIdx());
				lvo.setRegName(sessionVO.getAdmName());
				lvo.setRegIp(EgovCmsCommonUtil.getClientIP(request));
	
				comLogService.insertLogAdm(lvo);
			}
		}
	}*/
	
	/**
	 * 사용자 로그 기록
	 */
	private void insertUserLog(HttpServletRequest request) throws Exception {
		
		// Site CD
		String siteCd			=	(String)request.getAttribute("siteCd");
		if(EgovStringUtil.isEmpty(siteCd)) siteCd	=	"kr";
		
		EgovCmsComLogUsrStatVO usrStatVO	=	new EgovCmsComLogUsrStatVO();
		usrStatVO.setRegIdx("0");
		usrStatVO.setRegName("guest");
		usrStatVO.setRegIp(EgovCmsCommonUtil.getClientIP(request));
		usrStatVO.setModIdx("0");
		usrStatVO.setModName("guest");
		usrStatVO.setModIp(EgovCmsCommonUtil.getClientIP(request));
		usrStatVO.setSiteCd(siteCd);
		// 2시간 이내 로그기록 체크
		
		//2-12 진우석 개발단계 로그 주석
		
		int usrLogCount	=	comLogService.checkLogUsrStat(usrStatVO);
		
		// 2시간 이내에 로그기록이 없을 시 로그를 기록한다.
		if(usrLogCount < 1) {
			// 사용자 접속 로그
			
			//링크를 통해 들어온 경우에만 알 수 있다. 
			// 이전 접속 주소
			String logReferer	=	request.getHeader("referer");
			// 접속 에이전트
			String logAgent 		=	request.getHeader("user-agent");
			// 접속 OS
			String logOs		=	EgovCmsCommonUtil.getClientOsInfo(request);
			// 접속 브라우저
			String logBrowser	=	EgovCmsCommonUtil.getClientBrowserKind(request);
			// 디바이스 코드 =================
			String deviceCd		=	EgovCmsCommonUtil.getClientDeviceKind(request);
			// ============================
			// 이전 접속주소 코드 ==============
			String logRefererCd	=	"";
			if(logReferer != null && !logReferer.equals("") && !EgovStringUtil.isEmpty(logReferer)) {
				
				List<EgovMap> refererCdList	=	commonService.getCommCodeList("referer_cd");
				String domain	=	logReferer;
				if(domain.indexOf("https://") > -1)
					//domain	=	domain.substring("https://".length());
					domain	=	domain.substring("https://".length());
				else 
					domain	=	domain.substring("http://".length());
				
				domain	=	domain.substring(0, domain.indexOf("/"));
				
				for(int i = 0; i < refererCdList.size(); i++) {
					EgovMap tmp	=	refererCdList.get(i);
					if( i == refererCdList.size()-1) {
						logRefererCd	=	(String)tmp.get("cdVal2");
						break;
					}
					if(domain.contains((String)tmp.get("cdName2"))) {
						logRefererCd	=	(String)tmp.get("cdVal2");
						break;
					}
				}
			} else {
				logReferer	=	"";
				logRefererCd	=	"직접입력";
			}
			// ============================
			usrStatVO.setDeviceCd(deviceCd);
			usrStatVO.setLogRefererCd(logRefererCd);
			usrStatVO.setLogReferer(logReferer);
			usrStatVO.setLogAgent(logAgent);
			usrStatVO.setLogOs(logOs);
			usrStatVO.setLogBrowser(logBrowser);
			
			comLogService.insertLogUsrStat(usrStatVO);
			// ============================
			usrStatVO.setUvCnt(1);
		}
		else {
			usrStatVO.setUvCnt(0);
		}

		// UV, PV 누적 기록
		// 사용자 접속 통계 (데일리 PK)
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String today			=	dateFormat.format(new Date());
		usrStatVO.setYmd(today);
		comLogService.updateLogUsrStatDaily(usrStatVO);
		
		// Top Logo
		//EgovCmsKicadmSiteVO siteVo	=	new EgovCmsKicadmSiteVO();
		//EgovMap map = siteService.webMainTopLogo(siteVo);
		//request.setAttribute("mainTopLogo", map);

		//request mapping URL 값 받아오기
		/*EgovMap menuMap = (EgovMap) request.getAttribute("menuMap");

		if(menuMap != null) {
			EgovCmsComLogVO lvo = new EgovCmsComLogVO();
			
			lvo.setMenuIdx(String.valueOf(menuMap.get("menuIdx")));
			lvo.setMenuName((String) menuMap.get("menuName"));
			lvo.setMenuUrl((String) menuMap.get("menuUrl"));
			lvo.setLogCont((String) menuMap.get("menuName"));
			lvo.setRegIdx("0");
			lvo.setRegName("guest");
			lvo.setRegIp(EgovCmsCommonUtil.getClientIP(request));

			comLogService.insertLogUsr(lvo);
		}*/
	}

}
