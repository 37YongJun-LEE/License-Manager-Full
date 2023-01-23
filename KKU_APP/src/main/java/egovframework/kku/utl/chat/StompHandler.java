package egovframework.kku.utl.chat;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptorAdapter;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.kku.usr.service.ChatRoomVO;
import egovframework.kku.usr.service.EgovKkuChatService;
import egovframework.kku.usr.service.MessageVO;

// 연결과 종료를 알려주는 핸들러
@Component
public class StompHandler extends ChannelInterceptorAdapter {
	
	@Resource(name = "chatService")
	private EgovKkuChatService chatService;
	@Autowired
    private SimpMessagingTemplate template; //특정 Broker로 메세지를 전달

	@Override
    public Message<?> preSend(Message<?> message, MessageChannel channel) {
        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(message);
        String sessionId = accessor.getSessionId();
        switch (accessor.getCommand()) {
        	//소켓에 연결이 들어올 때
            case CONNECT:
            {

            	ChatRoomVO roomVO = new ChatRoomVO();
            	String writer = accessor.getFirstNativeHeader("writer");
                String roomId = accessor.getFirstNativeHeader("roomId");
                // 1. connect 발생 시 header에 담긴 정보로 roomVO에 등록
                roomVO.setRoomId(roomId);
                roomVO.setWriter(writer);
                roomVO.setSocketId(sessionId);
                // 2. socketID insert 
                chatService.updateSocketId(roomVO);
                // 3. 접속 여부 알림
                int ifOtherConnect = chatService.ifOtherConnect(roomVO);
                roomVO.setIfOtherConnect(ifOtherConnect);

                //접속시 메세지를 보냄(접속인원) : 서버 -> 클라이언트
                this.template.convertAndSend("/sub/chat/room/" + roomVO.getRoomId(), roomVO);
          
        		
        		return message;
            }
                
            //소켓에서 연결 해제 됐을 때 (뒤로가기, 강제종료 포함)
            case DISCONNECT:
            {
            	ChatRoomVO roomVO = new ChatRoomVO();
            	
            	// 1. 메세지 읽음 처리
                chatService.readMessage(sessionId);
                // 2. 방 정보 저장
                String roomId = chatService.selectRoomId(sessionId);
                roomVO.setRoomId(roomId);
                // 3. 세션 로그인 값 null로 처리 -> 결과 룸id리턴
                chatService.deleteSocketId(sessionId);
                // 4. 접속 여부 알림
                roomVO.setIfOtherConnect(0);
                
                //퇴장 시 메세지를 보냄(접속 여부) : 서버 -> 클라이언트
                this.template.convertAndSend("/sub/chat/room/" + roomVO.getRoomId(), roomVO);
                return message;
            }
            default:
                return message;
        }
    }

}