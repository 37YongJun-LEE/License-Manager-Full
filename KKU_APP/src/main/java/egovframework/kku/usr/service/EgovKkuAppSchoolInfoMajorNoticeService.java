package egovframework.kku.usr.service;

import java.util.List;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppSchoolInfoMajorNoticeService {
	
	public List<EgovMap> selectBoardList(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception;
	
	public int selectBoardListCnt(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception;
	
	public EgovMap selectBoardByIdx(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception;

	public List<EgovMap> selectBoardListByMajor(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO);

	public List<EgovMap> selectBoardFileList(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO)throws Exception;
	
	public void updateBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO)throws Exception;

	public String insertBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO)throws Exception;
	
	public void deleteBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO)throws Exception;

	public void doneBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO)throws Exception;
	
	public void insertBoardFile(EgovKkuAdmCommunityBoardFileVO vo)throws Exception;
	
	public void deleteBoardFile(EgovKkuAdmCommunityBoardFileVO vo)throws Exception;

	public int updateViewCnt(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO)throws Exception;

	public String getURL(String usrMajor) throws Exception;

	public List<String> selectMajorList();

}
