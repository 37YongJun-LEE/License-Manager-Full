package egovframework.kku.adm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuReportVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("adminReportDAO")
public class EgovKkuAdmReportDAO extends EgovComAbstractDAO{

	public List<?> getReportList(EgovKkuReportVO reportVO) {
		return list("adminReportDAO.getReportList",reportVO);
	}

	public int updateReportProcessState(EgovKkuReportVO reportVO) {
		return (int) update("adminReportDAO.updateReportProcessState",reportVO);
	}

	public EgovMap selectReportDetail(EgovKkuReportVO reportVO) {
		return (EgovMap) select("adminReportDAO.selectReportDetail",reportVO);
	}

	public int getReportListCnt(EgovKkuReportVO reportVO) {
		return (int) select("adminReportDAO.getReportListCnt",reportVO);
	}

	public void updateReport(EgovKkuReportVO reportVO) {
		update("adminReportDAO.updateReport",reportVO);
		
	}

	public void deleteReport(EgovKkuReportVO reportVO) {
		delete("adminReportDAO.deleteReport",reportVO);
		
	}






}
