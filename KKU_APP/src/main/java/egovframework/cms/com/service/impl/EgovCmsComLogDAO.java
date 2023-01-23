package egovframework.cms.com.service.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.cms.com.service.EgovCmsComLogUsrStatVO;
import egovframework.cms.com.service.EgovCmsComLogVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("comLogDAO")
public class EgovCmsComLogDAO extends EgovComAbstractDAO{
	/** log */
	protected static final Log LOG = LogFactory.getLog(EgovCmsComLogDAO.class);
	
	/**
	 * 로그를 기록한다.
	 * @param logVO
	 * @return
	 */
    public void insertLogAdm(EgovCmsComLogVO vo) throws Exception {
        insert("comLogDAO.insertLogAdm", vo);
    }

    public void insertLogUsr(EgovCmsComLogVO vo) throws Exception {
    	insert("comLogDAO.insertLogUsr", vo);
    }
    
    /**
	 * 2시간이내에 접속한 똑같은 IP가 존재하는지 체크한다.
	 * @param EgovCmsComLogUsrStatVO
	 * @return int
	 * @throws Exception
	 */
    public int checkLogUsrStat(EgovCmsComLogUsrStatVO vo) throws Exception {
    	return (int) select("comLogDAO.checkLogUsrStat", vo);
    }
    
	/**
	 * 사용자 접속 로그를 기록한다.
	 * @param EgovCmsComLogUsrStatVO
	 * @throws Exception
	 */
    public void insertLogUsrStat(EgovCmsComLogUsrStatVO vo) throws Exception {
    	insert("comLogDAO.insertLogUsrStat", vo);
    }
    
    public void updateLogUsrStatDaily(EgovCmsComLogUsrStatVO vo) throws Exception {
    	update("comLogDAO.updateLogUsrStatDaily", vo);
    }
}
