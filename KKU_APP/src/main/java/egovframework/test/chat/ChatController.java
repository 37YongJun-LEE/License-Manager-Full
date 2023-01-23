package egovframework.test.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
    
	@RequestMapping(value="/chatList.do")
	public String chatList() throws Exception {
		
		
		return "kkuapp/web/chat/chatList";
	}	
	
}