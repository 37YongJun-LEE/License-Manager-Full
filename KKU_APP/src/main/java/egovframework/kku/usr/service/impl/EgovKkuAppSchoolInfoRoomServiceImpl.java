package egovframework.kku.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.usr.service.EgovKkuAppSchoolInfoRoomService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoRoomVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("roomService")
public class EgovKkuAppSchoolInfoRoomServiceImpl implements EgovKkuAppSchoolInfoRoomService{

	@Resource(name="roomDAO")
	public EgovKkuAppSchoolInfoRoomDAO roomDAO;
	
	public List<EgovMap> selectBoardList(EgovKkuAppSchoolInfoRoomVO roomVO) throws Exception {
		return roomDAO.selectBoardList(roomVO);
	}

	public int selectBoardListCnt(EgovKkuAppSchoolInfoRoomVO roomVO) throws Exception {
		return  roomDAO.selectBoardListCnt(roomVO);
	}

	public EgovMap selectBoardByIdx(EgovKkuAppSchoolInfoRoomVO roomVO) throws Exception {
		return roomDAO.selectBoardByIdx(roomVO);
	}

	@Override
	public List<EgovMap> roomFileList(EgovKkuAppSchoolInfoRoomVO roomVO) throws Exception {
		return roomDAO.roomFileList(roomVO);
	}
}
