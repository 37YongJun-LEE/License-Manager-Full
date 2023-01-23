package egovframework.kku.utl.chat;

import java.util.Base64;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.EgovCmsCommonUtil;
import egovframework.com.cmm.EgovCmsFileUtil;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.usr.service.ChatRoomVO;
import egovframework.kku.usr.service.EgovKkuChatService;
import egovframework.kku.usr.service.EgovKkuLostVO;
import egovframework.kku.usr.service.MessageVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import org.springframework.web.socket.BinaryMessage;
import java.nio.ByteBuffer;


@Controller
public class StompController {

	@Resource(name = "chatService")
	private EgovKkuChatService chatService;

    //입장하고, 구독된 상태에서 매핑됨. (메세지를 보낼때마다 동작함)
	@MessageMapping("/chat/message/{id}")
	@SendTo("/sub/chat/room/{id}")
    public MessageVO message(@DestinationVariable String id, MessageVO message) throws Exception{
    	if(message.getBase64() == null){
	    	//2.db에 메세지 저장해야함.
	    	chatService.insertMessage(message);
	    	return message;
    	} else { // 이미지가 포함 된 경우
    		String fileName = uploadFile(message.getBase64());
    		message.setImageFile(fileName);
	    	chatService.insertMessage(message);
    		return message;
    	}
	}
	
	
	 public String uploadFile(String base64) throws Exception {

    	String folderName = "chat";
 		String convertedFileName = "";
		 
		 
	     final String[] base64Array = base64.split(",");
	     String dataUir, data;
	     if (base64Array.length > 1) {
	         dataUir = base64Array[0];
	         data = base64Array[1];
	     } else {
	         //Build according to the specific file you represent
	         dataUir = "data:image/jpg;base64";
	         data = base64Array[0];
	     }
	     MultipartFile mf = new Base64ToMultipartFile(data, dataUir);
	     

		if(mf.getSize()>0){
			if(mf.getContentType().toString().contains("image")){
			}
			
			convertedFileName = EgovCmsFileUtil.fileSingleUpload(mf, folderName);
			
			//commService.insertBoardFile(fileVO);
		}  
	     
	     
	     return convertedFileName;
	 }
		
}