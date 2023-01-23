package egovframework.kku.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import egovframework.kku.usr.service.EgovKkuAppLectureReviewVO;
import egovframework.kku.usr.service.EgovKkuAppTimetableService;
import egovframework.kku.usr.service.EgovKkuAppTimetableVO;
import egovframework.kku.usr.service.EgovKkuReportService;
import egovframework.kku.usr.service.EgovKkuReportVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("kkuReportService")
public class EgovKkuReportServiceImpl implements EgovKkuReportService {

	@Resource(name="reportDAO")
	public EgovKkuReportDAO reportDAO;

	@Override
	public void insertReportBoard(EgovKkuReportVO reportVO) {
		reportDAO.insertReportBoard(reportVO);
	}


}
