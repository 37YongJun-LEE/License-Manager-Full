package egovframework.kku.usr.service;

import java.util.List;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppCommunityService {
	
	public EgovKkuAppCommunityVO showBoardDetail(EgovKkuAppCommunityVO vo);

	
	public List<?> showTopThree(int num) throws Exception;
	public int getReplyNum(EgovKkuAppCommunityVO vo) throws Exception;
	public int getLikeNum(EgovKkuAppCommunityVO vo) throws Exception;
	
	public List<?> showFriendList(EgovKkuAppLoginSessionVO vo);
	
	
	//친구화면에서의 게시물 작성수, 판매내역 수, 친구 수 불러오기 
	public List<?> getCNTfriendProfile(EgovKkuAppUserVO vo) throws Exception;
	
	//댓글 등록
	public String replyInsert(EgovKkuAppReplyVO vo) throws Exception;
	
	//댓글 리스트 가져오기
	public List<?> getReplyList(EgovKkuAppCommunityVO vo) throws Exception;
	
	//알람 insert
	public String insertAlarm(EgovKkuAppAlarmVO vo) throws Exception;
	//알람 리스트
	public List<?> getAlarmList(EgovKkuAppAlarmVO vo) throws Exception;
	//해당유저 알람 카운트
	public int cntAlarm(String usrid) throws Exception;
	//해당 유저 알람 모두 읽음 처리
	public int updateReadAll(String usrid) throws Exception;
	//해당 유저 알람 모두 삭제 처리
	public int deleteAll(String usrid) throws Exception;
	
	//해당 게시판 리스트 가져오기
	public List<?> getBoardList(String bName) throws Exception;
	//해당 게시판 게시물 수 count
	public int cntBoardList(String bName) throws Exception;
	//게시글 작성
	public void insertBoard(EgovKkuAppCommunityVO vo) throws Exception;
	//게시글 수정
	public int updateBoard(EgovKkuAppCommunityVO vo) throws Exception;
	//조회수 업데이트
	public int updateViewCnt(EgovKkuAppCommunityVO vo) throws Exception;
	//전체 인기글 가져오기
	public List<?> selectAllHBoardList() throws Exception; 
	
	//해당 게시글 좋아요 눌렀는지 확인
	public int chkLiked(EgovKkuAppCommunityVO vo) throws Exception;
	//좋아요 하기
	public String insertLike(EgovKkuAppCommunityVO vo) throws Exception;
	
	//해당 댓글 좋아요 눌렀는지 확인 
	public int chkReplyLiked(EgovKkuAppReplyVO vo) throws Exception;
	//좋아요 하기
	public String insertReplyLike(EgovKkuAppReplyVO vo) throws Exception;
	
	//게시판 리스트 불러오기
	public List<EgovMap> selectBoardList(EgovKkuAppCommunityVO vo) throws Exception;
	//전체 게시글 카운트
	public int selectBoardListCnt(EgovKkuAppCommunityVO vo) throws Exception;
	//인기게시글 불러오기
	public List<?> selectBoardTopList(EgovKkuAppCommunityVO communityVO) throws Exception;
	//인기게시글 카운트
	public int selectBoardTopListCnt(EgovKkuAppCommunityVO communityVO) throws Exception;


	void insertBoardFile(EgovKkuAdmCommunityBoardFileVO vo) throws Exception;


	List<EgovMap> boardFileList(EgovKkuAppCommunityVO communityVO) throws Exception;


	void boardLikeDelete(EgovKkuAppCommunityVO vo) throws Exception;


	void boardReplyDelete(EgovKkuAppCommunityVO vo) throws Exception;


	void boardDelete(EgovKkuAppCommunityVO vo) throws Exception;


	public void updateBoardDelete(EgovKkuAppCommunityVO communiyVO);


	public int setAlarmRead(EgovKkuAppAlarmVO alarmVO) throws Exception;


	public String insertReport(EgovKkuReportVO reportVO) throws Exception;
	
	
}
