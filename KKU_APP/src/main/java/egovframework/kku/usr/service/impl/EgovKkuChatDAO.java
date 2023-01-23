package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.ChatRoomVO;
import egovframework.kku.usr.service.MessageVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("chatDAO")
public class EgovKkuChatDAO extends EgovComAbstractDAO {


	public String ifExistRoom(ChatRoomVO vo) {
		return (String) select("chatDAO.ifExistRoom", vo);
	}

	public int makeRoom(ChatRoomVO vo) {
		return (int) update("chatDAO.makeRoom", vo);
	}

	@SuppressWarnings("unchecked")
	public List<EgovMap> selectChatInfo(String roomId) {
		return (List<EgovMap>) list("chatDAO.selectChatInfo", roomId);
	}

	public int plusUsrCount(ChatRoomVO roomVO) {
		return update("chatDAO.plusUsrCount", roomVO);
	}

	public EgovMap selectRoomInfo(ChatRoomVO roomVO) {
		return (EgovMap) select("chatDAO.selectRoomInfo", roomVO);
	}

	public int minusUsrCount(ChatRoomVO roomVO) {
		return update("chatDAO.minusUsrCount", roomVO);
	}

	public int insertMessage(MessageVO message) {
		return update("chatDAO.insertMessage", message);
	}

	public int readMessage(String sessionId) {
		return update("chatDAO.readMessage", sessionId);
	}

	@SuppressWarnings("unchecked")
	public List<EgovMap> messageHistory(String roomId) {
		return (List<EgovMap>) list("chatDAO.messageHistory", roomId);
	}

	@SuppressWarnings("unchecked")
	public List<EgovMap> selectChatList(String writer) {
		return (List<EgovMap>) list("chatDAO.selectChatList", writer);
	}

	public int updateSocketId(ChatRoomVO roomVO) {
		return update("chatDAO.updateSocketId", roomVO);
	}

	public int deleteSocketId(String sessionId) {
		return update("chatDAO.deleteSocketId", sessionId);
	}

	public int ifOtherConnect(ChatRoomVO roomVO) {
		return (int) select("chatDAO.ifOtherConnect", roomVO);
	}

	public String selectRoomId(String sessionId) {
		return (String) select("chatDAO.selectRoomId", sessionId);
	}

	public int selectNotReadMessage(String usrIdx) {
		return (int) select("chatDAO.selectNotReadMessage", usrIdx);
	}
}
