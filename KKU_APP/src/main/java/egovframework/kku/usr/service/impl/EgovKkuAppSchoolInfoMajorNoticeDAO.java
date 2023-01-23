package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoMajorNoticeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("majorNoticeDAO")
public class EgovKkuAppSchoolInfoMajorNoticeDAO extends EgovComAbstractDAO{

	public List<EgovMap> selectBoardList(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		return (List<EgovMap>) list("majorNoticeDAO.selectBoardList", majorNoticeVO);
	}

	public int selectBoardListCnt(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) {
		return (int) select("majorNoticeDAO.selectBoardListCnt",majorNoticeVO);
	}

	public EgovMap selectBoardByIdx(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) {
		return (EgovMap) select("majorNoticeDAO.selectBoardByIdx", majorNoticeVO);
	}
	
	public List<EgovMap> selectBoardListByMajor(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) {
		return (List<EgovMap>) list("majorNoticeDAO.selectBoardListByMajor", majorNoticeVO);
	}

	public List<EgovMap> selectBoardFileList(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) {
		return (List<EgovMap>) list("majorNoticeDAO.selectBoardFileList",majorNoticeVO);
	}

	public void updateBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		update("majorNoticeDAO.updateBoard", majorNoticeVO);
	}

	public String insertBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		return (String) insert("majorNoticeDAO.insertBoard", majorNoticeVO);
	}

	public void deleteBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		update("majorNoticeDAO.deleteBoard", majorNoticeVO);
	}

	public void doneBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		insert("majorNoticeDAO.doneBoard", majorNoticeVO);
	}

	public void insertBoardFile(EgovKkuAdmCommunityBoardFileVO vo) throws Exception {
		insert("majorNoticeDAO.insertBoardFile", vo);
	}

	public void deleteBoardFile(EgovKkuAdmCommunityBoardFileVO vo) throws Exception {
		delete("majorNoticeDAO.deleteLike", vo);
	}

	public int updateViewCnt(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) {
		return (int) update("majorNoticeDAO.updateViewCnt",majorNoticeVO);
	}

	public String getURL(String usrMajor) {
		return (String) select("majorNoticeDAO.getURL",usrMajor);
	}

	public List<String> selectMajorList() {
		return (List<String>) list("majorNoticeDAO.selectMajorList");
	}

}
