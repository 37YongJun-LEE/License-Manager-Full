package egovframework.kku.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import egovframework.kku.usr.service.EgovKkuAppLectureReviewVO;
import egovframework.kku.usr.service.EgovKkuAppTimetableService;
import egovframework.kku.usr.service.EgovKkuAppTimetableVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("timetableService")
public class EgovKkuAppTimetableServiceImpl implements EgovKkuAppTimetableService {

	@Resource(name="timetableDAO")
	public EgovKkuAppTimetableDAO timetableDAO;

	@Override
	public int updateUserTimetable(EgovKkuAppTimetableVO timetableVO) throws Exception {
		return timetableDAO.updateUserTimetable(timetableVO);
	}
	
	@Override
	public int insertUserTimetable(EgovKkuAppTimetableVO timetableVO) throws Exception {
		return timetableDAO.insertUserTimetable(timetableVO);
	}

	@Override
	public List<EgovMap> selectLectureList(EgovKkuAppTimetableVO timetableVO) {
		return timetableDAO.selectLectureList(timetableVO);
	}

	@Override
	public int selectLectureListCnt(EgovKkuAppTimetableVO timetableVO) {
		return timetableDAO.selectLectureListCnt(timetableVO);
	}

	@Override
	public String selectLectureTime(String data) throws Exception {
		return timetableDAO.selecLectureTime(data);
	}

	@Override
	public EgovMap selectLectureInfo(String subnum) throws Exception {
		return timetableDAO.selectLectureInfo(subnum);
	}

	@Override
	public List<EgovMap> selectUsrTimetable(EgovKkuAppTimetableVO timetableVO) throws Exception {
		return timetableDAO.selectUsrTimetable(timetableVO);
	}

	@Override
	public void insertReview(EgovKkuAppLectureReviewVO reviewVO) {
		timetableDAO.insertReview(reviewVO);
		
	}

	@Override
	public int updateReview(EgovKkuAppLectureReviewVO reviewVO) {
		return timetableDAO.updateReview(reviewVO);
	}

	@Override
	public List<EgovMap> selectReview(EgovKkuAppTimetableVO timetableVO) {
		return timetableDAO.selectReview(timetableVO);
	}

	@Override
	public List<EgovMap> selectFile(EgovKkuAppTimetableVO timetableVO) {
		return timetableDAO.selectFile(timetableVO);
	}

	@Override
	public EgovMap selectReviewByIdx(String reviewIdx) {
		return timetableDAO.selectReviewByIdx(reviewIdx);
	}

	@Override
	public void deleteReview(String reviewIdx) {
		timetableDAO.deleteReview(reviewIdx);
	}
	
	@Override
	public int deleteTimeTable(EgovKkuAppTimetableVO timetableVO) {
		return timetableDAO.deleteTimeTable(timetableVO);
	}

	@Override
	public int selectUsrTimetableCnt(EgovKkuAppTimetableVO timetableVO) {
		return timetableDAO.selectUsrTimetableCnt(timetableVO);
	}

	@Override
	public int deleteTimetableSelected(EgovKkuAppTimetableVO timetableVO) {
		return timetableDAO.deleteTimetableSelected(timetableVO);
	}

	@Override
	public int deleteUsrTimetable(EgovKkuAppUserVO userVO) {
		return timetableDAO.deleteUsrTimetable(userVO);
	}

	@Override
	public int decreaseUsrTimetable(EgovKkuAppUserVO userVO) {
		return timetableDAO.decreaseUsrTimetable(userVO);
	}
	
	@Override
	public int setUsrTimetable(EgovKkuAppUserVO userVO) throws Exception {
		return timetableDAO.setUsrTimetable(userVO);
	}

	@Override
	public String getUsrTimetable(String usrIdx) throws Exception {
		return timetableDAO.getUsrTimetable(usrIdx);
	}
}
