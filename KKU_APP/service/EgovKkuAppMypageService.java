package egovframework.kku.mypage.service;

import java.util.List;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.adm.service.EgovKkuAdmLikeVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppMypageService {

	// 최초 사용자 정보 불러오기
	public EgovMap selectUserByIdx(EgovKkuAppLoginSessionVO vo) throws Exception;

	// 마이페이지 > 사용자 프로필 변경
	public void updateProfile(EgovKkuAppUserVO vo)throws Exception;
	// 마이페이지 > 비밀번호 변경
	public int updatePassword(EgovKkuAppUserVO vo)throws Exception;
	// 마이페이지 > 닉네임 변경
	public int updateNick(EgovKkuAppUserVO vo)throws Exception;
	// 마이페이지 > 회원 탈퇴
	public int withdrawal(EgovKkuAppUserVO vo)throws Exception;

	// 마이페이지 > 친구 목록
	public List<?> selectFriendList(EgovKkuAppFriendVO vo) throws Exception;
	// 마이페이지 > 친구 숫자
	public List<?> selectFriendCnt(EgovKkuAppLoginSessionVO vo)throws Exception;
	// 마이페이지 > 즐겨찾기 추가 해제
	public int updateFav(EgovKkuAppFriendVO vo)throws Exception;
	// 마이페이지 > 친구삭제
	public int deleteFrd(EgovKkuAppFriendVO vo)throws Exception;
	// 마이페이지 > 친구추가 > 친구 정보가져오기
	public List<?> selectFrdByNameAndPhone(EgovKkuAppUserVO vo) throws Exception;
	// 마이페이지 > 친구추가 
	public int insertFriend(EgovKkuAppFriendVO vo)throws Exception;
	// 마이페이지 > 친구 신청 대기 목록
	public List<?> waitFriendList(EgovKkuAppFriendVO vo) throws Exception;
	// 마이페이지 > 친구 신청 대기 > 친구수락
	public int acceptFrd(EgovKkuAppFriendVO vo)throws Exception;
	// 내 게시글 리스트 
	public List<?> selectmyCommunityList(String usrEmail);

	public int selectmyCommunityCnt(String usrEmail);

	public String checkFriend(EgovKkuAppFriendVO friendVO);
	
	
	
}
