  package egovframework.kku.usr.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/*import org.openqa.selenium.WebElement;*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.com.cmm.EgovCmsFileUtil;
import egovframework.com.cmm.FcmSendPush;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityService;
import egovframework.kku.usr.service.EgovKkuAppAlarmVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityService;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuAppLicenseService;
import egovframework.kku.usr.service.EgovKkuAppLicenseVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppReplyVO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerService;
import egovframework.kku.usr.service.EgovKkuAppTaxiService;
import egovframework.kku.usr.service.EgovKkuAppTaxiVO;
import egovframework.kku.usr.service.EgovKkuAppTimetableService;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.kku.usr.service.EgovKkuLostService;
import egovframework.kku.usr.service.EgovKkuLostVO;
import egovframework.kku.usr.service.EgovKkuReportVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
									
@Controller									
public class EgovKkuAppCommunityController  {									
					
	@Resource(name="licenseService")								
	private EgovKkuAppLicenseService licenseService;
	
	@Resource(name="commService")								
	private EgovKkuAppCommunityService commService;
	
	@Resource(name = "kkucommunityService")
	private EgovKkuAdmCommunityService kkucommunityService;
	
	@Resource(name="kkuUserService")
	private EgovKkuAppUserService kkuUserService;
	
	@Resource(name="crawlerService")
	private EgovKkuAppSchoolInfoCrawlerService crawlerService;
								
	@Resource(name="timetableService")								
	private EgovKkuAppTimetableService timetableService;
	
	@Resource(name = "taxiService")
	private EgovKkuAppTaxiService taxiService;
	
	@Resource(name = "lostService")
	private EgovKkuLostService lostService;
	//자유게시판								
	@RequestMapping(value="/board.do")								
	public String board(@ModelAttribute("CommunityVO") EgovKkuAppCommunityVO CommunityVO, Model model) throws Exception {		
        String bname = "자유게시판";
		CommunityVO.setBoardDetailname(bname);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		CommunityVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(CommunityVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(CommunityVO.getPageUnit());
        paginationInfo.setPageSize(5);
        CommunityVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        CommunityVO.setLastIndex(paginationInfo.getLastRecordIndex());
        CommunityVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
       
        paginationInfo.setTotalRecordCount(commService.selectBoardListCnt(CommunityVO));
		List<?> boardList = commService.selectBoardList(CommunityVO);
		

        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("boardList", boardList);

		model.addAttribute("state","board");
		
    	
		return "kkuapp/web/community/board/board";
	}							
									
	//자유게시판 - 인기게시물								
	@RequestMapping(value="/boardTop.do")								
	public String boardTop(@ModelAttribute("CommunityVO") EgovKkuAppCommunityVO CommunityVO, Model model) throws Exception {		
		
        String bname = "자유게시판";
		CommunityVO.setBoardDetailname(bname);
		
	
		PaginationInfo paginationInfo = new PaginationInfo();
		CommunityVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(CommunityVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(CommunityVO.getPageUnit());
        paginationInfo.setPageSize(5);
        CommunityVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        CommunityVO.setLastIndex(paginationInfo.getLastRecordIndex());
        CommunityVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        paginationInfo.setTotalRecordCount(commService.selectBoardTopListCnt(CommunityVO));
		List<?> boardList = commService.selectBoardTopList(CommunityVO);

        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("boardList", boardList);
		
		model.addAttribute("state","boardTop");
    	
		return "kkuapp/web/community/board/board";
	}
	
	//자유게시판 상세페이지								
	@RequestMapping(value="board_view.do")								
	public String boardView(ModelMap model, EgovKkuAppCommunityVO Communityvo,HttpServletRequest request) throws Exception{								
		//댓글 리스트 제외 모든 정보 pararm boardIdx , boardName
		EgovKkuAppCommunityVO BoardListVO = new EgovKkuAppCommunityVO();
		BoardListVO  = commService.showBoardDetail(Communityvo); //해당 게시물 정보					
		commService.updateViewCnt(Communityvo);// 조회수 업데이트 
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String UsrID = sessionVO.getUsrEmail();

		Communityvo.setBoardName("Cboard");
		List<?> replyList = commService.getReplyList(Communityvo); //해당 게시물 댓글 리스트 가져오기 
		
		EgovKkuAppCommunityVO BoardLikeCheckVO = new EgovKkuAppCommunityVO();
		BoardLikeCheckVO = BoardListVO;
		BoardLikeCheckVO.setUsrId(UsrID);
		BoardLikeCheckVO.setBoardCode("1");
		int likeCheck = commService.chkLiked(BoardLikeCheckVO);//좋아요 체크
		
		model.addAttribute("fileList", commService.boardFileList(Communityvo));
		model.addAttribute("UsrID", UsrID);//세션값 전달 
		model.addAttribute("boardDetailList", BoardListVO);	//게시물 디테일 전달						
		model.addAttribute("likeCheck", likeCheck);	// 세션유저가 좋아요 했는지 안했는지 전달, 좋아요 눌렀으면 1 return 
		model.addAttribute("replyList", replyList);
		return "kkuapp/web/community/board/board_view";							
	}								
									
	@RequestMapping(value="/boardLike.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String boardLike(EgovKkuAppCommunityVO CommunityVO) throws Exception{
		CommunityVO.setBoardCode("1");
		String msg = "";
		if(commService.chkLiked(CommunityVO) != 0){
			msg = "already Liked";
		}
		else{
			if(commService.insertLike(CommunityVO)== null){
				msg =  "success";
			}
			
		}
		
		return msg;
	}
	@RequestMapping(value="/replyLike.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String replyLike(EgovKkuAppReplyVO replyVO) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		replyVO.setLikeUsrid(sessionVO.getUsrEmail());
		replyVO.setBoardCode(1);
		String msg = "";
		if(commService.chkReplyLiked(replyVO) != 0){
			msg = "already";
		}
		else{
			if(commService.insertReplyLike(replyVO)== null){
				msg =  "success";
			}
			
		}
		
		return msg;
	}
	@RequestMapping(value="/replyWrite.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String replyWrite(EgovKkuAppReplyVO replyVO,HttpServletRequest request) throws Exception{
	
		
		//댓글 작성시 알람 세팅 
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String alarmInsertResult="";
		if(sessionVO.getUsrEmail() != replyVO.getBoardWriter()){
			EgovKkuAppAlarmVO alarmVO = new EgovKkuAppAlarmVO();
			alarmVO.setAlarmReceiverid(replyVO.getBoardWriter());
			alarmVO.setRequestedId(replyVO.getReplyWriter()); 
			alarmVO.setBoardIdx(replyVO.getBoardIdx());
			alarmVO.setBoardDetailname(replyVO.getBoardDetailname());
			alarmVO.setAlarmType(0); //alarmtype 0 = 댓글알림 , 1 = 친추

			
			EgovKkuAppUserVO usrVO = new EgovKkuAppUserVO();
			usrVO.setUsrEmail(replyVO.getBoardWriter());
			EgovMap map = kkuUserService.selectUserDevice(usrVO); //get user fcmToken, OS type

			//fcmToken 이  존재하고, 댓글쓴사람과 게시글 작성자가 다를때 
			if(!(map == null) && replyVO.getReplyWriter() != replyVO.getBoardWriter()){
			
				String tokenId = map.get("registrationId").toString();
				String title = "[새로운 댓글이 달렸습니다]";
				String content = replyVO.getBoardTitle(); // 댓글달린 해당 게시물 제목 
				String url = "/board_view.do?boardIdx="+replyVO.getBoardIdx()+"&boardName="+replyVO.getBoardName();
				
				if(map.get("os").toString().equals("android")){    				
					FcmSendPush.pushFCMNotification(tokenId, title, content,url);
				}else{
					FcmSendPush.IOSpushFCMNotification(tokenId, title, content,url);
				}
			}
			
			//알람 세팅 끝
			alarmInsertResult = commService.insertAlarm(alarmVO);
		}
				
		String replyInsertResult = commService.replyInsert(replyVO);
		String msg = "";
		if(replyInsertResult == null && alarmInsertResult == null){
			msg = "success";
		}
		else{
			msg = "fail";
		}
		return msg;
	
	}
									
	//자유게시판 글작성								
	@RequestMapping(value="/board_write.do")								
	public String boardWrite(){				
		return "kkuapp/web/community/board/board_write";							
	}
	//글작성 ajax 
	@RequestMapping(value="/board_writeAction.do")
	@ResponseBody
	public String boardWriteAction(EgovKkuAppCommunityVO CommuniyVO,MultipartHttpServletRequest mtfRequest) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		CommuniyVO.setBoardWriter(sessionVO.getUsrEmail());
		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		userVO.setUsrEmail(sessionVO.getUsrEmail());
		userVO.setUsrNickname(sessionVO.getUsrNickname());		
		userVO.setUsrIdx(sessionVO.getUsrIdx());
		String folderName = "board";
 		String convertedFileName = "";
		String msg = "";
		commService.insertBoard(CommuniyVO);
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");
			int i = 1;
			// 이미지 업로드
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					//나중에 userVO 세션 VO로 수정
					//fileVO.setRegIdx(sessionVO.getUsrIdx());
					//fileVO.setRegName(sessionVO.getUsrNm());
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblCode(Integer.toString(1));
					fileVO.setFileTblIdx(Integer.toString(CommuniyVO.getBoardIdx()));
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
					commService.insertBoardFile(fileVO);
				}
			}
			msg = "success";
		
		return msg;
	}
				
	
	@RequestMapping(value="/board_modify.do")
	public String boardModify(EgovKkuAppCommunityVO CommuniyVO,Model model) throws Exception{
		EgovKkuAppCommunityVO BoardListVO  = commService.showBoardDetail(CommuniyVO);
		model.addAttribute("BoardListVO", BoardListVO);
		return "kkuapp/web/community/board/board_modify";	
	}
	@RequestMapping(value="/boardModifyAction.do")
	@ResponseBody
	public String boardModifyAction(EgovKkuAppCommunityVO CommuniyVO,MultipartHttpServletRequest mtfRequest,
			  ModelMap model, HttpServletRequest request) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String folderName = "board";
 		String convertedFileName = "";
		if(CommuniyVO.getDelArr() != null){	
			
			for(int i=0; i<CommuniyVO.getDelArr().length; i++){
				if(CommuniyVO.getDelArr()[i].equals("Y")){
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileIdx(CommuniyVO.getFileIdxArr()[i]);
					fileVO.setModIdx(sessionVO.getUsrIdx());
					fileVO.setModName(CommuniyVO.getUsrNickname());
					kkucommunityService.deleteBoardFile(fileVO);
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
							fileVO.setFileTblCode("1");
							commService.insertBoardFile(fileVO);
						}
					}
					
					commService.updateBoard(CommuniyVO);
					
					return 1+""; // 글 수정완료
					
				}
	//자유게시판 삭제 
	/*
	 *  param : boardIdx , boardDetailname
	 * */
	@RequestMapping(value="/boardDelete.do")
	@ResponseBody
	public String boardDelete(EgovKkuAppCommunityVO CommuniyVO,Model model) throws Exception{
		commService.updateBoardDelete(CommuniyVO);
		return "t";
	}
						
	
	@RequestMapping(value="/declar.do")
	public String declar(EgovKkuReportVO reportVO,Model model )throws Exception{
	

		if(reportVO.getReportTblCode().equals("0")){ //중고거래
			 EgovKkuAdmCommunityBoardVO boardVO =new EgovKkuAdmCommunityBoardVO();
			 boardVO.setTrdIdx(reportVO.getReportBoardIdx());
			 model.addAttribute("ReportTblCode", "0");
			 model.addAttribute("BoardListVOO", kkucommunityService.selectBoardByIdx(boardVO));
		}
		else if(reportVO.getReportTblCode().equals("1") ){ //자유게시판 신고시 
			
			EgovKkuAppCommunityVO BoardListVO = new EgovKkuAppCommunityVO();
			BoardListVO.setBoardIdx(Integer.parseInt(reportVO.getReportBoardIdx()));
			BoardListVO.setBoardName(reportVO.getBoardName());
			BoardListVO  = commService.showBoardDetail(BoardListVO);
		model.addAttribute("reportPageurl", reportVO.getReportPageurl());
			 model.addAttribute("ReportTblCode", "1");
			model.addAttribute("BoardListVO", BoardListVO);
		}
		else if(reportVO.getReportTblCode().equals("2")){ //강의정보 참고자료
			String reviewIdx = reportVO.getReportBoardIdx();
			
			EgovMap lectureInfo = timetableService.selectReviewByIdx(reviewIdx);
			
			model.addAttribute("LectureBoardListVO", lectureInfo);
			 model.addAttribute("ReportTblCode", "2");
		}
		else if(reportVO.getReportTblCode().equals("3")){ //택시합승
			EgovKkuAppTaxiVO taxiVO = new EgovKkuAppTaxiVO();
			taxiVO.setTaxiIdx(Integer.parseInt(reportVO.getReportBoardIdx()));
			EgovMap taxiInfo = taxiService.selectBoard(taxiVO);
			model.addAttribute("TaxiBoardListVO", taxiInfo);
			 model.addAttribute("ReportTblCode", "3");
		}
		else if(reportVO.getReportTblCode().equals("4")){ //분실불
		
			EgovKkuLostVO lostVO = new EgovKkuLostVO();
			lostVO.setLostIdx(reportVO.getReportBoardIdx());
			EgovMap lostInfo = lostService.selectLostByIdx(lostVO);
			if(reportVO.getReportPageurl()!=null){
				model.addAttribute("reportIdx",reportVO.getReportBoardIdx());
			}
			model.addAttribute("reportPageurl", reportVO.getReportPageurl());
			model.addAttribute("lostInfo",lostInfo );
			 model.addAttribute("ReportTblCode", "4");
		}else if(reportVO.getReportTblCode().equals("10")){ //분실불
		
			EgovKkuAppLicenseVO LicenseBoardListVO = new EgovKkuAppLicenseVO();
			LicenseBoardListVO.setBoardIdx(Integer.parseInt(reportVO.getReportBoardIdx()));
			LicenseBoardListVO.setSubjectCd(reportVO.getBoardName());
			EgovMap LicenseVO  = licenseService.selectBoardDetail(LicenseBoardListVO);
			model.addAttribute("reportPageurl", reportVO.getReportPageurl());
			model.addAttribute("ReportTblCode", "10");
			model.addAttribute("LicenseVO", LicenseVO);
		}
		
		
		return "kkuapp/web/community/board/declar";
		
	}
	
	@RequestMapping(value="/declarAction.do", produces="application/x-www-form-urlencoded; charset=euc-kr")
	@ResponseBody
	public String declarAction(EgovKkuReportVO reportVO)throws Exception{
		
		// 신고된 게시물 작성자  usrIdx 가져오기
		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		userVO.setUsrEmail(reportVO.getBoardWriter());
		userVO.setUsrIdx(reportVO.getBoardWriter());
		EgovMap usrMap = kkuUserService.selectUser(userVO);
		reportVO.setReporterIdx( usrMap.get("usrIdx").toString());
		
		// 신고자 정보 넣어주기 
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		reportVO.setWriterIdx(sessionVO.getUsrIdx());
		
		String insertResult = commService.insertReport(reportVO);
		if(insertResult==null){
			return "success";
		}
		else{
			return "fail";
		}
		
	}
}									
									
									
									
									
									
									