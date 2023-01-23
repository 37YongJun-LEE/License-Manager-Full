package egovframework.kku.usr.service;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("timetableService")
public interface EgovKkuAppTimetableService {

	public int updateUserTimetable(EgovKkuAppTimetableVO timetableVO) throws Exception;
	
	public int insertUserTimetable(EgovKkuAppTimetableVO timetableVO) throws Exception;
	
	public List<EgovMap> selectLectureList(EgovKkuAppTimetableVO timetableVO);

	public int selectLectureListCnt(EgovKkuAppTimetableVO timetableVO);

	public String selectLectureTime(String data) throws Exception;

	public EgovMap selectLectureInfo(String subnum) throws Exception;

	public List<EgovMap> selectUsrTimetable(EgovKkuAppTimetableVO timetableVO) throws Exception;

	public void insertReview(EgovKkuAppLectureReviewVO reviewVO);

	public int updateReview(EgovKkuAppLectureReviewVO reviewVO);
	//강의번호는 매학기 바뀌니 X -> 교수명, 과목명으로 리뷰정보 select 해 옴.
	//파일도 같이 가져 옴.
	public List<EgovMap> selectReview(EgovKkuAppTimetableVO timetableVO);

	public List<EgovMap> selectFile(EgovKkuAppTimetableVO timetableVO);

	public EgovMap selectReviewByIdx(String reviewIdx);

	public void deleteReview(String reviewIdx);

	public int deleteTimeTable(EgovKkuAppTimetableVO timetableVO);

	public int selectUsrTimetableCnt(EgovKkuAppTimetableVO timetableVO);

	public int deleteTimetableSelected(EgovKkuAppTimetableVO timetableVO);

	public int deleteUsrTimetable(EgovKkuAppUserVO userVO);

	public int decreaseUsrTimetable(EgovKkuAppUserVO userVO);
	
	public int setUsrTimetable(EgovKkuAppUserVO userVO) throws Exception;

	public String getUsrTimetable(String usrIdx) throws Exception;
	
}
