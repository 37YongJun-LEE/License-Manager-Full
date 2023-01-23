package egovframework.cms.com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.cms.com.service.EgovCmsEmTranVo;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("commonDAO")
public class EgovCmsComDAO extends EgovComAbstractDAO{
	/** log */
	protected static final Log LOG = LogFactory.getLog(EgovCmsComDAO.class);
	
	/**
	 * 공통 코드들을 가져온다.
	 * @param codeVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<EgovMap> getComCodeList(String codeVal) {
		return (List<EgovMap>)list("commonDAO.getComCodeList", codeVal);
	}
	
	/**
	 * 공통 코드들을 가져온다.
	 * @param codeVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<EgovMap> getComCodeList2(String codeVal) {
		return (List<EgovMap>)list("commonDAO.getComCodeList2", codeVal);
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> getComCodeList3(String codeVal) {
		return (List<EgovMap>)list("commonDAO.getComCodeList3", codeVal);
	}
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> getComCodeList4(String codeVal) {
		return (List<EgovMap>)list("commonDAO.getComCodeList4", codeVal);
	}
	
	/**
	 * 공통 코드들을 가져온다.
	 * @param codeVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<EgovMap> getComMemCodeList(String codeVal) {
		return (List<EgovMap>)list("commonDAO.getComMemCodeList", codeVal);
	}

	/**
	 * 회원 공통 코드들을 가져온다.
	 * @param codeVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<EgovMap> getComMemberCodeList(String codeVal) {
		return (List<EgovMap>)list("commonDAO.getComMemberCodeList", codeVal);
	}

	public EgovMap getCommConfigSelectById(String cfgVal) {
		return (EgovMap)select("commonDAO.getCommConfigSelectById", cfgVal);
	}
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> defaultList(String sqlId, Object vo) throws Exception {
		return (List<EgovMap>) list(sqlId, vo);
	}

	public EgovMap defaultSelectById(String sqlId, Object vo) throws Exception {
		return (EgovMap)select(sqlId,  vo);
	}

	public void defaultInsert(String sqlId, Object vo) throws Exception {
		insert(sqlId, vo);
	}

	public int defaultInsertLastId(String sqlId, Object vo) throws Exception {
		return (Integer)insert(sqlId, vo);
	}

	public void defaultUpdate(String sqlId, Object vo) throws Exception {
		update(sqlId, vo);
	}
	
	public int defaultUpdateInt(String sqlId, Object vo) throws Exception {
		return update(sqlId, vo);
	}

	public void defaultDelete(String sqlId, Object vo) throws Exception {
		delete(sqlId, vo);
	}

	public int defaultInt(String sqlId, Object vo) throws Exception {
		return (Integer)select(sqlId, vo);
	}

	public String defaultString(String sqlId, Object vo) throws Exception {
		return (String)select(sqlId, vo);
	}

	public EgovMap getBcfInfoByBcfId(String bcfId) {
		return (EgovMap)select("commonDAO.getBcfInfoByBcfId", bcfId);
	}

	public EgovMap getMenuInfoByMenuId(String siteCd, String menuId) {
		Map<String, String> pmap = new HashMap<String, String>();
		pmap.put("siteCd", siteCd);
		pmap.put("menuId", menuId);
		return (EgovMap)select("commonDAO.getMenuInfoByMenuId", pmap);
	}

	/**
	 * SMS 발송 테이블에 데이터를 기록한다.
	 * @param 
	 * @return 
	 * @exception
	 */
	public void smsSendInsert(EgovCmsEmTranVo vo) {
	  	insert("commonDAO.smsSendInsert", vo);
	}
}
