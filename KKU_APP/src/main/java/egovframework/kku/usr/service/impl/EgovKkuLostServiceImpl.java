package egovframework.kku.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.usr.service.EgovKkuAppCodeVO;
import egovframework.kku.usr.service.EgovKkuAppFacilityVO;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.kku.usr.service.EgovKkuLostService;
import egovframework.kku.usr.service.EgovKkuLostVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("lostService")
public class EgovKkuLostServiceImpl implements EgovKkuLostService{
	@Resource(name = "lostDAO")
	private EgovKkuLostDAO lostDAO;

	@Override
	public void insertLost(EgovKkuLostVO lostVO) {
		lostDAO.insertLost(lostVO);
		
	}

	@Override
	public int updateLost(EgovKkuLostVO lostVO) {
		return lostDAO.updateLost(lostVO);
	}

	@Override
	public List<EgovMap> selectLostList(EgovKkuLostVO lostVO) {
		return lostDAO.selectLostList(lostVO);
	}

	@Override
	public EgovMap selectLostByIdx(EgovKkuLostVO lostVO) {
		return lostDAO.selectLostByIdx(lostVO);
	}

	@Override
	public List<EgovMap> lostFileList(EgovKkuLostVO lostVO) {
		return lostDAO.lostFileList(lostVO);
	}

	@Override
	public void delLost(EgovKkuLostVO lostVO) {
		lostDAO.delLost(lostVO);
		
	}

	@Override
	public void updateStaLost(EgovKkuLostVO lostVO) {
		lostDAO.updateStaLost(lostVO);
	}
	

	
}
