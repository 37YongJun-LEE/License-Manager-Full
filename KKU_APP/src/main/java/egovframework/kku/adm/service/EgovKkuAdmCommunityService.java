package egovframework.kku.adm.service;

import java.util.List;

import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * Kku-ceo-web
 * @author 개발팀 조반석
 * @since 2020.07.24
 * @version 1.0
 * @see
 */
public interface EgovKkuAdmCommunityService {

	// 커뮤니티관리 > 커뮤니티선택 > 소식관리 > 게시글List
	public List<EgovMap> selectBoardList(EgovKkuAdmCommunityBoardVO vo)throws Exception;
	// 마이페이지 > 거래내역(판매내역)
	public List<EgovMap> selectMyBoardList(EgovKkuAdmCommunityBoardVO vo)throws Exception;
	// 마이페이지 > 거래내역(찜목록)
	public List<EgovMap> selectLikeBoardList(EgovKkuAppUserVO vo)throws Exception;
	// 페이지 인덱싱 cnt
	public int selectBoardListCnt(EgovKkuAdmCommunityBoardVO vo)throws Exception;
	// 커뮤니티관리 > 커뮤니티선택 >게시글선택
	public EgovMap selectBoardByIdx(EgovKkuAdmCommunityBoardVO vo)throws Exception;
	// 커뮤니티관리 > 커뮤니티선택 > 게시글수정
	public void updateBoard(EgovKkuAdmCommunityBoardVO vo)throws Exception;
	// 커뮤니티관리 > 커뮤니티선택 > 게시글등록
	public void insertBoard(EgovKkuAdmCommunityBoardVO vo)throws Exception;
	// 커뮤니티관리 > 커뮤니티선택 >  게시글삭제
	public void deleteBoard(EgovKkuAdmCommunityBoardVO vo)throws Exception;
	// 커뮤니티관리 > 커뮤니티선택 >  판매상태업데이트
	public void staUpdateBoard(EgovKkuAdmCommunityBoardVO vo)throws Exception;
	// 커뮤니티관리 > 커뮤니티선택 >  파일 list
	public List<EgovMap> boardFileList(EgovKkuAdmCommunityBoardVO vo)throws Exception;
	// 커뮤니티관리 > 커뮤니티선택 >  파일 업로드
	public void insertBoardFile(EgovKkuAdmCommunityBoardFileVO vo)throws Exception;
	// 커뮤니티관리 > 커뮤니티선택 > 파일 delete
	public void deleteBoardFile(EgovKkuAdmCommunityBoardFileVO vo)throws Exception;
	// 즐겨찾기 추가
	public void insertLike(EgovKkuAdmLikeVO vo)throws Exception;
	// 즐겨찾기 삭제
	public void deleteLike(EgovKkuAdmLikeVO vo)throws Exception;
	// 즐겨찾기 select (자기가 like한건지 test)
	public int selectLike(EgovKkuAdmLikeVO vo)throws Exception;
	// 즐겨찾기 select 배열
	public List<EgovMap> likeList(EgovKkuAdmLikeVO vo)throws Exception;
	
	

}