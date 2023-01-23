package egovframework.cms.com.service;

import java.util.List;

public interface EgovCmsUserDetailsService {

	/**
	 * 인증된 사용자객체를 VO형식으로 가져온다.
	 * @return Object - 사용자 ValueObject
	 */
	public Object getAuthenticatedUser();

	/**
	 * 인증된 사용자의 권한 정보를 가져온다.
	 * 예) [ROLE_ADMIN, ROLE_USER, ROLE_A, ROLE_B, ROLE_RESTRICTED, IS_AUTHENTICATED_FULLY, IS_AUTHENTICATED_REMEMBERED, IS_AUTHENTICATED_ANONYMOUSLY]
	 * @return List - 사용자 권한정보 목록
	 */
	public List<String> getAuthorities();
	
	/**
	 * 인증된 사용자 여부를 체크한다.
	 * @return Boolean - 인증된 사용자 여부(TRUE / FALSE)	
	 */
	public Boolean isAuthenticated(); 


	/**
	 * 인증된 사용자 객체를 VO형식으로 가져온다.
	 * @return Object - 사용자(관리자) ValueObject
	 */
	public Object getAuthenticatedUserInfo();
	/**
	 * 사용자(인증기관) 객체를 VO형식으로 가져온다.
	 * @return
	 */
	public Object getAuthenticatedWebUserInfo();
	/**
	 * 사용자(입회용ID) 객체를 VO형식으로 가져온다.
	 * @return
	 */
	public Object getAuthenticatedAdmisUserInfo();
	public Object getSpeakersAuthenticatedUser();

	/**
	 * 인증된 사용자(관리자)의 권한 정보를 가져온다.
	 * 예) [ROLE_ADMIN, ROLE_USER, ROLE_A, ROLE_B, ROLE_RESTRICTED, IS_AUTHENTICATED_FULLY, IS_AUTHENTICATED_REMEMBERED, IS_AUTHENTICATED_ANONYMOUSLY]
	 * @return List - 사용자(관리자) 권한정보 목록
	 */
	public List<String> getAdminAuthorities();
	
	/**
	 * 인증된 사용자(관리자) 여부를 체크한다.
	 * @return Boolean - 인증된 사용자(관리자) 여부(TRUE / FALSE)	
	 */
	public Boolean isAdminAuthenticated(); 

}
