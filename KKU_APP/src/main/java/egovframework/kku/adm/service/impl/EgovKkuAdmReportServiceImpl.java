package egovframework.kku.adm.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmReportService;
import egovframework.kku.usr.service.EgovKkuReportVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("adminReportService")
public class EgovKkuAdmReportServiceImpl implements EgovKkuAdmReportService{

	@Resource(name="adminReportDAO")
	EgovKkuAdmReportDAO adminReportDAO;

	@Override
	public List<?> getReportList(EgovKkuReportVO reportVO) throws Exception {
		return adminReportDAO.getReportList(reportVO);
	}

	@Override
	public int updateReportProcessState(EgovKkuReportVO reportVO) throws Exception {
		return adminReportDAO.updateReportProcessState(reportVO);
	}

	@Override
	public EgovMap selectReportDetail(EgovKkuReportVO reportVO) {
		return adminReportDAO.selectReportDetail(reportVO);
	}

	@Override
	public int getReportListCnt(EgovKkuReportVO reportVO) throws Exception {
		return adminReportDAO.getReportListCnt(reportVO);
	}

	@Override
	public void updateReport(EgovKkuReportVO reportVO) throws Exception {
		adminReportDAO.updateReport(reportVO);
		
	}

	@Override
	public void deleteReport(EgovKkuReportVO reportVO) throws Exception {
		System.err.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		List<String> list = new ArrayList<String>(Arrays.asList(reportVO.getReportIdx().split(",")));
		for (int i = 0; i < list .size(); i++) { 
			reportVO.setReportIdx(list.get(i).toString());
			adminReportDAO.deleteReport(reportVO);
		}
		
		
	}

	
	

	
	
}
