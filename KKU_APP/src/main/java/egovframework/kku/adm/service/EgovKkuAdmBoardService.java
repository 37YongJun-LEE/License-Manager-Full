package egovframework.kku.adm.service;

import java.util.List;

import egovframework.kku.usr.service.EgovKkuAppBoardVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAdmBoardService {
	
	//학과 게시판 리스트 
	public List<?> selectMajorBoardList() throws Exception;

	public List<EgovMap> selectFreenoticeList(EgovKkuAppCommunityVO communityVO) throws Exception;

	public int selectFreenoticeInfoListCnt(EgovKkuAppCommunityVO communityVO) throws Exception;

	public EgovMap selectFreenoticeInfoDetail(EgovKkuAppCommunityVO communityVO) throws Exception;

	public int updateFreenoticeInfo(EgovKkuAppCommunityVO communityVO) throws Exception;

	public int deleteFreenoticeInfo(EgovKkuAppCommunityVO communityVO) throws Exception;

	public List<?> selectAllTradeList(EgovKkuAppBoardVO boardVO);

	public int updatetradeListInfo(EgovKkuAppBoardVO boardVO) throws Exception;


}
