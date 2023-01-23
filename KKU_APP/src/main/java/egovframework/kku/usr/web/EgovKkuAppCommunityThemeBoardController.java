package egovframework.kku.usr.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.com.cmm.EgovCmsFileUtil;
import egovframework.com.cmm.FcmSendPush;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityService;
import egovframework.kku.usr.service.EgovKkuAppAlarmVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityService;
import egovframework.kku.usr.service.EgovKkuAppCommunityThemeBoardService;
import egovframework.kku.usr.service.EgovKkuAppCommunityThemeBoardVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppReplyVO;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuAppCommunityThemeBoardController {
	
	@Resource(name="commService")								
	private EgovKkuAppCommunityService commService;
	
	@Resource(name = "kkucommunityService")
	private EgovKkuAdmCommunityService kkucommunityService;
	
	@Resource(name="themeBoardService")
	private EgovKkuAppCommunityThemeBoardService themeBoardService;
	
	@Resource(name="kkuUserService")
	private EgovKkuAppUserService kkuUserService;
	
	//주제별게시판 목록								
	@RequestMapping(value="/themeboard_list.do")								
	public String themeBoardList(EgovKkuAppCommunityThemeBoardVO themeVO, Model model) throws Exception{
		
		List<?> themeBoardList = themeBoardService.selectThemeBoardList(themeVO);
		model.addAttribute("themeBoardList", themeBoardList);
		
		
		return "kkuapp/web/community/themeboard/themeboard_list";							
	}								
	//주제별게시판								
	@RequestMapping(value="/themeboard.do")								
	public String themeBoard(@ModelAttribute("themeVO") EgovKkuAppCommunityThemeBoardVO themeVO, Model model) throws Exception{
		Map<String,String> onOff = new HashMap<String,String>();
		onOff.clear();
		onOff.put("All", "on");
		onOff.put("Top", "off");
		model.addAttribute("onOff", onOff);
		String bname = themeVO.getBthemeName();
		themeVO.setTboardDetailname(bname);
		model.addAttribute("name", bname);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		themeVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(themeVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(themeVO.getPageUnit());
        paginationInfo.setPageSize(5);
        themeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        themeVO.setLastIndex(paginationInfo.getLastRecordIndex());
        themeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        paginationInfo.setTotalRecordCount(themeBoardService.selectBoardListCnt(themeVO));
        themeVO.setTboardDetailname(bname);
		List<?> boardList = themeBoardService.selectTBoardList(themeVO);

		model.addAttribute("boardList", boardList);


		return "kkuapp/web/community/themeboard/themeboard";							
	}
	@RequestMapping(value="themeboardTop.do")
	public String themeboardTop(@ModelAttribute("themeVO") EgovKkuAppCommunityThemeBoardVO themeVO,Model model) throws Exception {
		Map<String,String> onOff = new HashMap<String,String>();
		onOff.clear();
		onOff.put("All", "on");
		onOff.put("Top", "off");
		model.addAttribute("name", themeVO.getBthemeName());
		
		
		PaginationInfo paginationInfo = new PaginationInfo();
		themeVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(themeVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(themeVO.getPageUnit());
        paginationInfo.setPageSize(5);
        themeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        themeVO.setLastIndex(paginationInfo.getLastRecordIndex());
        themeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		
		 paginationInfo.setTotalRecordCount(themeBoardService.selectBoardTopListCnt(themeVO));
	     themeVO.setTboardDetailname(themeVO.getBthemeName());
	     List<?> topBoardList = themeBoardService.selectTopThemeBoardList(themeVO);
	     model.addAttribute("topBoardList", topBoardList);
	     model.addAttribute("paginationInfo", paginationInfo);
		return "kkuapp/web/community/themeboard/themeboardTop";
	}
									
	@RequestMapping(value="/themeboard_view.do")								
	public String themeBoardView(@ModelAttribute("themeVO") EgovKkuAppCommunityThemeBoardVO themeVO, Model model) throws Exception{								
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		EgovKkuAppCommunityThemeBoardVO Tvo = themeBoardService.selectTBoardDetail(themeVO);

		
		List<?> replyList = themeBoardService.selectTReplyList(themeVO);
		String sessionID = sessionVO.getUsrEmail();
		model.addAttribute("sessionID", sessionID);
		model.addAttribute("replyList", replyList);

		model.addAttribute("boardList", Tvo);
		return "kkuapp/web/community/themeboard/themeboard_view";							
	}
	//주제별게시판 글작성								
	@RequestMapping(value="/themeboard_write.do")								
	public String themeBoardWrite(@ModelAttribute("themeVO") EgovKkuAppCommunityThemeBoardVO themeVO, Model model ){								
		model.addAttribute("name", themeVO.getBthemeName());				
		return "kkuapp/web/community/themeboard/themeboard_write";							
	}								
	@RequestMapping(value="/themeboardWriteAction.do")
	@ResponseBody
	public String themeBoardWriteAction(@ModelAttribute("themeVO") EgovKkuAppCommunityThemeBoardVO themeVO,MultipartHttpServletRequest mtfRequest ) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		themeVO.setTboardWriter(sessionVO.getUsrEmail());
		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		userVO.setUsrEmail(sessionVO.getUsrEmail());
		userVO.setUsrNickname(sessionVO.getUsrNickname());		
		userVO.setUsrIdx(sessionVO.getUsrIdx());
		
		String folderName = "tboard";
 		String convertedFileName = "";
		String msg = "";
		themeBoardService.insertTboard(themeVO);
		
		List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");
		int i = 1;
		// 이미지 업로드
		for(MultipartFile mf : imgList) {
			if(mf.getSize()>0){
				//나중에 userVO 세션 VO로 수정
				//fileVO.setRegIdx(sessionVO.getUsrIdx());
				//fileVO.setRegName(sessionVO.getUsrNm());
				EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
				fileVO.setFileTblCode(Integer.toString(2));
				fileVO.setFileTblIdx(Integer.toString(themeVO.getTboardIdx()));
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
				commService.insertBoardFile(fileVO);
			}
		}
		msg = "success";
	
	return msg;
	}
	
	@RequestMapping(value="/themeboard_modify.do")	
	public String TboardModify(@ModelAttribute("themeVO") EgovKkuAppCommunityThemeBoardVO themeVO,Model model) throws Exception{
		EgovKkuAppCommunityThemeBoardVO Tvo = new EgovKkuAppCommunityThemeBoardVO();
		Tvo = themeBoardService.selectTBoardDetail(themeVO);
		themeVO.setFileTblCode(2);
		List<?> filelist = themeBoardService.boardFileList(themeVO);
		model.addAttribute("tboardVO", Tvo);
		model.addAttribute("fileList", filelist);
		return"kkuapp/web/community/themeboard/themeboard_modify";	
	}
	@RequestMapping(value="/themeboardModifyAction.do")
	@ResponseBody
	public String tboardModifyAction(MultipartHttpServletRequest mtfRequest,@ModelAttribute("themeVO") EgovKkuAppCommunityThemeBoardVO themeVO) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String folderName = "tboard";
 		String convertedFileName = "";
 		if(themeVO.getDelArr() != null){	
			
			for(int i=0; i<themeVO.getDelArr().length; i++){
				if(themeVO.getDelArr()[i].equals("Y")){
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileIdx(themeVO.getFileIdxArr()[i]);
					fileVO.setModIdx(sessionVO.getUsrIdx());
					fileVO.setModName(themeVO.getUsrNickname());
					kkucommunityService.deleteBoardFile(fileVO);
				}
			}
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");
			
			// 이미지 업로드
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					//나중에 userVO 세션 VO로 수정
					//fileVO.setRegIdx(sessionVO.getUsrIdx());
					//fileVO.setRegName(sessionVO.getUsrNm());
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblIdx(Integer.toString(themeVO.getTboardIdx()) );
					fileVO.setFileRegIdx(sessionVO.getUsrIdx());
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
					fileVO.setFileTblCode("2");
					commService.insertBoardFile(fileVO);
				}
			}
			
			themeBoardService.updateBoard(themeVO);
			
			return 1+""; // 글 수정완료
		}
		return "";
	}
	@RequestMapping(value="/TboardLike.do")
	@ResponseBody
	public String TboardLike(EgovKkuAppCommunityVO CommunityVO) throws Exception{
		CommunityVO.setBoardCode("2");
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
	@RequestMapping(value="/tboardreplyWrite.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String replyWrite(Model model, EgovKkuAppReplyVO replyVO,HttpServletRequest request) throws Exception{
	
		
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
			EgovMap map = kkuUserService.selectUserDevice(usrVO);
			
			String tokenId = map.get("registrationId").toString();
			String title = "["+ replyVO.getReplyContent() + "]";
			String content = "새로운 댓글이 달렸습니다";
			
			FcmSendPush FcmSendPush = new FcmSendPush();
			FcmSendPush.pushFCMNotification(tokenId, title, content,"/alarmList.do");
			//알람 세팅 끝
			alarmInsertResult = commService.insertAlarm(alarmVO);
			
			}
		String replyInsertResult = themeBoardService.insertTboardReply(replyVO);
		String msg = "";
		if(replyInsertResult == null && alarmInsertResult == null){
			msg = "success";
		}
		else{
			msg = "fail";
		}
		return msg;
	
		}
	//주제별게시판 게시판 생성								
	@RequestMapping(value="/themeboard_create.do")								
	public String themeBoardCreate(){								
									
		return "kkuapp/web/community/themeboard/themeboard_create";							
	}								
				
	//주제별게시판 - 전체 인기글 리스트 페이지 2022-07-03 추가 - 전체 인기글 						
	@RequestMapping(value="/totalFamousList.do")								
	public String total(EgovKkuAppCommunityThemeBoardVO themeVO, Model model) throws Exception{								
		
		List<?> HBoardList = themeBoardService.selectHBoardList(themeVO);
		
		model.addAttribute("BoardList", HBoardList);
		return "kkuapp/web/community/themeboard/totalFamousList";							
	}								
		
		
}
