package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.usr.service.EgovKkuAppAlarmVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppReplyVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.kku.usr.service.EgovKkuReportVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("commDAO")
public class EgovKkuAppCommunityDAO extends EgovComAbstractDAO{

	public EgovKkuAppCommunityVO showBoardDetail(EgovKkuAppCommunityVO vo) {
		
		return (EgovKkuAppCommunityVO) select ( "communityDAO.showBoardDetail",vo);
	}

	public List<?> showTopThree(int num) {
		return list( "communityDAO.showTopThree",num);
	}

	public int getLikeNum(EgovKkuAppCommunityVO vo) {
		return (int)select("communityDAO.getLikeNum",vo);
	}

	public int getReplyNum(EgovKkuAppCommunityVO vo) {

		return (int)select("communityDAO.getReplyNum",vo);
	}

	public List<?> showFriendList(EgovKkuAppLoginSessionVO vo) {
		return list( "communityDAO.showFriendList",vo);
	}

	public List<?> getCNTfriendProfile(EgovKkuAppUserVO vo) {
		return list( "communityDAO.getCNTfriendProfile",vo);
	}

	public String replyInsert(EgovKkuAppReplyVO vo) {
		return (String) insert("communityDAO.replyInsert",vo);
	}

	public List<?> getReplyList(EgovKkuAppCommunityVO vo) {
		return list( "communityDAO.getReplyList",vo);
	}

	public String insertAlarm( EgovKkuAppAlarmVO vo) {
		return (String) insert("communityDAO.insertAlarm",vo);
	}

	public List<?> getAlarmList(EgovKkuAppAlarmVO vo) {
		return list( "communityDAO.getAlarmList",vo);
	}

	public int cntAlarm(String usrid) {
		return (int)select("communityDAO.cntAlarm",usrid);
	}

	public int updateReadAll(String usrid) {
		return (int) update("communityDAO.updateReadAll",usrid);
	}

	public int deleteAll(String usrid) {
		return (int) delete("communityDAO.deleteAll",usrid);
	}

	public List<?> getBoardList(String bName) {
		return list( "communityDAO.getBoardList",bName);
	}

	public int cntBoardList(String bName) {
		return (int)select("communityDAO.cntBoardList",bName);
	}

	public void insertBoard(EgovKkuAppCommunityVO vo) {
		 insert("kcommunityDAO.insertBoard",vo);
	}

	public List<?> selectAllHBoardList() {
		return list( "communityDAO.selectAllHBoardList");
	}

	public int updateViewCnt(EgovKkuAppCommunityVO vo) {
		return (int) update("communityDAO.updateViewCnt",vo);
	}

	public int chkLiked(EgovKkuAppCommunityVO vo) {
		return (int)select("communityDAO.chkLiked",vo);
	}

	public String insertLike(EgovKkuAppCommunityVO vo) {
		return (String) insert("communityDAO.insertLike",vo);
	}

	public int updateBoard(EgovKkuAppCommunityVO vo) {
		return (int) update("kcommunityDAO.updateBoard",vo);
	}

	public int selectBoardListCnt(EgovKkuAppCommunityVO vo) {
		return (int) select("kcommunityDAO.selectBoardListCnt",vo);
	}

	public List<EgovMap> selectBoardList(EgovKkuAppCommunityVO vo) {
		return (List<EgovMap>) list("kcommunityDAO.selectBoardList", vo);
	}

	public List<?> selectBoardTopList(EgovKkuAppCommunityVO communityVO) {
		return (List<EgovMap>) list("kcommunityDAO.selectBoardTopList",communityVO);
	}

	public int selectBoardTopListCnt(EgovKkuAppCommunityVO communityVO) {
		return (int) select("kcommunityDAO.selectBoardTopListCnt",communityVO);
	}

	public void boardDelete(EgovKkuAppCommunityVO vo) {
		delete("communityDAO.boardDelete",vo);
		
	}

	public void boardReplyDelete(EgovKkuAppCommunityVO vo) {
		delete("communityDAO.boardReplyDelete",vo);
		
	}

	public void boardLikeDelete(EgovKkuAppCommunityVO vo) {
		delete("communityDAO.boardLikeDelete",vo);
		
	}

	public int boardidxget() {
		return  (int) select("kcommunityDAO.boardidxget");
		
	}

	public List<EgovMap> boardFileList(EgovKkuAppCommunityVO communityVO) {
		return (List<EgovMap>) list("kcommunityDAO.boardFileList",communityVO);
	}

	public void insertBoardFile(EgovKkuAdmCommunityBoardFileVO vo) {
		insert("kcommunityDAO.insertBoardFile", vo);
		
	}

	public void updateBoardDelete(EgovKkuAppCommunityVO communiyVO) {
		update("kcommunityDAO.updateBoardDelete", communiyVO);
	}

	public String insertReplyLike(EgovKkuAppReplyVO vo) {
		return (String) insert("kcommunityDAO.insertReplyLike", vo);
	}

	public int chkReplyLiked(EgovKkuAppReplyVO vo) {
		return (int) select("kcommunityDAO.chkReplyLiked", vo);
	}

	public int setAlarmRead(EgovKkuAppAlarmVO alarmVO) {
		return (int) update("kcommunityDAO.setAlarmRead", alarmVO);
	}

	public String insertReport(EgovKkuReportVO reportVO) {
		return (String) insert("kcommunityDAO.insertReport", reportVO);
	}

}
