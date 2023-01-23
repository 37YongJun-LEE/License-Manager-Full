package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoRoomVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("roomDAO")
public class EgovKkuAppSchoolInfoRoomDAO extends EgovComAbstractDAO{

	public List<EgovMap> selectBoardList(EgovKkuAppSchoolInfoRoomVO roomVO) throws Exception {
		return (List<EgovMap>) list("roomDAO.selectBoardList", roomVO);
	}

	public int selectBoardListCnt(EgovKkuAppSchoolInfoRoomVO roomVO) {
		return (int) select("roomDAO.selectBoardListCnt",roomVO);
	}

	public EgovMap selectBoardByIdx(EgovKkuAppSchoolInfoRoomVO roomVO) {
		return (EgovMap) select("roomDAO.selectBoardByIdx", roomVO);
	}

	public List<EgovMap> roomFileList(EgovKkuAppSchoolInfoRoomVO roomVO) {
		return (List<EgovMap>) list("roomDAO.roomFileList", roomVO);
	}
}
