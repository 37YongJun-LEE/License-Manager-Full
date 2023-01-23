package egovframework.kku.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.usr.service.EgovKkuAppCommunityThemeBoardService;
import egovframework.kku.usr.service.EgovKkuAppCommunityThemeBoardVO;
import egovframework.kku.usr.service.EgovKkuAppReplyVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("themeBoardService")
public class EgovKkuAppCommunityThemeBoardServiceImpl implements EgovKkuAppCommunityThemeBoardService {

	@Resource(name="themeBoardDAO")
	public EgovKkuAppCommunityThemeBoardDAO themeBoardDAO;
	
	@Override
	public List<EgovMap> selectThemeBoardList(EgovKkuAppCommunityThemeBoardVO themeVO) throws Exception {
		return (List<EgovMap>) themeBoardDAO.selectThemeBoardList(themeVO);
	}

	@Override
	public List<?> selectHBoardList(EgovKkuAppCommunityThemeBoardVO themeVO) throws Exception {
		return themeBoardDAO.selectHBoardList(themeVO);
	}

	@Override
	public void insertTboard(EgovKkuAppCommunityThemeBoardVO vo) throws Exception {
		themeBoardDAO.insertTboard(vo);
		
	}

	@Override
	public List<EgovMap> selectTBoardList(EgovKkuAppCommunityThemeBoardVO themeVO) throws Exception {
		return (List<EgovMap>) themeBoardDAO.selectTBoardList(themeVO);
	}

	@Override
	public int selectBoardListCnt(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return themeBoardDAO.selectBoardListCnt(themeVO);
	}

	@Override
	public EgovKkuAppCommunityThemeBoardVO selectTBoardDetail(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return themeBoardDAO.selectTBoardDetail(themeVO);
	}

	@Override
	public List<?> boardFileList(EgovKkuAppCommunityThemeBoardVO themeVO) {
		return themeBoardDAO.boardFileList(themeVO);
	}

	@Override
	public void updateBoard(EgovKkuAppCommunityThemeBoardVO themeVO) {
		themeBoardDAO.updateBoard(themeVO);
		
	}

	@Override
	public List<?> selectTReplyList(EgovKkuAppCommunityThemeBoardVO themeVO) throws Exception {
		return themeBoardDAO.selectTReplyList(themeVO);
	}

	@Override
	public String insertTboardReply(EgovKkuAppReplyVO replyVO) {
		return themeBoardDAO.insertTboardReply(replyVO);
	}

	@Override
	public List<?> selectTopThemeBoardList(EgovKkuAppCommunityThemeBoardVO themeVO) throws Exception {
		return themeBoardDAO.selectTopThemeBoardList(themeVO);
	}

	@Override
	public int selectBoardTopListCnt(EgovKkuAppCommunityThemeBoardVO themeVO) throws Exception {
		return themeBoardDAO.selectBoardTopListCnt(themeVO);
	}
	

}
