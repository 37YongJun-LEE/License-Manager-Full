package egovframework.kku.usr.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.kku.usr.service.ChatRoomVO;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppMypageService;
import egovframework.kku.usr.service.EgovKkuChatService;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Controller
@RequestMapping("/chat")
public class EgovKkuChatController {
	

	@Resource(name = "chatService")
	private EgovKkuChatService chatService;
	
	@Resource(name="mypageService")								
	private EgovKkuAppMypageService mypageService;
	
	// 채팅방 입장
	@RequestMapping(value = "/room.do", method = RequestMethod.GET)
	public String createRoom(HttpServletRequest request, Model model, ChatRoomVO roomVO) {

		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();

		String myIdx = sessionVO.getUsrIdx();
		String roomId = request.getParameter("roomId");
		
		
		
		
		//1. 룸아이디로 정보들 가져오기 1. 내닉네임 2. 상대닉네임
		List<EgovMap> chatInfo = chatService.selectChatInfo(roomId);
	
		
		//1. 룸아이디 정보들 view에 보내줌 addAtrribute - 리스트에서 본인 세션 정보랑 매칭 시켜서 전송
		//session이랑 writer랑 일치하는지 검사
		if((chatInfo.get(0).get("writer")).toString().equals(myIdx)){
			model.addAttribute("myInfo", chatInfo.get(0));
			model.addAttribute("yourInfo", chatInfo.get(1));
		} else{
			model.addAttribute("myInfo", chatInfo.get(1));
			model.addAttribute("yourInfo", chatInfo.get(0));
		}
		
		//친구정보
		EgovKkuAppFriendVO friendVO = new EgovKkuAppFriendVO();
		friendVO.setFriendMyIdx(chatInfo.get(0).get("writer").toString());
		friendVO.setFriendFrdIdx(chatInfo.get(1).get("writer").toString());
		model.addAttribute("friendYN", mypageService.checkFriend(friendVO));
		
		roomVO.setRoomId(roomId);
		roomVO.setWriter(sessionVO.getUsrIdx());
		//채팅 History addAttribute
		List<EgovMap> messageHistory = chatService.messageHistory(roomId);
		model.addAttribute("messageHistory", messageHistory);
		
		
		//상대방 접속 정보
		model.addAttribute("ifOtherConnect", chatService.ifOtherConnect(roomVO));
		
		return "kkuapp/web/chat/kkuChat";
	}
	
	
	
	@RequestMapping(value="/chatList.do")
	public String chatList(HttpServletRequest request, Model model, ChatRoomVO roomVO) throws Exception {

		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		String writer = sessionVO.getUsrIdx();
		
		
		List<EgovMap> chatList = chatService.selectChatList(writer);
		model.addAttribute("chatList", chatList);
		
		
		return "kkuapp/web/chat/chatList";
	}		
	
	
	
	
    @RequestMapping(value="/makeRoom.do")
    @ResponseBody
	public String makeRoom(ModelMap model, HttpServletRequest request, ChatRoomVO roomVO) throws Exception {
    	
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		
		//roomId는 trade에서 UUID로 랜덤으로 생성한 값.
		String roomId = request.getParameter("roomId");
		String trdUsrIdx = request.getParameter("trdUsrIdx");
		
		
		roomVO.setWriter(sessionVO.getUsrIdx());
		roomVO.setReceiver(trdUsrIdx);
		
		//이미 있는 방인지 select 로 체크 (count)
		String checkRoomId = chatService.ifExistRoom(roomVO);
		
		
		// checkRoomId
		if(checkRoomId != null){
			return checkRoomId;
		} else{ //채팅방이 없을 때, 채팅방을 만들어준다. , 만들고 roomId 리턴해주면 해당 페이지에서 post해서 채팅 가능!
			//랜덤으로 넘겨받은 roomId를 사용해서 db에 저장한다.
			roomVO.setRoomId(roomId);
			
			int checkMake = chatService.makeRoom(roomVO);
			return roomId;
		}
    }
}
