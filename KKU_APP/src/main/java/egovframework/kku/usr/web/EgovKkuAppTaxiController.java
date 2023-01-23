package egovframework.kku.usr.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.com.cmm.FcmSendPush;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppTaxiAlarmVO;
import egovframework.kku.usr.service.EgovKkuAppTaxiService;
import egovframework.kku.usr.service.EgovKkuAppTaxiVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuAppTaxiController {

	@Resource(name = "taxiService")
	private EgovKkuAppTaxiService taxiService;

	//택시합승
	@RequestMapping(value="/taxi.do")
	public String taxi(@ModelAttribute("taxiVO") EgovKkuAppTaxiVO taxiVO, Model model) throws Exception{
		PaginationInfo paginationInfo = new PaginationInfo();
		taxiVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(taxiVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(taxiVO.getPageUnit());
        paginationInfo.setPageSize(5);
        taxiVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        taxiVO.setLastIndex(paginationInfo.getLastRecordIndex());
        taxiVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
       
        paginationInfo.setTotalRecordCount(taxiService.selectBoardListCnt(taxiVO));
		List<EgovMap> taxiList = taxiService.selectBoardList(taxiVO);
		
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("taxiList", taxiList);
		
		return "kkuapp/web/main/taxi";
	}
	@RequestMapping(value="/taxiView.do")
	public String taxiView(Model model, EgovKkuAppTaxiVO taxiVO) throws Exception{
		
		taxiService.updateViewCnt(taxiVO);
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		
		taxiVO.setUsrIdx(usrIdx);
		EgovMap writerInfo = taxiService.selectUsrInfo(taxiVO);//작성자 정보
		EgovMap taxiInfo = taxiService.selectBoard(taxiVO);//게시물 내용

		List<EgovMap> taxiApplicantList = taxiService.selectApplicantList(taxiVO);//지원자 목록 
		
		ArrayList<String> usrList = new ArrayList<>();
		for(EgovMap map : taxiService.selectApplicantList(taxiVO)){
			if(map.get("applicantUsridx").toString() != null){			
				usrList.add(map.get("applicantUsridx").toString());
			}
		}
		model.addAttribute("usrList", usrList);
		model.addAttribute("usrIdx", usrIdx);
		model.addAttribute("writerInfo",writerInfo);
		model.addAttribute("taxiInfo",taxiInfo);
		model.addAttribute("taxiApplicantList", taxiApplicantList);
		return "kkuapp/web/main/taxiView";
	}
	
	@RequestMapping(value="/taxi_apply.do")
	@ResponseBody
	public String taxiApply(Model model, EgovKkuAppTaxiVO taxiVO) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		String usrNickname = sessionVO.getUsrNickname();
		
		EgovMap taxiInfo = taxiService.selectBoard(taxiVO);
		
		taxiVO.setUsrIdx(usrIdx);
		taxiVO.setUsrNickname(usrNickname);
		int result = 0;
		int members = (int) taxiInfo.get("taxiMembers");
		int applied = (int) taxiInfo.get("taxiApplied");
		if (applied < members) {
			taxiService.updateAppliedCnt(taxiVO);
			result = taxiService.insertApplicant(taxiVO);
			return "success";
		} else return "error";
		
	}
	
	@RequestMapping(value="/taxi_cancle.do")
	@ResponseBody
	public String taxiCancle(Model model, EgovKkuAppTaxiVO taxiVO) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		taxiVO.setUsrIdx(usrIdx);
		
		taxiService.deleteAppliedCnt(taxiVO);
		taxiService.deleteApplicant(taxiVO);
		
		return "success";
	}
	
	@RequestMapping(value="/taxi_close.do")
	@ResponseBody
	public String taxiClose(Model model, EgovKkuAppTaxiVO taxiVO) throws Exception{
		
		int result = 0;
		result = taxiService.changeState(taxiVO);
		if (result==0) {
			return "error";
		} else return "success";
	}
	
	@RequestMapping(value="/taxiWrite.do")
	public String taxiWrite(Model model) throws Exception{
		return "kkuapp/web/main/taxiWrite";
	}
	
	@RequestMapping(value="/taxiWrite_submit.do")
	@ResponseBody
	public String taxiWriteSubmit(HttpServletRequest request, Model model, EgovKkuAppTaxiVO taxiVO) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		String usrNickname = sessionVO.getUsrNickname();

		String departurePlace = request.getParameter("departurePlace");
		String arrivalPlace = request.getParameter("arrivalPlace");
		String departureTime = request.getParameter("departureTime");
		String members = request.getParameter("members");
		String gender = request.getParameter("gender");
		String myGender = request.getParameter("myGender");
		String taxiRequest = request.getParameter("taxiRequest");
		
		
		taxiVO.setTaxiWriteridx(Integer.parseInt(usrIdx));
		taxiVO.setTaxiWriter(usrNickname);
		taxiVO.setTaxiDepartureplace(departurePlace);
		taxiVO.setTaxiArrivalplace(arrivalPlace);
		taxiVO.setTaxiDeparturetime(departureTime);
		taxiVO.setTaxiMembers(members);
		taxiVO.setTaxiGender(gender);
		taxiVO.setTaxiWritergender(myGender);
		taxiVO.setTaxiRequest(taxiRequest);
		
		taxiService.insertBoard(taxiVO);
	
		String content = taxiVO.getTaxiDepartureplace() + " " + taxiVO.getTaxiArrivalplace() + "로 가는 글이 등록되었습니다.";
		FcmSendPush fcmPush = new FcmSendPush();
		ArrayList<String> android = new ArrayList<>();
		ArrayList<String> ios = new ArrayList<>();
		ArrayList<String> registration_ids = new ArrayList<>();
		if(taxiService.taxipushAlarmList(taxiVO) != null){
		for(EgovMap map : taxiService.taxipushAlarmList(taxiVO)){
			if(map.get("os").toString().equals("android")){    				
				android.add(map.get("registrationId").toString());
			}else{
				ios.add(map.get("registrationId").toString());
			}
		}
	
		for(int i=0; i<android.size(); i++){
			registration_ids.add(android.get(i));
			if(i%1000 == 999){
				FcmSendPush.multiPushFCM(registration_ids, "택시알람", content, "/taxi.do");
				registration_ids.clear();
			}
		}
		if(!registration_ids.isEmpty()){
			FcmSendPush.multiPushFCM(registration_ids, "택시알람", content, "/taxi.do");
			registration_ids.clear();
		}
	
		
		for(int i=0; i<ios.size(); i++){
			registration_ids.add(ios.get(i));
			if(i%1000 == 999){
				FcmSendPush.IOSMultiPushFCM(registration_ids, "택시알람", content, "/taxi.do");		
				registration_ids.clear();
			}
		}
		if(!registration_ids.isEmpty() ){
			FcmSendPush.IOSMultiPushFCM(registration_ids, "택시알람", content, "/taxi.do");
		}


		
		
		return Integer.toString(1);
		}
		return Integer.toString(0);
	}
	
	
	@RequestMapping(value="/taxiAlarm.do")
	public String taxiAlarm(Model model, EgovKkuAppTaxiAlarmVO alarmVO) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		alarmVO.setUsrIdx(sessionVO.getUsrIdx());
		//select
		model.addAttribute("alarmList", taxiService.selectAlarmList(alarmVO));
		
		return "kkuapp/web/main/taxiAlarm";
	}	
	
	
	@RequestMapping(value="/taxiAlarmAjax.do")
	@ResponseBody
	public String taxiAlarmAjax(HttpServletRequest request, Model model, EgovKkuAppTaxiAlarmVO alarmVO) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		alarmVO.setUsrIdx(sessionVO.getUsrIdx());
		//insert
		taxiService.insertAlarm(alarmVO);
		return 1+"";
	}		
	
	@RequestMapping(value="/taxiAlarmDelete.do")
	@ResponseBody
	public String taxiAlarmDelete(HttpServletRequest request, Model model, EgovKkuAppTaxiAlarmVO alarmVO) throws Exception{
		
		taxiService.deleteTaxiAlarm(alarmVO);
		return 1+"";
	}			
	
}
