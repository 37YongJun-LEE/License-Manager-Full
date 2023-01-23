package egovframework.cms.com.util;

import java.util.List;

import egovframework.cms.com.service.EgovCmsUserDetailsService;

/**
 * EgovUserDetails Helper 클래스
 *
 * @author sjyoon
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2009.03.10  sjyoon         최초 생성
 *   2011.07.01	 서준식          interface 생성후 상세 로직의 분리
 * </pre>
 */

public class EgovCmsUserDetailsHelper {

	static EgovCmsUserDetailsService egovCmsUserDetailsService;

	public EgovCmsUserDetailsService getEgovCmsUserDetailsService() {
		return egovCmsUserDetailsService;
	}

	public void setEgovCmsUserDetailsService(EgovCmsUserDetailsService egovCmsUserDetailsService) {
		EgovCmsUserDetailsHelper.egovCmsUserDetailsService = egovCmsUserDetailsService;
	}

	/**
	 * 인증된 사용자객체를 VO형식으로 가져온다.
	 * @return Object - 사용자 ValueObject
	 */
	public static Object getAuthenticatedUser() {
		return egovCmsUserDetailsService.getAuthenticatedUser();
	}

	/**
	 * 인증된 사용자의 권한 정보를 가져온다.
	 *
	 * @return List - 사용자 권한정보 목록
	 */
	public static List<String> getAuthorities() {
		return egovCmsUserDetailsService.getAuthorities();
	}

	/**
	 * 인증된 사용자 여부를 체크한다.
	 * @return Boolean - 인증된 사용자 여부(TRUE / FALSE)
	 */
	public static Boolean isAuthenticated() {
		return egovCmsUserDetailsService.isAuthenticated();
	}

	/**
	 * 인증된 사용자(관리자)객체를 VO형식으로 가져온다.
	 * @return Object - 사용자(관리자) ValueObject
	 */
	public static Object getAuthenticatedUserInfo() {
		return egovCmsUserDetailsService.getAuthenticatedUserInfo();
	}
	
	/**
	 * 인증된 사용자(기관)객체를 VO형식으로 가져온다.
	 * @return Object - 사용자(기관) ValueObject
	 */
	public static Object getAuthenticatedWebUserInfo() {
		return egovCmsUserDetailsService.getAuthenticatedWebUserInfo();
	}
	
	/**
	 * 인증된 사용자(입회용)객체를 VO형식으로 가져온다.
	 * @return Object - 사용자(기관) ValueObject
	 */
	public static Object getAuthenticatedAdmisUserInfo() {
		return egovCmsUserDetailsService.getAuthenticatedAdmisUserInfo();
	}
	
	public static Object getSpeakersAuthenticatedUser() {
		return egovCmsUserDetailsService.getSpeakersAuthenticatedUser();
	}

	/**
	 * 인증된 사용자(관리자)의 권한 정보를 가져온다.
	 *
	 * @return List - 사용자(관리자) 권한정보 목록
	 */
	public static List<String> getAdminAuthorities() {
		return egovCmsUserDetailsService.getAdminAuthorities();
	}

	/**
	 * 인증된 사용자(관리자) 여부를 체크한다.
	 * @return Boolean - 인증된 사용자(관리자) 여부(TRUE / FALSE)
	 */
	public static Boolean isAdminAuthenticated() {
		return egovCmsUserDetailsService.isAdminAuthenticated();
	}
}
