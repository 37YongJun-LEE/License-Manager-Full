package egovframework.kku.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.usr.service.EgovKkuAppAlarmVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityService;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppReplyVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.kku.usr.service.EgovKkuReportVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("commService")	
public class EgovKkuAppCommunityServiceImpl implements EgovKkuAppCommunityService {

	@Resource(name="commDAO")
	public EgovKkuAppCommunityDAO communityDAO;
	
	@Override
	public EgovKkuAppCommunityVO showBoardDetail(EgovKkuAppCommunityVO vo) {
		return communityDAO.showBoardDetail(vo);
	}
	@Override
	public List<?> showTopThree(int num) throws Exception {
		return communityDAO.showTopThree(num);
	}

	@Override
	public int getReplyNum(EgovKkuAppCommunityVO vo) throws Exception {
		return communityDAO.getReplyNum(vo);
	}

	@Override
	public int getLikeNum(EgovKkuAppCommunityVO vo) throws Exception {
		return communityDAO.getLikeNum(vo);
	}
	
	@Override
	public List<?> showFriendList(EgovKkuAppLoginSessionVO vo) {
		return communityDAO.showFriendList(vo);
	}
	@Override
	public List<?> getCNTfriendProfile(EgovKkuAppUserVO vo) throws Exception {
		return communityDAO.getCNTfriendProfile(vo);
	}
	@Override
	public String replyInsert(EgovKkuAppReplyVO vo) throws Exception {
		return communityDAO.replyInsert(vo);
	}
	@Override
	public List<?> getReplyList(EgovKkuAppCommunityVO vo) throws Exception {
		return communityDAO.getReplyList(vo);
	}
	@Override
	public String insertAlarm(EgovKkuAppAlarmVO vo)throws Exception {
		return communityDAO.insertAlarm(vo);
	}
	@Override
	public List<?> getAlarmList(EgovKkuAppAlarmVO vo) throws Exception {
		return communityDAO.getAlarmList(vo);
	}
	@Override
	public int cntAlarm(String usrid) throws Exception {
		return communityDAO.cntAlarm(usrid);
	}
	@Override
	public int updateReadAll(String usrid) throws Exception {
		return communityDAO.updateReadAll(usrid);
	}
	@Override
	public int deleteAll(String usrid) throws Exception {
		return communityDAO.deleteAll(usrid);
	}
	@Override
	public List<?> getBoardList(String bName) throws Exception {
		return communityDAO.getBoardList(bName);
	}
	@Override
	public int cntBoardList(String bName) throws Exception {
		return communityDAO.cntBoardList(bName);
	}
	@Override
	public void insertBoard(EgovKkuAppCommunityVO vo) throws Exception {
		communityDAO.insertBoard(vo);
	}
	@Override
	public List<?> selectAllHBoardList() throws Exception {
		return communityDAO.selectAllHBoardList();
	}
	@Override
	public int updateViewCnt(EgovKkuAppCommunityVO vo) throws Exception {
		return communityDAO.updateViewCnt(vo);
	}
	@Override
	public int chkLiked(EgovKkuAppCommunityVO vo) throws Exception {
		return communityDAO.chkLiked(vo);
	}
	@Override
	public String insertLike(EgovKkuAppCommunityVO vo) throws Exception {
		return communityDAO.insertLike(vo);
	}
	@Override
	public int updateBoard(EgovKkuAppCommunityVO vo) throws Exception {
		return communityDAO.updateBoard(vo);
	}

	@Override
	public int selectBoardListCnt(EgovKkuAppCommunityVO vo) throws Exception {
		return communityDAO.selectBoardListCnt(vo);
	}
	@Override
	public List<EgovMap> selectBoardList(EgovKkuAppCommunityVO vo) throws Exception {
		return communityDAO.selectBoardList(vo);
	}
	@Override
	public List<?> selectBoardTopList(EgovKkuAppCommunityVO communityVO) throws Exception {
		return communityDAO.selectBoardTopList(communityVO);
	}
	@Override
	public int selectBoardTopListCnt(EgovKkuAppCommunityVO communityVO) throws Exception {
		return communityDAO.selectBoardTopListCnt(communityVO);
	}
	@Override
	public void boardDelete(EgovKkuAppCommunityVO vo) throws Exception {
		communityDAO.boardDelete(vo);
		
	}
	@Override
	public void boardReplyDelete(EgovKkuAppCommunityVO vo) throws Exception {
		communityDAO.boardReplyDelete(vo);
		
	}
	@Override
	public void boardLikeDelete(EgovKkuAppCommunityVO vo) throws Exception {
		communityDAO.boardLikeDelete(vo);
		
	}

	@Override
	public List<EgovMap> boardFileList(EgovKkuAppCommunityVO communityVO) throws Exception {
		return communityDAO.boardFileList(communityVO);
	}
	@Override
	public void insertBoardFile(EgovKkuAdmCommunityBoardFileVO vo) throws Exception {
		communityDAO.insertBoardFile(vo);
		
	}
	@Override
	public void updateBoardDelete(EgovKkuAppCommunityVO communiyVO) {
		communityDAO.updateBoardDelete(communiyVO);
		
	}
	@Override
	public int chkReplyLiked(EgovKkuAppReplyVO vo) throws Exception {
		return communityDAO.chkReplyLiked(vo);
	}
	@Override
	public String insertReplyLike(EgovKkuAppReplyVO vo) throws Exception {
		return communityDAO.insertReplyLike(vo);
	}
	@Override
	public int setAlarmRead(EgovKkuAppAlarmVO alarmVO) throws Exception {
		return communityDAO.setAlarmRead(alarmVO);
	}
	@Override
	public String insertReport(EgovKkuReportVO reportVO) throws Exception {
		return communityDAO.insertReport(reportVO);
	}
	
}
