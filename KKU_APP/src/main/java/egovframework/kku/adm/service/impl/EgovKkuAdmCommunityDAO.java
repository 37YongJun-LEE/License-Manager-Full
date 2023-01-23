package egovframework.kku.adm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.adm.service.EgovKkuAdmLikeVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * kpc-ceo-web
 * @author 개발팀 조반석
 * @since 2020.07.24
 * @version 1.0
 * @see
 */

@Repository("kkucommunityDAO")
public class EgovKkuAdmCommunityDAO extends EgovComAbstractDAO{

/*
	// 커뮤니티관리 > 커뮤니티관리 > List
	@SuppressWarnings("unchecked")
	public List<EgovMap> selectCommunityList() throws Exception {
		return (List<EgovMap>) list("communityDAO.selectCommunityList");
	}	
	
	// 커뮤니티관리 > 커뮤니티관리 > 커뮤니티선택
	public EgovKkuAdmCommunityVO selectCommunityByIdx(EgovKkuAdmCommunityVO vo) throws Exception{
		return (EgovKkuAdmCommunityVO) select("communityDAO.selectCommunityByIdx", vo);
	}
	
	//
	public List<EgovMap> selCommunityList() throws Exception {
		return (List<EgovMap>) list("communityDAO.selCommunityList");
	}	
	
	// 커뮤니티관리 > 커뮤니티관리 > 커뮤니티수정
	public void updateCommunity(EgovKkuAdmCommunityVO vo)throws Exception{
		update("communityDAO.updateCommunity", vo);
	}
	
	// 커뮤니티관리 > 커뮤니티관리 > 커뮤니티삭제
	public void deleteCommunity(EgovKkuAdmCommunityVO vo)throws Exception{
		update("communityDAO.deleteCommunity", vo);
	}
	
	// 커뮤니티관리 > 커뮤니티관리 > 커뮤니티등록
	public void insertCommunity(EgovKkuAdmCommunityVO vo)throws Exception{
		insert("communityDAO.insertCommunity", vo);
	}
	
	// 커뮤니티관리 > 커뮤니티선택 > 모임관리 > List
	public List<EgovMap> selectSubList(EgovKkuAdmCommunitySubVO vo) throws Exception {
		return (List<EgovMap>) list("communityDAO.selectSubList",vo);
	}	
	
	// 커뮤니티관리 > 커뮤니티선택 > 모임관리 > 소모임선택
	public EgovKkuAdmCommunitySubVO selectSubByIdx(EgovKkuAdmCommunitySubVO vo) throws Exception{
		return (EgovKkuAdmCommunitySubVO) select("communityDAO.selectSubByIdx", vo);
	}
	
	// 커뮤니티관리 > 커뮤니티선택 > 모임관리 > 소모임수정
	public void updateSub(EgovKkuAdmCommunitySubVO vo)throws Exception{
		update("communityDAO.updateSub", vo);
	}
	
	// 커뮤니티관리 > 커뮤니티선택 > 모임관리 > 소모임삭제
	public void deleteSub(EgovKkuAdmCommunitySubVO vo)throws Exception{
		update("communityDAO.deleteSub", vo);
	}
	
	// 커뮤니티관리 > 커뮤니티선택 > 모임관리 > 소모임등록
	public void insertSub(EgovKkuAdmCommunitySubVO vo)throws Exception{
		insert("communityDAO.insertSub", vo);
	}
	*/
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글List
	@SuppressWarnings("unchecked")
	public List<EgovMap> selectBoardList(EgovKkuAdmCommunityBoardVO vo)throws Exception{
		return (List<EgovMap>) list("kkucommunityDAO.selectBoardList",vo);
	}
	// 마이페이지 > 거래내역(판매내역)
	@SuppressWarnings("unchecked")
	public List<EgovMap> selectMyBoardList(EgovKkuAdmCommunityBoardVO vo)throws Exception{
		return (List<EgovMap>) list("kkucommunityDAO.selectMyBoardList",vo);
	}
	// 마이페이지 > 거래내역(찜목록)
	@SuppressWarnings("unchecked")
	public List<EgovMap> selectLikeBoardList(EgovKkuAppUserVO vo)throws Exception{
		return (List<EgovMap>) list("kkucommunityDAO.selectLikeBoardList",vo);
	}
	public int selectBoardListCnt(EgovKkuAdmCommunityBoardVO vo)throws Exception{
		return (int) select("kkucommunityDAO.selectBoardListCnt",vo);
	}
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글선택
	public EgovMap selectBoardByIdx(EgovKkuAdmCommunityBoardVO vo)throws Exception{
		return (EgovMap) select("kkucommunityDAO.selectBoardByIdx", vo);
	}
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글등록
	public void insertBoard(EgovKkuAdmCommunityBoardVO vo)throws Exception{
		insert("kkucommunityDAO.insertBoard", vo);
	}
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글수정
	public void updateBoard(EgovKkuAdmCommunityBoardVO vo)throws Exception{
		update("kkucommunityDAO.updateBoard", vo);
	}
	
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글삭제
	public void deleteBoard(EgovKkuAdmCommunityBoardVO vo)throws Exception{
		update("kkucommunityDAO.deleteBoard", vo);
	}
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 판매완료
	public void staUpdateBoard(EgovKkuAdmCommunityBoardVO vo)throws Exception{
		insert("kkucommunityDAO.staUpdateBoard", vo);
	}
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 파일 list
	public List<EgovMap> boardFileList(EgovKkuAdmCommunityBoardVO vo)throws Exception{
		return (List<EgovMap>) list("kkucommunityDAO.boardFileList",vo);
	}
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 파일 insert
	public void insertBoardFile(EgovKkuAdmCommunityBoardFileVO vo)throws Exception{
		insert("kkucommunityDAO.insertBoardFile", vo);
	}
	public void deleteBoardFile(EgovKkuAdmCommunityBoardFileVO vo)throws Exception{
		update("kkucommunityDAO.deleteBoardFile",vo);
	}
	public void insertLike(EgovKkuAdmLikeVO vo)throws Exception{
		insert("kkucommunityDAO.insertLike", vo);
	}
	public void deleteLike(EgovKkuAdmLikeVO vo)throws Exception{
		delete("kkucommunityDAO.deleteLike", vo);
	}
	public int selectLike(EgovKkuAdmLikeVO vo)throws Exception{
		return (int) select("kkucommunityDAO.selectLike", vo);
	}
	@SuppressWarnings("unchecked")
	public List<EgovMap> likeList(EgovKkuAdmLikeVO vo)throws Exception{
		return (List<EgovMap>) list("kkucommunityDAO.likeList",vo);
	}
	
	
	/*
	
	
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 파일 delete

	
	// 커뮤니티관리 > 커뮤니티선택 > 회원관리 > 회원list
	public List<EgovMap> userList(EgovKkuAdmCommunityVO vo)throws Exception{
		return (List<EgovMap>) list("communityDAO.userList",vo);
	}
	public int userListCnt(EgovKkuAdmCommunityVO vo)throws Exception{
		return (int) select("communityDAO.userListCnt",vo);
	}
	
	// 커뮤니티관리 > 커뮤니티선택 > 회원관리 > 임원관리list
	public List<EgovMap> leaderList(EgovKkuAdmCommunityVO vo)throws Exception{
		return (List<EgovMap>) list("communityDAO.leaderList",vo);
	}
	
	// 커뮤니티관리 > 경조사관리 list
	public List<EgovMap> eventList(EgovKpcAdmEventVO vo)throws Exception{
		return (List<EgovMap>) list("communityDAO.eventList",vo);
	}
	
	// 커뮤니티관리 > 경조사관리cnt
	public int eventListCnt(EgovKpcAdmEventVO vo)throws Exception{
		return (int) select("communityDAO.eventListCnt",vo);
	}
	
	// 커뮤니티관리 > 경조사관리 insert
	public void insertEvent(EgovKpcAdmEventVO vo) throws Exception{
		insert("communityDAO.insertEvent",vo);
	}
	
	// 커뮤니티관리 > 경조사관리  파일 insert
	public void insertEventFile(EgovKpcAdmEventFileVO vo)throws Exception{
		insert("communityDAO.insertEventFile", vo);
	}
	
	// 커뮤니티관리 > 경조사관리  파일 list
	public List<EgovMap> eventFileList(EgovKpcAdmEventVO vo)throws Exception{
		return (List<EgovMap>) list("communityDAO.eventFileList",vo);
	}
	
	// 커뮤니티관리 > 경조사관리  파일 delete
	public void deleteEventFile(EgovKpcAdmEventFileVO vo)throws Exception{
		update("communityDAO.deleteEventFile",vo);
	}
	
	// 커뮤니티관리 > 경조사관리 select
	public EgovMap selectEvent(EgovKpcAdmEventVO vo) throws Exception{
		return (EgovMap) select("communityDAO.selectEvent",vo);
	}
	
	// 커뮤니티관리 > 경조사관리 update
	public void updateEvent(EgovKpcAdmEventVO vo) throws Exception{
		update("communityDAO.updateEvent",vo);
	}
	
	// 커뮤니티관리 > 경조사관리 delete
	public void deleteEvent(EgovKpcAdmEventVO vo) throws Exception{
		update("communityDAO.deleteEvent",vo);
	}
	
	// 커뮤니티관리 > 경조사관리 > 회원list
	public List<EgovMap> eventUserList(EgovKkuAdmCommunityVO vo)throws Exception{
		return (List<EgovMap>) list("communityDAO.eventUserList",vo);
	}
	public int eventUserListCnt(EgovKkuAdmCommunityVO vo)throws Exception{
		return (int) select("communityDAO.eventUserListCnt",vo);
	}
	
	// 커뮤니티관리 > 경조사관리 > 전체기수
	public List<EgovMap> allSubList()throws Exception{
		return (List<EgovMap>) list("communityDAO.allSubList");
	}
	
	//커뮤니티관리 > 공지사항관리 List
	public List<EgovMap> noticeList(EgovKpcAdmNoticeVO vo)throws Exception{
		return (List<EgovMap>) list("communityDAO.noticeList",vo);
	}
	public int noticeListCnt(EgovKpcAdmNoticeVO vo)throws Exception{
		return (int) select("communityDAO.noticeListCnt",vo);
	}
	
	//커뮤니티관리 > 공지사항관리 > insert
	public void insertNotice(EgovKpcAdmNoticeVO vo)throws Exception{
		insert("communityDAO.insertNotice",vo);
	}
	
	//커뮤니티관리 > 공지사항관리  > file insert
	public void insertNoticeFile(EgovKpcAdmNoticeFileVO vo)throws Exception{
		insert("communityDAO.insertNoticeFile",vo);
	}
	
	//커뮤니티관리 > 공지사항관리  > select
	public EgovMap selectNotice(EgovKpcAdmNoticeVO vo)throws Exception{
		return (EgovMap) select("communityDAO.selectNotice",vo);
	}
	
	//커뮤니티관리 > 공지사항관리 >File List
	public List<EgovMap> noticeFileList(EgovKpcAdmNoticeVO vo)throws Exception{
		return (List<EgovMap>) list("communityDAO.noticeFileList",vo);
	}
	
	// 커뮤니티관리 > 공지사항관리 > update
	public void updateNotice(EgovKpcAdmNoticeVO vo) throws Exception{
		update("communityDAO.updateNotice",vo);
	}	
	
	//  커뮤니티관리 > 공지사항관리 > 파일 delete
	public void deleteNoticeFile(EgovKpcAdmNoticeFileVO vo)throws Exception{
		update("communityDAO.deleteNoticeFile",vo);
	}
	
	// 커뮤니티관리 > 공지사항관리 > delete
	public void deleteNotice(EgovKpcAdmNoticeVO vo) throws Exception{
		update("communityDAO.deleteNotice",vo);
	}
	
	// 지역 목록
	public List<EgovMap> locList()throws Exception{
		return (List<EgovMap>) list("communityDAO.locList");
	}
	
	//엑셀용 리스트
	public List<EgovMap> excelUserList(EgovKkuAdmCommunityVO vo)throws Exception{
		return (List<EgovMap>) list("communityDAO.excelUserList",vo);
	}
	
	// 커뮤니티 임원 정렬
	public void leaderSorting(EgovKkuAdmCommunityLeaderVO vo) throws Exception{
		update("communityDAO.leaderSorting", vo);
	}
	
	*/
	
}