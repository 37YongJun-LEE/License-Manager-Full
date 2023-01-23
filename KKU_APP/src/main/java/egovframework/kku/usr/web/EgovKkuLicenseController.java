package egovframework.kku.usr.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.com.cmm.EgovCmsFileUtil;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuAppLicenseService;
import egovframework.kku.usr.service.EgovKkuAppLicenseVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuLicenseController {
	
	@Resource(name="licenseService")								
	private EgovKkuAppLicenseService licenseService;

	@RequestMapping(value="/licenseMain.do")
	public String licenseMain(HttpServletResponse response, EgovKkuAppLicenseVO interestVO, ModelMap model, HttpServletRequest request) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		EgovKkuAppLicenseVO recoVO = new EgovKkuAppLicenseVO();
		
		interestVO.setUsrIdx(sessionVO.getUsrIdx());
		recoVO.setUsrIdx(sessionVO.getUsrIdx());
		
		interestVO.setFirstIndex(0);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		interestVO.setPageUnit(8);
		
        paginationInfo.setCurrentPageNo(interestVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(interestVO.getPageUnit());
        paginationInfo.setPageSize(5);
        
        interestVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        interestVO.setLastIndex(paginationInfo.getLastRecordIndex());
        interestVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        paginationInfo.setTotalRecordCount(licenseService.selectLicenseListCnt(interestVO));
		
		List interestings = licenseService.selectAllLicenseData(interestVO);
		List recos  = licenseService.selectUniReco(recoVO);
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("interestings", interestings);
		model.addAttribute("recoItems", recos);
		
		return "kkuapp/web/license/licenseMain";
	}
	
	@RequestMapping(value="/licenseView.do")
	public String licenseView(@ModelAttribute("licenseVO") EgovKkuAppLicenseVO licenseVO, HttpServletResponse response,
			 ModelMap model, HttpServletRequest request) throws Exception {
		//EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		licenseVO.setUsrIdx(sessionVO.getUsrIdx());
		
		//view에선 2개 까지만 출력
		licenseVO.setIsLimit(1);
		//자격증정보
		EgovMap licenseSub = licenseService.selectLicenseSubject(licenseVO);
		List<?> licenseQual = licenseService.selectLicenseQual(licenseVO);	
		System.err.println("licenseSub="+licenseSub.toString());
		System.err.println("licenseQual="+licenseQual.toString());
		model.addAttribute("licenseSub",licenseSub);
		model.addAttribute("licenseQual",licenseQual);

		//자격증 날짜
		List<EgovMap> licenseDate = licenseService.selectLicenseDateList (licenseVO);
		System.err.println("licenseDate="+licenseDate.toString());
		model.addAttribute("licenseDate",licenseDate);
		
		//추천자격증이 없는 경우 0 return
		int isLicenseInterest = licenseService.selectInterestCnt(licenseSub);
		System.err.println("Cnt="+isLicenseInterest);
		
		//추천자격증
		if(isLicenseInterest != 0) {
			EgovMap licenseInterest = licenseService.selectLicenseInterest(licenseSub);
			model.addAttribute("licenseInterest", licenseInterest);
			licenseInterest.put("usrIdx", sessionVO.getUsrIdx());
			System.err.println("licenseInterest="+licenseInterest.toString());
			
			
			//추천자격증 리스트
			List<EgovMap> licenseInterestSub = licenseService.selectLicenseInterestSub(licenseInterest);
			model.addAttribute("licenseInterestSub",licenseInterestSub);
			System.err.println("licenseInterestSub="+licenseInterestSub.toString());
			
		}
		
		
		
		//자료실 출력
		List<?> flist = licenseService.selectLicenseFiles(licenseVO);
		model.addAttribute("flist", flist );
		System.err.println("flist="+flist.toString());
		
		//게시판 출력
		List<?> boardList = licenseService.selectBoardList(licenseVO);
		
		System.err.println("licenseVO="+licenseVO);
		
		model.addAttribute("vo", licenseVO);
		model.addAttribute("boardList", boardList);
		
		// List dates = licenseService.selectAllDate(licenseVO);
		// model.addAttribute("dates", dates);
		
		return "kkuapp/web/license/licenseView";
	}
	
	@RequestMapping(value="/licenseDate.do")
	public String licenseDate(@ModelAttribute("licenseVO") EgovKkuAppLicenseVO licenseVO, HttpServletResponse response,
			 ModelMap model, HttpServletRequest request) throws Exception {
		//페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setPageSize(8);
		paginationInfo.setRecordCountPerPage(8);
		paginationInfo.setCurrentPageNo(licenseVO.getPageIndex());
		licenseVO.setPageUnit(8);
		licenseVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		licenseVO.setLastIndex(paginationInfo.getLastRecordIndex());
        
        paginationInfo.setTotalRecordCount(licenseService.selectDateListCnt(licenseVO));
        model.addAttribute("paginationInfo", paginationInfo);
		
		
        model.addAttribute("vo", licenseVO);
		//자격증정보
		EgovMap sub = licenseService.selectLicenseSubject(licenseVO);
		model.addAttribute("sub",sub);

		//자격증 날짜
		List<EgovMap> licenseDate = licenseService.selectLicenseDateList (licenseVO);
		System.err.println("licenseDate="+licenseDate.toString());
		if(licenseDate != null) {
			model.addAttribute("licenseDate",licenseDate);
		}
		//추천자격증이 없는 경우 0 return
		int isLicenseInterest = licenseService.selectInterestCnt(sub);
		System.err.println("Cnt="+isLicenseInterest);
		
		return "kkuapp/web/license/licenseDate";
	}
	@RequestMapping(value="/licenseRecommend.do")
	public String licenseRec(@ModelAttribute("licenseVO") EgovKkuAppLicenseVO licenseVO, HttpServletResponse response,
			 ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		licenseVO.setUsrIdx(sessionVO.getUsrIdx());
		
		EgovMap sub  = licenseService.selectLicenseSubject(licenseVO);
		model.addAttribute("sub",sub);
		//페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setPageSize(8);
		paginationInfo.setRecordCountPerPage(8);
		paginationInfo.setCurrentPageNo(licenseVO.getPageIndex());
		licenseVO.setPageUnit(8);
		licenseVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		licenseVO.setLastIndex(paginationInfo.getLastRecordIndex());
		
        paginationInfo.setTotalRecordCount(licenseService.selectInterestCnt(sub));
        model.addAttribute("paginationInfo", paginationInfo);
		
		
		//자격증 날짜
		List<EgovMap> licenseDate = licenseService.selectLicenseDateList (licenseVO);
		System.err.println("licenseDate="+licenseDate.toString());
		if(licenseDate != null) {
			model.addAttribute("licenseDate",licenseDate);
		}
		//추천자격증이 없는 경우 0 return
		int isLicenseInterest = licenseService.selectInterestCnt(sub);
		System.err.println("Cnt="+isLicenseInterest);
		
		//추천자격증
		if(isLicenseInterest != 0) {
			EgovMap licenseInterest = licenseService.selectLicenseInterest(sub);
			model.addAttribute("licenseInterest", licenseInterest);
			licenseInterest.put("usrIdx", sessionVO.getUsrIdx());
			System.err.println("licenseInterest="+licenseInterest.toString());
			
			//추천자격증 리스트
			List<EgovMap> licenseInterestSub = licenseService.selectLicenseInterestSub(licenseInterest);
			model.addAttribute("licenseInterestSub",licenseInterestSub);
			
		}
		
		
		model.addAttribute("vo", licenseVO);
		
		return "kkuapp/web/license/licenseRecommend";
	}
	
	@RequestMapping(value="/licenseReg")
	public String licenseReg(EgovKkuAppLicenseVO vo, Model model) throws Exception{
		List<EgovMap> list = licenseService.selectLicenseList(vo);
		System.err.println("list==="+list);
		model.addAttribute("list",list);
		
		
		return "kkuapp/web/license/licenseReg";
	}
	
	@RequestMapping(value="/licenseSearch")
	public String licenseSearch(@ModelAttribute("licenseVO") EgovKkuAppLicenseVO licenseVO, Model model) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		PaginationInfo paginationInfo = new PaginationInfo();
		licenseVO.setPageUnit(8); // 게시물 수 설정
		
        paginationInfo.setCurrentPageNo(licenseVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(licenseVO.getPageUnit());
        paginationInfo.setPageSize(5);
        licenseVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        licenseVO.setLastIndex(paginationInfo.getLastRecordIndex());
        licenseVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        paginationInfo.setTotalRecordCount(licenseService.selectLicenseListCnt(licenseVO));
		
		// licenseVO.setUsrIdx(sessionVO.getUsrIdx());
		List<?> list  = licenseService.selectAllLicenseData(licenseVO);
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("list", list);
		return "kkuapp/web/license/licenseSearch";
	}
	
	@RequestMapping(value="/license/alert", method=RequestMethod.POST, produces="application/json; charset=utf8")
	@ResponseBody
	public String toggleAlert(EgovKkuAppLicenseVO licenseVO) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		licenseVO.setUsrIdx(sessionVO.getUsrIdx());
		
		try {
			licenseService.toggleAlert(licenseVO);
			
			return "{ \"success\": true, \"state\": \"" + licenseService.getAlertState(licenseVO) + "\" }";
		} catch (Exception e) {
			return "{ \"success\": false, \"message\": '" + e.toString() + "' }";
		}
	}
	
	@RequestMapping(value="/license/sinterest", method=RequestMethod.POST, produces="application/json; charset=utf8")
	@ResponseBody
	public String insertSInterest(EgovKkuAppLicenseVO licenseVO) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		licenseVO.setUsrIdx(sessionVO.getUsrIdx());
		
		if (licenseService.hasSInterest(licenseVO)) {
			return "{ \"success\": false, \"message\": \"이미 등록되었습니다.\" }";
		}
		
		try {
			if (licenseService.reviveSInterest(licenseVO) < 1) {
				licenseService.insertSInterest(licenseVO);
			}
			
			return "{ \"success\": true }";
		} catch (Exception e) {
			return "{ \"success\": false, \"message\": \"다시 시도해주세요.\" }";
		}
	}
	
	@RequestMapping(value="/license/sinterest", method=RequestMethod.DELETE, produces="application/json; charset=utf8")
	@ResponseBody
	public String deleteSInterest(@RequestBody String data) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		Gson gson = new GsonBuilder().create();
		
		EgovKkuAppLicenseVO licenseVO = gson.fromJson(data, EgovKkuAppLicenseVO.class);
		licenseVO.setUsrIdx(sessionVO.getUsrIdx());
		
		try {
			licenseService.deleteSInterest(licenseVO);
			
			return "{ \"success\": true }";
		} catch (Exception e) {
			return "{ \"success\": false }";
		}
	}
	
	@RequestMapping(value="/licenseFileBoard.do")
	public  String licenseFileBoard(@ModelAttribute("licenseVO") EgovKkuAppLicenseVO licenseVO, Model model) throws Exception {
		//페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setPageSize(8);
		paginationInfo.setRecordCountPerPage(8);
		paginationInfo.setCurrentPageNo(licenseVO.getPageIndex());
		licenseVO.setPageUnit(8);
		licenseVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		licenseVO.setLastIndex(paginationInfo.getLastRecordIndex());
        
        paginationInfo.setTotalRecordCount(licenseService.selectFilesListCnt(licenseVO));
        model.addAttribute("paginationInfo", paginationInfo);
		
		
		List<?> fileList = licenseService.selectLicenseFiles(licenseVO);
		System.err.println("licenseVO=="+licenseVO.toString());
		EgovMap sub = licenseService.selectLicenseSubject(licenseVO);
		
		model.addAttribute("sub",sub);
		model.addAttribute("vo", licenseVO);
		model.addAttribute("fileList",fileList);
		System.err.println("fileList=="+fileList.toString());
		
		return "kkuapp/web/license/licenseFileBoard";
	}
	
	@RequestMapping(value="/licenseFileView.do")
	public String licenseFileView(@ModelAttribute("licenseVO") EgovKkuAppLicenseVO licenseVO, Model model) throws Exception{
		
		EgovMap fileDetail = licenseService.selectFileDetail(licenseVO);
		List<?> fileDetailList = licenseService.selectFileDetailList(licenseVO);
		System.err.println("fileDetail=="+fileDetail.toString());
		
		model.addAttribute("fileDetail", fileDetail);
		model.addAttribute("fileList", fileDetailList);
		
		
		return "kkuapp/web/license/licenseFileView";
	}
	//파일 다운로드
	@RequestMapping(value="/licenseFileDownload.do")
	public void licenseFileDownload(@ModelAttribute("licenseVO") EgovKkuAppLicenseVO licenseVO, Model model, HttpServletResponse response) throws Exception{
		
		//파일 다운로드인 경우
		System.err.println("licenseVO.getIsLimit" + licenseVO.getIsLimit());
		EgovMap detail = licenseService.selectFileDetailForDown(licenseVO);
		
		//파일경로
		String globalPath = EgovProperties.getProperty("Globals.fileStorePath");
		String filePath = globalPath+"licenseFiles/";
		
		String fileName = (String) detail.get("quesFileName");
		System.err.println("fileName"+fileName);
		String contentType = "";
		// 파일명별 contentType zip, pdf, jpg
		String fileType = fileName.substring(fileName.lastIndexOf(".")+1);
		System.err.println("fileType = "+fileType);
		switch (fileType) {
			case "zip":
				contentType = "application/zip";
			case "pdf":
				contentType = "application/pdf";
			case "jpg":
				contentType = "image/img";
			case "hwp":
				contentType = "application/hwp";
			default:
				contentType = "application/"+fileType;
		}
//		if (fileName.charAt(fileName.length()-1) == 'p') {
//			contentType = "application/zip";
//		}else if(fileName.charAt(fileName.length()-1) == 'f') {
//			contentType = "application/pdf";
//		}else if(fileName.charAt(fileName.length()-1) == 'g') {
//			contentType = "image/img";
//		}
		
		System.err.println("contentType = "+contentType);
		File file = new File(filePath+fileName);
		
		int fileLength = (int) file.length();
		
		if(fileLength > 0) {
			response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName, "UTF-8") + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Content-Type", contentType);
			response.setHeader("Content-Length", "" + fileLength);
			response.setHeader("Pragma", "no-cache;");
			response.setHeader("Expires", "-1;");

			try(
					FileInputStream fis = new FileInputStream(filePath+fileName);
					OutputStream out = response.getOutputStream();
					){
				int readCount = 0;
				byte[] buffer = new byte[1024];
				while((readCount = fis.read(buffer)) != -1){
					out.write(buffer,0,readCount);
				}
			}catch(Exception ex){
				throw new RuntimeException("file Save Error");
			}
		}
		
	}
	
	
	@RequestMapping(value="/licenseBoard.do")
	public String licenseBoard(@ModelAttribute("licenseVO") EgovKkuAppLicenseVO licenseVO, Model model) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		licenseVO.setUsrIdx(sessionVO.getUsrIdx());
		//checkAuth = 1(등록되어있는 계정)
		int checkAuth = licenseService.checkAuth(licenseVO);
		model.addAttribute("checkAuth", checkAuth);
		System.err.println("checkAuth"+checkAuth);
		
		//페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setPageSize(8);
		paginationInfo.setRecordCountPerPage(8);
		paginationInfo.setCurrentPageNo(licenseVO.getPageIndex());
		licenseVO.setPageUnit(8);
		licenseVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		licenseVO.setLastIndex(paginationInfo.getLastRecordIndex());
        
        paginationInfo.setTotalRecordCount(licenseService.selectBoardListCnt(licenseVO));
        model.addAttribute("paginationInfo", paginationInfo);
		
		List<?> boardList = licenseService.selectBoardList(licenseVO);
		EgovMap sub = licenseService.selectLicenseSubject(licenseVO);
		model.addAttribute("boardList", boardList);
		System.err.println("boardList=="+boardList);
		model.addAttribute("vo", licenseVO);
		model.addAttribute("sub", sub);
		
		
		return "kkuapp/web/license/licenseBoard";
	}
	@RequestMapping(value="/licenseBoardView.do")
	public String licenseBoardView(@ModelAttribute("licenseVO") EgovKkuAppLicenseVO licenseVO, Model model) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String UsrID = sessionVO.getUsrEmail();
		
		//subjectCd, boardIdx
		EgovMap boardDetail = licenseService.selectBoardDetail(licenseVO);
		licenseService.updateViewCnt(licenseVO);
		
		

		licenseVO.setUsrIdx(sessionVO.getUsrIdx());
		//checkAuth = 1(등록되어있는 계정)
		int checkAuth = licenseService.checkAuth(licenseVO);
		model.addAttribute("checkAuth", checkAuth);
		System.err.println("checkAuth"+checkAuth);
		
		
		List<?> replyList = licenseService.getBoardReplyList(licenseVO);
		
		licenseVO.setBoardWriter(UsrID);
		int likeCheck = licenseService.likeCnt(licenseVO);
		System.err.println("likeCheck=="+likeCheck);
		
		EgovMap sub = licenseService.selectLicenseSubject(licenseVO);
		
		
		System.err.println("Vo="+licenseVO.toString());
		System.err.println("boardDetail =" + boardDetail.toString());
		
		model.addAttribute("fileList", licenseService.boardFileList(licenseVO));
		model.addAttribute("sub", sub);
		model.addAttribute("likeCheck", likeCheck);
		model.addAttribute("boardDetail", boardDetail);
		model.addAttribute("UsrID",UsrID);
		model.addAttribute("replyList", replyList);
		
		return "kkuapp/web/license/licenseBoardView";
	}
	
	
//	@RequestMapping(value="/licenseBoardLike.do",produces = "application/text; charset=utf8")
//	@ResponseBody
//	public String boardLike(EgovKkuAppLicenseVO licenseVO) throws Exception{
//		
//		licenseVO.setBoardCode("3");
//		String msg = "";
//		System.err.println("licenseService.likeCnt(licenseVO)"+licenseService.likeCnt(licenseVO));
//		if(licenseService.likeCnt(licenseVO) != 0){
//			msg = "already Liked";
//		}
//		else{
//			if(licenseService.insertLike(licenseVO) == null){
//				msg =  "success";
//			}
//			
//		}
//		
//		return msg;
//	}

	@RequestMapping(value="/licenseBoardDelete.do")
	@ResponseBody
	public String boardDelete(EgovKkuAppLicenseVO licenseVO,Model model) throws Exception{
		licenseService.updateBoardDelete(licenseVO);
		return "t";
	}
	
	@RequestMapping(value="/licenseBoardModify.do")
	public String boardModify(EgovKkuAppLicenseVO licenseVO,Model model) throws Exception{
		EgovMap boardDetail  = licenseService.selectBoardDetail(licenseVO);
		EgovMap sub = licenseService.selectLicenseSubject(licenseVO);
		System.err.println("sub"+sub);
		
		model.addAttribute("sub", sub);
		model.addAttribute("boardDetail", boardDetail);
		
		return "kkuapp/web/license/licenseBoardModify";	
	}
	@RequestMapping(value="/licenseBoardModifyAction.do")
	@ResponseBody
	public String boardModifyAction(EgovKkuAppCommunityVO CommuniyVO,MultipartHttpServletRequest mtfRequest,
			  ModelMap model, HttpServletRequest request) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String folderName = "licenseBoard";
 		String convertedFileName = "";
 		System.err.println("communityVO == "+CommuniyVO);
		if(CommuniyVO.getDelArr() != null){	
			
			for(int i=0; i<CommuniyVO.getDelArr().length; i++){
				if(CommuniyVO.getDelArr()[i].equals("Y")){
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileIdx(CommuniyVO.getFileIdxArr()[i]);
					fileVO.setModIdx(sessionVO.getUsrIdx());
					fileVO.setModName(CommuniyVO.getUsrNickname());
					licenseService.deleteBoardFile(fileVO);
				}
			}
		}
		
		// 신규파일 업로드
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");
			
			// 이미지 업로드
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					//나중에 userVO 세션 VO로 수정
					//fileVO.setRegIdx(sessionVO.getUsrIdx());
					//fileVO.setRegName(sessionVO.getUsrNm());
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblIdx(Integer.toString(CommuniyVO.getBoardIdx()) );
					fileVO.setFileRegIdx(sessionVO.getUsrIdx());
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
					fileVO.setFileTblCode("10");
					licenseService.insertLicenseBoardFile(fileVO);
				}
			}
			
			licenseService.updateBoard(CommuniyVO);
			
			return 1+""; // 글 수정완료
			
	}
	
	
	@RequestMapping(value="/licenseBoardWrite.do")
	public String licenseBoardWrite(EgovKkuAppLicenseVO licenseVO, Model model) throws Exception {
		EgovMap sub = licenseService.selectLicenseSubject(licenseVO);
		model.addAttribute("sub", sub);
		
		return "kkuapp/web/license/licenseBoardWrite";
	}
	
	@RequestMapping(value="/licenseBoardWriteAction.do")
	@ResponseBody
	public String licenseBoardWriteAction(EgovKkuAppLicenseVO licenseVO,MultipartHttpServletRequest mtfRequest) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		EgovMap sub = licenseService.selectLicenseSubject(licenseVO);
		
		licenseVO.setBoardWriter(sessionVO.getUsrEmail());
		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		userVO.setUsrEmail(sessionVO.getUsrEmail());
		userVO.setUsrNickname(sessionVO.getUsrNickname());		
		userVO.setUsrIdx(sessionVO.getUsrIdx());
		String folderName = "licenseBoard";
 		String convertedFileName = "";
		String msg = "";
		licenseService.insertLicenseBoard(licenseVO);
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");
			int i = 1;
			// 이미지 업로드
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					//나중에 userVO 세션 VO로 수정
					//fileVO.setRegIdx(sessionVO.getUsrIdx());
					//fileVO.setRegName(sessionVO.getUsrNm());
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblCode(Integer.toString(10));
					fileVO.setFileTblIdx(Integer.toString(licenseVO.getBoardIdx()));
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
					licenseService.insertLicenseBoardFile(fileVO);
				}
			}
			msg = "success";
		
		return msg;
	}
	
}
