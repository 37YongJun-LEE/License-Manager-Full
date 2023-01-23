package egovframework.kku.adm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppBoardVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("adminBoardDAO")
public class EgovKkuAdmBoardDAO extends EgovComAbstractDAO{

	public List<?> selectMajorBoardList() {
		return list("adminBoardDAO.selectMajorBoardList");
	}

	@SuppressWarnings("unchecked")
	public List<EgovMap> selectFreenoticeList(EgovKkuAppCommunityVO communityVO) {
		
		return (List<EgovMap>) list("adminBoardDAO.selectFreenoticeList", communityVO);
	}

	public int selectFreenoticeInfoListCnt(EgovKkuAppCommunityVO communityVO) {
		
		return (int)select("adminBoardDAO.selectFreenoticeInfoListCnt",communityVO);
	}

	public EgovMap selectFreenoticeInfoDetail(EgovKkuAppCommunityVO communityVO) {
		
		return (EgovMap)select("adminBoardDAO.selectFreenoticeInfoDetail", communityVO);
	}

	public int updateFreenoticeInfo(EgovKkuAppCommunityVO communityVO) {
		
		return (int)update("adminBoardDAO.updateFreeenoticeInfo", communityVO);
	}

	public int deleteFreenoticeInfo(EgovKkuAppCommunityVO communityVO) {
		
		return(int)delete("adminBoardDAO.deleteFreeenoticeInfo", communityVO);
	}

	public List<?> selectAllTradeList(EgovKkuAppBoardVO boardVO) {

		return list("adminBoardDAO.selectAllTradeList",boardVO);
	}

}
