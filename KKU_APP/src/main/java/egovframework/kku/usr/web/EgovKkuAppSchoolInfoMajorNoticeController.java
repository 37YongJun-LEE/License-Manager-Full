package egovframework.kku.usr.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.com.cmm.EgovCmsCommonUtil;
import egovframework.com.cmm.EgovCmsFileUtil;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityService;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerVO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoMajorNoticeService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoMajorNoticeVO;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.kku.usr.service.impl.EgovKkuAppSchoolInfoMajorNoticeServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuAppSchoolInfoMajorNoticeController {
	
	@Resource(name="majorNoticeService")
	private EgovKkuAppSchoolInfoMajorNoticeService majorNoticeService;
	
	@Resource(name="kkuUserService")
	private EgovKkuAppUserService kkuUserService;
	
	@Resource(name="crawlerService")
	private EgovKkuAppSchoolInfoCrawlerService crawlerService;
	
	//???????????? 
	@RequestMapping(value="/majorNotice.do")
	public String majorNoticeList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO, ModelMap model, 
			HttpServletRequest request) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
        
        EgovMap usrInfo = kkuUserService.selectUsrInfoByUsrIdx(sessionVO.getUsrIdx());
        String usrMajor = (String) usrInfo.getValue(0);
        
        switch(usrMajor) {
		case "????????????????????????":
		case "??????????????????":
		case "????????????????????????":
		case "???????????????????????????":
		case "??????????????????":
			usrMajor = "?????????????????????";
			break;
		}
        crawlerVO.setNoticeCategory(usrMajor);
		
        //?????????
        PaginationInfo paginationInfo = new PaginationInfo();
      	paginationInfo.setPageSize(8);
      	paginationInfo.setRecordCountPerPage(8);
      	paginationInfo.setCurrentPageNo(crawlerVO.getPageIndex());
      	crawlerVO.setPageUnit(8);
      	crawlerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	crawlerVO.setLastIndex(paginationInfo.getLastRecordIndex());
             
      	paginationInfo.setTotalRecordCount(crawlerService.selectMajorNoticeListCnt(crawlerVO));
      	model.addAttribute("paginationInfo", paginationInfo);
        //---?????????
        
		List<EgovMap> majorNoticeList = crawlerService.selectMajorNoticeList(crawlerVO);
		
		String update = crawlerService.selectRecentUpdated();
		model.addAttribute("update", update);
		
		model.addAttribute("vo", crawlerVO);
		model.addAttribute("usrMajor", usrMajor);
		model.addAttribute("majorNoticeList", majorNoticeList);
		
		return "kkuapp/web/community/schoolinfo/majorNotice";
	}
	
	//???????????? ??????????????? 
	@RequestMapping(value="/majorNotice_view.do")
	public String majorNoticeView(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO, EgovKkuAppSchoolInfoCrawlerVO crawlerVO, ModelMap model) throws Exception {
		
		crawlerService.updateMNoticeViewcnt(crawlerVO.getNoticeIdx());
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
        String usrIdx = sessionVO.getUsrIdx(); // USR_IDX??? ????????????
        
        /* [?????? ???????????? ???????????? ???????????? ??????] */
        EgovMap egovMap = new EgovMap();
        egovMap.put("usrIdx", usrIdx);
        String noticeIdx = crawlerVO.getNoticeIdx();
        egovMap.put("noticeIdx", noticeIdx);
        EgovMap me = kkuUserService.selectUser2(usrIdx);
        
        /*
     	 [???????????? ?????? ?????? ?????? ??? ???????????? ??????]
    	 ?????? ?????? : KU_USER??? VIEW_CHECKING??? STRING?????? ?????? ???????????? IDX??? ???????????? ????????????
    	 if?????? contains ????????? ?????? ????????? ?????? ??????????????? VIEW_CHECKING??? ?????? idx??? ???????????? ?????? ?????? (kkuUserService.updateViewWho)
    	 JSP ??????????????? ${fn:contains(list, noticeIdx)}??? ???????????? ??????/????????? ?????? ????????? ??????
    	 '/majorNotice_viewCheck.do'??? ?????? ???????????? ???????????????.
        */
        String usrChecking = (String) me.get("viewChecking");
        boolean usrCheckingBool = usrChecking.contains(noticeIdx);
        if(!usrCheckingBool) {
        	System.err.println("--------?????? ???????????? ??????--------");
        	kkuUserService.updateViewWho(egovMap);
        }
      
        EgovMap usrInfo = kkuUserService.selectUsrInfoByUsrIdx(usrIdx);
        String usrMajor = (String) usrInfo.getValue(0);
		String url = majorNoticeService.getURL(usrMajor);
		
		int endIndex = 0;
		switch(usrMajor) {
		case "????????????":
			endIndex = url.indexOf("PostList");
			break;
		case "??????????????????":
			endIndex = url.indexOf("?c=BOARD");
			break;
		default:
			endIndex = url.indexOf("noticeList");
		}
		String srcurl = "src=\""+url.substring(0,endIndex);
		String hrefurl = "href=\""+url.substring(0,endIndex);
		
		crawlerVO.setSrcUrl(srcurl);
		crawlerVO.setHrefUrl(hrefurl);
        
        switch(usrMajor) {
		case "????????????????????????":
		case "??????????????????":
		case "????????????????????????":
		case "???????????????????????????":
		case "??????????????????":
			usrMajor = "?????????????????????";
			break;
		}
        
		EgovMap majorNotice = crawlerService.selectMajorNoticeByNum(crawlerVO);
		
		model.addAttribute("usrMajor",usrMajor);
		model.addAttribute("majorNotice",majorNotice);
		model.addAttribute("noticeIdx", crawlerVO.getNoticeIdx());
		
		List<?> users = kkuUserService.selectUserByMajor(usrMajor);
		model.addAttribute("users", users);
//        
//     	majorNoticeVO.setBoardDetailname(usrMajor);
//      model.addAttribute("usrRank", (String) usrInfo.getValue(1));
//        
//		String idx = majorNoticeVO.getBoardIdx();
//		model.addAttribute("majorNoticeVO", majorNoticeVO);
//		
//		model.addAttribute("majorNoticeInfo", majorNoticeService.selectBoardByIdx(majorNoticeVO));
//		model.addAttribute("fileList", majorNoticeService.selectBoardFileList(majorNoticeVO));
//		majorNoticeService.updateViewCnt(majorNoticeVO);
//
		
		return "kkuapp/web/community/schoolinfo/majorNotice_view";
	}
	
	//???????????? ????????? 
	@RequestMapping(value="/majorNotice_write.do")
	public String majorNoticeWrite(@ModelAttribute("majorNoticeVO") EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO, ModelMap model) throws Exception {
//		if(!majorNoticeVO.getBoardIdx().equals("")){
//			model.addAttribute("majorNoticeInfo", majorNoticeService.selectBoardByIdx(majorNoticeVO));
//			model.addAttribute("fileList", majorNoticeService.selectBoardFileList(majorNoticeVO));
//		}
//		
		
		return "kkuapp/web/community/schoolinfo/majorNotice_write";
	}
	
	@RequestMapping(value="/majorNotice_submit.do")
    @ResponseBody
	public String tradeProc(@ModelAttribute("majorNoticeVO") EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO,
			  			  MultipartHttpServletRequest mtfRequest,
			  			  ModelMap model, HttpServletRequest request) throws Exception {
    	
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();

		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		//userVO.setUsrIdx(sessionVO.getUsrIdx());
		String usrIdx = sessionVO.getUsrIdx();
		userVO.setUsrEmail(sessionVO.getUsrEmail());
		userVO.setUsrNickname(sessionVO.getUsrNickname());		
		userVO.setUsrIdx(sessionVO.getUsrIdx());		

		majorNoticeVO.setBoardWriter(userVO.getUsrEmail());
    	
    	String folderName = "Mboard";
 		String convertedFileName = "";
 		
 		
 		//?????? ?????????
 		
    	// mode??? ?????? ????????????
		if(majorNoticeVO.getMode().equals("reg")){

			
			//????????????
			majorNoticeService.insertBoard(majorNoticeVO);
			
			
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");

			
			int i = 1;
			// ????????? ?????????
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					//????????? userVO ?????? VO??? ??????
					//fileVO.setRegIdx(sessionVO.getUsrIdx());
					//fileVO.setRegName(sessionVO.getUsrNm());
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblIdx(majorNoticeVO.getBoardIdx());
					fileVO.setFileRegIdx(userVO.getUsrIdx());
					fileVO.setFileRegNick(userVO.getUsrNickname());
					if(mf.getContentType().toString().contains("image")){
						fileVO.setBfType("img");
					}else{
						fileVO.setBfType("file");
					}
					fileVO.setFileUsrFile(mf.getOriginalFilename());
					convertedFileName = EgovCmsFileUtil.fileSingleUpload(mf, folderName);
					fileVO.setFileSrvFile(convertedFileName);
					fileVO.setFileUsrFile(fileVO.getFileUsrFile() + "|" + (mf.getSize()/1024) + "KB");
					majorNoticeService.insertBoardFile(fileVO);
				}
			}
			
			
			return 1+"";  // ??? ????????????

		}else if(majorNoticeVO.getMode().equals("mod")){

			
			// ?????? ????????????
			if(majorNoticeVO.getDelArr() != null){	
				for(int i=0; i<majorNoticeVO.getDelArr().length; i++){
					if(majorNoticeVO.getDelArr()[i].equals("Y")){
						EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
						fileVO.setFileIdx(majorNoticeVO.getFileIdxArr()[i]);
						fileVO.setModIdx(userVO.getUsrIdx());
						fileVO.setModName(userVO.getUsrNickname());
						
						majorNoticeService.deleteBoardFile(fileVO);
					}
				}
			}
			// ???????????? ?????????
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");
			
			// ????????? ?????????
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					//????????? userVO ?????? VO??? ??????
					//fileVO.setRegIdx(sessionVO.getUsrIdx());
					//fileVO.setRegName(sessionVO.getUsrNm());
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblIdx(majorNoticeVO.getBoardIdx());
					fileVO.setFileRegIdx(userVO.getUsrIdx());
					fileVO.setFileRegNick(userVO.getUsrNickname());
					if(mf.getContentType().toString().contains("image")){
						fileVO.setBfType("img");
					}else{
						fileVO.setBfType("file");
					}
					fileVO.setFileUsrFile(mf.getOriginalFilename());
					convertedFileName = EgovCmsFileUtil.fileSingleUpload(mf, folderName);
					fileVO.setFileSrvFile(convertedFileName);
					fileVO.setFileUsrFile(fileVO.getFileUsrFile() + "|" + (mf.getSize()/1024) + "KB");
					majorNoticeService.insertBoardFile(fileVO);
				}
			}
			return 1+""; // ??? ????????????
		} else // ??????
			return 0+"";
	}
	
	@RequestMapping(value="/majorNotice_submit2.do")
	public String tradeProc2(@ModelAttribute("majorNoticeVO") EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO,
			  			  MultipartHttpServletRequest mtfRequest,
			  			  ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		

		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		//userVO.setUsrIdx(sessionVO.getUsrIdx());
		userVO.setUsrEmail(sessionVO.getUsrEmail());
		userVO.setUsrNickname(sessionVO.getUsrNickname());		
		userVO.setUsrIdx(sessionVO.getUsrIdx());		

		majorNoticeVO.setBoardWriter(userVO.getUsrEmail());


		majorNoticeService.deleteBoard(majorNoticeVO);
		
		return "redirect:majorNotice.do";
	}
	
	//???????????? ????????? ?????? 
	@RequestMapping(value="/majorNotice_changeAdmin.do")
	public String majorNoticeChangeAdmin(EgovKkuAppUserVO userVO, ModelMap model) throws Exception{
		
//		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
//				
//        String usrIdx = sessionVO.getUsrIdx();        
//        EgovMap usrInfo = kkuUserService.selectUsrInfoByUsrIdx(usrIdx);
//        String usrMajor = (String) usrInfo.getValue(0);
//        userVO.setUsrMajor(usrMajor);
//        
//        EgovMap admin = kkuUserService.selectAdminUserInfo(userVO);
//		
//		model.addAttribute("admin1", admin.getValue(0));
		
		return "kkuapp/web/community/schoolinfo/majorNotice_changeAdmin";
	}
	
	@RequestMapping(value="/majorNotice_changeAdminSubmit.do")
	public String majorNoticeChangeAdminSubmit() throws Exception{
		
		return "kkuapp/web/community/schoolinfo/majorNotice_changeAdmin";
	}
	
	// [????????? ??? ?????? ?????? ??????] (?????? ????????? ??? ???????????? '/majorNotice_view.do' ??????)
	@RequestMapping(value="/majorNotice_viewCheck.do")
	public String majorNotice_viewCheck(String filter, String noticeIdx, EgovKkuAppUserVO userVO, ModelMap model) throws Exception{
		
		String test = userVO.getUsrMajor();
		List<?> users = kkuUserService.selectUserByMajor(test);
		model.addAttribute("users", users);
		model.addAttribute("noticeIdx", noticeIdx);
		model.addAttribute("usrMajor", test);
		if(filter == null) {			
			filter = "all";
		}
		model.addAttribute("filter", filter);
		
		return "kkuapp/web/community/schoolinfo/majorNotice_view_check";
	}
		
}
