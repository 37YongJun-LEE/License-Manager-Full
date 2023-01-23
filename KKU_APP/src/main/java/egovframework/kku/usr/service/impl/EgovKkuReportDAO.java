package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppLectureReviewVO;
import egovframework.kku.usr.service.EgovKkuAppTimetableVO;
import egovframework.kku.usr.service.EgovKkuReportVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("reportDAO")
public class EgovKkuReportDAO extends EgovComAbstractDAO {

	public void insertReportBoard(EgovKkuReportVO reportVO) {
		insert("reportDAO.insertReportBoard", reportVO);
	}



}
