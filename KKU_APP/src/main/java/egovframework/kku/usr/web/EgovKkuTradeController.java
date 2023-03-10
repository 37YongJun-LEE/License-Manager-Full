package egovframework.kku.usr.web;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.com.cmm.EgovCmsCommonUtil;
import egovframework.com.cmm.EgovCmsFileUtil;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityService;
import egovframework.kku.adm.service.EgovKkuAdmLikeVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppMypageService;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuTradeController {

	@Resource(name = "mypageService")
	private EgovKkuAppMypageService mypageService;
	
	@Resource(name = "kkucommunityService")
	private EgovKkuAdmCommunityService kkucommunityService;
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name="kkuUserService")
	private EgovKkuAppUserService userService;

	@RequestMapping(value="/trade/tradeList.do")
	public String tradeList(@ModelAttribute("boardVO") EgovKkuAdmCommunityBoardVO boardVO, 
			                ModelMap model, HttpServletRequest request) throws Exception {
        LocalDate date = LocalDate.now();
        String time = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HHmm"));
		
		EgovKkuAdmLikeVO likeVO = new EgovKkuAdmLikeVO();
		//??????????????????
		PaginationInfo paginationInfo = new PaginationInfo();
		boardVO.setPageUnit(8); // ????????? ??? ??????
        paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
        paginationInfo.setPageSize(5);
        boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
        boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		// trade
	    paginationInfo.setTotalRecordCount(kkucommunityService.selectBoardListCnt(boardVO));
	    
		model.addAttribute("tradeList", kkucommunityService.selectBoardList(boardVO));
		model.addAttribute("paginationInfo", paginationInfo);


		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		userVO.setUsrIdx(sessionVO.getUsrIdx());
		
		//????????? EgovMap ????????? ????????????.
		//???????????? addAttribute
		model.addAttribute("userInfo", mypageService.selectUserByIdx(sessionVO));
		
		
		
		// ?????? ?????????
		//model.addAttribute("userNoticeList", appUserService.userNoticeList(userVO));

		// ????????????
		//insertMenuLog(request, "?????? > ???????????? > ??????????????? ??????");
		

		//like
		likeVO.setUsrIdx(sessionVO.getUsrIdx());
		model.addAttribute("likeList", kkucommunityService.likeList(likeVO));
		

		return "kkuapp/web/trade/tradeList";
	}
	
	@RequestMapping(value="/trade/trade.do")
	public String tradeInfo(@ModelAttribute("boardVO") EgovKkuAdmCommunityBoardVO boardVO, 
			              @ModelAttribute("userVO") EgovKkuAppUserVO userVO,
			              @ModelAttribute("likeVO") EgovKkuAdmLikeVO likeVO,
			              ModelMap model, HttpServletRequest request) throws Exception {
		

		//?????? ??????
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();

		userVO.setUsrIdx(sessionVO.getUsrIdx());
		model.addAttribute("userVO", userVO);
		
		//like
		likeVO.setUsrIdx(sessionVO.getUsrIdx());
		likeVO.setTrdIdx(boardVO.getTrdIdx());
		
		//trade
		model.addAttribute("likeInfo", kkucommunityService.selectLike(likeVO));
		model.addAttribute("tradeInfo", kkucommunityService.selectBoardByIdx(boardVO));
		model.addAttribute("fileList", kkucommunityService.boardFileList(boardVO));
		model.addAttribute("sessionVO", sessionVO);

		return "kkuapp/web/trade/trade";
	}

	
	@RequestMapping(value="/trade/tradeWrite.do")
	public String tradeWrite(@ModelAttribute("boardVO") EgovKkuAdmCommunityBoardVO boardVO,  
			               ModelMap model, HttpServletRequest request) throws Exception {
		boardVO.setFileTblCode("0");
		if(!boardVO.getTrdIdx().equals("")){
			model.addAttribute("tradeInfo", kkucommunityService.selectBoardByIdx(boardVO));
			model.addAttribute("fileList", kkucommunityService.boardFileList(boardVO));
		}
		
		return "kkuapp/web/trade/tradeWrite";
	}
	
	@RequestMapping(value="/trade/tradeProc.do")
    @ResponseBody
	public String tradeProc(@ModelAttribute("boardVO") EgovKkuAdmCommunityBoardVO boardVO,
			  			  MultipartHttpServletRequest mtfRequest,
			  			  ModelMap model, HttpServletRequest request) throws Exception {
    	
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		//userVO.setUsrIdx(sessionVO.getUsrIdx());
		userVO.setUsrEmail(sessionVO.getUsrEmail());
		userVO.setUsrNickname(sessionVO.getUsrNickname());		
		userVO.setUsrIdx(sessionVO.getUsrIdx());		

    	boardVO.setTrdWriter(userVO.getUsrEmail());
    	boardVO.setTrdUsrnick(userVO.getUsrNickname());
    	boardVO.setTrdUsrIdx(userVO.getUsrIdx());
    	
    	String folderName = "trade";
 		String convertedFileName = "";
 		
 		
 		//?????? ?????????
 		
    	// mode??? ?????? ????????????
		if(boardVO.getMode().equals("reg")){
			
			//????????????
			kkucommunityService.insertBoard(boardVO);
			
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");

			
			int i = 1;
			// ????????? ?????????
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					checkImageSize(mf);
					//????????? userVO ?????? VO??? ??????
					//fileVO.setRegIdx(sessionVO.getUsrIdx());
					//fileVO.setRegName(sessionVO.getUsrNm());
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblIdx(boardVO.getTrdIdx());
					fileVO.setFileRegIdx(userVO.getUsrIdx());
					fileVO.setFileRegNick(userVO.getUsrNickname());
					//
					String type = mf.getContentType();
		            //BufferedImage resizeImagePng = resizeImage(mf, type);
					//
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
					kkucommunityService.insertBoardFile(fileVO);
				}
			}
			
			
			return 1+"";  // ??? ????????????

		}else if(boardVO.getMode().equals("mod")){

			
			// ?????? ????????????
			if(boardVO.getDelArr() != null){	
				for(int i=0; i<boardVO.getDelArr().length; i++){
					if(boardVO.getDelArr()[i].equals("Y")){
						EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
						fileVO.setFileIdx(boardVO.getFileIdxArr()[i]);
						fileVO.setModIdx(userVO.getUsrIdx());
						fileVO.setModName(userVO.getUsrNickname());
						
						kkucommunityService.deleteBoardFile(fileVO);
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
					fileVO.setFileTblIdx(boardVO.getTrdIdx());
					fileVO.setFileRegIdx(userVO.getUsrIdx());
					fileVO.setFileRegNick(userVO.getUsrNickname());
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
					kkucommunityService.insertBoardFile(fileVO);
				}
			}
			
			kkucommunityService.updateBoard(boardVO);
			
			return 1+""; // ??? ????????????
			
		} else // ??????
			return 0+"";
	}
	
	// ajax??? ?????? submit ????????? ???????????? ??????
	@RequestMapping(value="/trade/tradeProc2.do")
	public String tradeProc2(@ModelAttribute("boardVO") EgovKkuAdmCommunityBoardVO boardVO,
			  			  MultipartHttpServletRequest mtfRequest,
			  			  ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();


		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		//userVO.setUsrIdx(sessionVO.getUsrIdx());
		userVO.setUsrEmail(sessionVO.getUsrEmail());
		userVO.setUsrNickname(sessionVO.getUsrNickname());		
		userVO.setUsrIdx(sessionVO.getUsrIdx());		

    	boardVO.setTrdWriter(userVO.getUsrEmail());
    	boardVO.setTrdUsrnick(userVO.getUsrNickname());
    	boardVO.setTrdUsrIdx(userVO.getUsrIdx());
		
		if(boardVO.getMode().equals("del")){
			//??????

			kkucommunityService.deleteBoard(boardVO);
			return "redirect:/mypage/myTrade01.do";
		}else{
			kkucommunityService.staUpdateBoard(boardVO);
			return "redirect:/mypage/myTrade01.do";
			
		}
	}
	

	@RequestMapping(value="/trade/tradeProc3.do")
    @ResponseBody
	public String tradeProc3(@ModelAttribute("boardVO") EgovKkuAdmCommunityBoardVO boardVO,
			  ModelMap model, HttpServletRequest request) throws Exception {

		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();

    	boardVO.setTrdWriter(sessionVO.getUsrIdx());
		
		if(boardVO.getMode().equals("update")){
			

			if(boardVO.getTrdStatus().equals("3")){
				kkucommunityService.staUpdateBoard(boardVO);
				return 3+"";
			}
			kkucommunityService.staUpdateBoard(boardVO);
			//??????????????? ???????????? ?????? ???????????????
			return 2+"";
		}else{
		
			return 0+"";
		}
	}
	
	@RequestMapping(value="/trade/saveLike.do")
	public String saveLike(@ModelAttribute("likeVO") EgovKkuAdmLikeVO likeVO,
			  			  ModelMap model, HttpServletRequest request) throws Exception {
    	
		//EgovKpcAppLoginSessionVO sessionVO = (EgovKpcAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String mode = request.getParameter("mode");
		
		likeVO.setTrdIdx(request.getParameter("trdIdx"));
		likeVO.setUsrIdx(request.getParameter("usrIdx"));
		// mode??? ?????? ????????????
		if(mode.equals("on")){
			kkucommunityService.insertLike(likeVO);
		} else if(mode.equals("off")){
			kkucommunityService.deleteLike(likeVO);
		}
		return "kkuapp/web/trade/trade";
	}
	
	
	
/*
	@RequestMapping(value="upload.do")
	public String upload(@ModelAttribute("boardVO") EgovKkuAdmCommunityBoardVO boardVO,  
			               ModelMap model, HttpServletRequest request) throws Exception {

		
		//EgovKpcAppLoginSessionVO sessionVO = (EgovKpcAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		//EgovKpcAdmUserVO userVO = new EgovKpcAdmUserVO();
		//userVO.setUsrIdx(sessionVO.getUsrIdx());
		// ?????? ?????????
		//model.addAttribute("userNoticeList", appUserService.userNoticeList(userVO));
		
		

		return "kkuapp/web/trade/upload";
	}	
	*/
	
	
	private void checkImageSize(MultipartFile file) {
		  try {
		    BufferedImage bufferedImage = ImageIO.read(file.getInputStream());
		    int width = bufferedImage.getWidth();
		    int height = bufferedImage.getHeight();
		  } catch (IOException e) {
		     e.printStackTrace();
		  }
		}		

	


}
