package egovframework.kku.usr.web;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.utl.jsoup.EgovKkuAppSchoolInfoJsoupCrawler;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerVO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoMajorNoticeService;
import egovframework.kku.utl.selenium.EgovKkuAppSchoolInfoDietHaeoreumSeleniumDriver;
import egovframework.kku.utl.selenium.EgovKkuAppSchoolInfoDietMosiraeSeleniumDriver;
import egovframework.kku.utl.selenium.EgovKkuAppSchoolInfoMajorNoticeSeleniumDriver;
import egovframework.kku.utl.selenium.EgovKkuAppSchoolInfoNoticeSeleniumDriver;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuAppSchoolInfoController {

	@Resource(name="crawlerService")
	private EgovKkuAppSchoolInfoCrawlerService crawlerService;
	
	@Resource(name="majorNoticeService")
	private EgovKkuAppSchoolInfoMajorNoticeService majorNoticeService;

	//크롤링 스케쥴러
	@RequestMapping(value="crawlerScheduled.do")
	@Async("AsyncExecutor")
	@Scheduled(cron="0 10 22 * * *")
	public void crawlerScheduled() throws Exception {
		EgovKkuAppSchoolInfoCrawlerVO crawlerVO = new EgovKkuAppSchoolInfoCrawlerVO();

		//업데이트 시간
		LocalDateTime localDateTime = LocalDateTime.now();
        String localDateTimeStr = localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		crawlerVO.setCrawlerCategory("update");
		crawlerVO.setCrawlerContent(localDateTimeStr);
		crawlerService.insertContent(crawlerVO);

		try {
			//학과공지 크롤링
			List<String> majorList = majorNoticeService.selectMajorList();
			for(int i=0; i<majorList.size(); i++) {
				System.err.println("학과공지 크롤링 진행 중 ("+majorList.get(i)+")");
				crawlerVO.setNoticeCategory(majorList.get(i));
				majorNoticeCrawler(crawlerVO);
			}
			
			//학교공지 크롤링
			List<String> cateList = Arrays.asList("학사공지", "장학공지", "취업/창업", "국제교류", "일반공지", "외부행사/공모전");
			for(int i=0; i<cateList.size(); i++) {
				System.err.println("학교공지 크롤링 진행 중 ("+cateList.get(i)+")");
				crawlerVO.setNoticeCategory(cateList.get(i));
				noticeCrawler(crawlerVO);
			}
			
			//학식정보
			dietMosiraeCrawler(crawlerVO);
			dietHaeoreumCrawler(crawlerVO);
			
			//학사일정
			scheduleAnnualCrawler1(crawlerVO);
			scheduleAnnualCrawler2(crawlerVO);
			
			//버스시간표
			busCrawler(crawlerVO);
			
		} catch(Exception e) {
			System.err.println(e);
		}
		
	}
	
	//학교정보								
	@RequestMapping(value="/school_info.do")								
	public String schoolInfoList()throws Exception {								
									
		return "kkuapp/web/community/schoolinfo/school_info";							
	}		

	//건국정보
	@RequestMapping(value="notice.do")
	public String noticeList(Model model, EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{
		//class on
		String noticeCategory = crawlerVO.getNoticeCategory();
		
		if (noticeCategory == null) {
			noticeCategory = "학사공지";
			crawlerVO.setNoticeCategory(noticeCategory);
		}
		
		//페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setPageSize(8);
		paginationInfo.setRecordCountPerPage(8);
		paginationInfo.setCurrentPageNo(crawlerVO.getPageIndex());
		crawlerVO.setPageUnit(8);
        crawlerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        crawlerVO.setLastIndex(paginationInfo.getLastRecordIndex());
        
        paginationInfo.setTotalRecordCount(crawlerService.selectNoticeListCnt(crawlerVO));
        model.addAttribute("paginationInfo", paginationInfo);
        String updateDate = crawlerService.selectRecentUpdateDate();
        model.addAttribute("updateDate", updateDate);
        //---페이징
		List<EgovMap> noticeList = crawlerService.selectNoticeList(crawlerVO);

		String update = crawlerService.selectRecentUpdated();
		model.addAttribute("update", update);
		
		model.addAttribute("vo", crawlerVO);
		model.addAttribute("noticeList", noticeList);
		
		System.err.println(noticeList);
		
		
		return "kkuapp/web/community/schoolinfo/notice";							
	}
	
	//건국정보
	@RequestMapping(value="notice_crawler.do")
	public String noticeCrawler(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{
		
		String category = crawlerVO.getNoticeCategory();
		String url = "";
		
		switch(category) {
		case "학사공지":
			url = "https://www.kku.ac.kr/user/boardList.do?boardId=1489&siteId=wwwkr&id=wwwkr_070102000000";
			break;
		case "장학공지":
			url = "https://www.kku.ac.kr/user/boardList.do?boardId=1497&siteId=wwwkr&id=wwwkr_070103000000";
			break;
		case "취업/창업":
			url = "https://www.kku.ac.kr/user/boardList.do?boardId=1516&siteId=wwwkr&id=wwwkr_070105000000";
			break;
		case "국제교류":
			url = "https://www.kku.ac.kr/user/boardList.do?boardId=35358&siteId=wwwkr&id=wwwkr_070109000000";
			break;
		case "일반공지":
			url = "https://www.kku.ac.kr/user/boardList.do?boardId=1481&siteId=wwwkr&id=wwwkr_070101000000";
			break;
		case "외부행사/공모전":
			url = "https://www.kku.ac.kr/user/boardList.do?boardId=1584&siteId=wwwkr&id=wwwkr_070306000000";
			break;
		}
		
		List<String> Index = crawlerService.selectIndexList(crawlerVO);
		List<Integer> IndexList = new ArrayList<Integer>();
		for(int j=0; j<Index.size(); j++) {
			if (Index.get(j) != null) {
				IndexList.add(Integer.parseInt(Index.get(j)));
			}
		}
		
		EgovKkuAppSchoolInfoNoticeSeleniumDriver webdriver = new EgovKkuAppSchoolInfoNoticeSeleniumDriver();
		String[][] dataList = webdriver.useDriver(url,IndexList);
		
		int result = 0;
		try {
			for (int j=0; j<dataList.length; j++) {
				if(dataList[j][0] != null) {
					crawlerVO.setNoticeNum(dataList[j][0]);
					crawlerVO.setNoticeTitle(dataList[j][1]);
					crawlerVO.setNoticeFiles(dataList[j][2]);
					crawlerVO.setNoticeContent(dataList[j][3]);
					crawlerVO.setNoticeDate(dataList[j][4]);
					crawlerVO.setNoticeName(dataList[j][5]);
					crawlerVO.setNoticeCategory(dataList[j][6]);
					result += crawlerService.insertNotice(crawlerVO);
				}
			}
		} catch(Exception e) {
			return "error";
		}
		
		return "success";
	}

	//건국정보 상세페이지								
	@RequestMapping(value="notice_view.do")								
	public String noticeView(Model model, EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{
		
		crawlerService.updateNoticeViewcnt(crawlerVO.getNoticeIdx());
		System.err.println(crawlerVO);
		EgovMap notice = crawlerService.selectNoticeByNum(crawlerVO);
		
		model.addAttribute("notice", notice);
		
		return "kkuapp/web/community/schoolinfo/notice_view";
	}

	//학식정보 - 모시래								
	@RequestMapping(value="/diet_mosirae.do")								
	public String dietMosirae(Model model, EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		
		String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-M-d"));
		String tomorrow = LocalDate.now().plusDays(1).format(DateTimeFormatter.ofPattern("yyyy-M-d"));
		
		crawlerVO.setWeekmenuPlace("모시래학사");
		crawlerVO.setWeekmenuDate(today);
		List<EgovMap> todayDietInfo = crawlerService.selectMenuList(crawlerVO);
		
		crawlerVO.setWeekmenuDate(tomorrow);
		List<EgovMap> tomorrowDietInfo = crawlerService.selectMenuList(crawlerVO);
		
		model.addAttribute("today",today);
		model.addAttribute("tomorrow",tomorrow);
		model.addAttribute("todayDietInfo", todayDietInfo);
		model.addAttribute("tomorrowDietInfo", tomorrowDietInfo);
		
		String update = crawlerService.selectRecentUpdated();
		model.addAttribute("update", update);
		
		return "kkuapp/web/community/schoolinfo/diet_mosirae";
	}
	
	@RequestMapping(value="/diet_mosirae_crawler.do")
	public String dietMosiraeCrawler(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		
		String url = "https://dorm.kku.ac.kr/main.do";
		
		EgovKkuAppSchoolInfoDietMosiraeSeleniumDriver webdriver = new EgovKkuAppSchoolInfoDietMosiraeSeleniumDriver();
		String[][][] result = webdriver.useDriver(url);
		
		int success = 0;
		for(int i=0; i<result.length; i++) {
			for(int j=0; j<result[i].length; j++) {
				crawlerVO.setWeekmenuMenu(result[i][j][0]);
				crawlerVO.setWeekmenuCalory(result[i][j][1]);
				crawlerVO.setWeekmenuCategory(result[i][j][2]);
				crawlerVO.setWeekmenuDay(result[i][j][3]);
				crawlerVO.setWeekmenuPlace(result[i][j][4]);
				crawlerVO.setWeekmenuDate(result[i][j][5]);
				success += crawlerService.insertWeeklyMenu(crawlerVO);
			}
		}
		if(success == 0) {
			return "error";
		}else return "success";
		
	}
	
	//학식정보 - 해오름								
	@RequestMapping(value="/diet_haeoreum.do")								
	public String dietHaeoreum(Model model, EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {	
		
		String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-M-d"));
		String tomorrow = LocalDate.now().plusDays(1).format(DateTimeFormatter.ofPattern("yyyy-M-d"));
		

		crawlerVO.setWeekmenuPlace("해오름학사");
		crawlerVO.setWeekmenuDate(today);
		List<EgovMap> todayDietInfo = crawlerService.selectMenuList(crawlerVO);
		
		crawlerVO.setWeekmenuDate(tomorrow);
		List<EgovMap> tomorrowDietInfo = crawlerService.selectMenuList(crawlerVO);
		
		model.addAttribute("today",today);
		model.addAttribute("tomorrow",tomorrow);
		model.addAttribute("todayDietInfo", todayDietInfo);
		model.addAttribute("tomorrowDietInfo", tomorrowDietInfo);
		
		String update = crawlerService.selectRecentUpdated();
		model.addAttribute("update", update);
		
		return "kkuapp/web/community/schoolinfo/diet_haeoreum";
	}
	
	@RequestMapping(value="/diet_haeoreum_crawler.do")
	public String dietHaeoreumCrawler(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		
		String url = "https://dorm.kku.ac.kr/main.do";
		
		EgovKkuAppSchoolInfoDietHaeoreumSeleniumDriver webdriver = new EgovKkuAppSchoolInfoDietHaeoreumSeleniumDriver();
		String[][][] result = webdriver.useDriver(url);
		
		int success = 0;
		for(int i=0; i<result.length; i++) {
			for(int j=0; j<result[i].length; j++) {
				crawlerVO.setWeekmenuMenu(result[i][j][0]);
//				crawlerVO.setWeekmenuCalory(result[i][j][1]);
				crawlerVO.setWeekmenuCategory(result[i][j][2]);
				crawlerVO.setWeekmenuDay(result[i][j][3]);
				crawlerVO.setWeekmenuPlace(result[i][j][4]);
				crawlerVO.setWeekmenuDate(result[i][j][5]);
				success += crawlerService.insertWeeklyMenu(crawlerVO);
			}
		}
		if(success == 0) {
			return "error";
		}else return "success";
		
	}
	
	//학사일정
	@RequestMapping(value="/schedule_annual.do")
	public String scheduleAnnual(@ModelAttribute("vo") EgovKkuAppSchoolInfoCrawlerVO crawlerVO, Model model) throws Exception {
		
		System.err.println(crawlerVO.getCrawlerCategory());
		
		if(crawlerVO.getCrawlerCategory() == null || crawlerVO.getCrawlerCategory() == ""){
			LocalDate now = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM");
			int formatedMonth = Integer.parseInt(now.format(formatter));
			
			if(formatedMonth >= 3 && formatedMonth <= 8 ) {
				crawlerVO.setCrawlerCategory("semester1");
			} else {
				crawlerVO.setCrawlerCategory("semester2");
			}
		}
		
		EgovMap content = crawlerService.selectContent(crawlerVO);
		model.addAttribute("content", content);
		
		Map<String,String> onOff = new HashMap<String,String>();
		onOff.put("first", "on");
		onOff.put("second", "off");
		model.addAttribute("onOff",onOff);
		
		String update = crawlerService.selectRecentUpdated();
		model.addAttribute("update", update);
		
		return "kkuapp/web/community/schoolinfo/schedule_annual";
	}
	
	//학사일정 - 1학기
	@RequestMapping(value="/schedule_annual1.do")
	public String scheduleAnnual1(EgovKkuAppSchoolInfoCrawlerVO crawlerVO, Model model) throws Exception {
		crawlerVO.setCrawlerCategory("semester1");
		
		EgovMap content = crawlerService.selectContent(crawlerVO);
		
		model.addAttribute("content", content);
		
		Map<String,String> onOff = new HashMap<String,String>();
		onOff.put("first", "on");
		onOff.put("second", "off");
		model.addAttribute("onOff",onOff);
		
		String update = crawlerService.selectRecentUpdated();
		model.addAttribute("update", update);
		
		return "kkuapp/web/community/schoolinfo/schedule_annual";							
	}
	
	//학사일정(1학기) 크롤러 업데이트
	@RequestMapping(value="/scheduleAnnualCrawlerReload1.do")
	public String scheduleAnnualCrawler1(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{	
		
		//url=크롤링 주소, sel=태그명
		String url = "https://www.kku.ac.kr/mbshome/mbs/wwwkr/subview.do?id=wwwkr_050104010000";							
		String sel = "table.table_info3";				
		crawlerVO.setCrawlerCategory("semester1");
		
		EgovKkuAppSchoolInfoJsoupCrawler A = new EgovKkuAppSchoolInfoJsoupCrawler();							
		Elements data = (Elements) A.crawler(url,sel);		
		
		crawlerVO.setCrawlerContent(String.valueOf(data));
		crawlerService.insertContent(crawlerVO);
		
		if(data != null) {
			return "success";
		} else return "error";
	}
		
	//학사일정 - 2학기								
	@RequestMapping(value="/schedule_annual2.do")								
	public String scheduleAnnual2(EgovKkuAppSchoolInfoCrawlerVO crawlerVO, Model model) throws Exception {							
		crawlerVO.setCrawlerCategory("semester2");		
		EgovMap content = crawlerService.selectContent(crawlerVO);
		
		model.addAttribute("content", content);
									
		//클래스 on&off
		Map<String,String> onOff = new HashMap<String,String>();
		onOff.put("first", "off");
		onOff.put("second", "on");
		model.addAttribute("onOff",onOff);
		
		String update = crawlerService.selectRecentUpdated();
		model.addAttribute("update", update);
		
		return "kkuapp/web/community/schoolinfo/schedule_annual";							
	}
	
	//학사일정(2학기) 크롤러 업데이트
	@RequestMapping(value="/scheduleAnnualCrawlerReload2.do")
	public String scheduleAnnualCrawler2(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{	
		
		//url=크롤링 주소, sel=태그명
		String url = "https://www.kku.ac.kr/mbshome/mbs/wwwkr/subview.do?id=wwwkr_050104020000";							
		String sel = "table.table_info3";		
		crawlerVO.setCrawlerCategory("semester2");
		
		EgovKkuAppSchoolInfoJsoupCrawler A = new EgovKkuAppSchoolInfoJsoupCrawler();							
		Elements data = (Elements) A.crawler(url,sel);		
		
		crawlerVO.setCrawlerContent(String.valueOf(data));
		crawlerService.insertContent(crawlerVO);
		
		if(data != null) {
			return "success";
		} else return "error";
	}
	
	//버스시간표								
	@RequestMapping(value="/schedule_bus.do")
	public String scheduleBus(EgovKkuAppSchoolInfoCrawlerVO crawlerVO, Model model) throws Exception{		
			crawlerVO.setCrawlerCategory("bus");
		
		EgovMap content = crawlerService.selectContent(crawlerVO);
		model.addAttribute("content", content);
		
		String update = crawlerService.selectRecentUpdated();
		model.addAttribute("update", update);
									
		return "kkuapp/web/community/schoolinfo/schedule_bus";
	}
	//
	@RequestMapping(value="/normal_bus.do")
	public String nurmalBus(EgovKkuAppSchoolInfoCrawlerVO crawlerVO, Model model) throws Exception{		
		
									
		return "kkuapp/web/community/schoolinfo/normal_bus";
	}
	//버스시간표 크롤러 업데이트
	@RequestMapping(value="/busCrawlerReload.do")
	public String busCrawler(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{	
		
		//url=크롤링 주소, sel=태그명
		String url = "http://www.kku.ac.kr/mbshome/mbs/wwwkr/subview.do?id=wwwkr_040105020000";							
		String sel = "table.table_info";				
		crawlerVO.setCrawlerCategory("bus");
		
		EgovKkuAppSchoolInfoJsoupCrawler A = new EgovKkuAppSchoolInfoJsoupCrawler();							
		Elements data = (Elements) A.crawler(url,sel);		
		
		crawlerVO.setCrawlerContent(String.valueOf(data));
		crawlerService.insertContent(crawlerVO);
		
		if(data != null) {
			return "success";
		} else return "error";
	}				

	//학과공지 불러오기(스케쥴러 오류로 학과공지 컨트롤러에서 옮겨옴)
	@RequestMapping(value="/majorNotice_crawler.do")
	public String majorNoticeCrawler(EgovKkuAppSchoolInfoCrawlerVO crawlerVO ) throws Exception {

		String usrMajor = crawlerVO.getNoticeCategory();
		
		String url = majorNoticeService.getURL(usrMajor);
		
		switch(usrMajor) {
		case "반려동물융합전공":
		case "융합치유전공":
		case "빅데이터융합전공":
		case "도시디자인융합전공":
		case "자기설계전공":
			usrMajor = "힐링바이오대학";
			break;
		}
		crawlerVO.setNoticeCategory(usrMajor);
		
		//중복검사용 기존 공지 리스트 가져오기
		List<String> Index = crawlerService.selectIndexListMN(crawlerVO);
		List<Integer> IndexList = new ArrayList<Integer>();
		for(int i=0; i<Index.size(); i++) {
			if (Index.get(i) != null) {
				IndexList.add(Integer.parseInt(Index.get(i)));
			}
		}
		
		EgovKkuAppSchoolInfoMajorNoticeSeleniumDriver webdriver = new EgovKkuAppSchoolInfoMajorNoticeSeleniumDriver();
		String[][] dataList = new String[30][6];
		switch(usrMajor) {
		case "의과대학":
			dataList = webdriver.useDriverMed(url,IndexList);
			break;
		case "컴퓨터공학과":
			dataList = webdriver.useDriverCS(url,IndexList);
			break;
		default:
			dataList = webdriver.useDriver(url,IndexList);
		}
		
		int result = 0;
		try {
			for (int i=0; i<dataList.length; i++) {
				if(dataList[i][0] != null) {
					crawlerVO.setNoticeNum(dataList[i][0]);
					crawlerVO.setNoticeTitle(dataList[i][1]);
					crawlerVO.setNoticeFiles(dataList[i][2]);
					crawlerVO.setNoticeContent(dataList[i][3]);
					crawlerVO.setNoticeDate(dataList[i][4]);
					crawlerVO.setNoticeName(dataList[i][5]);
					result += crawlerService.insertMajorNotice(crawlerVO);
				}
			}
		} catch(Exception e) {
			return "error";
		}
		
		return "success";
	}
}
