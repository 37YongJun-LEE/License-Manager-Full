package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppLectureReviewVO;
import egovframework.kku.usr.service.EgovKkuAppTimetableVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("timetableDAO")
public class EgovKkuAppTimetableDAO extends EgovComAbstractDAO {

	public int updateUserTimetable(EgovKkuAppTimetableVO timetableVO) {
		return (int) update("timetableDAO.updateUserTimetable", timetableVO);
	}

	public int insertUserTimetable(EgovKkuAppTimetableVO timetableVO) {
		return (int) update("timetableDAO.insertUserTimetable", timetableVO);
	}
	
	public List<EgovMap> selectLectureList(EgovKkuAppTimetableVO timetableVO) {
		return (List<EgovMap>) list("timetableDAO.selectLectureList", timetableVO);
	}

	public int selectLectureListCnt(EgovKkuAppTimetableVO timetableVO) {
		return (int) select("timetableDAO.selectLectureListCnt", timetableVO);
	}

	public String selecLectureTime(String data) {
		return (String) select("timetableDAO.selectLectureTime", data);
	}

	public EgovMap selectLectureInfo(String subnum) {
		return (EgovMap) select("timetableDAO.selectLectureInfo", subnum);
	}

	public List<EgovMap> selectUsrTimetable(EgovKkuAppTimetableVO timetableVO) {
		return (List<EgovMap>) list("timetableDAO.selectUsrTimetable",timetableVO);
	}

	public void insertReview(EgovKkuAppLectureReviewVO reviewVO) {
		insert("timetableDAO.insertReview", reviewVO);
		
	}

	public int updateReview(EgovKkuAppLectureReviewVO reviewVO) {
		return update("timetableDAO.updateReview", reviewVO);
	}

	public List<EgovMap> selectReview(EgovKkuAppTimetableVO timetableVO) {
		return (List<EgovMap>) list("timetableDAO.selectReview", timetableVO);
	}

	public List<EgovMap> selectFile(EgovKkuAppTimetableVO timetableVO) {
		return (List<EgovMap>) list("timetableDAO.selectFile", timetableVO);
	}

	public EgovMap selectReviewByIdx(String reviewIdx) {
		return (EgovMap) select("timetableDAO.selectReviewByIdx", reviewIdx);
	}

	public void deleteReview(String reviewIdx) {
		update("timetableDAO.deleteReview", reviewIdx);
	}

	public int deleteTimeTable(EgovKkuAppTimetableVO timetableVO) {
		return (int)update("timetableDAO.deleteTimeTable", timetableVO);
	}

	public int selectUsrTimetableCnt(EgovKkuAppTimetableVO timetableVO) {
		return (int) select("timetableDAO.selectUsrTimetableCnt",timetableVO);
	}

	public int deleteTimetableSelected(EgovKkuAppTimetableVO timetableVO) {
		return (int) update("timetableDAO.deleteTimetableSelected",timetableVO);
	}

	public int deleteUsrTimetable(EgovKkuAppUserVO userVO) {
		return (int) update("timetableDAO.deleteUsrTimetable", userVO);
	}

	public int decreaseUsrTimetable(EgovKkuAppUserVO userVO) {
		return (int) update("timetableDAO.decreaseUsrTimetable", userVO);
	}

	public int setUsrTimetable(EgovKkuAppUserVO userVO) {
		return (int) update("timetableDAO.setUsrTimetable", userVO);
	}

	public String getUsrTimetable(String usrIdx) {
		return (String) select("timetableDAO.getUsrTimetable", usrIdx);
	}

}
