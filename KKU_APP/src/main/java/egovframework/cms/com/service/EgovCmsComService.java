package egovframework.cms.com.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovCmsComService {
	
	/**
	 * 공통 코드 리스트를 가져온다.
	 * @param codeVal
	 * @return List<EgovCmsComCodeVO>
	 */
	List<EgovMap> getCommCodeList(String codeVal) throws Exception;
	
	/**
	 * 공통 코드 리스트를 가져온다.
	 * @param codeVal
	 * @return List<EgovCmsComCodeVO>
	 */
	List<EgovMap> getCommCodeList2(String codeVal) throws Exception;
	List<EgovMap> getCommCodeList3(String codeVal) throws Exception;
	List<EgovMap> getCommCodeList4(String codeVal) throws Exception;
	
	/**
	 * 공통 코드 리스트를 가져온다.
	 * @param codeVal
	 * @return List<EgovCmsComCodeVO>
	 */
	List<EgovMap> getCommMemCodeList(String codeVal) throws Exception;
	
	/**
	 * 회원 공통 코드 리스트를 가져온다.
	 * @param codeVal
	 * @return List<EgovCmsComCodeVO>
	 */
	public List<EgovMap> getCommMemberCodeList(String codeVal) throws Exception;
	
	List<EgovMap> defaultList(String sqlId, Object vo) throws Exception;
	EgovMap defaultSelectById(String sqlId, Object vo) throws Exception;
	void defaultInsert(String sqlId, Object vo) throws Exception;
	int defaultInsertLastId(String sqlId, Object vo) throws Exception;
	void defaultUpdate(String sqlId, Object vo) throws Exception;
	int defaultUpdateInt(String sqlId, Object vo) throws Exception;
	void defaultDelete(String sqlId, Object vo) throws Exception;
	int defaultInt(String sqlId, Object vo) throws Exception;
	String defaultString(String sqlId, Object vo) throws Exception;

	/**
	 * 게시판ID 로 게시판 정보를 가져온다.
	 * @param bcfId
	 * @return EgovMap
	 */
	public EgovMap getBcfInfoByBcfId(String bcfId) throws Exception;

	/**
	 * 메뉴ID 로 메뉴 정보를 가져온다.
	 * @param menuId
	 * @return EgovMap
	 */
	public EgovMap getMenuInfoByMenuId(String siteCd, String menuId) throws Exception;

	EgovMap getCommConfigSelectById(String cfgVal) throws Exception;

	/**
 	 * 시스템 메일 발송
 	 * @param 
 	 * @return 
 	 * @exception
 	 */
	String sendSystemEmail(String email, String receiver, String msg, String type) throws Exception;

}
	
	
 	
