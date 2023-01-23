package egovframework.cms.com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.cms.com.service.EgovCmsUserDetailsService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 
 * @author 공통서비스 개발팀 서준식
 * @since 2011. 6. 25.
 * @version 1.0
 * @see
 *
 * <pre>
 * 개정이력(Modification Information) 
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2011. 8. 12.    서준식        최초생성
 *  
 *  </pre>
 */

public class EgovCmsUserDetailsSessionServiceImpl extends EgovAbstractServiceImpl implements EgovCmsUserDetailsService {

	public Object getAuthenticatedUser() {
		if (RequestContextHolder.getRequestAttributes() == null) {
			return null;
		}

		return RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);

	}

	public List<String> getAuthorities() {

		// 권한 설정을 리턴한다.
		List<String> listAuth = new ArrayList<String>();

		return listAuth;
	}
	
	public Boolean isAuthenticated() {
		// 인증된 유저인지 확인한다.

		if (RequestContextHolder.getRequestAttributes() == null) {
			return false;
		} else {

			if (RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION) == null) {
				return false;
			} else {
				return true;
			}
		}

	}
	
	public Object getAuthenticatedUserInfo() {
		if (RequestContextHolder.getRequestAttributes() == null) {
			return null;
		}
		return RequestContextHolder.getRequestAttributes().getAttribute("adminSessionVO", RequestAttributes.SCOPE_SESSION);

	}
	
	public Object getAuthenticatedWebUserInfo() {
		if (RequestContextHolder.getRequestAttributes() == null) {
			return null;
		}
		return RequestContextHolder.getRequestAttributes().getAttribute("orgSessionVo", RequestAttributes.SCOPE_SESSION);

	}
	
	public Object getAuthenticatedAdmisUserInfo() {
		if (RequestContextHolder.getRequestAttributes() == null) {
			return null;
		}
		return RequestContextHolder.getRequestAttributes().getAttribute("admissionSessionVo", RequestAttributes.SCOPE_SESSION);

	}
	
	public Object getSpeakersAuthenticatedUser() {
		if (RequestContextHolder.getRequestAttributes() == null) {
			return null;
		}
		return RequestContextHolder.getRequestAttributes().getAttribute("speakersSessionVo", RequestAttributes.SCOPE_SESSION);

	}
	
	public List<String> getAdminAuthorities() {

		// 권한 설정을 리턴한다.
		List<String> listAuth = new ArrayList<String>();

		return listAuth;
	}

	public Boolean isAdminAuthenticated() {
		// 인증된 유저인지 확인한다.

		if (RequestContextHolder.getRequestAttributes() == null) {
			return false;
		} else {

			if (RequestContextHolder.getRequestAttributes().getAttribute("adminSessionVo", RequestAttributes.SCOPE_SESSION) == null) {
				return false;
			} else {
				return true;
			}
		}

	}

	

}
