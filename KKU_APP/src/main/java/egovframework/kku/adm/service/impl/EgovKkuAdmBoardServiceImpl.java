package egovframework.kku.adm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmBoardService;
import egovframework.kku.usr.service.EgovKkuAppBoardVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("adminBoardService")
public class EgovKkuAdmBoardServiceImpl implements EgovKkuAdmBoardService{

	@Resource(name="adminBoardDAO")
	EgovKkuAdmBoardDAO adminBoardDAO;

	@Override
	public List<?> selectMajorBoardList() throws Exception {
		return adminBoardDAO.selectMajorBoardList();
	}

	@Override
	public List<EgovMap> selectFreenoticeList(EgovKkuAppCommunityVO communityVO) throws Exception {
		
		return adminBoardDAO.selectFreenoticeList(communityVO);
	}

	@Override
	public int selectFreenoticeInfoListCnt(EgovKkuAppCommunityVO communityVO) throws Exception {
		
		return adminBoardDAO.selectFreenoticeInfoListCnt(communityVO);
	}

	@Override
	public EgovMap selectFreenoticeInfoDetail(EgovKkuAppCommunityVO communityVO) throws Exception {
		
		return adminBoardDAO.selectFreenoticeInfoDetail(communityVO);
	}

	@Override
	public int updateFreenoticeInfo(EgovKkuAppCommunityVO communityVO) throws Exception {
		
		return adminBoardDAO.updateFreenoticeInfo(communityVO);
	}

	@Override
	public int deleteFreenoticeInfo(EgovKkuAppCommunityVO communityVO) throws Exception {
		
		return adminBoardDAO.deleteFreenoticeInfo(communityVO);
	}

	@Override
	public List<?> selectAllTradeList(EgovKkuAppBoardVO boardVO) {
		// TODO Auto-generated method stub
		return adminBoardDAO.selectAllTradeList(boardVO);
	}

	@Override
	public int updatetradeListInfo(EgovKkuAppBoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}