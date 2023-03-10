package egovframework.kku.usr.web;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.com.cmm.EgovCmsFileUtil;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityService;
import egovframework.kku.usr.service.EgovKkuAppCommunityService;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppLectureReviewVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppMypageService;
import egovframework.kku.usr.service.EgovKkuAppTimetableService;
import egovframework.kku.usr.service.EgovKkuAppTimetableVO;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.kku.usr.service.EgovKkuReportService;
import egovframework.kku.usr.service.EgovKkuReportVO;
import egovframework.kku.utl.selenium.EgovKkuAppTimetableSeleniumDriver;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller									
public class EgovKkuAppTimetableController  {

	@Resource(name="timetableService")								
	private EgovKkuAppTimetableService timetableService;
	
	@Resource(name="kkuUserService")
	private EgovKkuAppUserService kkuUserService;
	
	@Resource(name="commService")								
	private EgovKkuAppCommunityService commService;

	@Resource(name = "kkucommunityService")
	private EgovKkuAdmCommunityService kkucommunityService;
	
	@Resource(name = "kkuReportService")
	private EgovKkuReportService reportService;
	
	@Resource(name="mypageService")								
	private EgovKkuAppMypageService mypageService;
	
	//?????????
	@RequestMapping(value="/timetable.do")								
	public String timetable(Model model, EgovKkuAppTimetableVO timetableVO) throws Exception {
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		
		String timetables = timetableService.getUsrTimetable(usrIdx);
		timetableVO.setUsrTimetable(Integer.parseInt(timetables));
		timetableVO.setTimetableUsridx(usrIdx);
		List<EgovMap> usrTimetable = timetableService.selectUsrTimetable(timetableVO);
		
		model.addAttribute("timetable", usrTimetable);
		
		String[] time = {"0900","0930",
				"1000","1030",
				"1100","1130",
				"1200","1230",
				"1300","1330",
				"1400","1430",
				"1500","1530",
				"1600","1630",
				"1700","1730"};

		model.addAttribute("nickname", sessionVO.getUsrNickname());
		model.addAttribute("time",time);
		
		//?????? ??????
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		int semester = 0;
		if(now.getMonthValue()<7) {
			semester = 1;
		} else semester = 2;
		String thisSemester = year+"??? "+semester+"??????";
		
		model.addAttribute("thisSemester",thisSemester);
		
		// ????????????
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("M??? dd??? a hh:mm");
		model.addAttribute("now", sf.format(nowTime));
		
		EgovKkuAppFriendVO friendVO = new EgovKkuAppFriendVO();
		friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
		List<?> friendList = (List<?>) mypageService.selectFriendStatus(friendVO);
		model.addAttribute("friendList", friendList);
		
		return "kkuapp/web/timetable/timetable/timetable";	
	}
	
	//???????????????
	@RequestMapping(value="/friendTimetable.do")								
	public String friendTimetable(Model model, EgovKkuAppTimetableVO timetableVO, EgovKkuAppFriendVO friendVO) throws Exception {

		//?????? ??????
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		int semester = 0;
		if(now.getMonthValue()<7) {
			semester = 1;
		} else semester = 2;
		String thisSemester = year+"??? "+semester+"??????";
		
		model.addAttribute("thisSemester",thisSemester);
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		String friendIdx = timetableVO.getTimetableUsridx();
		friendVO.setFriendFrdIdx(friendIdx);
		friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
		if(!mypageService.checkFriend(friendVO).equals(0)){
			String timetables = timetableService.getUsrTimetable(friendIdx);
			timetableVO.setUsrTimetable(Integer.parseInt(timetables));
			timetableVO.setTimetableUsridx(friendIdx);
			List<EgovMap> usrTimetable = timetableService.selectUsrTimetable(timetableVO);
			
			
			model.addAttribute("timetable", usrTimetable);
			String[] time = {"0900","0930",
					"1000","1030",
					"1100","1130",
					"1200","1230",
					"1300","1330",
					"1400","1430",
					"1500","1530",
					"1600","1630",
					"1700","1730"};
	
			model.addAttribute("usrInfo", kkuUserService.selectUsrInfoByUsrIdx(friendIdx));
			model.addAttribute("time",time);
			
			return "kkuapp/web/timetable/timetable/friendTimetable";	
		}else
			return "";
		
	}
	
	//?????? ?????? ?????? ?????????
	@RequestMapping(value="/customTimetable.do")
	public String customTimetable(Model model, EgovKkuAppTimetableVO timetableVO) throws Exception {
		
		//?????? ????????? ???????????? ????????? ?????? ????????? ????????????
        if(timetableVO.getLectureMajor()!=null){
	        if(timetableVO.getLectureMajor().equals("first")){
	        	EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
	    		EgovMap map = mypageService.selectUserByIdx(sessionVO);
				timetableVO.setSearchMajor(map.get("usrMajor").toString());
	        }
        }
        
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		
		String timetables = timetableService.getUsrTimetable(usrIdx);
		if(!timetables.equals(" ")){
			timetableVO.setUsrTimetable(Integer.parseInt(timetables));
			timetableVO.setTimetableUsridx(usrIdx);
			List<EgovMap> usrTimetable = timetableService.selectUsrTimetable(timetableVO);
			
			model.addAttribute("timetable", usrTimetable);
		}
		
		String[] time = {"0900","0930",
				"1000","1030",
				"1100","1130",
				"1200","1230",
				"1300","1330",
				"1400","1430",
				"1500","1530",
				"1600","1630",
				"1700","1730"};

		model.addAttribute("nickname", sessionVO.getUsrNickname());
		model.addAttribute("time",time);
		
		//?????? ??????
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		int semester = 0;
		if(now.getMonthValue()<7) {
			semester = 1;
		} else semester = 2;
		String thisSemester = year+"??? "+semester+"??????";
		
		model.addAttribute("thisSemester",thisSemester);
		
		//????????????
		PaginationInfo paginationInfo = new PaginationInfo();
		timetableVO.setPageUnit(4); // ????????? ??? ??????
        paginationInfo.setCurrentPageNo(timetableVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(timetableVO.getPageUnit());
        paginationInfo.setPageSize(5);
        timetableVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        timetableVO.setLastIndex(paginationInfo.getLastRecordIndex());
        timetableVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        paginationInfo.setTotalRecordCount(timetableService.selectLectureListCnt(timetableVO));
		List<?> lectureList = timetableService.selectLectureList(timetableVO);
		

        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("lectureList", lectureList);
		
    	List<EgovMap> resultList = (List<EgovMap>) kkuUserService.findOptionDetailAll();
    	model.addAttribute("resultList", resultList);
    	model.addAttribute("timetableVO", timetableVO);
		
		return "kkuapp/web/timetable/timetable/timetableUserAdd2";
	
	}	
	
	//?????? ?????? ?????????
	@RequestMapping(value="/addTimetable.do")
	public String addTimetable(Model model, EgovKkuAppTimetableVO timetableVO) throws Exception {
		
		//?????? ????????? ???????????? ????????? ?????? ????????? ????????????
        if(timetableVO.getLectureMajor()!=null){
	        if(timetableVO.getLectureMajor().equals("first")){
	        	EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
	    		EgovMap map = mypageService.selectUserByIdx(sessionVO);
				timetableVO.setSearchMajor(map.get("usrMajor").toString());
	        }
        }
        
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		
		String timetables = timetableService.getUsrTimetable(usrIdx);
		if(!timetables.equals(" ")){
			timetableVO.setUsrTimetable(Integer.parseInt(timetables));
			timetableVO.setTimetableUsridx(usrIdx);
			List<EgovMap> usrTimetable = timetableService.selectUsrTimetable(timetableVO);
			
			model.addAttribute("timetable", usrTimetable);
		}
		
		String[] time = {"0900","0930",
				"1000","1030",
				"1100","1130",
				"1200","1230",
				"1300","1330",
				"1400","1430",
				"1500","1530",
				"1600","1630",
				"1700","1730"};

		model.addAttribute("nickname", sessionVO.getUsrNickname());
		model.addAttribute("time",time);
		
		//?????? ??????
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		int semester = 0;
		if(now.getMonthValue()<7) {
			semester = 1;
		} else semester = 2;
		String thisSemester = year+"??? "+semester+"??????";
		
		model.addAttribute("thisSemester",thisSemester);
		
		//????????????
		PaginationInfo paginationInfo = new PaginationInfo();
		timetableVO.setPageUnit(4); // ????????? ??? ??????
        paginationInfo.setCurrentPageNo(timetableVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(timetableVO.getPageUnit());
        paginationInfo.setPageSize(5);
        timetableVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        timetableVO.setLastIndex(paginationInfo.getLastRecordIndex());
        timetableVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        paginationInfo.setTotalRecordCount(timetableService.selectLectureListCnt(timetableVO));
		List<?> lectureList = timetableService.selectLectureList(timetableVO);
		

        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("lectureList", lectureList);
		
    	List<EgovMap> resultList = (List<EgovMap>) kkuUserService.findOptionDetailAll();
    	model.addAttribute("resultList", resultList);
    	model.addAttribute("timetableVO", timetableVO);
		
		
		return "kkuapp/web/timetable/timetable/timetableUserAdd";
	
	}	
	
	//????????????
	@RequestMapping(value="/addTimetable2.do")
	@ResponseBody
	public String addTimetable(HttpServletRequest request, Model model, EgovKkuAppTimetableVO timetableVO, EgovKkuAppUserVO userVO) throws Exception {
		
		//????????? ????????? ????????????
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		String timetables = timetableService.getUsrTimetable(usrIdx);
		List<EgovMap> usrTimetable = new ArrayList<EgovMap>();
		
		timetableVO.setUsrTimetable(Integer.parseInt(timetables));
		timetableVO.setTimetableUsridx(usrIdx);
		usrTimetable = timetableService.selectUsrTimetable(timetableVO);
		
		//?????? ??????
		String subnum = request.getParameter("subnum");
		
		//?????????
		String subname = request.getParameter("subname");
		timetableVO.setTimetableSubname(subname);
		
		//?????? ??????(??????)
		String lectureInfo = timetableService.selectLectureTime(subnum);
		
		int result = 0;
		int comma = lectureInfo.indexOf(",");
		try {
			if (comma != -1) {
				String lectureTime1 = lectureInfo.substring(0,comma);
				String lectureTime2 = lectureInfo.substring(comma);
				
				//lectureTime1
				int dash = lectureTime1.indexOf("-");
				int end = lectureTime1.indexOf("(");
				String startTime = "";
				String endTime = "";
				String lectureRoom = "";
				try {
					lectureRoom = lectureTime1.substring(end+1,lectureTime1.indexOf(")"));
				} catch(Exception e) {
					lectureRoom = "????????? ?????? ??????";
				}
				
				if(end != -1) {
					endTime = lectureTime1.substring(dash+1, end);
				}else {
					endTime = lectureTime1.substring(dash+1);
				}
				String lectureDay = lectureTime1.replaceAll("[^\uAC00-\uD7A30-9a-zA-Z]", "");
				char day = lectureDay.charAt(0);
				
				startTime = lectureTime1.substring(lectureTime1.indexOf(day)+1,dash);

				String setDay = Character.toString(day);
				
				timetableVO.setTimetableSubnum(subnum);
				timetableVO.setTimetableDay(setDay);
				timetableVO.setTimetableStarttime(startTime);
				timetableVO.setTimetableEndtime(endTime);
				timetableVO.setTimetableLectureroom(lectureRoom);
				
				int count = timetableService.selectUsrTimetableCnt(timetableVO);
				
				//lectureTime2
				int dash2 = lectureTime2.indexOf("-");
				int end2 = lectureTime2.indexOf("(");
				String startTime2 = "";
				String endTime2 = "";
				String lectureRoom2 = "";
				try {
					lectureRoom2 = lectureTime2.substring(end2+1,lectureTime2.indexOf(")"));
				} catch(Exception e) {
					lectureRoom2 = "????????? ?????? ??????";
				}
				if(end2 != -1) {
					endTime2 = lectureTime2.substring(dash2+1, end2);
				}else {
					endTime2 = lectureTime2.substring(dash2+1);
				}
				String lectureDay2 = lectureTime2.replaceAll("[^\uAC00-\uD7A30-9a-zA-Z]", "");
				char day2 = lectureDay2.charAt(0);
				
				startTime2 = lectureTime2.substring(lectureTime2.indexOf(day2)+1,dash2);

				String setDay2 = Character.toString(day2);
				
				timetableVO.setTimetableSubnum(subnum);
				timetableVO.setTimetableDay(setDay2);
				timetableVO.setTimetableStarttime(startTime2);
				timetableVO.setTimetableEndtime(endTime2);
				timetableVO.setTimetableLectureroom(lectureRoom2);
				
				int count2 = timetableService.selectUsrTimetableCnt(timetableVO);
				
				//?????? ?????? ??? ????????? ??????
				if(count == 0 && count2 == 0) {
					//lecturetime2
					result += timetableService.insertUserTimetable(timetableVO);
					
					//lecturetime1
					timetableVO.setTimetableDay(setDay);
					timetableVO.setTimetableStarttime(startTime);
					timetableVO.setTimetableEndtime(endTime);
					timetableVO.setTimetableLectureroom(lectureRoom);
					result += timetableService.insertUserTimetable(timetableVO);
				} else {
					return "error";
				}
				
			} else { 
				int dash = lectureInfo.indexOf("-");
				int end = lectureInfo.indexOf("(");
				String startTime = "";
				String endTime = "";
				String lectureRoom = "";
				try {
					lectureRoom = lectureInfo.substring(end+1,lectureInfo.indexOf(")"));
				} catch(Exception e) {
					lectureRoom = "????????? ?????? ??????";
				}
				
				if(end != -1) {
					endTime = lectureInfo.substring(dash+1, end);
				}else {
					endTime = lectureInfo.substring(dash+1);
				}
				String lectureDay = lectureInfo.replaceAll("[^\uAC00-\uD7A30-9a-zA-Z]", "");
				char day = lectureDay.charAt(0);
				
				startTime = lectureInfo.substring(lectureInfo.indexOf(day)+1,dash);

				String setDay = Character.toString(day);
				
				timetableVO.setTimetableSubnum(subnum);
				timetableVO.setTimetableDay(setDay);
				timetableVO.setTimetableStarttime(startTime);
				timetableVO.setTimetableEndtime(endTime);
				timetableVO.setTimetableLectureroom(lectureRoom);
				timetableVO.setTimetableUsridx(usrIdx);
				
				int count = timetableService.selectUsrTimetableCnt(timetableVO);
				
				//?????? ?????? ??? ????????? ??????
				if(count == 0) {
					result += timetableService.insertUserTimetable(timetableVO);
				} else return "error";
				
			}
		} catch(Exception e) {
		}
		
		//????????? ?????? ??????
		userVO.setUsrIdx(usrIdx);
		userVO.setUsrTimeTable(Integer.toString(result));
		timetableService.setUsrTimetable(userVO);
		
		if(result > 0) {
			return "success";
		} else return "error2";
	}

	//?????? ?????? ??? ????????????
	@RequestMapping(value="/preview.do")
	@ResponseBody
	public String preview(HttpServletRequest request, Model model, EgovKkuAppTimetableVO timetableVO, EgovKkuAppUserVO userVO) throws Exception {
		
		//?????? ??????
		String subnum = request.getParameter("subnum");
		
		//?????????
		String subname = request.getParameter("subname");
		timetableVO.setTimetableSubname(subname);
		
		//?????? ??????(??????)
		String lectureInfo = timetableService.selectLectureTime(subnum);
		
		int result = 0;
		int comma = lectureInfo.indexOf(",");
		try {
			if (comma != -1) {
				String lectureTime1 = lectureInfo.substring(0,comma);
				String lectureTime2 = lectureInfo.substring(comma);
				
				//lectureTime1
				int dash = lectureTime1.indexOf("-");
				int end = lectureTime1.indexOf("(");
				String startTime = "";
				String endTime = "";
				String lectureRoom = "";
				try {
					lectureRoom = lectureTime1.substring(end+1,lectureTime1.indexOf(")"));
				} catch(Exception e) {
					lectureRoom = "????????? ?????? ??????";
				}
				
				if(end != -1) {
					endTime = lectureTime1.substring(dash+1, end);
				}else {
					endTime = lectureTime1.substring(dash+1);
				}
				String lectureDay = lectureTime1.replaceAll("[^\uAC00-\uD7A30-9a-zA-Z]", "");
				char day = lectureDay.charAt(0);
				
				startTime = lectureTime1.substring(lectureTime1.indexOf(day)+1,dash);

				String setDay = Character.toString(day);
				
				//lectureTime2
				int dash2 = lectureTime2.indexOf("-");
				int end2 = lectureTime2.indexOf("(");
				String startTime2 = "";
				String endTime2 = "";
				String lectureRoom2 = "";
				try {
					lectureRoom2 = lectureTime2.substring(end2+1,lectureTime2.indexOf(")"));
				} catch(Exception e) {
					lectureRoom2 = "????????? ?????? ??????";
				}
				if(end2 != -1) {
					endTime2 = lectureTime2.substring(dash2+1, end2);
				}else {
					endTime2 = lectureTime2.substring(dash2+1);
				}
				String lectureDay2 = lectureTime2.replaceAll("[^\uAC00-\uD7A30-9a-zA-Z]", "");
				char day2 = lectureDay2.charAt(0);
				
				startTime2 = lectureTime2.substring(lectureTime2.indexOf(day2)+1,dash2);

				String setDay2 = Character.toString(day2);
				
				String id11 = times(startTime,setDay);
				String id12 = times(endTime,setDay);
				
				String id21 = times(startTime2,setDay2);
				String id22 = times(endTime2,setDay2);
				
				String ids = id11+":::"+id12+":::"+id21+":::"+id22;
				
				return ids;
				
			} else { 
				int dash = lectureInfo.indexOf("-");
				int end = lectureInfo.indexOf("(");
				String startTime = "";
				String endTime = "";
				
				if(end != -1) {
					endTime = lectureInfo.substring(dash+1, end);
				}else {
					endTime = lectureInfo.substring(dash+1);
				}
				String lectureDay = lectureInfo.replaceAll("[^\uAC00-\uD7A30-9a-zA-Z]", "");
				char day = lectureDay.charAt(0);
				
				startTime = lectureInfo.substring(lectureInfo.indexOf(day)+1,dash);

				String setDay = Character.toString(day);
				
				String id1 = times(startTime,setDay);
				String id2 = times(endTime,setDay);
				
				String[] idList = {"",""};
				idList[0]=id1;
				idList[1]=id2;
				
				String ids = id1+":::"+id2;
				
				return ids;
			}
		} catch(Exception e) {
		}
		
		return null;
	}
	
	public static String times(String time, String day) {
		
		String td = "";
		
		switch(time) {
		case "0900": td += "1"; break;
		case "0930": td += "2"; break;
		case "1000": td += "3"; break;
		case "1030": td += "4"; break;
		case "1100": td += "5"; break;
		case "1130": td += "6"; break;
		case "1200": td += "7"; break;
		case "1230": td += "8"; break;
		case "1300": td += "9"; break;
		case "1330": td += "10"; break;
		case "1400": td += "11"; break;
		case "1430": td += "12"; break;
		case "1500": td += "13"; break;
		case "1530": td += "14"; break;
		case "1600": td += "15"; break;
		case "1630": td += "16"; break;
		case "1700": td += "17"; break;
		case "1730": td += "18"; break;
		case "1800": td += "19"; break;
		}
		
		switch(day) {
		case "???":
			td += "1";
			break;
		case "???":
			td += "2";
			break;
		case "???":
			td += "3";
			break;
		case "???":
			td += "4";
			break;
		case "???":
			td += "5";
			break;
		}
		
		return td;
	}
	
	//????????? ???????????? ?????????
	@RequestMapping(value="/timetable_create.do")								
	public String timetableCreate(Model model, HttpServletRequest request) throws Exception {
		
		
		return "kkuapp/web/timetable/timetable/timetable_create";
	}
	
	//????????? ?????????
	@RequestMapping(value="/timetable_delete.do")								
	public String timetableDelete(Model model, HttpServletRequest request, EgovKkuAppUserVO userVO) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		
		EgovKkuAppTimetableVO timetableVO = new EgovKkuAppTimetableVO();
		timetableVO.setTimetableUsridx(usrIdx);
		int result = timetableService.deleteTimeTable(timetableVO);
		
		//????????? ?????? ?????????
		userVO.setUsrIdx(usrIdx);
		int result2 =timetableService.deleteUsrTimetable(userVO);
		
		return "redirect:/timetable.do";
	}
	
	//??????????????? ?????? ?????? ??????
	@RequestMapping(value="/timetable_deleteSelected.do")								
	public String timetableDeleteSelected(Model model, HttpServletRequest request, EgovKkuAppUserVO userVO, EgovKkuAppTimetableVO timetableVO) throws Exception {

		String referer = request.getHeader("Referer");

		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		
		timetableVO.setTimetableUsridx(usrIdx);
		int result = timetableService.deleteTimetableSelected(timetableVO);
		
		//????????? ?????? ??????
		userVO.setUsrIdx(usrIdx);
		userVO.setUsrTimeTable(Integer.toString(result));
		int result2 = timetableService.decreaseUsrTimetable(userVO);
		
		return "redirect:"+referer;
	}
		
	//????????? ???????????? ??????
	@RequestMapping(value="/myTimetable.do")
	@ResponseBody
	public String myTimetable(Model model, HttpServletRequest request, EgovKkuAppUserVO userVO,
			EgovKkuAppTimetableVO timetableVO) throws Exception {
		String url = "https://attend.kku.ac.kr/kku/";
		String id = request.getParameter("kkuId");
		String pwd = request.getParameter("kkuPwd");
		
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String usrIdx = sessionVO.getUsrIdx();
		timetableVO.setTimetableUsridx(usrIdx);
		
		EgovKkuAppTimetableSeleniumDriver webdriver = new EgovKkuAppTimetableSeleniumDriver();
		String timetable = webdriver.useDriver(url, id, pwd);
		
		timetable = timetable.replace(" ","");
		timetable = timetable.replace("("," ");
		timetable = timetable.replace(")"," ");
		timetable = timetable.replace("\n","");
		
		List<String> dataList = Arrays.asList(timetable.split(" "));

		int result = 0;
		try {
			for(int i=0; i<dataList.size(); i++) {
				String data = dataList.get(i);
				boolean isNumeric =  data.matches("[+-]?\\d*(\\.\\d+)?");
				if(isNumeric) {
					String lectureInfo = timetableService.selectLectureTime(data);
					int comma = lectureInfo.indexOf(",");
					
					if (comma != -1) {
						String lectureTime1 = lectureInfo.substring(0,comma);
						String lectureTime2 = lectureInfo.substring(comma);
						
						//lectureTime1
						int dash = lectureTime1.indexOf("-");
						int end = lectureTime1.indexOf("(");
						String startTime = "";
						String endTime = "";
						String lectureRoom = "";
						try {
							lectureRoom = lectureTime1.substring(end+1,lectureTime1.indexOf(")"));
						} catch(Exception e) {
							lectureRoom = "????????? ?????? ??????";
						}
						
						if(end != -1) {
							endTime = lectureTime1.substring(dash+1, end);
						}else {
							endTime = lectureTime1.substring(dash+1);
						}
						String lectureDay = lectureTime1.replaceAll("[^\uAC00-\uD7A30-9a-zA-Z]", "");
						char day = lectureDay.charAt(0);
						
						startTime = lectureTime1.substring(lectureTime1.indexOf(day)+1,dash);

						String setDay = Character.toString(day);
						
						timetableVO.setTimetableSubnum(data);
						timetableVO.setTimetableDay(setDay);
						timetableVO.setTimetableStarttime(startTime);
						timetableVO.setTimetableEndtime(endTime);
						timetableVO.setTimetableLectureroom(lectureRoom);
						result += timetableService.insertUserTimetable(timetableVO);
						
						//lectureTime2
						int dash2 = lectureTime2.indexOf("-");
						int end2 = lectureTime2.indexOf("(");
						String startTime2 = "";
						String endTime2 = "";
						String lectureRoom2 = "";
						try {
							lectureRoom2 = lectureTime2.substring(end2+1,lectureTime2.indexOf(")"));
						} catch(Exception e) {
							lectureRoom2 = "????????? ?????? ??????";
						}
						
						if(end2 != -1) {
							endTime2 = lectureTime2.substring(dash2+1, end2);
						}else {
							endTime2 = lectureTime2.substring(dash2+1);
						}
						String lectureDay2 = lectureTime2.replaceAll("[^\uAC00-\uD7A30-9a-zA-Z]", "");
						char day2 = lectureDay2.charAt(0);
						
						startTime2 = lectureTime2.substring(lectureTime2.indexOf(day2)+1,dash2);

						String setDay2 = Character.toString(day2);
						
						timetableVO.setTimetableSubnum(data);
						timetableVO.setTimetableDay(setDay2);
						timetableVO.setTimetableStarttime(startTime2);
						timetableVO.setTimetableEndtime(endTime2);
						timetableVO.setTimetableLectureroom(lectureRoom2);
						result += timetableService.insertUserTimetable(timetableVO);
						
					} else { 
						int dash = lectureInfo.indexOf("-");
						int end = lectureInfo.indexOf("(");
						String startTime = "";
						String endTime = "";
						String lectureRoom = "";
						try {
							lectureRoom = lectureInfo.substring(end+1,lectureInfo.indexOf(")"));
						} catch(Exception e) {
							lectureRoom = "????????? ?????? ??????";
						}
						
						if(end != -1) {
							endTime = lectureInfo.substring(dash+1, end);
						}else {
							endTime = lectureInfo.substring(dash+1);
						}
						String lectureDay = lectureInfo.replaceAll("[^\uAC00-\uD7A30-9a-zA-Z]", "");
						char day = lectureDay.charAt(0);
						
						startTime = lectureInfo.substring(lectureInfo.indexOf(day)+1,dash);

						String setDay = Character.toString(day);
						
						timetableVO.setTimetableSubnum(data);
						timetableVO.setTimetableDay(setDay);
						timetableVO.setTimetableStarttime(startTime);
						timetableVO.setTimetableEndtime(endTime);
						timetableVO.setTimetableLectureroom(lectureRoom);
						result += timetableService.insertUserTimetable(timetableVO);
					}
				} else {
					timetableVO.setTimetableSubname(data);
					
				}
			} 
		} catch(Exception e) {
		}
		
		//????????? ?????? ??????
		userVO.setUsrIdx(usrIdx);
		userVO.setUsrTimeTable(Integer.toString(result));
		timetableService.setUsrTimetable(userVO);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail"; 
		}
		
	}
	
	//????????????
	@RequestMapping(value="/lectureInfo.do")								
	public String lectureInfo(Model model, EgovKkuAppTimetableVO timetableVO) throws Exception {
		
		//?????? ????????? ???????????? ????????? ?????? ????????? ????????????
        if(timetableVO.getLectureMajor()!=null){
	        if(timetableVO.getLectureMajor().equals("first")){
	        	EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
	    		EgovMap map = mypageService.selectUserByIdx(sessionVO);
				timetableVO.setSearchMajor(map.get("usrMajor").toString());
	        }
        }
        
		PaginationInfo paginationInfo = new PaginationInfo();
		timetableVO.setPageUnit(20); // ????????? ??? ??????
        paginationInfo.setCurrentPageNo(timetableVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(timetableVO.getPageUnit());
        paginationInfo.setPageSize(5);
        timetableVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        timetableVO.setLastIndex(paginationInfo.getLastRecordIndex());
        timetableVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        paginationInfo.setTotalRecordCount(timetableService.selectLectureListCnt(timetableVO));
		List<?> lectureList = timetableService.selectLectureList(timetableVO);

        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("lectureList", lectureList);
		
    	List<EgovMap> resultList = (List<EgovMap>) kkuUserService.findOptionDetailAll();
    	model.addAttribute("resultList", resultList);
    	model.addAttribute("timetableVO", timetableVO);

    	
		return "kkuapp/web/timetable/lectureInfo/lectureInfo";							
	}
	
	//???????????? ???????????????
	@RequestMapping(value="/lectureInfo_view.do")
	public String lectureInfoView(Model model, EgovKkuAppTimetableVO timetableVO) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		String subnum = timetableVO.getLectureSubnum();

		EgovMap lectureInfo = timetableService.selectLectureInfo(subnum);
		
		//????????????, ????????? ?????????
		String lectureTP = (String) lectureInfo.get("lectureTime");
		String lectureTime = "";
		String lecturePlace = "";
		//??????
		int comma = lectureTP.indexOf(",");
		if(comma != -1) {
			try {
				lectureTime = lectureTP.substring(0,lectureTP.indexOf("("));
				lectureTime += lectureTP.substring(comma,lectureTP.lastIndexOf("("));
			} catch(Exception e) {
				lectureTime = "???????????? ?????? ??????";
			}
		} else {
			try {
				lectureTime = lectureTP.substring(0,lectureTP.indexOf("("));
			} catch(Exception e) {
				lectureTime = "???????????? ?????? ??????";
			}
		}
		//??????
		try {
			lecturePlace = lectureTP.substring(lectureTP.indexOf("(")+1,lectureTP.indexOf(")"));
		} catch(Exception e) {
			lecturePlace = "????????? ?????? ??????";
		}
		
		model.addAttribute("Place",lecturePlace);
		model.addAttribute("Time",lectureTime);
		
		timetableVO.setLectureName(lectureInfo.get("lectureName").toString());
		timetableVO.setLectureProfname(lectureInfo.get("lectureProfname").toString());
		
		
		List<EgovMap> reviewInfo = timetableService.selectReview(timetableVO);
		
		List<EgovMap> fileInfo = timetableService.selectFile(timetableVO);

		model.addAttribute("sessionIdx", sessionVO.getUsrIdx());
		model.addAttribute("lectureInfo", lectureInfo);
		model.addAttribute("reviewList", reviewInfo);
		model.addAttribute("fileList", fileInfo);
		
		return "kkuapp/web/timetable/lectureInfo/lectureInfo_view";
		
	}
	
	@RequestMapping(value="/lectureReview.do")
	public String lectureReview(Model model, EgovKkuAppLectureReviewVO reviewVO) throws Exception {
		String subnum = reviewVO.getSubNum();
		EgovKkuAppTimetableVO timetableVO = new EgovKkuAppTimetableVO();
		timetableVO.setLectureSubnum(subnum);
		EgovMap lectureInfo = timetableService.selectLectureInfo(subnum);
		model.addAttribute("lectureinfo", lectureInfo);
		
		timetableVO.setLectureName(lectureInfo.get("lectureName").toString());
		timetableVO.setLectureProfname(lectureInfo.get("lectureProfname").toString());
		
		if(reviewVO.getReviewIdx() != null){
			// ???????????? ???
			timetableVO.setReviewIdx(reviewVO.getReviewIdx());
			model.addAttribute("reviewInfo", timetableService.selectReviewByIdx(reviewVO.getReviewIdx()));
			model.addAttribute("fileList", timetableService.selectFile(timetableVO));
			return "kkuapp/web/timetable/lectureInfo/lectureReview";
		} else {
			return "kkuapp/web/timetable/lectureInfo/lectureReview";
		}
	}	
	
	//???????????? ?????? + ??????
	@RequestMapping(value="/reviewProc.do")
    @ResponseBody
	public String reviewProc(@ModelAttribute("reviewVO") EgovKkuAppLectureReviewVO reviewVO,
			  			  MultipartHttpServletRequest mtfRequest,
			  			  ModelMap model, HttpServletRequest request) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();


		reviewVO.setWriter(sessionVO.getUsrIdx());
    	
    	String folderName = "lecture";
 		String convertedFileName = "";
 		
 		//?????? ?????????
		
    	// mode??? ?????? ????????????
		if(reviewVO.getMode().equals("reg")){

			
			//????????????
			timetableService.insertReview(reviewVO);
			
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");

			
			int i = 1;
			// ????????? ?????????
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblIdx(reviewVO.getReviewIdx());
					fileVO.setFileTblCode(Integer.toString(3));
					fileVO.setFileRegIdx(reviewVO.getWriter());
					fileVO.setFileRegNick(sessionVO.getUsrNickname());
					if(mf.getContentType().toString().contains("image")){
						fileVO.setBfType("img");
					}else{
						fileVO.setBfType("file");
					}
					fileVO.setFileUsrFile(mf.getOriginalFilename());
					convertedFileName = EgovCmsFileUtil.fileSingleUpload(mf, folderName);
					fileVO.setFileSrvFile(convertedFileName);
					fileVO.setFileUsrFile(fileVO.getFileUsrFile() + "|" + (mf.getSize()/1024) + "KB");
					commService.insertBoardFile(fileVO);
				}
			}
			return 1+"";  // ??? ????????????
			// ??? ????????????
		} else if(reviewVO.getMode().equals("mod")){

			
			// ?????? ????????????
			if(reviewVO.getDelArr() != null){	
				for(int i=0; i<reviewVO.getDelArr().length; i++){
					if(reviewVO.getDelArr()[i].equals("Y")){
						EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
						fileVO.setFileIdx(reviewVO.getFileIdxArr()[i]);
						fileVO.setModIdx(reviewVO.getWriter());
						fileVO.setModName(sessionVO.getUsrNickname());
						
						kkucommunityService.deleteBoardFile(fileVO);
					}
				}
			}
			// ???????????? ?????????
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");
			
			// ????????? ?????????
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblIdx(reviewVO.getReviewIdx());
					fileVO.setFileRegIdx(reviewVO.getWriter());
					fileVO.setFileTblCode(Integer.toString(3));
					fileVO.setFileRegNick(sessionVO.getUsrNickname());
					if(mf.getContentType().toString().contains("image")){
						fileVO.setBfType("img");
					}else{
						fileVO.setBfType("file");
					}
					fileVO.setFileUsrFile(mf.getOriginalFilename());
					convertedFileName = EgovCmsFileUtil.fileSingleUpload(mf, folderName);
					fileVO.setFileSrvFile(convertedFileName);
					fileVO.setFileUsrFile(fileVO.getFileUsrFile() + "|" + (mf.getSize()/1024) + "KB");
					commService.insertBoardFile(fileVO);
				}
			}
			
			int checkUpdate = timetableService.updateReview(reviewVO);
			
			return checkUpdate + ""; // ??? ????????????
			
		} else // ?????? "0" ?????? ???
			return 0+"";
	}
	// ???????????? ??????
	@RequestMapping(value="/reviewDelete.do")
	public String reviewDelete(@ModelAttribute("reviewVO") EgovKkuAppLectureReviewVO reviewVO,
			  			  ModelMap model, HttpServletRequest request) throws Exception {
		

		String reviewIdx = reviewVO.getReviewIdx();
		String subNum = reviewVO.getSubNum();

		timetableService.deleteReview(reviewIdx);
		
		return "redirect:/lectureInfo_view.do?lectureSubnum="+subNum;
		
	}
	
	
	@RequestMapping(value = "/download.do")
	public void downloadFile(HttpServletResponse response, @RequestParam(value="srvFile") String srvFile, @RequestParam(value="usrFile") String usrFile, @RequestParam(value="folder") String folder) throws Exception {
		String ext = usrFile.substring(usrFile.lastIndexOf("."), usrFile.length());
		String fileName = usrFile.substring(0, usrFile.lastIndexOf("."));
		// ??????????????? ?????? ??????
		String uploadPath = EgovProperties.getProperty("Globals.fileStorePath") + EgovWebUtil.filePathReplaceAll(folder) + "/";
		String srvFileStr = EgovWebUtil.filePathBlackList(srvFile);

		
		
		File uFile = new File(uploadPath, srvFileStr);
		int fSize = (int) uFile.length();
		if (fSize > 0) {
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName, "UTF-8") + ext + "\"");
			response.setContentLength(fSize);

			FileInputStream fis = new FileInputStream(uFile);
			BufferedInputStream bis = new BufferedInputStream(fis);
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			FileCopyUtils.copy(bis, bos);
			bos.flush();
			bos.close();
			bis.close();
			fis.close();
		}
		else {
			response.setContentType("text/html");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<script>alert('Download fail');self.close();</script>");
			printwriter.flush();
			printwriter.close();
		}
	}	
	
	
	@RequestMapping(value="/report.do")
	public String report(@ModelAttribute("reviewVO") EgovKkuAppLectureReviewVO reviewVO,
			  			  ModelMap model, HttpServletRequest request) throws Exception {

		String usrNick = request.getParameter("usrNick");
		EgovMap reviewInfo = timetableService.selectReviewByIdx(reviewVO.getReviewIdx());
		
		model.addAttribute("review", reviewInfo);
		model.addAttribute("usrNick", usrNick);
		
		

		return "kkuapp/web/timetable/lectureInfo/report";
		
		}	
	
	@RequestMapping(value="/reportProcess.do")
	public String reportProcess(@ModelAttribute("reportVO") EgovKkuReportVO reportVO,
			  			  ModelMap model, HttpServletRequest request) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String subNum = request.getParameter("subNum");
		reportVO.setWriterIdx(sessionVO.getUsrIdx());
		reportVO.setReportTblCode(Integer.toString(3));
		
		reportService.insertReportBoard(reportVO);
		
		
		return "redirect:/lectureInfo_view.do?lectureSubnum=" + subNum;
		
	}	
	
}
