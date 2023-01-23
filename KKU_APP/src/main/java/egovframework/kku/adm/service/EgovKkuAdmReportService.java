package egovframework.kku.adm.service;

import java.util.List;

import egovframework.kku.usr.service.EgovKkuReportVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAdmReportService {
	
	public List<?> getReportList(EgovKkuReportVO reportVO) throws Exception;

	public int updateReportProcessState(EgovKkuReportVO reportVO) throws Exception;

	public EgovMap selectReportDetail(EgovKkuReportVO reportVO) throws Exception;

	public int getReportListCnt(EgovKkuReportVO reportVO) throws Exception;

	public void updateReport(EgovKkuReportVO reportVO)  throws Exception;

	public void deleteReport(EgovKkuReportVO reportVO) throws Exception;

}
