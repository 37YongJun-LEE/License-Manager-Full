package egovframework.kku.usr.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppSchoolInfoRoomService {
	
	public List<EgovMap> selectBoardList(EgovKkuAppSchoolInfoRoomVO roomVO) throws Exception;
	
	public int selectBoardListCnt(EgovKkuAppSchoolInfoRoomVO roomVO) throws Exception;
	
	public EgovMap selectBoardByIdx(EgovKkuAppSchoolInfoRoomVO roomVO) throws Exception;

	public List<EgovMap> roomFileList(EgovKkuAppSchoolInfoRoomVO roomVO) throws Exception;

}
