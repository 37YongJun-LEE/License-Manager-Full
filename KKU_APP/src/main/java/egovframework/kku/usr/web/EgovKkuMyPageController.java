package egovframework.kku.usr.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import egovframework.com.cmm.util.EgovComcmmUtil;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityService;
import egovframework.kku.usr.service.EgovKkuAppAlarmVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityService;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppMypageService;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class EgovKkuMyPageController {
	
	@Resource(name="commService")								
	private EgovKkuAppCommunityService commService;
	
	@Resource(name = "mypageService")
	private EgovKkuAppMypageService mypageService;
	
	@Resource(name = "kkucommunityService")
	private EgovKkuAdmCommunityService kkucommunityService;
	
	@Resource(name="kkuUserService")
	private EgovKkuAppUserService kkuUserService;
	
	@RequestMapping(value="/mypage.do")
	public String mypage(HttpServletResponse response,
			 ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		//EgovKkuAdmUserVO userVO = new EgovKkuAdmUserVO();
		//userVO.setUsrIdx(sessionVO.getUsrIdx());
		
		int boardCnt = mypageService.selectmyCommunityCnt(sessionVO.getUsrEmail());
		
		//유저정보 addAttribute
		model.addAttribute("boardCnt", boardCnt);
		model.addAttribute("userInfo", mypageService.selectUserByIdx(sessionVO));
		
		List<?> friendCnt = mypageService.selectFriendCnt(sessionVO);
		model.addAttribute("friendCnt", friendCnt.get(0));
		
		//불러온 값 콘솔에 메세지로 확인
		EgovMap temp = mypageService.selectUserByIdx(sessionVO);
		
		
		return "kkuapp/web/mypage/mypage";
	}
	
	@RequestMapping(value="/mypage/myCommunity.do")
	public String mycommunity(HttpServletResponse response,
			 ModelMap model, HttpServletRequest request) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		List<?> myList = mypageService.selectmyCommunityList(sessionVO.getUsrEmail());
		model.addAttribute("BoardList", myList);
		return "kkuapp/web/mypage/myCommunity";
	}

	@RequestMapping(value="/mypage/myTrade01.do")
	public String mytrade01(@ModelAttribute("boardVO") EgovKkuAdmCommunityBoardVO boardVO, 
			                ModelMap model, HttpServletRequest request) throws Exception {	

		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		userVO.setUsrIdx(sessionVO.getUsrIdx());
		boardVO.setTrdUsrIdx(sessionVO.getUsrIdx());
		
		model.addAttribute("tradeList", kkucommunityService.selectMyBoardList(boardVO));
		//유저정보 addAttribute

		return "kkuapp/web/mypage/myTrade01";
	}
	//찜목록
	@RequestMapping(value="/mypage/myTrade02.do")
	public String myTrade02(@ModelAttribute("boardVO") EgovKkuAdmCommunityBoardVO boardVO,
			                ModelMap model, HttpServletRequest request) throws Exception {	

		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		EgovKkuAppUserVO userVO = new EgovKkuAppUserVO();
		userVO.setUsrIdx(sessionVO.getUsrIdx());
		boardVO.setTrdUsrIdx(sessionVO.getUsrIdx());
		
		model.addAttribute("tradeList", kkucommunityService.selectLikeBoardList(userVO));
		//유저정보 addAttribute

		return "kkuapp/web/mypage/myTrade02";
	}
	
	@RequestMapping(value="/mypage/myFriend.do")
	public String myfriend(@ModelAttribute("friendVO") EgovKkuAppFriendVO friendVO, HttpServletResponse response,
			 ModelMap model, HttpServletRequest request) throws Exception {
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
		
		int waitCnt = (mypageService.waitFriendList(friendVO)).size();
		
		
		List<?> friendList = (List<?>) mypageService.selectFriendList(friendVO);
		List<?> friendCnt = mypageService.selectFriendCnt(sessionVO);
		model.addAttribute("waitCnt", waitCnt);
		model.addAttribute("friendCnt", friendCnt.get(0));
		model.addAttribute("friendList", friendList);
		
		
		return "kkuapp/web/mypage/myFriend";
	}
	@RequestMapping(value="/mypage/changeNick.do")
	public String changename(@ModelAttribute("userVO") EgovKkuAppUserVO userVO, HttpServletResponse response,
			 ModelMap model, HttpServletRequest request) throws Exception {

		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		userVO.setUsrIdx(sessionVO.getUsrIdx());
		model.addAttribute("userInfo", mypageService.selectUserByIdx(sessionVO));
		
		
		
		return "kkuapp/web/mypage/changeNick";
	}
	@RequestMapping(value="/mypage/changePw.do")
	public String changepw(HttpServletResponse response, 
			 ModelMap model, HttpServletRequest request) throws Exception {
		return "kkuapp/web/mypage/changePw";
	}
	@RequestMapping(value="/mypage/service.do")
	public String service(HttpServletResponse response,
			 ModelMap model, HttpServletRequest request) throws Exception {
		return "kkuapp/web/mypage/service";
	}
	@RequestMapping(value="/mypage/withdrawal.do")
	public String withdrawal(HttpServletResponse response,
			 ModelMap model, HttpServletRequest request) throws Exception {
		return "kkuapp/web/mypage/withdrawal";
	}

	
	@RequestMapping(value="/mypage/addPhoto.do")
	public String addPhoto(@ModelAttribute("userVO") EgovKkuAppUserVO userVO,
			  ModelMap model, MultipartHttpServletRequest mtfRequest, 
			  HttpServletRequest request) throws Exception {

		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
    	String folderName = "mypage";
 		String convertedFileName = "";
 		
		MultipartFile mf = mtfRequest.getFile("input_usr_img");

		if(mf.getSize()>0){
			//나중에 userVO 세션 VO로 수정
			userVO.setUsrIdx(sessionVO.getUsrIdx());
			EgovKkuAdmCommunityBoardFileVO fileVO = new EgovKkuAdmCommunityBoardFileVO();
			if(mf.getContentType().toString().contains("image")){
				
				userVO.setUsrProfilepic(mf.getOriginalFilename());
				convertedFileName = EgovCmsFileUtil.fileSingleUpload(mf, folderName);
				convertedFileName = EgovCmsFileUtil.fileReSizeUpload(mf, folderName, convertedFileName);
				userVO.setUsrSrvprofilepic(convertedFileName);
				userVO.setUsrProfilepic(userVO.getUsrProfilepic() + "|" + (mf.getSize()/1024) + "KB");
				mypageService.updateProfile(userVO);
			}else{
				fileVO.setBfType("file");
			}
		}		

		return "redirect:/mypage.do";
	}
	@RequestMapping(value="/mypage/updatePassword.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String updatePWajax(@ModelAttribute("userVO") EgovKkuAppUserVO userVO, HttpServletRequest request)throws Exception{

		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		userVO.setUsrEmail(sessionVO.getUsrEmail());
		userVO.setUsrIdx(sessionVO.getUsrIdx());
		
		
		String old = request.getParameter("oldPassword");
		String md5Pwd = EgovComcmmUtil.genMD5(old);
		userVO.setUsrPassword(md5Pwd);
		
		//비밀번호 맞는지 확인하기 위해 login서비스 이용
    	int loginCheck = kkuUserService.Login(userVO);
		if(loginCheck == 1){
			String newPass = request.getParameter("newPassword");
			String md5Pwd2 = EgovComcmmUtil.genMD5(newPass);
			userVO.setUsrPassword(md5Pwd2);
			int result = mypageService.updatePassword(userVO);
			
			if(result == 1){
				return result +"";
			}
			return "failed";
		}else
			return "diffpass";
	}
	
	
	
	@RequestMapping(value="/mypage/updateNick.do",produces = "application/text; charset=utf8")
    @ResponseBody
	public String updateNick(@ModelAttribute("userVO") EgovKkuAppUserVO userVO, HttpServletRequest request) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		userVO.setUsrIdx(sessionVO.getUsrIdx());
		String nickName = request.getParameter("usrNickname");
		userVO.setUsrNickname(nickName);
		
		int changeCheck = mypageService.updateNick(userVO);
		
		if(changeCheck != 0){
			return changeCheck + "";
		}else{
			return changeCheck + "";
		}
		
	} 
	// 탈퇴 체크 ajax 
	@RequestMapping(value="/mypage/withdrawalCheck.do",produces = "application/text; charset=utf8")
    @ResponseBody
	public String withdrawalCheck(@ModelAttribute("userVO") EgovKkuAppUserVO userVO, HttpServletRequest request) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		userVO.setUsrIdx(sessionVO.getUsrIdx());
		userVO.setUsrEmail(sessionVO.getUsrEmail());
		String password = request.getParameter("password");
		String md5Pwd = EgovComcmmUtil.genMD5(password);
		userVO.setUsrPassword(md5Pwd);

		int withdrawalCheck = mypageService.withdrawal(userVO);
		
		if(withdrawalCheck != 0){
			//회원탈퇴 후 처리
			int withdrawFriend = mypageService.withdrawFriends(userVO); //친구목록 삭제
			int withdrawTimetable = mypageService.withdrawTimetable(userVO); //시간표 삭제
			int withdrawBoard = mypageService.withdrawBoard(userVO); //자유게시판 게시물 상태 변경
			int withdrawTaxi = mypageService.withdrawTaxi(userVO); //택시합승 게시물 상태 변경
			int withdrawReport = mypageService.withdrawReport(userVO); //고장신고 게시물 상태 변경
			int withdrawTrade = mypageService.withdrawTrade(userVO); //중고거래 게시물 상태 변경
			int withdrawLost = mypageService.withdrawLost(userVO); //분실물 게시판 게시물 상태 변경
			
			return withdrawalCheck + "";
		}else{
			return withdrawalCheck + "";
		}
		
	}
	
	//마이페이지 > 친구 즐겨찾기 추가 / 해제
	@RequestMapping(value="/mypage/updateFav.do")
    @ResponseBody
	public String updateFav(@ModelAttribute("friendVO") EgovKkuAppFriendVO friendVO, HttpServletRequest request) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		
		String mode = request.getParameter("mode");
		String frdIdx = request.getParameter("idx");

		friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
		friendVO.setFriendFrdIdx(frdIdx);
		
		
		//mode가 delFav면 즐찾 0으로 addFav면 즐찾 1로
		if(mode.equals("favAdd")){
			friendVO.setFriendIsfav("1");
			int favCheck = mypageService.updateFav(friendVO);
			return favCheck + "";
		} else if(mode.equals("favDel")){
			friendVO.setFriendIsfav("0");
			int favCheck = mypageService.updateFav(friendVO);
			return favCheck + "";
		} else 
			return 0 + "";
	} 
	//마이페이지 > 친구 삭제
	@RequestMapping(value="/mypage/deleteFrd.do")
    @ResponseBody
	public String deleteFrd(@ModelAttribute("friendVO") EgovKkuAppFriendVO friendVO, HttpServletRequest request) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		String frdIdx = request.getParameter("idx");

		friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
		friendVO.setFriendFrdIdx(frdIdx);
		
		
		int delCheck = mypageService.deleteFrd(friendVO);
		if(delCheck != 0)
			return 1+"";
		else
			return 0+"";
	}
	

	@RequestMapping(value="/mypage/addFriend.do")
	public String addfriend(HttpServletResponse response, ModelMap model, HttpServletRequest request) throws Exception {
		
		
		return "kkuapp/web/mypage/addFriend";
	}
	//마이페이지 > 친구 신청
	@RequestMapping(value="/mypage/addFriendCheck.do")
    @ResponseBody
	public String addFriendCheck(@ModelAttribute("userVO") EgovKkuAppUserVO userVO, EgovKkuAppFriendVO friendVO, HttpServletRequest request) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		String usrName = request.getParameter("usrName");
		String phoneNumber = request.getParameter("phoneNumber");
		userVO.setUsrName(usrName);
		userVO.setPhoneNumber(phoneNumber);
		
		System.err.println(usrName);
		System.err.println(phoneNumber);
		
		// 친구 실명 + 핸드폰 번호로 검색
		List<EgovMap> friendInfoList = (List<EgovMap>) mypageService.selectFrdByNameAndPhone(userVO);
		String myIdx = sessionVO.getUsrIdx();
		
		friendVO.setFriendMyid(sessionVO.getUsrEmail());
		friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
		
		// 친구 실명 + 핸드폰 번호로 검색 > 값 있으니까 친구추가 하면 됨.
		if(friendInfoList.size() != 0){
			
			String frdName = friendInfoList.get(0).get("usrEmail").toString();
			String frdIdx = friendInfoList.get(0).get("usrIdx").toString();
			friendVO.setFriendFid(frdName);
			friendVO.setFriendFrdIdx(frdIdx);

			EgovKkuAppUserVO usrVO = new EgovKkuAppUserVO();
			usrVO.setUsrEmail(frdName); // 요청 받은 사람한테 알림 
		/*	EgovMap map = kkuUserService.selectUserDevice(usrVO);
			FcmSendPush FcmSendPush = new FcmSendPush();
			String tokenId = map.get("registrationId").toString();
			String title = "새로운 친구 요청이 왔어요!";
			String Content = "새 친구요청!";
			FcmSendPush.pushFCMNotification(tokenId, title, Content,"/alarmList.do");*/
			
			//예외처리 // 나를 친구로 신청했을 때 
			if(myIdx.equals(frdIdx)){
				return 0 + "";
			}
			
			// insert성공
			int result = mypageService.insertFriend(friendVO);
			
			if(result == 1 ){
				//댓글 작성시 알람 세팅 
				EgovKkuAppAlarmVO alarmVO = new EgovKkuAppAlarmVO();
				alarmVO.setAlarmReceiverid(friendVO.getFriendFid()); //알람 받는사람
				alarmVO.setRequestedId(friendVO.getFriendMyid());  //알람 보내는 사람 
				alarmVO.setAlarmType(1); //alarmtype 0 = 댓글알림 , 1 = 친추
				//fcmToken 이  존재하고, 댓글쓴사람과 게시글 작성자가 다를때 
				
				EgovMap map = kkuUserService.selectUserDevice(usrVO);
				if(!(map == null) ){
					String tokenId = map.get("registrationId").toString();
					String title = "새친구 요청이 왔어요!";
					String content = ":D";
					String url = "/friendView.do?usrIdx="+friendVO.getFriendMyIdx();
					
					if(map.get("os").toString().equals("android")){    				
						FcmSendPush.pushFCMNotification(tokenId, title, content,url);
					}else{
						FcmSendPush.IOSpushFCMNotification(tokenId, title, content,url);
					}
				}
				commService.insertAlarm(alarmVO);
				//알람 세팅 끝
				return 1 + "";
			} else //insert실패(이미 값이 있을 때)
				return 2 + "";			
		// 닉네임 유효하지 않을 때
		} else{
			return 0 + "";
		}
	}

	@RequestMapping(value="/mypage/wait01.do")
	public String wait01(@ModelAttribute("friendVO") EgovKkuAppFriendVO friendVO, HttpServletResponse response, ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		

		friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
		List<?> waitList = (List<?>) mypageService.waitFriendList(friendVO);
		model.addAttribute("waitList", waitList);
		
		return "kkuapp/web/mypage/friendWait01";
	}
	
	@RequestMapping(value="/mypage/wait02.do")
	public String wait02(@ModelAttribute("friendVO") EgovKkuAppFriendVO friendVO, HttpServletResponse response, ModelMap model, HttpServletRequest request) throws Exception {
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		

		friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
		List<?> friendList = mypageService.selectFriendList(friendVO);
		List<?> friendCnt = mypageService.selectFriendCnt(sessionVO);
		model.addAttribute("friendCnt", friendCnt.get(0));
		model.addAttribute("friendList", friendList);
		
		return "kkuapp/web/mypage/friendWait02";
	}
	
	@RequestMapping(value="/mypage/cancleFriend.do")
    @ResponseBody
	public String cancleFriend(@ModelAttribute("friendVO") EgovKkuAppFriendVO friendVO, HttpServletRequest request) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		String frdIdx = request.getParameter("frdIdx");
		friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
		friendVO.setFriendFrdIdx(frdIdx);
		//취소랑 삭제랑 동작이 같음.
		int cancleCheck = mypageService.deleteFrd(friendVO);
		
		if(cancleCheck != 0)
			return 1+"";
		else
			return 0+"";
		
	}
	@RequestMapping(value="/mypage/waitFriend.do")
    @ResponseBody
	public String waitFriend(@ModelAttribute("friendVO") EgovKkuAppFriendVO friendVO, HttpServletRequest request) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		String frdIdx = request.getParameter("frdIdx");
		String frdEmail = request.getParameter("usrEmail");
		String mode = request.getParameter("mode");
		// friendVO 세팅
		friendVO.setFriendMyid(sessionVO.getUsrEmail());
		friendVO.setFriendMyIdx(sessionVO.getUsrIdx());
		friendVO.setFriendFid(frdEmail);
		friendVO.setFriendFrdIdx(frdIdx);
		//취소랑 삭제랑 동작이 같음.
		//추가
		if(mode.equals("Y")){
			mypageService.acceptFrd(friendVO); // update한 row 리턴 1,2,0(이미 상대가 수락) < 셋다 친구 추가 된거니 상관없는듯
			return 1+""; // 수락 완료
		}
		else if(mode.equals("N")){	
			mypageService.deleteFrd(friendVO);
			return 2+""; // 거절 완료
		}else {
			return 0+""; // 처리 안된 에러
		}
		
		
	}	
	
	
	
	@RequestMapping(value="/niceGuy.do")
	public String niceGuy() throws Exception {
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		return "kkuapp/web/temp/niceGuy";
	}	
	@RequestMapping(value="/member/myReportList.do")
	public String myReportList(Model model,EgovKkuAppUserVO uVO) throws Exception {
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		uVO.setUsrIdx(sessionVO.getUsrIdx());
		List<EgovMap> reportList = mypageService.selectMyReportListbyUsrIdx(uVO);
		System.err.println("@@@@@@@@@@@@@@@@@@@@@@");
		System.err.println(reportList.toString());
		model.addAttribute("reportList", reportList);
		return "kkuapp/web/mypage/myReport";
	}	

}
