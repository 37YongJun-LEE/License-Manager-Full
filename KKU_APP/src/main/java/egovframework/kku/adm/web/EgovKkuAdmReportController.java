package egovframework.kku.adm.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.cms.com.service.EgovCmsComService;
import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.com.cmm.EgovCmsCommonUtil;
import egovframework.kku.adm.service.EgovKkuAdmLoginSessionVO;
import egovframework.kku.adm.service.EgovKkuAdmReportService;
import egovframework.kku.usr.service.EgovKkuReportVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuAdmReportController {
	
	@Resource(name="adminReportService")
	EgovKkuAdmReportService adminReportService;
	
	@Resource(name="commonService")
	EgovCmsComService commonService;
	
	@RequestMapping(value="/admin/report.do") 
	public String report(@ModelAttribute("vo") EgovKkuReportVO reportVO, Model model) throws Exception {
		
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(reportVO.getPageIndex());
	    reportVO.setPageUnit(15);
	    paginationInfo.setRecordCountPerPage(15); //한페이지당 게시되는 게시물 건수 UserVO.getPageUnit()
        paginationInfo.setPageSize(10); //페이지 리스트에 게시되는 페이지 건수
        
        reportVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        reportVO.setLastIndex(paginationInfo.getLastRecordIndex());
        reportVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
		model.addAttribute("depth01","report");
		
		//휴대폰 번호 앞자리 list
		List<EgovMap> boardCodeList = commonService.getCommCodeList("report_board_code");
		model.addAttribute("boardCodeList", boardCodeList);
		
		
		List<?> reportList = adminReportService.getReportList(reportVO);
		 paginationInfo.setTotalRecordCount(adminReportService.getReportListCnt(reportVO));
		 
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("reportList", reportList);
		
		return "kkuapp/adm/report/report";
	 }
	
	@RequestMapping(value="/admin/reportProcess.do")
	public String reportProcess(EgovKkuReportVO reportVO, Model model) throws Exception {

		model.addAttribute("depth01","report");
		
		String check  = "";
		EgovMap map = adminReportService.selectReportDetail(reportVO);
		if(map.get("reportState").toString().equals("0")){    				
		//처리상태가 0(접수됨) 상태에서만 접수됨 -> 접수완료 상태 변경
			reportVO.setReportState(1);
			int updateCheck = adminReportService.updateReportProcessState(reportVO);
		}
		map = adminReportService.selectReportDetail(reportVO);
		model.addAttribute("map",  map);
		
		return "kkuapp/adm/report/reportProcess"; 
	}
	
	@RequestMapping(value="/admin/reportModifyAction.do")
	@ResponseBody
	public String reportProcessAction(EgovKkuReportVO reportVO, Model model,HttpServletRequest request) throws Exception {
System.err.println("reportProcessAction");
		System.err.println(reportVO.toString());
		EgovKkuAdmLoginSessionVO sessionVO = (EgovKkuAdmLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUserInfo();
		reportVO.setReportProcessperson(sessionVO.getUsrNickname());
		
		reportVO.setModIdx(sessionVO.getUsrIdx());
		reportVO.setModId(sessionVO.getUsrEmail());
		reportVO.setModIp(EgovCmsCommonUtil.getClientIP(request));
		adminReportService.updateReport(reportVO);
		return "Y"; 
	}
	
	@RequestMapping(value="/admin/reportDeleteAction.do")
	@ResponseBody
	public String reportDeleteAction(EgovKkuReportVO reportVO, Model model,HttpServletRequest request) throws Exception {
		System.err.println(reportVO.getReportIdx());
		if(reportVO.getReportIdx() != null){
			adminReportService.deleteReport(reportVO);
			return "Y"; 
		}
		else{
			return "N"; 
		}
		
		
	}
	
}
