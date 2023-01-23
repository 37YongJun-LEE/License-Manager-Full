package egovframework.kku.adm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityService;
import egovframework.kku.adm.service.EgovKkuAdmLikeVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * kpc-ceo-web
 * @author 개발팀 조반석
 * @since 2020.07.24
 * @version 1.0
 * @see
 */
@Service("kkucommunityService")
public class EgovKkuAdmCommunityServiceImpl extends EgovAbstractServiceImpl implements EgovKkuAdmCommunityService{
	
	@Resource(name = "kkucommunityDAO")
	private EgovKkuAdmCommunityDAO kkucommunityDAO;
	/*
	// 커뮤니티관리 > 커뮤니티관리 > List
	@Override
	public List<EgovMap> selectCommunityList() throws Exception {
		return communityDAO.selectCommunityList();
	}
	
	// 커뮤니티관리 > 커뮤니티관리 > 커뮤니티선택
	@Override
	public EgovKkuAdmCommunityVO selectCommunityByIdx(EgovKkuAdmCommunityVO vo) throws Exception {
		return communityDAO.selectCommunityByIdx(vo);
	}

	//
	@Override
	public List<EgovMap> selCommunityList() throws Exception {
		return communityDAO.selCommunityList();
	}
	
	// 커뮤니티관리 > 커뮤니티관리 > 커뮤니티수정
	@Override
	public void updateCommunity(EgovKkuAdmCommunityVO vo) throws Exception {
		communityDAO.updateCommunity(vo);
	}

	// 커뮤니티관리 > 커뮤니티관리 > 커뮤니티삭제
	@Override
	public void deleteCommunity(EgovKkuAdmCommunityVO vo) throws Exception {
		communityDAO.deleteCommunity(vo);
	}

	// 커뮤니티관리 > 커뮤니티관리 > 커뮤니티등록
	@Override
	public void insertCommunity(EgovKkuAdmCommunityVO vo) throws Exception {
		communityDAO.insertCommunity(vo);
	}
	
	// 커뮤니티관리 > 커뮤니티선택 > 모임관리 > List
	@Override
	public List<EgovMap> selectSubList(EgovKkuAdmCommunitySubVO vo) throws Exception {
		return communityDAO.selectSubList(vo);
	}
	
	// 커뮤니티관리 > 커뮤니티선택 > 모임관리 > 소모임선택
	@Override
	public EgovKkuAdmCommunitySubVO selectSubByIdx(EgovKkuAdmCommunitySubVO vo) throws Exception {
		return communityDAO.selectSubByIdx(vo);
	}

	// 커뮤니티관리 > 커뮤니티선택 > 모임관리 > 소모임수정
	@Override
	public void updateSub(EgovKkuAdmCommunitySubVO vo) throws Exception {
		communityDAO.updateSub(vo);
	}

	// 커뮤니티관리 > 커뮤니티선택 > 모임관리 > 소모임삭제
	@Override
	public void deleteSub(EgovKkuAdmCommunitySubVO vo) throws Exception {
		communityDAO.deleteSub(vo);
	}

	// 커뮤니티관리 > 커뮤니티선택 > 모임관리 > 소모임등록
	@Override
	public void insertSub(EgovKkuAdmCommunitySubVO vo) throws Exception {
		communityDAO.insertSub(vo);
	}
*/
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글List
	@Override
	public List<EgovMap> selectBoardList(EgovKkuAdmCommunityBoardVO vo) throws Exception {
		return kkucommunityDAO.selectBoardList(vo);
	}
	// 마이페이지 > 거래내역(판매내역)
	@Override
	public List<EgovMap> selectMyBoardList(EgovKkuAdmCommunityBoardVO vo) throws Exception {
		return kkucommunityDAO.selectMyBoardList(vo);
	}
	// 마이페이지 > 거래내역(찜목록)
	@Override
	public List<EgovMap> selectLikeBoardList(EgovKkuAppUserVO vo) throws Exception {
		return kkucommunityDAO.selectLikeBoardList(vo);
	}
	@Override
	public int selectBoardListCnt(EgovKkuAdmCommunityBoardVO vo) throws Exception {
		return  kkucommunityDAO.selectBoardListCnt(vo);
	}

	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글선택
	@Override
	public EgovMap selectBoardByIdx(EgovKkuAdmCommunityBoardVO vo) throws Exception {
		return kkucommunityDAO.selectBoardByIdx(vo);
	}

	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글수정
	@Override
	public void updateBoard(EgovKkuAdmCommunityBoardVO vo) throws Exception {
		kkucommunityDAO.updateBoard(vo);
	}

	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글등록
	@Override
	public void insertBoard(EgovKkuAdmCommunityBoardVO vo) throws Exception {
		kkucommunityDAO.insertBoard(vo);
	}

	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글삭제
	@Override
	public void deleteBoard(EgovKkuAdmCommunityBoardVO vo) throws Exception {
		kkucommunityDAO.deleteBoard(vo);
	}
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 판매완료
	@Override
	public void staUpdateBoard(EgovKkuAdmCommunityBoardVO vo) throws Exception {
		kkucommunityDAO.staUpdateBoard(vo);
	}
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 파일 list
	@Override
	public List<EgovMap> boardFileList(EgovKkuAdmCommunityBoardVO vo) throws Exception {
		return kkucommunityDAO.boardFileList(vo);
	}
	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 파일 업로드
	@Override
	public void insertBoardFile(EgovKkuAdmCommunityBoardFileVO vo) throws Exception {
		kkucommunityDAO.insertBoardFile(vo);
	}
	@Override
	public void deleteBoardFile(EgovKkuAdmCommunityBoardFileVO vo) throws Exception {
		kkucommunityDAO.deleteBoardFile(vo);
	}
	@Override
	public void insertLike(EgovKkuAdmLikeVO vo) throws Exception {
		kkucommunityDAO.insertLike(vo);
	}
	@Override
	public void deleteLike(EgovKkuAdmLikeVO vo) throws Exception {
		kkucommunityDAO.deleteLike(vo);
	}
	@Override
	public int selectLike(EgovKkuAdmLikeVO vo) throws Exception {
		return kkucommunityDAO.selectLike(vo);
	}
	@Override
	public List<EgovMap> likeList(EgovKkuAdmLikeVO vo) throws Exception {
		return kkucommunityDAO.likeList(vo);
	}
	
	
/*
	

	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 파일 delete


	// 커뮤니티관리 > 커뮤니티선택 > 회원관리 > 회원list
	@Override
	public List<EgovMap> userList(EgovKkuAdmCommunityVO vo) throws Exception {
		return communityDAO.userList(vo);
	}

	@Override
	public int userListCnt(EgovKkuAdmCommunityVO vo) throws Exception {
		return communityDAO.userListCnt(vo);
	}

	// 커뮤니티관리 > 커뮤니티선택 > 회원관리 > 임원관리list
	@Override
	public List<EgovMap> leaderList(EgovKkuAdmCommunityVO vo) throws Exception {
		return communityDAO.leaderList(vo);
	}

	// 커뮤니티관리 > 경조사관리 list
	@Override
	public List<EgovMap> eventList(EgovKpcAdmEventVO vo) throws Exception {
		return communityDAO.eventList(vo);
	}

	// 커뮤니티관리 > 경조사관리 list cnt
	@Override
	public int eventListCnt(EgovKpcAdmEventVO vo) throws Exception {
		return communityDAO.eventListCnt(vo);
	}

	// 커뮤니티관리 > 경조사관리 insert	
	@Override
	public void insertEvent(EgovKpcAdmEventVO vo) throws Exception {
		communityDAO.insertEvent(vo);
	}
	
	// 커뮤니티관리 > 경조사관리  파일 insert
	@Override
	public void insertEventFile(EgovKpcAdmEventFileVO vo) throws Exception {
		communityDAO.insertEventFile(vo);
	}
	
	// 커뮤니티관리 > 경조사관리  파일 list
	@Override
	public List<EgovMap> eventFileList(EgovKpcAdmEventVO vo) throws Exception {
		return communityDAO.eventFileList(vo);
	}

	// 커뮤니티관리 > 경조사관리  파일 delete
	@Override
	public void deleteEventFile(EgovKpcAdmEventFileVO vo) throws Exception {
		communityDAO.deleteEventFile(vo);
	}
	
	// 커뮤니티관리 > 경조사관리  select
	@Override
	public EgovMap selectEvent(EgovKpcAdmEventVO vo) throws Exception {
		return communityDAO.selectEvent(vo);
	}

	// 커뮤니티관리 > 경조사관리 list
	@Override
	public void updateEvent(EgovKpcAdmEventVO vo) throws Exception {
		communityDAO.updateEvent(vo);
	}
	
	// 커뮤니티관리 > 경조사관리delete
	@Override
	public void deleteEvent(EgovKpcAdmEventVO vo) throws Exception {
		communityDAO.deleteEvent(vo);
	}

	// 커뮤니티관리 > 경조사관리 > 회원list
	@Override
	public List<EgovMap> eventUserList(EgovKkuAdmCommunityVO vo) throws Exception {
		return communityDAO.eventUserList(vo);
	}

	@Override
	public int eventUserListCnt(EgovKkuAdmCommunityVO vo) throws Exception {
		return communityDAO.eventUserListCnt(vo);
	}

	// 커뮤니티관리 > 경조사관리 > 전체기수
	@Override
	public List<EgovMap> allSubList() throws Exception {
		return communityDAO.allSubList();
	}

	
	//커뮤니티관리 > 공지사항관리 List
	@Override
	public List<EgovMap> noticeList(EgovKpcAdmNoticeVO vo) throws Exception {
		return communityDAO.noticeList(vo);
	}
	@Override
	public int noticeListCnt(EgovKpcAdmNoticeVO vo) throws Exception {
		return communityDAO.noticeListCnt(vo);
	}

	//커뮤니티관리 > 공지사항관리 > insert
	@Override
	public void insertNotice(EgovKpcAdmNoticeVO vo) throws Exception {
		communityDAO.insertNotice(vo);
	}

	//커뮤니티관리 > 공지사항관리  > file insert
	@Override
	public void insertNoticeFile(EgovKpcAdmNoticeFileVO vo) throws Exception {
		communityDAO.insertNoticeFile(vo);
	}

	//커뮤니티관리 > 공지사항관리  > select
	@Override
	public EgovMap selectNotice(EgovKpcAdmNoticeVO vo) throws Exception {
		return communityDAO.selectNotice(vo);
	}
	
	//커뮤니티관리 > 공지사항관리 >File List
	@Override
	public List<EgovMap> noticeFileList(EgovKpcAdmNoticeVO vo) throws Exception {
		return communityDAO.noticeFileList(vo);
	}
	// 커뮤니티관리 > 공지사항관리 > update
	@Override
	public void updateNotice(EgovKpcAdmNoticeVO vo) throws Exception {
		communityDAO.updateNotice(vo);
	}
	
	//  커뮤니티관리 > 공지사항관리 > 파일 delete
	@Override
	public void deleteNoticeFile(EgovKpcAdmNoticeFileVO vo) throws Exception {
		communityDAO.deleteNoticeFile(vo);
	}
	
	// 커뮤니티관리 > 공지사항관리 > delete
	@Override
	public void deleteNotice(EgovKpcAdmNoticeVO vo) throws Exception {
		communityDAO.deleteNotice(vo);
	}

	@Override
	public List<EgovMap> locList() throws Exception {
		return communityDAO.locList();
	}

	//엑셀용 리스트
	@Override
	public List<EgovMap> excelUserList(EgovKkuAdmCommunityVO vo) throws Exception {
		return communityDAO.excelUserList(vo);
	}

	// 커뮤니티 임원 정렬
	@Override
	public void leaderSorting(EgovKkuAdmCommunityLeaderVO vo) throws Exception {
		communityDAO.leaderSorting(vo);
	}
*/
	
}