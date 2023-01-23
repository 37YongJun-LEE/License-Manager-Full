package egovframework.kku.usr.service.impl;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.SessionVO;
import egovframework.kku.usr.service.ChatRoomVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuChatService;
import egovframework.kku.usr.service.MessageVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/* service 설명은 EgovChatervice에 있음*/

@Service("chatService")
public class EgovKkuChatServiceImpl implements EgovKkuChatService {

	@Resource(name="chatDAO")
	public EgovKkuChatDAO chatDAO;
	
	@Override
	public String ifExistRoom(ChatRoomVO vo) throws Exception {
		return chatDAO.ifExistRoom(vo);
	}

	@Override
	public int makeRoom(ChatRoomVO vo) throws Exception {
		return chatDAO.makeRoom(vo);
	}

	@Override
	public List<EgovMap> selectChatInfo(String roomId) {
		return chatDAO.selectChatInfo(roomId);
	}

	@Override
	public int insertMessage(MessageVO message) {
		return chatDAO.insertMessage(message);
	}

	@Override
	public int readMessage(String sessionId) {
		return chatDAO.readMessage(sessionId);
	}

	@Override
	public List<EgovMap> messageHistory(String roomId) {
		return chatDAO.messageHistory(roomId);
	}

	@Override
	public List<EgovMap> selectChatList(String writer) {
		return chatDAO.selectChatList(writer);
	}

	@Override
	public int updateSocketId(ChatRoomVO roomVO) {
		return chatDAO.updateSocketId(roomVO);
	}

	@Override
	public int deleteSocketId(String sessionId) {
		return chatDAO.deleteSocketId(sessionId);
	}



	@Override
	public int ifOtherConnect(ChatRoomVO roomVO) {
		return chatDAO.ifOtherConnect(roomVO);
	}
	
	@Override
	public String selectRoomId(String sessionId) {
		return chatDAO.selectRoomId(sessionId);
	}	
	
	@Override
	public int selectNotReadMessage(String usrIdx) {
		return chatDAO.selectNotReadMessage(usrIdx);
	}	
	




}
