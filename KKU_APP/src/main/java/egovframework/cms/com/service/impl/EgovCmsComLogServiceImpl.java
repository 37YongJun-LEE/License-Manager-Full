package egovframework.cms.com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.cms.com.service.EgovCmsComLogService;
import egovframework.cms.com.service.EgovCmsComLogUsrStatVO;
import egovframework.cms.com.service.EgovCmsComLogVO;

@Service("comLogService")
public class EgovCmsComLogServiceImpl implements EgovCmsComLogService{
	
	@Resource(name = "comLogDAO")
	private EgovCmsComLogDAO comLogDAO;
	
	@Override
	public void insertLogAdm(EgovCmsComLogVO vo) throws Exception {
		comLogDAO.insertLogAdm(vo);
    }

	@Override
	public void insertLogUsr(EgovCmsComLogVO vo) throws Exception {
		comLogDAO.insertLogUsr(vo);
	}

	@Override
	public int checkLogUsrStat(EgovCmsComLogUsrStatVO vo) throws Exception {
		return comLogDAO.checkLogUsrStat(vo);
	}

	@Override
	public void insertLogUsrStat(EgovCmsComLogUsrStatVO vo) throws Exception {
		comLogDAO.insertLogUsrStat(vo);
	}

	@Override
	public void updateLogUsrStatDaily(EgovCmsComLogUsrStatVO vo)
			throws Exception {
		comLogDAO.updateLogUsrStatDaily(vo);
	}
}
