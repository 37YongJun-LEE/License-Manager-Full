package egovframework.kku.adm.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EgovKkuAdmChatController {
	@RequestMapping(value="/admin/onechat.do")
	public String onechat(Model model) throws Exception {
		
		model.addAttribute("depth01","chat");
		
		return "kkuapp/adm/chat/onechat";
	}

	@RequestMapping(value="/admin/tradechat.do")
	public String tradechat(Model model) throws Exception {
		
		model.addAttribute("depth01","chat");
		
		return "kkuapp/adm/chat/tradechat"; 
	}
}
