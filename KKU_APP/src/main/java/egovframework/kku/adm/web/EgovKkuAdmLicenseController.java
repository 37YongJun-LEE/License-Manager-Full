package egovframework.kku.adm.web;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.SysexMessage;
import org.apache.commons.lang.StringEscapeUtils;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.com.cmm.EgovCmsCommonUtil;
import egovframework.com.cmm.EgovCmsFileUtil;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.adm.service.EgovKkuAdmLicenseService;
import egovframework.kku.adm.service.EgovKkuAdmLicenseVO;
import egovframework.kku.adm.service.EgovKkuAdmLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityService;
import egovframework.kku.usr.service.EgovKkuAppLicenseService;
import egovframework.kku.usr.service.EgovKkuAppLicenseVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerVO;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.utl.selenium.EgovKkuAppLicenseDataSeleniumDriver;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class EgovKkuAdmLicenseController {
	
	@Resource(name="licenseService")								
	private EgovKkuAppLicenseService licenseService;
	
	@Resource(name="adminLicenseService")
	EgovKkuAdmLicenseService adminLicenseService;
	
	@Resource(name="kkuUserService")
	private EgovKkuAppUserService kkuUserService;

	@Resource(name="commService")								
	private EgovKkuAppCommunityService commService;
	
	@RequestMapping(value="/admin/licenseList.do") 
	public String list(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		model.addAttribute("depth01","license");
		
		//페이지네이션
		PaginationInfo paginationInfo = new PaginationInfo();
	    vo.setPageUnit(10);
	    paginationInfo.setCurrentPageNo(vo.getPageIndex());
	    paginationInfo.setRecordCountPerPage(15); 
        paginationInfo.setPageSize(10);
        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        paginationInfo.setTotalRecordCount(adminLicenseService.searchLicenseListCnt(vo));
        model.addAttribute("paginationInfo", paginationInfo);
        
        List<EgovMap> resultList = adminLicenseService.searchLicenseList(vo);
		model.addAttribute("resultList",resultList);
		
		List<EgovMap> majorList = (List<EgovMap>) kkuUserService.findOptionDetailAll();
    	model.addAttribute("majorList", majorList);
		
		return "kkuapp/adm/license/licenseList"; 
	}
	
	@RequestMapping(value="/admin/licenseDetail.do") 
	public String detail(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		model.addAttribute("depth01","license");
		model.addAttribute("depth02","default");
		
		
		System.err.println("=============1분기================");
		EgovMap result = adminLicenseService.searchLicenseDetail(vo);
		model.addAttribute("result",result);
		
		// 수정 가능 여부 체크
		model.addAttribute("custom_check", ((String) result.get("subjectCd")).substring(0,1));
		
		//응시자격--------
		System.err.println("=============2분기================");
		EgovKkuAppLicenseVO licenseVo = new EgovKkuAppLicenseVO();
		licenseVo.setSubjectCd(vo.getSubjectCd());
		List<?> licenseQual = licenseService.selectLicenseQual(licenseVo);
		model.addAttribute("licenseQual",licenseQual);
		//--------------
		
		System.err.println("=============3분기================");
		List<EgovMap> schedule = adminLicenseService.searchLicenseSchedule(vo);
		model.addAttribute("schedule",schedule);
		
		return "kkuapp/adm/license/licenseDetail"; 
	}

	@RequestMapping(value="/admin/licenseDetailMod.do") 
	@ResponseBody
	public String modify(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model, HttpServletRequest request) throws Exception {
		
		EgovKkuAdmLoginSessionVO sessionVo = (EgovKkuAdmLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUserInfo();
		vo.setRegId(sessionVo.getUsrEmail());
		vo.setDescription(request.getParameter("description"));
		System.err.println(request.getParameter("description"));
		int result = adminLicenseService.updateLicenseSchedule(vo);
		if(result != 0) {
			return "success";
		}
		return "error";
	}
	
	@RequestMapping(value="/admin/licenseRecMajor.do") 
	public String recMajor(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		model.addAttribute("depth01","license");
		model.addAttribute("depth02","major");
		
		EgovMap result = adminLicenseService.searchLicenseDetail(vo);
		model.addAttribute("result",result);
		
		List<EgovMap> resultList = adminLicenseService.searchMajorRecommandation(vo);
		model.addAttribute("resultList",resultList);
		
		return "kkuapp/adm/license/licenseDetail"; 
	}
	
	@RequestMapping(value="/admin/majorPopup.do") 
	public String majorPopup(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {

		//수정
		if(vo.getUniIdx() != "" && vo.getUniIdx() != null) {
			List<EgovMap> result = (List<EgovMap>) adminLicenseService.searchMajorRecommandation(vo);
			model.addAttribute("result",result.get(0));
		}
		
		List<EgovMap> resultList = (List<EgovMap>) kkuUserService.findOptionDetailAll();
    	model.addAttribute("resultList", resultList);
		
		return "kkuapp/adm/license/majorPopup";
	}
	
	@RequestMapping(value="/admin/majorRecAdd.do")
	@ResponseBody
	public String majorRecAdd(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model, HttpServletRequest request) throws Exception {
		
		EgovKkuAdmLoginSessionVO sessionVo = (EgovKkuAdmLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUserInfo();
		vo.setRegId(sessionVo.getUsrEmail());
		vo.setUniIdx(request.getParameter("uniIdx"));
		vo.setSubjectCd(request.getParameter("subjectCd"));
		vo.setPilsooYn(request.getParameter("pilsooYn"));
		vo.setIdx(request.getParameter("idx"));
		
		String mode = request.getParameter("mode");
		
		switch(mode) {
		case "ins":
			List<EgovMap> recMajor = adminLicenseService.searchMajorRecommandation(vo);
			if(recMajor.size() == 0) {
				int result = adminLicenseService.insertRecMajor(vo);
				if(result == 1) {
					return "insSuccess";
				} else return "error";
			} else return "already";
		case "upd":
			int result = adminLicenseService.updateRecMajor(vo);
			if(result != 0) {
				return "updSuccess";
			} else return "error";
		default:
			return "error";
		}
	}
	
	@RequestMapping(value="/admin/majorRecDelete.do")
	public String majorRecDelete(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model, HttpServletRequest request) throws Exception {
		
		int result = adminLicenseService.deleteRecMajor(vo);
		
		return "redirect:/admin/licenseRecMajor.do?subjectCd="+vo.getSubjectCd();
	}
	
	@RequestMapping(value="/admin/licenseRecLicense.do") 
	public String recLicense(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		model.addAttribute("depth01","license");
		model.addAttribute("depth02","license");
		
		EgovMap result = adminLicenseService.searchLicenseDetail(vo);
		model.addAttribute("result",result);
		
		EgovMap recLicenseApi = adminLicenseService.searchLicenseRecommandation(vo);
		model.addAttribute("recLicenseApi",recLicenseApi);
		
		List<EgovMap> recLicense = adminLicenseService.searchLicenseRecoMade(vo);
		model.addAttribute("recLicense",recLicense);
		
		return "kkuapp/adm/license/licenseDetail"; 
	}

	@RequestMapping(value="/admin/licensePopup.do") 
	public String licensePopup(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		//페이지네이션
		PaginationInfo paginationInfo = new PaginationInfo();
	    vo.setPageUnit(10);
	    paginationInfo.setCurrentPageNo(vo.getPageIndex());
	    paginationInfo.setRecordCountPerPage(15); 
        paginationInfo.setPageSize(5);
        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        paginationInfo.setTotalRecordCount(adminLicenseService.searchLicenseListCnt(vo));
        model.addAttribute("paginationInfo", paginationInfo);
        
		List<EgovMap> resultList = adminLicenseService.searchLicenseList(vo);
		model.addAttribute("resultList",resultList);
		
		return "kkuapp/adm/license/licensePopup";
	}
	
	@RequestMapping(value="/admin/licenseRecAdd.do")
	@ResponseBody
	public String licenseRecAdd(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model, HttpServletRequest request) throws Exception {
		
		vo.setSubjectCd(request.getParameter("subjectCd"));
		vo.setRecSubjectCd(request.getParameter("recSubjectCd"));
		vo.setRecSubjectName(request.getParameter("recSubjectName"));
		EgovKkuAdmLoginSessionVO sessionVo = (EgovKkuAdmLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUserInfo();
		vo.setRegId(sessionVo.getUsrEmail());
		
		int result = 0;
		//중복 등록 확인
		if(adminLicenseService.searchLicenseRecCnt(vo) == 0 && adminLicenseService.searchLicenseIRecCnt(vo) == 0) {
			result = adminLicenseService.insertLicenseRec(vo);
		} else return "already";
		if(result != 0) {
			return "success";
		} else return "error";
	}
	
	@RequestMapping(value="/admin/licenseRecDelete.do")
	public String licenseRecDelete(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model, HttpServletRequest request) throws Exception {
		
		int result = adminLicenseService.deleteRecLicense(vo);
		
		return "redirect:/admin/licenseRecLicense.do?subjectCd="+vo.getSubjectCd();
	}
	
	@RequestMapping(value="/admin/licensePrevQuestions.do") 
	public String prevQuestions(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		model.addAttribute("depth01","license");
		model.addAttribute("depth02","questions");
		
		EgovMap result = adminLicenseService.searchLicenseDetail(vo);
		model.addAttribute("result",result);
		
		List<EgovMap> resultList = adminLicenseService.searchLicenseQuestions(vo);
		model.addAttribute("resultList",resultList);
		
		return "kkuapp/adm/license/licenseDetail"; 
	}
	
	@RequestMapping(value="/admin/questionsPopup.do") 
	public String questionsPopup(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		if(vo.getIdx()!=null) {
			List<EgovMap> resultList = adminLicenseService.searchLicenseQuestions(vo);
			model.addAttribute("result",resultList.get(0));
		}
		
		return "kkuapp/adm/license/questionsPopup";
	}
	
	@RequestMapping(value="/admin/questionsAdd.do")
	public String questionsAdd(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model, ModelMap modelMap, MultipartHttpServletRequest request) throws Exception {

		String msg = "";
		EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
		EgovKkuAdmLoginSessionVO sessionVO = (EgovKkuAdmLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUserInfo();
		vo.setRegId(sessionVO.getUsrEmail());
		vo.setQuesFileOrder("1");
		
		MultipartFile file1 = request.getFile("file1");
		String fileName = EgovCmsFileUtil.fileSingleUpload(file1, "prevQuestions");
		
		//파일 첨부 확인
		if(fileName != "" && fileName != null) {
			fileVO.setFileTblCode("9");
			fileVO.setFileTblIdx(vo.getIdx());
			fileVO.setFileUsrFile(vo.getQuesFileName());
			fileVO.setFileSrvFile(fileName);
			
			fileVO.setFileRegIdx(sessionVO.getUsrIdx());
			fileVO.setFileRegNick(sessionVO.getUsrNickname());
			
			if(file1.getContentType().toString().contains("image")){
				fileVO.setBfType("img");
			}else{
				fileVO.setBfType("file");
			}
			
			vo.setQuesFileName(vo.getQuesFileName());
			vo.setQuesFileUrl(fileName);
		}
		
		//게시물 등록 or 수정
		if(vo.getIdx() == "" || vo.getIdx() == null) {
			//insert
			String result = adminLicenseService.insertPrevQuestions(vo);
			fileVO.setFileTblIdx(result);
			commService.insertBoardFile(fileVO);
			msg = "추가 되었습니다.";
		} else {
			//update
			if (vo.getQuesFileName().lastIndexOf(".") == -1) {
				//파일명에 확장자 붙여주기
				String nameBefore = vo.getFileNameBefore();
				int index = nameBefore.lastIndexOf(".");
				String fileExt = nameBefore.substring(index + 1);
				fileExt = fileExt.toLowerCase();
				vo.setQuesFileName(vo.getQuesFileName()+"."+fileExt);
			} 
			int result = adminLicenseService.updatePrevQuestions(vo);
			if(fileName != "" && fileName != null) {
				commService.insertBoardFile(fileVO);
			}
			msg = "수정 되었습니다.";
		}
		
		return EgovCmsCommonUtil.alertClose(modelMap, msg);
	}
	
	@RequestMapping(value="/admin/questionsDelete.do")
	public String questionsDelete(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model, HttpServletRequest request) throws Exception {

		EgovKkuAdmLoginSessionVO sessionVO = (EgovKkuAdmLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUserInfo();
		vo.setRegId(sessionVO.getUsrEmail());
		
		int result = adminLicenseService.deleteQuestions(vo);
		
		return "redirect:/admin/licensePrevQuestions.do?subjectCd="+vo.getSubjectCd();
	}

	@RequestMapping(value="/admin/licenseBoard.do") 
	public String board(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		model.addAttribute("depth01","license");
		model.addAttribute("depth02","board");
		
		EgovMap result = adminLicenseService.searchLicenseDetail(vo);
		model.addAttribute("result",result);
		
		System.err.println("vo " + vo);
		
		List<EgovMap> resultList = adminLicenseService.searchLicenseBoard(vo);
		System.err.println(resultList);
		model.addAttribute("resultList",resultList);
		
		return "kkuapp/adm/license/licenseDetail"; 
	}
	
	@RequestMapping(value="/admin/licenseBoardDetail.do")
	public String freenoticeListDetail(EgovKkuAdmLicenseVO vo,Model model) throws Exception{

		model.addAttribute("depth01","license");
		model.addAttribute("depth02","board");
		
		EgovMap boardInfo = adminLicenseService.licenseBoardDetail(vo);
		model.addAttribute("boardInfo",boardInfo);
		System.err.println(boardInfo);
		
		return "kkuapp/adm/license/licenseBoardDetail";
	}
	  	
	@RequestMapping(value="/admin/licenseBoardAction.do") //자격증 게시판 게시글 수정
	@ResponseBody
	public String licenseBoardAction(EgovKkuAdmLicenseVO vo)throws Exception{
		
		String cont = vo.getBoardContent();
		String unescape = StringEscapeUtils.unescapeHtml(cont);
		
		int result = adminLicenseService.updatelicenseBoard(vo);
		String resultMsg = "";
		if( result == 1){
			resultMsg = "success";
		}else{
			resultMsg = "fail";
		}
		return resultMsg;
	}
	
	@RequestMapping(value="/admin/dataCrawler.do")
	public String dataCrawler(String type1, EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		
		int success = 0;
		String url = "https://www.dataq.or.kr/www/accept/schedule.do";
		
		EgovKkuAppLicenseDataSeleniumDriver webdriver = new EgovKkuAppLicenseDataSeleniumDriver();
		List<EgovMap> resultList = webdriver.useDriver(url);
		//adminLicenseService.insertDataLicnese(resultList);
		for(int i=0; i<resultList.size(); i++)
			success += adminLicenseService.insertDataLicnese(resultList.get(i));

		if(success == 0) {
			return "error";
		}else
			// 상황별 경로 지정
			if(!type1.isEmpty()) {
				return "redirect:/admin/licenseUpdateList.do";
			}
			return "redirect:/admin/licenseList.do";
	}		
	
	@RequestMapping(value="/admin/dataAdd.do") 
	public String dataAdd(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		model.addAttribute("depth01","license");
		model.addAttribute("depth02","default");
	
		return "kkuapp/adm/license/licenseAdd";
	}
	
	@RequestMapping(value="/admin/dataAddProc.do") 
	public String dataAddProc(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		// 빈값 있을 시 오류 발생
		if(vo.getQualCd().isEmpty() || vo.getJobfieldName().isEmpty() || vo.getMjobfieldName().isEmpty() || vo.getSubjectName().isEmpty()) {
			model.addAttribute("msg", "값을 모두 채워주세요");
			return "redirect:/admin/dataAdd.do";
		}
		
		model.addAttribute("depth01","license");
		model.addAttribute("depth02","default");
		
		EgovMap recentSubjectCd = adminLicenseService.selectRecentNumber(vo);			
		String newSubjectCd = "";
		if(recentSubjectCd == null) {
			EgovMap recentSubjectCdTest = new EgovMap();
			recentSubjectCdTest.put("subjectCd", "C000");
			newSubjectCd = ((String) recentSubjectCdTest.get("subjectCd")).substring(1);
		} else {
			newSubjectCd = ((String) recentSubjectCd.get("subjectCd")).substring(1);
		}
		
		int newSubjectCdCal = Integer.parseInt(newSubjectCd) + 1;
		newSubjectCd = Integer.toString(newSubjectCdCal);
		if(newSubjectCd.length() == 1) {
			newSubjectCd = "00" + newSubjectCd;
		} else if(newSubjectCd.length() == 2) {
			newSubjectCd = "0" + newSubjectCd;
		}
		newSubjectCd = "C" + newSubjectCd;
		vo.setSubjectCd(newSubjectCd);
		
		if("S".equals(vo.getQualCd())) {			
			vo.setQualName("국가전문자격");
		} else if("T".equals(vo.getQualCd())) {
			vo.setQualName("국가기술자격");			
		} else if("D".equals(vo.getQualCd())) {
			vo.setQualName("데이터자격검정");			
		} else if("Q".equals(vo.getQualCd())) {
			vo.setQualName("민간자격");						
		} else {
			vo.setQualCd("N");
			vo.setQualName("미분류");
		}
				
		// insert 진행 및 성공 msg 반환
		adminLicenseService.insertLicenseCustom(vo);
		model.addAttribute("msg", "["+ newSubjectCd +"] '"+ vo.getSubjectName() + "' 이름으로 새로운 자격증이 등록되었습니다.");
		
		return "redirect:/admin/licenseList.do";
	}
	
	@RequestMapping(value="/admin/dataEdit.do") 
	public String dataEdit(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		model.addAttribute("depth01","license");
		model.addAttribute("depth02","default");
		
		EgovMap result = adminLicenseService.searchLicenseDetail(vo);
		model.addAttribute("result", result);
		// 수정 여부 전달
		model.addAttribute("edited_is", 1);
	
		return "kkuapp/adm/license/licenseAdd";
	}
	
	@RequestMapping(value="/admin/dataEditProc.do") 
	public String dataEditProc(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
	
		String subjectCd = vo.getSubjectCd();
		
		if("S".equals(vo.getQualCd())) {			
			vo.setQualName("국가전문자격");
		} else if("T".equals(vo.getQualCd())) {
			vo.setQualName("국가기술자격");			
		} else if("D".equals(vo.getQualCd())) {
			vo.setQualName("데이터자격검정");			
		} else if("Q".equals(vo.getQualCd())) {
			vo.setQualName("민간자격");						
		} else {
			vo.setQualName("미분류");
		}
		
		System.err.println(vo);
		adminLicenseService.updateLicenseCustom(vo);
		model.addAttribute("msg", "자격증이 수정되었습니다.");
		
		return "redirect:/admin/licenseDetail.do?subjectCd="+subjectCd;
	}
	
	
	// 자격증 정보 업데이트 페이지로 이동하는 컨트롤러
	@RequestMapping(value="/admin/licenseUpdateList.do") 
	public String licenseUpdateList(@ModelAttribute("vo") EgovKkuAdmLicenseVO vo, Model model) throws Exception {
		
		model.addAttribute("depth01","license");
		model.addAttribute("depth02","default");
		
		return "kkuapp/adm/license/licenseForUpdate";
	}
}
