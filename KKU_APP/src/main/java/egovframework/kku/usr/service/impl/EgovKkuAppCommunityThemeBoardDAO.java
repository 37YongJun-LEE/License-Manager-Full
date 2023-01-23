package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppCommunityThemeBoardVO;
import egovframework.kku.usr.service.EgovKkuAppReplyVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("themeBoardDAO")
public class EgovKkuAppCommunityThemeBoardDAO extends EgovComAbstractDAO {
	
	public List<?> selectThemeBoardList(EgovKkuAppCommunityThemeBoardVO themeVO) throws Exception {
		return (List<EgovMap>) list("themeBoardDAO.selectThemeBoardList", themeVO);
	}

	public List<?> selectHBoardList(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return list("themeBoardDAO.selectHBoardList",themeVO);
	}

	public void insertTboard(EgovKkuAppCommunityThemeBoardVO vo) {
		insert ("themeBoardDAO.insertTboard",vo);
		
	}

	public List<EgovMap> selectTBoardList(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return (List<EgovMap>) list("themeBoardDAO.selectTBoardList", themeVO);
	}

	public int selectBoardListCnt(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return (int) select("themeBoardDAO.selectBoardListCnt", themeVO);
	}

	public EgovKkuAppCommunityThemeBoardVO selectTBoardDetail(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return (EgovKkuAppCommunityThemeBoardVO) select("themeBoardDAO.selectTBoardDetail",themeVO);
	}

	public List<?> boardFileList(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return list("themeBoardDAO.boardFileList",themeVO);
	}

	public void updateBoard(EgovKkuAppCommunityThemeBoardVO themeVO) {
		update("themeBoardDAO.updateBoard",themeVO);
		
	}

	public List<?> selectTReplyList(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return list("themeBoardDAO.selectTReplyList",themeVO);
	}

	public String insertTboardReply(EgovKkuAppReplyVO replyVO) {
		return (String) insert("themeBoardDAO.insertTboardReply", replyVO);
	}

	public List<?> selectTopThemeBoardList(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return list("themeBoardDAO.selectTopThemeBoardList",themeVO);
	}

	public int selectBoardTopListCnt(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return (int) select("themeBoardDAO.selectBoardTopListCnt",themeVO);
	}

}
