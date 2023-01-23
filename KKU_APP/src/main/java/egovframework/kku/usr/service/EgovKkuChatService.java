package egovframework.kku.usr.service;

import java.util.List;

import org.springframework.messaging.Message;

import egovframework.com.cmm.SessionVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuChatService {
	// 채팅 > 방을 만들때 이미 있는 방인지 체크
	public String ifExistRoom(ChatRoomVO vo) throws Exception;
	// 채팅 > 채팅방 만듬
	public int makeRoom(ChatRoomVO vo) throws Exception;
	// 채팅 > 채팅 정보 (roomId, 내닉네임, 상대닉네임)
	public List<EgovMap> selectChatInfo(String roomId);
	// 채팅 > 메세지 발송 > DB저장
	public int insertMessage(MessageVO message);
	// 채팅 > 채팅방 퇴장 시 > 읽은 메세지들 readCheck > 0으로 바꿔줌
	public int readMessage(String sessionId);
	// 채팅 > 채팅방 접속 시 > 채팅 내역 불러오기
	public List<EgovMap> messageHistory(String roomId);
	// 채팅리스트 접속 > 채팅 리스트 불러오기
	public List<EgovMap> selectChatList(String writer);
	// 채팅 > 유저 소켓 ID 저장
	public int updateSocketId(ChatRoomVO roomVO);
	// 채팅 > 유저 소켓 ID 삭제 (null로 바꿈)
	public int deleteSocketId(String sessionId);
	// 접속된 유저 카운트 정보
	public int ifOtherConnect(ChatRoomVO roomVO);
	// 세션id로 룸id 얻어오기
	public String selectRoomId(String sessionId);
	// 안읽은 채팅 개수 가져오기
	public int selectNotReadMessage(String usrIdx);
}