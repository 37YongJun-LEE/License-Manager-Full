package egovframework.cms.com.service.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.cms.com.service.EgovCmsComFileVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("fileDAO")
public class EgovCmsComFileDAO extends EgovComAbstractDAO{
	/** log */
	protected static final Log LOG = LogFactory.getLog(EgovCmsComFileDAO.class);
	
	public void fileInsert(EgovCmsComFileVO vo) throws Exception {					// insert
        insert("fileDAO.fileInsert", vo);
   }
	public void fileUpdate(EgovCmsComFileVO vo) throws Exception {					// insert
        insert("fileDAO.fileUpdate", vo);
   }
	public void fileDelete(EgovCmsComFileVO vo) throws Exception {					// delete
        delete("fileDAO.fileDelete", vo);
   }
	public void fileDeleteAll(EgovCmsComFileVO vo) throws Exception {					// deleteAll
        delete("fileDAO.fileDeleteAll", vo);
   }
	
	@SuppressWarnings("unchecked")
 	public List<EgovCmsComFileVO> selectFileList(EgovCmsComFileVO vo) throws Exception {			// list
         return (List<EgovCmsComFileVO>) list("fileDAO.selectFileList", vo);
    }
	@SuppressWarnings("unchecked")
 	public List<EgovCmsComFileVO> selectFileDelList(EgovCmsComFileVO vo)				// list
             throws Exception {
         return (List<EgovCmsComFileVO>) list("fileDAO.selectFileDelList", vo);
    }
	// select by Id
 	public EgovCmsComFileVO fileSelectById(EgovCmsComFileVO vo) throws Exception {	 // select idx
    	return (EgovCmsComFileVO)select("fileDAO.fileSelectById", vo);
    }
 	
 // select by Id
  	public EgovCmsComFileVO fileSelectByIdPath(EgovCmsComFileVO vo) throws Exception {	 // select idx
     	return (EgovCmsComFileVO)select("fileDAO.fileSelectByIdPath", vo);
     }
}
