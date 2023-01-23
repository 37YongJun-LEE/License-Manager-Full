package egovframework.kku.mypage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.mypage.service.EgovKkuAppFriendVO;
import egovframework.kku.mypage.service.EgovKkuAppMypageService;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mypageService")
public class EgovKkuAppMypageServiceImpl extends EgovAbstractServiceImpl implements EgovKkuAppMypageService {

	@Resource(name = "mypageDAO")
	private EgovKkuAppMypageDAO mypageDAO;

	// 최초 사용자 정보 불러오기
	@Override
	public EgovMap selectUserByIdx(EgovKkuAppLoginSessionVO vo) throws Exception {
		return mypageDAO.selectUserByIdx(vo);
	}

	// 마이페이지 > 사용자 프로필 변경
	@Override
	public void updateProfile(EgovKkuAppUserVO vo) throws Exception {
		mypageDAO.updateProfile(vo);
	}
	// 마이페이지 > 비밀번호변경
	@Override
	public int updatePassword(EgovKkuAppUserVO vo) throws Exception {
		return mypageDAO.updatePassword(vo);
	}
	// 마이페이지 > 닉네임변경
	@Override
	public int updateNick(EgovKkuAppUserVO vo) throws Exception {
		return mypageDAO.updateNick(vo);
	}
	// 마이페이지 > 회원 탈퇴
	@Override
	public int withdrawal(EgovKkuAppUserVO vo) throws Exception {
		return mypageDAO.withdrawal(vo);
	}
	// 마이페이지 > 친구목록 불러오기
	@Override
	public List<?> selectFriendList(EgovKkuAppFriendVO vo) throws Exception {
		return mypageDAO.selectFriendList(vo);
	}
	// 마이페이지 > 친구숫자
	@Override
	public List<?> selectFriendCnt(EgovKkuAppLoginSessionVO vo) throws Exception {
		return mypageDAO.selectFriendCnt(vo);
	}
	// 마이페이지 > 즐겨찾기추가
	@Override
	public int updateFav(EgovKkuAppFriendVO vo) throws Exception {
		return mypageDAO.updateFav(vo);
	}
	// 마이페이지 > 친구삭제
	@Override
	public int deleteFrd(EgovKkuAppFriendVO vo) throws Exception {
		return mypageDAO.deleteFrd(vo);
	}
	// 마이페이지 > 친구추가 > 친구 정보가져오기
	@Override
	public List<?> selectFrdByNameAndPhone(EgovKkuAppUserVO vo) throws Exception {
		return mypageDAO.selectFrdByNameAndPhone(vo);
	}
	// 마이페이지 > 친구추가 
	@Override
	public int insertFriend(EgovKkuAppFriendVO vo) throws Exception {
		return mypageDAO.insertFriend(vo);
	}
	// 마이페이지 > 친구 대기 목록
	@Override
	public List<?> waitFriendList(EgovKkuAppFriendVO vo) throws Exception {
		return mypageDAO.waitFriendList(vo);
	}
	// 마이페이지 > 친구 신청 대기 > 친구수락
	@Override
	public int acceptFrd(EgovKkuAppFriendVO vo) throws Exception {
		return mypageDAO.acceptFrd(vo);
	}
	
	@Override
	public List<?> selectmyCommunityList(String usrEmail) {
		return mypageDAO.selectmyCommunityList(usrEmail);
	}

	@Override
	public int selectmyCommunityCnt(String usrEmail) {
		return mypageDAO.selectmyCommunityCnt(usrEmail);
	}
	//친구인지 확인
	@Override
	public String checkFriend(EgovKkuAppFriendVO friendVO) {
		return mypageDAO.checkFriend(friendVO);
	}
}
