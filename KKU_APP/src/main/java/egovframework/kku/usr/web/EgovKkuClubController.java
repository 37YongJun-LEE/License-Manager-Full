package egovframework.kku.usr.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.h2.api.DatabaseEventListener;
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
import egovframework.kku.adm.service.EgovKkuAdmCommunityService;
import egovframework.kku.usr.service.EgovKkuAppClubService;
import egovframework.kku.usr.service.EgovKkuAppClubVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityService;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuClubController {
	
/*	@Resource(name="commService")								
	private EgovKkuAppCommunityService commService;
	
	@Resource(name = "mypageService")
	private EgovKkuAppMypageService mypageService;
	
	@Resource(name = "kkucommunityService")
	private EgovKkuAdmCommunityService kkucommunityService;
	
	@Resource(name="kkuUserService")
	private EgovKkuAppUserService kkuUserService;*/

	@Resource(name="clubService")
	private EgovKkuAppClubService clubService;
	
	@Resource(name="commService")								
	private EgovKkuAppCommunityService commService;
	
	@Resource(name = "kkucommunityService")
	private EgovKkuAdmCommunityService kkucommunityService;
	
	@RequestMapping(value="/clubList.do")
	public String club(HttpServletResponse response,
			 ModelMap model, HttpServletRequest request, EgovKkuAppClubVO clubVO) throws Exception {
		String clubCategory = clubVO.getClubCategory();
		switch(clubCategory){
			case "all":
				break;
			case "art":
				clubVO.setClubCategory("예술분과");
				break;
			case "business":
				clubVO.setClubCategory("창업분과");
				break;
			case "hobby":
				clubVO.setClubCategory("취미교양분과");
				break;
			case "volunteer":
				clubVO.setClubCategory("봉사분과");
				break;
			case "leisure":
				clubVO.setClubCategory("레저분과");
				break;
			case "sport":
				clubVO.setClubCategory("체육분과");
				break;
			case "religion":
				clubVO.setClubCategory("종교분과");
				break;
			case "study":
				clubVO.setClubCategory("학술분과");
				break;
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		clubVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(clubVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(clubVO.getPageUnit());
        paginationInfo.setPageSize(5);
        clubVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        clubVO.setLastIndex(paginationInfo.getLastRecordIndex());
        clubVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        int clubListCnt = clubService.selectClubListCnt(clubVO);
		List<EgovMap> clubList = clubService.selectClubList(clubVO);
        paginationInfo.setTotalRecordCount(clubListCnt);

        model.addAttribute("vo", clubVO);
		model.addAttribute("selected",clubCategory );
		model.addAttribute("paginationInfo", paginationInfo);	
		model.addAttribute("clubList", clubList);
		
		
		return "kkuapp/web/club/clubList";
	}
	
	//동아리 홍보 페이지
	@RequestMapping(value="/club_info.do")
	public String clubInfo(Model model, @ModelAttribute("clubVO") EgovKkuAppClubVO clubVO  )
			throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		clubVO.setUsrIdx(sessionVO.getUsrIdx());
		//해당 동아리의 현재 유저의 정보를 가져옴 
		EgovMap userDetail = clubService.selectClubUserInfo(clubVO);

		if(userDetail == null){
			EgovKkuAppClubVO clubDetailVO = clubService.selectClubDetail(clubVO);
			model.addAttribute("clubDetailVO", clubDetailVO);
		
			return "kkuapp/web/club/club_info";
		}
		else if(userDetail.get("clubUserState").toString().equals("3")){
			String Param = "/club_view.do?clubIdx="+userDetail.get("clubIdx").toString()+"&category=board";
			
			return "redirect:"+Param;
		}
		else{
			return "kkuapp/web/club/club_info";
		}
		
	}
	
	//동아리 가입 페이지
	@RequestMapping(value="/club_join.do")
	public String clubJoin(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model) throws Exception {
		model.addAttribute("clubIdx", clubVO.getClubIdx());
		return "kkuapp/web/club/club_join";
	}
	
	@RequestMapping(value="/club_join_action.do" , produces="application/x-www-form-urlencoded; charset=euc-kr")
	@ResponseBody
	public String clubJoinAction( @ModelAttribute("clubVO") EgovKkuAppClubVO clubVO) throws Exception	{

		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		clubVO.setUsrIdx(sessionVO.getUsrIdx());
		clubVO.setClubUserLev("0"); //일반유저
		clubVO.setClubUserState("0"); //가입신청 상태로 insert
		clubVO.setDelYn("N");
		System.err.println(sessionVO.getUsrIdx());
		String insertCheck = clubService.insertClubApplication(clubVO);
		String msg= "";
		if (insertCheck == null){
			msg = "success";
		}
		else{
			msg ="fail";
		}
		return msg;
	}
	@RequestMapping(value="/club_join_ok.do")
	public String clubJoinOk() throws Exception {
		
		return "kkuapp/web/club/club_join_ok";
	}
	//동아리 페이지
	@RequestMapping(value="/club_view.do")
	public String clubView( @ModelAttribute("clubVO") EgovKkuAppClubVO clubVO, Model model) throws Exception {
		
		EgovKkuAppClubVO userCheckVO = new EgovKkuAppClubVO ();
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		userCheckVO.setUsrIdx(sessionVO.getUsrIdx());
		userCheckVO.setClubIdx(clubVO.getClubIdx());
		EgovMap currectUserInfo = clubService.selectClubUserInfo(userCheckVO);
		model.addAttribute("currectUserInfo", currectUserInfo);
		
		EgovKkuAppClubVO clubDetailVO = clubService.selectClubDetail(clubVO);
		model.addAttribute("clubDetailVO", clubDetailVO);
		
		List<EgovMap> clubViewDetail = clubService.selectClubViewDetail(clubVO);
		System.err.println(clubViewDetail);
		model.addAttribute("clubViewDetail", clubViewDetail);
		
		if(clubVO.getCategory().equals("board")){
			model.addAttribute("state","board");
		}
		else if(clubVO.getCategory().equals("gal")){
			model.addAttribute("state","gal");
		}
		
		return "kkuapp/web/club/club_view";
	}
	//공지사항 작성페이지 
	@RequestMapping(value="/club_notice_write.do")
	public String clubNoticeWrite(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO) throws Exception{
		return "kkuapp/web/club/club_notice_write";
		
	}
	
	@RequestMapping(value="/club_notice_write_action.do")
	@ResponseBody
	public String clubNoticeWriteAction( EgovKkuAppClubVO clubVO) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		clubVO.setRegIdx(sessionVO.getUsrIdx());
		String insertchk = clubService.insertClubNotice(clubVO);
		if(insertchk == null){
			return "success";
		}
		else{
			return "fail";
		}
		
		
	}
	//동아리 가입신청 리스트 페이지
	@RequestMapping(value="club_join_view.do") 
	public String clubJoinView(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO, Model model) throws Exception {
		clubVO.setClubUserState("0");
		List<EgovMap> clubApplicationList = clubService.selectClubApplicationList(clubVO);
		ArrayList<String> dateList = new ArrayList<>();
		for(EgovMap map : clubApplicationList){
			
			dateList.add(map.get("nregDate").toString());
			
		} 
		Set<String> listWithoutDuplicates = new LinkedHashSet<String>(dateList);
		dateList.clear();
		dateList.addAll(listWithoutDuplicates); //날짜 중복제거 
		if(!dateList.isEmpty()){
			String firstDate = dateList.get(0).toString();
			model.addAttribute("firstDate",firstDate);

			model.addAttribute("dateList", dateList);

		}
		
		model.addAttribute("clubApplicationList", clubApplicationList);
		return "kkuapp/web/club/club_join_view";
	}
	
	//동아리 지원서 보기 페이지 
	@RequestMapping(value="club_apply.do") 
	public String clubApply(Model model, @ModelAttribute("clubVO") EgovKkuAppClubVO clubVO) throws Exception {
		EgovMap	clubApplicationDetail = clubService.selectClubApplicationDetail(clubVO);
		model.addAttribute("clubApplicationDetail", clubApplicationDetail);
			return "kkuapp/web/club/club_apply";
		}
	
	//동아리 가입 상태 처리
		@RequestMapping(value="/club_apply_process.do", produces="application/x-www-form-urlencoded; charset=euc-kr") 
		@ResponseBody
		public String clubApplyProcess(Model model, @ModelAttribute("clubVO") EgovKkuAppClubVO clubVO) throws Exception {
			int check = clubService.updateClubUserState(clubVO);
			if(check == 1){
				return "success";
			}
			else{
				return "err";
			}
		}
	
	//갤러리 페이지
	@RequestMapping(value="/club_gallery.do")
	public String clubGallery(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model) throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		clubVO.setPageUnit(4); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(clubVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(clubVO.getPageUnit());
        paginationInfo.setPageSize(5);
        clubVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        clubVO.setLastIndex(paginationInfo.getLastRecordIndex());
        clubVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        int clubListCnt = clubService.selectClubGalleryCnt(clubVO);

        clubVO.setClubBoardType("GALLERY");
		clubVO.setFileTblCode(8);
		List<EgovMap> galleryList = clubService.selectClubGalleryList(clubVO);
        paginationInfo.setTotalRecordCount(clubListCnt);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("galleryList", galleryList);
		return "kkuapp/web/club/club_gallery";
		
	}
	//갤러리 상세 페이지
	@RequestMapping(value="/club_gallery_view.do")
	public String clubGalleryView(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO, Model model) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String sessionIdx = sessionVO.getUsrIdx();
		clubVO.setFileTblCode(8);
		clubVO.setClubBoardType("GALLERY");
		EgovMap galleryDetail = clubService.selectClubGalleryDetail(clubVO);
			System.err.println(galleryDetail);
		model.addAttribute("sessionIdx", sessionIdx);
		model.addAttribute("galleryDetail", galleryDetail);
		return "kkuapp/web/club/club_gallery_view";
		
	}
	//갤러리 글 작성 페이지
	@RequestMapping(value="/club_gallery_write.do")
	public String clubGalleryWrite(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model) throws Exception{
		return "kkuapp/web/club/club_gallery_write";
	}
		@RequestMapping(value="/club_gallery_write_process.do")
		@ResponseBody
		public String clubGalleryWriteProcess(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,MultipartHttpServletRequest mtfRequest) throws Exception{
			EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
			clubVO.setRegIdx(sessionVO.getUsrIdx());
			clubVO.setViewnum(0);
			
	
			
			String folderName = "clubBoard";
	 		String convertedFileName = "";
			String msg = "";
			
			clubService.insertClubContent(clubVO); //게시판 , 갤러리 둘다 사용
			List<MultipartFile> imgList = mtfRequest.getFiles("attach_file");
			for(MultipartFile mf : imgList) {
				if(mf.getSize()>0){
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileTblCode(Integer.toString(8));
					fileVO.setFileTblIdx(Integer.toString(clubVO.getClubBoardIdx()));
					fileVO.setFileRegIdx(sessionVO.getUsrIdx());
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
		
		//갤러리 글 삭제 
		@RequestMapping(value="/club_gallery_delete_process.do")
		@ResponseBody
		public String clubGalleryDelteProcess(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model) throws Exception{

			EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
			clubVO.setDelYn("Y");
			clubVO.setModIdx(sessionVO.getUsrIdx());
			int updateCnt = clubService.updateClubBoardState(clubVO);

			
			if(updateCnt == 1){
				return "success";
			}
			else{
				return "fail";
			}
		}
		
		
	@RequestMapping(value="/club_gallery_modify.do")
	public String clubGalleryModify(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model) throws Exception{
		clubVO.setClubBoardType("GALLERY");
		clubVO.setFileTblCode(8);
		EgovMap galleryDetail = clubService.selectClubGalleryDetail(clubVO);
		System.err.println(galleryDetail);
		model.addAttribute("galleryDetail", galleryDetail);
		
		return  "kkuapp/web/club/club_gallery_modify";
	}
	
	@RequestMapping(value="/club_gallery_modify_process.do")
	@ResponseBody
	public String clubGalleryModifyProcess(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,MultipartHttpServletRequest mtfRequest,
			  ModelMap model, HttpServletRequest request) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		clubVO.setClubBoardType("GALLERY");
		clubVO.setDelYn("N");
		clubVO.setModIdx(sessionVO.getUsrIdx());
		
		String folderName = "clubBoard";
 		String convertedFileName = "";
		String msg = "";

		if(clubVO.getDelArr() != null){	
			
			for(int i=0; i<clubVO.getDelArr().length; i++){
				if(clubVO.getDelArr()[i].equals("Y")){
					EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
					fileVO.setFileIdx(clubVO.getFileIdxArr()[i]);
					fileVO.setModIdx(sessionVO.getUsrIdx());
					fileVO.setModName(sessionVO.getUsrNickname());
					System.err.println(fileVO.toString());
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
				fileVO.setFileTblIdx(Integer.toString(clubVO.getClubBoardIdx()) );
				fileVO.setFileTblCode(Integer.toString(8));
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
				fileVO.setFileTblCode("8");
				commService.insertBoardFile(fileVO);
			}
		}
		
	
		int updateCnt = clubService.updateClubBoardState(clubVO);
		System.err.println(clubVO.toString());
		
		return "success"; // 글 수정완료
		
	
	}
	//동아리 자유게시판  페이지
		@RequestMapping(value="/club_board.do")
		public String clubBoard(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model) throws Exception{
			clubVO.setClubBoardType("BOARD");
			PaginationInfo paginationInfo = new PaginationInfo();
			clubVO.setPageUnit(4); // 게시물 수 설정
	        paginationInfo.setCurrentPageNo(clubVO.getPageIndex());
	        paginationInfo.setRecordCountPerPage(clubVO.getPageUnit());
	        paginationInfo.setPageSize(5);
	        clubVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	        clubVO.setLastIndex(paginationInfo.getLastRecordIndex());
	        clubVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	        int clubListCnt = clubService.selectClubGalleryCnt(clubVO);


			clubVO.setFileTblCode(8);
			List<EgovMap> galleryList = clubService.selectClubGalleryList(clubVO);
	        paginationInfo.setTotalRecordCount(clubListCnt);

			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("boardList", galleryList);
			return "kkuapp/web/club/club_board";
			
		}
	
	//동아리 게시판 상세 페이지
	//동아리 게시판 글 작성 페이지
	@RequestMapping(value="/club_board_write.do")
	public String clubBoardWrite(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model) throws Exception{
		return "kkuapp/web/club/club_board_write";
	}	
	//동아리 게시판 상세 페이지
	@RequestMapping(value="/club_board_view.do")
	public String clubBoardView(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO, Model model) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String sessionIdx = sessionVO.getUsrIdx();
		clubVO.setClubBoardType("BOARD");
		clubVO.setFileTblCode(8);
		EgovMap galleryDetail = clubService.selectClubGalleryDetail(clubVO);
		
		model.addAttribute("sessionIdx", sessionIdx);
		model.addAttribute("galleryDetail", galleryDetail);
		
		System.err.println(galleryDetail);
		
		return "kkuapp/web/club/club_board_view";
		
	}
	//동아리 게시판 상세 페이지
		@RequestMapping(value="/club_board_modify.do")
		public String clubBoardModify(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO, Model model) throws Exception{
			EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
			String sessionIdx = sessionVO.getUsrIdx();
			clubVO.setClubBoardType("BOARD");
			clubVO.setFileTblCode(8);
			EgovMap galleryDetail = clubService.selectClubGalleryDetail(clubVO);
			System.err.println(galleryDetail);
			model.addAttribute("sessionIdx", sessionIdx);
			model.addAttribute("galleryDetail", galleryDetail);
			
			System.err.println(galleryDetail);
			
			return "kkuapp/web/club/club_board_modify";
			
		}
		
		@RequestMapping(value="/club_board_modify_process.do")
		@ResponseBody
		public String clubBoardModifyProcess(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,MultipartHttpServletRequest mtfRequest,
				  ModelMap model, HttpServletRequest request) throws Exception{
			EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
			clubVO.setClubBoardType("BOARD");
			clubVO.setDelYn("N");
			clubVO.setModIdx(sessionVO.getUsrIdx());
			
			String folderName = "clubBoard";
	 		String convertedFileName = "";
			String msg = "";
			System.err.println(clubVO.toString());
			if(clubVO.getDelArr() != null){	
				
				for(int i=0; i<clubVO.getDelArr().length; i++){
					if(clubVO.getDelArr()[i].equals("Y")){
						EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
						fileVO.setFileIdx(clubVO.getFileIdxArr()[i]);
						fileVO.setModIdx(sessionVO.getUsrIdx());
						fileVO.setModName(sessionVO.getUsrNickname());
						System.err.println(fileVO.toString());
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
					fileVO.setFileTblIdx(Integer.toString(clubVO.getClubBoardIdx()) );
					fileVO.setFileTblCode(Integer.toString(8));
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
					fileVO.setFileTblCode("8");
					commService.insertBoardFile(fileVO);
				}
			}
			
		
			int updateCnt = clubService.updateClubBoardState(clubVO);
			System.err.println(clubVO.toString());
			
			return "success"; // 글 수정완료
			
		
		}
	//동아리 회원관리 페이지
	@RequestMapping(value="/club_mem.do")
	public String clubMemList(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model) throws Exception{
		EgovKkuAppClubVO clubDetailVO = clubService.selectClubDetail(clubVO);
		model.addAttribute("clubDetailVO", clubDetailVO);
		
		clubVO.setClubUserState("3");
		List<EgovMap> clubApplicationList = clubService.selectClubApplicationList(clubVO);
		model.addAttribute("clubApplicationList", clubApplicationList);
		return "kkuapp/web/club/club_mem";
	}
	//동아리 회원등급 수정 페이지
		@RequestMapping(value="/club_mem_process.do")
		@ResponseBody
		public String clubMemAction(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model) throws Exception{
			EgovKkuAppClubVO userCheckVO = new EgovKkuAppClubVO ();
			EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
			userCheckVO.setUsrIdx(sessionVO.getUsrIdx());
			userCheckVO.setClubIdx(clubVO.getClubIdx());
			EgovMap currectUserInfo = clubService.selectClubUserInfo(userCheckVO);
			EgovMap selectedUserInfo = clubService.selectClubUserInfo(clubVO);
		//자기 자신 선택
			if(currectUserInfo.get("usrIdx").equals(selectedUserInfo.get("usrIdx")) ) {
				return "selfSelected";
			}
			else{
				//일반 운영진 일때
				if(Integer.parseInt(currectUserInfo.get("clubUserLev").toString()) <= 1){ 
					//현재 접속된 유저의 랭크가 , 선택된 유저의 랭크보다 작을때
					if(Integer.parseInt(currectUserInfo.get("clubUserLev").toString()) < (Integer.parseInt(selectedUserInfo.get("clubUserLev").toString()))){
						return "noPermission";
						}
					else if(Integer.parseInt(currectUserInfo.get("clubUserLev").toString()) > (Integer.parseInt(selectedUserInfo.get("clubUserLev").toString()))){
						//일반 유저 -> 운영진으로 임명 할 경우
						if(clubVO.getClubUserLev().equals("1")){
							clubVO.setClubUserState("3");
							clubVO.setModIdx(sessionVO.getUsrIdx());
							clubService.updateClubUserState(clubVO);
							return "updated";
						}
						//일반 유저 -> 삭제
						else if(clubVO.getClubUserLev().equals("-1")){
							clubVO.setClubUserState("0");
							clubVO.setDelYn("Y");
							clubVO.setModIdx(sessionVO.getUsrIdx());
							clubService.updateClubUserState(clubVO);
							return "updated";
						}
						else{
							return "sameLevel";
						}
					}
					
				}
				//동아리 회장일때
				else if(Integer.parseInt(currectUserInfo.get("clubUserLev").toString()) == 2){
					
					//일반 유저 -> 운영진으로 임명 할 경우
					if(clubVO.getClubUserLev().equals("1") ){
						System.err.println("check");
						clubVO.setClubUserState("3");
						clubVO.setModIdx(sessionVO.getUsrIdx());
						clubService.updateClubUserState(clubVO);
						return "updated";
					}
					 //운영진 -> 일반유저로 임명 할 경우
					 else if(clubVO.getClubUserLev().equals("0")){
							clubVO.setClubUserState("3");
							clubVO.setModIdx(sessionVO.getUsrIdx());
							clubService.updateClubUserState(clubVO);
							return "updated";
						}
					//운영진 -> 회장으로 임명 할 경우
					 else if(clubVO.getClubUserLev().equals("2")){
							clubVO.setClubUserState("3");
							clubVO.setModIdx(sessionVO.getUsrIdx());
							clubService.updateClubUserState(clubVO); //상대방을 회장으로 올림
							
							clubVO.setClubUserLev("1");
							clubVO.setUsrIdx(sessionVO.getUsrIdx()); //내 자신을 다시 운영진으로 자동 임명 
							clubService.updateClubUserState(clubVO);
							return "updated";
						}
					//일반 유저 -> 삭제
					else if(clubVO.getClubUserLev().equals("-1")){
						System.err.println("chek");
						clubVO.setClubUserState("0");
						clubVO.setDelYn("Y");
						clubVO.setModIdx(sessionVO.getUsrIdx());
						clubService.updateClubUserState(clubVO);
						return "updated";
					}
				
				}
			
				
			}
			return "noPermission";
		}
		
		@RequestMapping(value="/club_mem_alarm.do")
		public String club_mem_alarm(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model) throws Exception {
			clubVO.setClubUserState("3");
			List<EgovMap> clubApplicationList = clubService.selectClubApplicationList(clubVO);
			model.addAttribute("clubApplicationList", clubApplicationList);
			return "kkuapp/web/club/club_mem_alarm";
		}
		
		@RequestMapping(value="/club_mem_alarm_process.do")
		@ResponseBody
		public String club_mem_alarm_process(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO,Model model,MultipartHttpServletRequest mtfRequest) throws Exception {

			System.err.println("te");
			ArrayList<String> android = new ArrayList<>();
			ArrayList<String> ios = new ArrayList<>();
			ArrayList<String> registration_ids = new ArrayList<>();
			clubVO.setClubUserState("3");
			List<EgovMap> UserList = clubService.selectClubUserDevice(clubVO);
			int cnt = 0;
			for(EgovMap map : UserList){
				if(map.get("registrationId")!=null && map.get("os")!=null ){
					if(map.get("os").toString().equals("android")){    				
						android.add(map.get("registrationId").toString());
					}else{
						ios.add(map.get("registrationId").toString());
					}
				}
				
			}
			//android multipush
			String title = "동아리 공지사항이 도착했어요!";
			String content = clubVO.getClubUserMsg().toString();
			String Url = "/club_view.do?clubIdx="+clubVO.getClubIdx()+"&category=board";
			if(!android.isEmpty()){
				for(int i=0; i<android.size(); i++){
					registration_ids.add(android.get(i));
					if(i%1000 == 999){
						FcmSendPush.multiPushFCM(registration_ids, title, content , Url);
						registration_ids.clear();
					}
				}
				if(!registration_ids.isEmpty()){
					FcmSendPush.multiPushFCM(registration_ids, title, content , Url);
					registration_ids.clear();
				}
				cnt +=1;
			}
			//ios multipush
			if(!ios.isEmpty()){
				for(int i=0; i<ios.size(); i++){
					registration_ids.add(ios.get(i));
					if(i%1000 == 999){
						
						FcmSendPush.IOSMultiPushFCM(registration_ids, title, content , Url);		
						registration_ids.clear();
					}
				}
				if(!registration_ids.isEmpty() ){
					FcmSendPush.IOSMultiPushFCM(registration_ids, title, content , Url);
				}
				cnt +=1;
			}

			return Integer.toString(cnt);
		}
		@RequestMapping(value="/club_setting.do")
		public String club_setting(@ModelAttribute("clubVO") EgovKkuAppClubVO clubVO) throws Exception{
			
			return "kkuapp/web/club/club_setting";
		}
		
		
}
