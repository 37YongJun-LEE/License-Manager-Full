package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("mypageDAO")
public class EgovKkuAppMypageDAO extends EgovComAbstractDAO{

	// 최초 사용자 정보 불러오기
	public EgovMap selectUserByIdx(EgovKkuAppLoginSessionVO vo) throws Exception {
		return (EgovMap) select("mypageDAO.selectUserByIdx", vo);
	}

	// 마이페이지 > 사용자 프로필 변경
	public void updateProfile(EgovKkuAppUserVO vo)throws Exception{
		update("mypageDAO.updateProfile", vo);
	}
	// 마이페이지 > 비밀번호 변경
	public int updatePassword(EgovKkuAppUserVO vo)throws Exception{
		return update("mypageDAO.updatePassword", vo);
	}
	// 마이페이지 > 닉네임 변경
	public int updateNick(EgovKkuAppUserVO vo)throws Exception{
		return update("mypageDAO.updateNick", vo);
	}
	// 마이페이지 > 회원 탈퇴
	public int withdrawal(EgovKkuAppUserVO vo)throws Exception{
		return update("mypageDAO.withdrawal", vo);
	}
	// 회원탈퇴 후 처리
	public int withdrawBoard(EgovKkuAppUserVO userVO) {
		return update("mypageDAO.withdrawBoard", userVO);
	}
	public int withdrawFriends(EgovKkuAppUserVO userVO) {
		return update("mypageDAO.withdrawFriends", userVO);
	}
	public int withdrawTimetable(EgovKkuAppUserVO userVO) {
		return update("mypageDAO.withdrawTimetable", userVO);
	}
	public int withdrawTaxi(EgovKkuAppUserVO userVO) {
		return update("mypageDAO.withdrawTaxi", userVO);
	}
	public int withdrawReport(EgovKkuAppUserVO userVO) {
		return update("mypageDAO.withdrawReport", userVO);
	}
	public int withdrawTrade(EgovKkuAppUserVO userVO) {
		return update("mypageDAO.withdrawTrade", userVO);
	}
	public int withdrawLost(EgovKkuAppUserVO userVO) {
		return update("mypageDAO.withdrawLost", userVO);
	}


	// 마이페이지 > 친구목록
	public List<?> selectFriendList(EgovKkuAppFriendVO vo) throws Exception {
		return list("mypageDAO.selectFriendList", vo);
	}
	// 마이페이지 > 친구숫자
	public List<?> selectFriendCnt(EgovKkuAppLoginSessionVO vo)throws Exception{
		return list("mypageDAO.selectFriendCnt", vo);
	}
	// 마이페이지 > 친구 즐겨찾기
	public int updateFav(EgovKkuAppFriendVO vo)throws Exception{
		return update("mypageDAO.updateFav", vo);
	}
	// 마이페이지 > 친구삭제
	public int deleteFrd(EgovKkuAppFriendVO vo) throws Exception {
		return delete("mypageDAO.deleteFrd", vo);
	}
	// 마이페이지 > 친구추가 > 친구 정보가져오기
	public List<?> selectFrdByNameAndPhone(EgovKkuAppUserVO vo) throws Exception {
		return list("mypageDAO.selectFrdByNameAndPhone", vo);
	}
	// 마이페이지 > 친구추가 > 친구 추가 **리턴값 확인 위해 일부로 update 사용
	public int insertFriend(EgovKkuAppFriendVO vo) throws Exception {
		return update("mypageDAO.insertFriend", vo);
	}
	// 마이페이지 > 친구 대기 목록
	public List<?> waitFriendList(EgovKkuAppFriendVO vo) throws Exception {
		return list("mypageDAO.waitFriendList", vo);
	}
	// 마이페이지 > 친구 신청 대기 > 친구수락
	public int acceptFrd(EgovKkuAppFriendVO vo)throws Exception{
		return update("mypageDAO.acceptFrd", vo);
	}
	public List<?> selectmyCommunityList(String usrEmail) {
		return list("mypageDAO.selectmyCommunityList",usrEmail);
	}

	public int selectmyCommunityCnt(String usrEmail) {
		return (int) select("mypageDAO.selectmyCommunityCnt",usrEmail);
	}

	public String checkFriend(EgovKkuAppFriendVO friendVO) {
		return (String) select("mypageDAO.checkFriend",friendVO);
	}

	public List<?> selectFriendStatus(EgovKkuAppFriendVO friendVO) {
		return list("mypageDAO.selectFriendStatus", friendVO);
	}

	public List<EgovMap> selectMyReportListbyUsrIdx(EgovKkuAppUserVO uVO) {
		return (List<EgovMap>)list("mypageDAO.selectMyReportListbyUsrIdx", uVO);
	}
	
}
