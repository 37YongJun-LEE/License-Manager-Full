package egovframework.kku.adm.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EgovKkuAdmClassController {
	
	@RequestMapping(value="/admin/studyinfo.do") 
	public String studyinfo(Model model) throws Exception {
		
		model.addAttribute("depth01","lectureInfo");
		
		return "kkuapp/adm/study/studyinfo"; 
	}

	@RequestMapping(value="/admin/studyrefer.do")
	public String studyrefer(Model model) throws Exception {

		model.addAttribute("depth01","lectureInfo");
		
		return "kkuapp/adm/study/studyrefer"; 
	}
}
