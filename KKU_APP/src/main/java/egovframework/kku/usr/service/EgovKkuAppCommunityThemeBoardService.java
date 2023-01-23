package egovframework.kku.usr.service;

import java.util.List;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppCommunityThemeBoardService {
	//주제별 게시판 리스트 가져오기
	List<EgovMap> selectThemeBoardList(EgovKkuAppCommunityThemeBoardVO themeVO)throws Exception;
	//좋아요 15개 이상 게시물 리스트 가져오기
	List<?> selectHBoardList(EgovKkuAppCommunityThemeBoardVO themeVO)throws Exception;
	//주제별게시판 insert
	public void insertTboard(EgovKkuAppCommunityThemeBoardVO vo)throws Exception;
	//게시판 리스트 가져오기
	List<EgovMap> selectTBoardList(EgovKkuAppCommunityThemeBoardVO themeVO)throws Exception;
	
	int selectBoardListCnt(EgovKkuAppCommunityThemeBoardVO themeVO);
	//게시판 상세페이지
	EgovKkuAppCommunityThemeBoardVO selectTBoardDetail(EgovKkuAppCommunityThemeBoardVO themeVO);
	List<?> boardFileList(EgovKkuAppCommunityThemeBoardVO themeVO);

	void updateBoard(EgovKkuAppCommunityThemeBoardVO themeVO);
	List<?> selectTReplyList(EgovKkuAppCommunityThemeBoardVO themeVO)throws Exception;
	String insertTboardReply(EgovKkuAppReplyVO replyVO);
	//주제별게시판 게시물 리스트
	List<?> selectTopThemeBoardList(EgovKkuAppCommunityThemeBoardVO themeVO) throws Exception;
	//주제별게시판 게시물 갯수
	int selectBoardTopListCnt(EgovKkuAppCommunityThemeBoardVO themeVO) throws Exception;
}
