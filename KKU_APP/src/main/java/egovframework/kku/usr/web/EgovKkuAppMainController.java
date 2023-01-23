package egovframework.kku.usr.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialArray;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.util.WebUtils;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.cms.com.util.HttpPostMultipart;
import egovframework.cms.com.util.NaverShortUrlUtils;
import egovframework.cms.com.util.PmsComCodeVO;
import egovframework.cms.com.util.PmsComService;
import egovframework.com.cmm.EgovCmsFileUtil;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.utl.jsoup.EgovKkuAppSchoolInfoJsoupCrawler;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityService;
import egovframework.kku.usr.service.DormVO;
import egovframework.kku.usr.service.EgovKkuAppAlarmVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityService;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuAppFacilityVO;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppMypageService;
import egovframework.kku.usr.service.EgovKkuAppReplyVO;
import egovframework.kku.usr.service.EgovKkuAppTaxiService;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.kku.usr.service.EgovKkuLostService;
import egovframework.kku.usr.service.EgovKkuLostVO;
import egovframework.kku.utl.selenium.EgovKkuAppLibSeleniumDriver;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuAppMainController {

	@Resource(name="kkuUserService")
	private EgovKkuAppUserService kkuUserService;
	
	@Resource(name="commService")
	private EgovKkuAppCommunityService communityService;
	
	@Resource(name = "pmsComService")
	private PmsComService pmsComService; 
	
	@Resource(name = "mypageService")
	private EgovKkuAppMypageService mypageService;

	@Resource(name = "lostService")
	private EgovKkuLostService lostService;
	
	@Resource(name="commService")								
	private EgovKkuAppCommunityService commService;
	
	@Resource(name = "kkucommunityService")
	private EgovKkuAdmCommunityService kkucommunityService;
	
	@Resource(name = "taxiService")
	private EgovKkuAppTaxiService taxiService;
	
	@RequestMapping(value="/policy.do")
	public String policy() throws Exception{
		return "kkuapp/web/main/policy";
	}
	
	@RequestMapping(value="/main.do")
	public String Main(EgovKkuAppUserVO loginVO, 
    		HttpServletResponse response, Model model,HttpServletRequest request, ModelMap mMAp, HttpSession session) throws Exception{
		System.err.println("MAIN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	
		//EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO)mMAp.get("sessionVO");
		//EgovCmsUserDetailsHelper.getAuthenticatedUser();
		System.err.println("---------------------webUtils------------------------------------");
		System.err.println(WebUtils.getSessionAttribute(request, "loginVO"));
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) WebUtils.getSessionAttribute(request,"loginVO");
		
		
		System.err.println("@!#!@#!@#!#@!#@!#!@#@!#@!#!@#@#@!#@!#");
		request.getSession().setAttribute(session.getId(),sessionVO);
		System.err.println(request.getParameterNames().toString());
		System.err.println(sessionVO);
		System.err.println(loginVO);
		request.getSession().setAttribute("loginVO", sessionVO);
		System.err.println(request.getSession().getAttribute("loginVO"));
		System.err.println("@!#!@#!@#!#@!#@!#!@#@!#@!#!@#@#@!#@!#");
		
		int cnt = 3;
		
			
		List<?> list = communityService.showTopThree(cnt);
		
		EgovKkuAppFriendVO friendVO = new EgovKkuAppFriendVO();
		//sessionVO.getUsrIdx()
		if(WebUtils.getSessionAttribute(request, "loginVO") != null){
			System.err.println("session NOTTTTTTTTTT NUllllllll");
			friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
			List<?> friendList = (List<?>) mypageService.selectFriendStatus(friendVO);
			/*model.addAttribute("friendList", friendList);	*/	
			
			model.addAttribute("boardList", list);
			model.addAttribute("friendList", friendList);
			
			System.err.println("main 리턴하ㅣㄺ[염ㄴ라피;ㅇㄴ허ㅑㅐ");
			WebUtils.setSessionAttribute(request, "loginVO",WebUtils.getSessionAttribute(request, "loginVO"));
			return "kkuapp/web/main/main";
		}
		else{
			System.err.println("session 없음 --> login 페이지로!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			return "redirect:/member/login.do";
		}
		
		
		//ModelAndView modelAndView = new ModelAndView("redirect:/main.do");
		//return modelAndView;
		//throw new ModelAndViewDefiningException(modelAndView);
	}
	

	@RequestMapping(value="/friendView.do")
	public String FriendView(Model model,EgovKkuAppUserVO uservo ,HttpServletRequest request ) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		//친구화면에서의 게시물 작성수, 판매내역 수, 친구 수 불러오기 
		List<?> friendCNt = communityService.getCNTfriendProfile(uservo);
		
		//내 친구의 usrID가 들어감 
		String usrID = uservo.getUsrEmail();

		//내 친구의 정보 불러오기 
		EgovMap usrInfo =  kkuUserService.selectUser(uservo);
		int boardCnt = mypageService.selectmyCommunityCnt(usrInfo.get("usrEmail").toString());
		
		EgovKkuAppFriendVO fVO = new EgovKkuAppFriendVO();
		fVO.setFriendMyid(sessionVO.getUsrEmail());
		fVO.setFriendFid(usrInfo.get("usrEmail").toString());
		String friendStatus =  kkuUserService.selectFriendStatus(fVO);
		
		model.addAttribute("myIdx", sessionVO.getUsrIdx());
		model.addAttribute("friendStatus", friendStatus);
		model.addAttribute("boardCnt", boardCnt);
		model.addAttribute("friendCNt", friendCNt);
		model.addAttribute("usrInfo", usrInfo);
		return "kkuapp/web/main/friendView";
	}
	
	@RequestMapping(value="/alarmList.do")
	public String alarmList(Model model) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		EgovKkuAppAlarmVO alarmVO = new EgovKkuAppAlarmVO();
		alarmVO.setAlarmReceiverid(sessionVO.getUsrEmail());
		List<?> alarmList = communityService.getAlarmList(alarmVO);
		model.addAttribute("alarmList", alarmList);
		return "kkuapp/web/main/alarmList";
	}

	@RequestMapping(value="/alarm_edit.do")
	public String alarmEdit() throws Exception{
		return "kkuapp/web/main/alarmEdit";
	}
	
	@RequestMapping(value="/alarmRead.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String alarmRead(EgovKkuAppAlarmVO alarmVO) throws Exception{
		int num = communityService.setAlarmRead(alarmVO);
		String msg = "";
		if(num == 1 ){
			msg= "success";
		}
		else{
			msg = "fail";
		}
		return msg;
	}
	
	@RequestMapping(value="/alarmReadDelete.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String alarmReadDelete(String Type) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String msg = "";
		if(Type.equals("delete") ){
			communityService.deleteAll(sessionVO.getUsrEmail());
			msg = "deleted";
			
		}
		else if(Type.equals("read") ){
			msg = "read";
			
		}
		return msg;
	}
	
	@RequestMapping(value="/campusReport.do")
	public String campusReport(Model model) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		EgovKkuAppFacilityVO facVO = new EgovKkuAppFacilityVO();
		facVO.setReporterId(sessionVO.getUsrEmail());
		List<?> fixList = kkuUserService.selectFacilityFix(facVO);
		model.addAttribute("fixList", fixList);
		return "kkuapp/web/main/campusReport";
	}
	@RequestMapping(value="/campusReportAction.do")
	@ResponseBody
	public String campusReportAction(EgovKkuAppFacilityVO vo) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
	
		//해당 유저 디바이스 정보(전화번호) 가져오기
		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		userVO.setUsrEmail(sessionVO.getUsrEmail());
		EgovMap map = kkuUserService.selectUserDevice(userVO);
		vo.setReporterPnum(map.get("phoneNumber").toString()); //신고 접수한 사람 전화번호
		vo.setReporterId(sessionVO.getUsrEmail());  // 신고 접수한 사람 아이디

		kkuUserService.insertReport(vo); //insert 성공시

			//String originalURL = "http://kkuapp.pms.or.kr:8083/campusReportList.do";
			String originalURL = "https://kuapp.smartcampus.life/reportView.do?reportIdx=" + vo.getReportIdx();
			String tranMsg = "[슬대 불편신고 접수]";

			NaverShortUrlUtils shortUtils = new NaverShortUrlUtils();
			JSONParser paser = new JSONParser();
			JSONObject obj = (JSONObject) paser.parse(shortUtils.returl(originalURL));
			JSONObject jobj =  (JSONObject) obj.get("result");
			
			tranMsg += jobj.get("url");
			//문자 발송 내역 log
			// uri

			
			PmsComCodeVO pmscomcodeVO1 = new PmsComCodeVO();
			pmscomcodeVO1.setTran_callback("0438525011"); // 보내는사람
			pmscomcodeVO1.setTran_phone("01030878788"); // 받는사람 01030878788
			pmscomcodeVO1.setTran_msg(tranMsg); // 메세지
			pmscomcodeVO1.setTran_etc1("1"); // 구분자 맴버idx
			pmscomcodeVO1.setTran_id(EgovProperties.getProperty("Globals.SMSId")); // 사이트
			
			kkuUserService.insertSms(pmscomcodeVO1);													// uri
			pmsComService.insertSms(pmscomcodeVO1);

		
		return "1";
	}
	@RequestMapping(value="/campusReportList.do")
	public String campusReportList(Model model) throws Exception {
		List<?> boardList = kkuUserService.showReportList();
		model.addAttribute("boardList", boardList);
		return "kkuapp/web/main/campusReportList";
	}
	@RequestMapping(value="/reportView.do") //시설신고 상세페이지 
	public String campusReportView(EgovKkuAppFacilityVO facVO,Model model) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		if(sessionVO == null){
			model.addAttribute("usrLogincheck", "0");
		}
		else if(sessionVO != null){
			model.addAttribute("usrLogincheck", "1");
			String usrEmail = sessionVO.getUsrEmail();
			model.addAttribute("usrEmail", usrEmail);
			
		}
		

		
		List<?> boardList = kkuUserService.showReportListDetail(facVO);
		int processStateCheck = kkuUserService.getProcessState(facVO);
		if(processStateCheck == 0){
			facVO.setProcessState(1);
			int process = kkuUserService.updateFacilityProcess(facVO);
		}
		model.addAttribute("boardList", boardList);
		return "kkuapp/web/main/report_view";
	}
	@RequestMapping(value="/facilityLoginAction.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String facilityLoginAction(String loginName, HttpServletRequest request) throws Exception{
		int chkFacLogin = kkuUserService.facLoginCheck(loginName);
		String msg = "";
		if(chkFacLogin == 1){
			msg = "success";
			EgovKkuAppLoginSessionVO sessionVO = new EgovKkuAppLoginSessionVO();
			sessionVO.setUsrEmail(loginName);
			request.getSession().setAttribute("loginVO", sessionVO);
		}
		else{
			msg = "fail";
		}
		return msg;
	}
	@RequestMapping(value="/reportStatusUpdate.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String reportStatusUpdate(EgovKkuAppFacilityVO facVO,Model model) throws Exception{
		facVO.setReadYn(1);
		int cnt = kkuUserService.updateFacilityProcess(facVO);
		if(cnt == 1){
			return "success";
		}
		else{
			return "";
		}
	}
	
	//시설관리팀 코멘트 
	@RequestMapping(value="/reportFixCommentAction.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String reportFixCommentAction(EgovKkuAppFacilityVO facVO) throws Exception{
		int updateResult = kkuUserService.updateFacilityFixComment(facVO);
		String msg = "";
		if(updateResult == 1){
			msg = "success";
		}
		else {
			msg= "fail";
		}
		return msg;
	}
	
	//시설관리팀 코멘트 삭제
		@RequestMapping(value="/reportFixCommentDeleteAction.do",produces = "application/text; charset=utf8")
		@ResponseBody
		public String reportFixCommentModifyAction(EgovKkuAppFacilityVO facVO) throws Exception{
			int updateResult = kkuUserService.updateFacilityFixComment(facVO);
			String msg = "";
			if(updateResult == 1){
				msg = "success";
			}
			else {
				msg= "fail";
			}
			return msg;
		}
		
	@RequestMapping(value="/librarySeat.do")
	public String libSeat() throws Exception{
		
		return "kkuapp/web/main/libraryLogin";
	}
	
	@RequestMapping(value="/librarySeatAction.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String libSeatAction(Model model, HttpServletRequest request, EgovKkuAppUserVO userVO) throws Exception{
		String url = "https://lib.kku.ac.kr/#/";
		String id = request.getParameter("kkuId");
		String pwd = request.getParameter("kkuPwd");
		EgovKkuAppLibSeleniumDriver webdriver = new EgovKkuAppLibSeleniumDriver();
		String timetable = webdriver.useDriver(url, id, pwd);
		timetable.replace("사용안함", " ");
		List<String> dataList = Arrays.asList(timetable.split("\n"));

		if(dataList.toString().contains("좌석수")){
			return timetable;
		}
		else{
			return "fail";
		}
	
	}
	@RequestMapping(value="/seatView.do")
	public String libSeatView(String url, Model model) throws Exception{
		model.addAttribute("Url", url);
		return "kkuapp/web/main/seatView";
	}
	@RequestMapping(value="/searchResult.do")
	public String searchResult(String searchVal) throws Exception{
		return "kkuapp/web/main/searchResult";
	}
	
	//분실물
	@RequestMapping(value="/lostAll.do")
	public String lostAll(@ModelAttribute("lostVO") EgovKkuLostVO lostVO, Model model) throws Exception{
		
		Map<String,String> onOff = new HashMap<String,String>();
/*		onOff.clear();*/
		onOff.put("lost", "on");
		onOff.put("find", "off");
		model.addAttribute("onOff", onOff);		
		
		//페이지네이션
		PaginationInfo paginationInfo = new PaginationInfo();
		lostVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(lostVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(lostVO.getPageUnit());
        paginationInfo.setPageSize(5);
        lostVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        lostVO.setLastIndex(paginationInfo.getLastRecordIndex());
        lostVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		List<EgovMap> lostList = lostService.selectLostList(lostVO);
		
		model.addAttribute("lostList", lostList);
		
		return "kkuapp/web/main/lostAndFound";
	}
	
	@RequestMapping(value="/lost.do")
	public String lost(@ModelAttribute("lostVO") EgovKkuLostVO lostVO, Model model) throws Exception{
		
		Map<String,String> onOff = new HashMap<String,String>();
		onOff.clear();
		onOff.put("lost", "on");
		onOff.put("find", "off");
		model.addAttribute("onOff", onOff);		
		
		//페이지네이션
		PaginationInfo paginationInfo = new PaginationInfo();
		lostVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(lostVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(lostVO.getPageUnit());
        paginationInfo.setPageSize(5);
        lostVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        lostVO.setLastIndex(paginationInfo.getLastRecordIndex());
        lostVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		lostVO.setLostSelecter("분실물 찾아가세요");
		List<EgovMap> lostList = lostService.selectLostList(lostVO);
		
		model.addAttribute("lostList", lostList);
		
		return "kkuapp/web/main/lostAndFound";
	}

	@RequestMapping(value="/find.do")
	public String find(@ModelAttribute("lostVO") EgovKkuLostVO lostVO, Model model) throws Exception{
		
		Map<String,String> onOff = new HashMap<String,String>();
		onOff.clear();
		onOff.put("lost", "off");
		onOff.put("find", "on");
		model.addAttribute("onOff", onOff);		
		
		//페이지네이션
		PaginationInfo paginationInfo = new PaginationInfo();
		lostVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(lostVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(lostVO.getPageUnit());
        paginationInfo.setPageSize(5);
        lostVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        lostVO.setLastIndex(paginationInfo.getLastRecordIndex());
        lostVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		lostVO.setLostSelecter("분실물 찾습니다");
		List<EgovMap> lostList = lostService.selectLostList(lostVO);
		
		model.addAttribute("lostList", lostList);
		
		return "kkuapp/web/main/lostAndFound";		
	}	

	
	@RequestMapping(value="/lostView.do")
	public String tradeInfo(@ModelAttribute("lostVO") EgovKkuLostVO lostVO, 
			              ModelMap model, HttpServletRequest request) throws Exception {
		
		//세션 정보
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();

		model.addAttribute("usrIdx", sessionVO.getUsrIdx());
		model.addAttribute("usrEmail",  sessionVO.getUsrEmail());
		//lost
		model.addAttribute("lostInfo", lostService.selectLostByIdx(lostVO));
		model.addAttribute("fileList", lostService.lostFileList(lostVO));
		
		EgovKkuAppCommunityVO Communityvo = new EgovKkuAppCommunityVO();
		Communityvo.setBoardIdx(Integer.parseInt(lostVO.getLostIdx()));
		Communityvo.setBoardName("Lboard");
		model.addAttribute("replyList", commService.getReplyList(Communityvo));
		model.addAttribute("sessionVO", sessionVO);
		
		return "kkuapp/web/main/lostView";
	}
	
	@RequestMapping(value="/lostWrite.do")
	public String lostWrite(@ModelAttribute("lostVO") EgovKkuLostVO lostVO, Model model, HttpServletRequest request) throws Exception{
		
		if(!lostVO.getLostIdx().equals("")){
			lostVO.setFileTblCode("5");
			model.addAttribute("lostInfo", lostService.selectLostByIdx(lostVO));
			model.addAttribute("fileList", lostService.lostFileList(lostVO));
		}		
		
		return "kkuapp/web/main/lostWrite";
	}	
	
	// 분실물 등록 + 수정
	@RequestMapping(value="/lostProc.do")
    @ResponseBody
	public String lostProc(@ModelAttribute("lostVO") EgovKkuLostVO lostVO,
			  			  MultipartHttpServletRequest mtfRequest,
			  			  ModelMap model, HttpServletRequest request) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();


		lostVO.setLostWriter(sessionVO.getUsrIdx());
    	
    	String folderName = "lost";
 		String convertedFileName = "";
 		
 		//호출 테스트
		
    	// mode에 따라 분기처리
		if(lostVO.getMode().equals("reg")){


			//신규등록
			lostService.insertLost(lostVO);
			
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");

			
			int i = 1;
			// 이미지 업로드
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblIdx(lostVO.getLostIdx());
					fileVO.setFileTblCode(Integer.toString(5));
					fileVO.setFileRegIdx(lostVO.getLostWriter());
					fileVO.setFileRegNick(sessionVO.getUsrNickname());
					if(mf.getContentType().toString().contains("image")){
						fileVO.setBfType("img");
					}else{
						fileVO.setBfType("file");
					}
					fileVO.setFileUsrFile(mf.getOriginalFilename());
					convertedFileName = EgovCmsFileUtil.fileSingleUpload(mf, folderName);
					convertedFileName = EgovCmsFileUtil.fileReSizeUpload(mf, folderName, convertedFileName);
					fileVO.setFileSrvFile(convertedFileName);
					fileVO.setFileUsrFile(fileVO.getFileUsrFile() + "|" + (mf.getSize()/1024) + "KB");
					commService.insertBoardFile(fileVO);
				}
			}
			return 1+"";  // 글 등록완료
			// 글 수정모드
		} else if(lostVO.getMode().equals("mod")){

			
			// 파일 삭제여부
			if(lostVO.getDelArr() != null){	
				for(int i=0; i<lostVO.getDelArr().length; i++){
					if(lostVO.getDelArr()[i].equals("Y")){
						EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
						fileVO.setFileIdx(lostVO.getFileIdxArr()[i]);
						fileVO.setModIdx(lostVO.getLostWriter());
						fileVO.setModName(sessionVO.getUsrNickname());
						
						kkucommunityService.deleteBoardFile(fileVO);
					}
				}
			}
			// 신규파일 업로드
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");
			
			// 이미지 업로드
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblIdx(lostVO.getLostIdx());
					fileVO.setFileRegIdx(lostVO.getLostWriter());
					fileVO.setFileTblCode(Integer.toString(5));
					fileVO.setFileRegNick(sessionVO.getUsrNickname());
					if(mf.getContentType().toString().contains("image")){
						fileVO.setBfType("img");
					}else{
						fileVO.setBfType("file");
					}
					fileVO.setFileUsrFile(mf.getOriginalFilename());
					convertedFileName = EgovCmsFileUtil.fileSingleUpload(mf, folderName);
					convertedFileName = EgovCmsFileUtil.fileReSizeUpload(mf, folderName, convertedFileName);
					fileVO.setFileSrvFile(convertedFileName);
					fileVO.setFileUsrFile(fileVO.getFileUsrFile() + "|" + (mf.getSize()/1024) + "KB");
					commService.insertBoardFile(fileVO);
				}
			}
			
			int checkUpdate = lostService.updateLost(lostVO);
			
			return checkUpdate + ""; // 글 수정완료
			
		} else // 에러 "0" 보내 줌
			return 0+"";
	}
	
	//분실물 댓글
	@RequestMapping(value="/lostReply.do")
	public String lostReply(@ModelAttribute("replyVO") EgovKkuAppReplyVO replyVO, Model model) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		replyVO.setReplyWriter(sessionVO.getUsrEmail());
		replyVO.setBoardDetailname("분실물게시판");
		replyVO.setBoardName("Lboard");
		
		communityService.replyInsert(replyVO);
		
		return "redirect:/lostView.do?lostIdx="+replyVO.getBoardIdx();
	}
	
	// 수정이랑 삭제
	@RequestMapping(value="/lostProc2.do")
	public String lostProc2(@ModelAttribute("lostVO") EgovKkuLostVO lostVO,
			  			  ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();


		if(lostVO.getMode().equals("del")){
			//삭제

			lostService.delLost(lostVO);
			return "redirect:/lostAll.do";
		}else{
			lostService.updateStaLost(lostVO);
			return "redirect:/lostAll.do";
			
		}
	}
	
	@RequestMapping(value="/stay.do")
	public String stay()throws Exception{
		return "kkuapp/web/main/stay";
	}
	
	@RequestMapping(value="/dormitory.do")
	public String dormitoryView(String type,Model model) throws Exception {

		if(type.equals("mo")){

			model.addAttribute("cd", 1);

		}
		else if(type.equals("hae")){
			model.addAttribute("cd", 2);
		}
		return "kkuapp/web/main/dorm";
	}
	
	
	//임시 원룸
	@RequestMapping(value="/tempRoom.do")
	public String tempRoom() throws Exception {
		

		
		return "kkuapp/web/temp/room";
	}	
	
	//임시 원룸
	@RequestMapping(value="/tempRoomView.do")
	public String tempRoomView() throws Exception {
		

		
		return "kkuapp/web/temp/roomView";
	}
	
	//외박신청 조회
	@RequestMapping(value="/dormOutSearch.do")
	public String dormOutSearch(DormVO vo,Model model) throws Exception {
		String makeUrl = "https://dormmgr.kku.ac.kr/KKU/stdModule/stdOutRegSearch.jsp" + "?check="+vo.getCheck()+"&stdNo="+vo.getStdNo()+"&resno="+vo.getResno()+"&DORM_CD="+vo.getDORM_CD();
		URL url = new URL(makeUrl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("ContentType", "application/x-www-form-urlencoded");
		con.setRequestProperty("charset", "euc-kr");
		if (HttpMethod.POST.equals("POST")) {        // 커넥션의 header 밑의 stream을 사용한다. (Get의 경우는 필요가 없다.)        
			con.setDoOutput(true);       
			try (DataOutputStream output = new DataOutputStream(con.getOutputStream())) { 
		      
				output.flush();        }     
			}      // 프로토콜의 반환 코드를 받을 수 있다. (200이면 정상이다.)      
		int code = con.getResponseCode();     
		 try (BufferedReader input = new BufferedReader(new InputStreamReader(con.getInputStream(),"EUC-KR"))) {        
			 String line;       
			 StringBuffer buffer = new StringBuffer();      
			 while ((line = input.readLine()) != null) {          
				 buffer.append(line);        
				 }        
			String Sbuffer = buffer.toString().replaceAll("\\s+","");
	
			EgovKkuAppSchoolInfoJsoupCrawler jcrawler = new EgovKkuAppSchoolInfoJsoupCrawler();
			
			String userName = jcrawler.crawler(makeUrl, "#container > div.page > div.page_header > div > div > strong").toString();
			String OutList = jcrawler.crawler(makeUrl, "#container > div.page > div.post_tbl > div.post_view.react_div").toString();
		
			String isExist;
			if(Sbuffer.contains("관생이존재하지않습니다")){
				isExist = "1";
				model.addAttribute("isExist", isExist);
				model.addAttribute("userName", userName);
			}
			else{
				if(Sbuffer.contains("외박신청목록이존재하지않습니다.")){
					isExist = "0";
					model.addAttribute("isExist", isExist);
					model.addAttribute("noneExist", "외박신청 목록이 존재하지 않습니다.");
					model.addAttribute("vo", vo);
					model.addAttribute("userName", userName);
					model.addAttribute("applicationTable",OutList);
				}
				else{
					isExist = "0";
					model.addAttribute("isExist", isExist);
					model.addAttribute("userName", userName);
					model.addAttribute("applicationTable",OutList);
					
				}
			}
			
			model.addAttribute("vo", vo);
	
			 return "kkuapp/web/main/dormOutSearchList";
			 }    
		  
		
		
	}
	@RequestMapping(value="/dormOut.do")
	public String dormOut(DormVO vo , Model model) throws Exception{
		model.addAttribute("vo", vo);
		 return "kkuapp/web/main/dormOut";
	}
	
	//외박 신청 기능 
	@RequestMapping(value="/dormOutSubmitAction.do"  , produces="application/x-www-form-urlencoded; charset=euc-kr")
	@ResponseBody
	public String dormOutSubmitAction(DormVO vo) throws Exception {
		String response ="";
		try {
		    // Set header
		    Map<String, String> headers = new HashMap<>();
		    headers.put("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36");
		    HttpPostMultipart multipart = new HttpPostMultipart("https://dormmgr.kku.ac.kr/KKU/stdModule/stdOutRegProcess.jsp", "euc-kr", headers);
		    // Add form field
		    multipart.addFormField("stdNo", vo.getStdNo());
		    multipart.addFormField("resno",vo.getResno());
		    multipart.addFormField("DORM_CD", vo.getDORM_CD());
		    multipart.addFormField("crud", vo.getCrud());
		    multipart.addFormField("remk",vo.getRemk() );
		    multipart.addFormField("gubun", vo.getGubun());
		    multipart.addFormField("scStartReceDt",vo.getScStartReceDt());
		    multipart.addFormField("scEndReceDt", vo.getScEndReceDt() );
		    multipart.addFormField("resn", vo.getResn());
		    multipart.addFormField("dataSeq", "");
		    // Add file
		   /* multipart.addFilePart("imgFile", new File("/Users/apple/Desktop/test.png"));*/
		    // Print result
		    response = multipart.finish();

		} catch (Exception e) {
		    e.printStackTrace();
		}
	
		return response;
	}
	
	//외박 신청 취소 기능 
		@RequestMapping(value="/dormOutSubmitCancelAction.do"  , produces="application/x-www-form-urlencoded; charset=euc-kr")
		@ResponseBody
		public String dormOutSubmitCancelAction(DormVO vo) throws Exception {
			String response ="";
			try {
			    // Set header
			    Map<String, String> headers = new HashMap<>();
			    headers.put("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36");
			    HttpPostMultipart multipart = new HttpPostMultipart("https://dormmgr.kku.ac.kr/KKU/stdModule/stdOutRegProcess.jsp", "euc-kr", headers);
			    // Add form field
			    
			    multipart.addFormField("stdNo", vo.getStdNo());
			    multipart.addFormField("resno",vo.getResno());
			    multipart.addFormField("DORM_CD", vo.getDORM_CD());
			    multipart.addFormField("crud", vo.getCrud());
			
			    // Add file
			   /* multipart.addFilePart("imgFile", new File("/Users/apple/Desktop/test.png"));*/
			    // Print result
			    response = multipart.finish();

			} catch (Exception e) {
			    e.printStackTrace();
			}
		
			return response;
		}

		@RequestMapping(value="/appNotice.do")
		public String appNotice(Model model) throws Exception {
			
			return "kkuapp/web/main/appNotice";
		}
		
}
	
