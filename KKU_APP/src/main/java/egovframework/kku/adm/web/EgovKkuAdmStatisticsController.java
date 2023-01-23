package egovframework.kku.adm.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EgovKkuAdmStatisticsController {
	@RequestMapping(value="/admin/statistics.do") 
	public String report(Model model) throws Exception {
			  
		model.addAttribute("depth01","statistics");
		
		 return "kkuapp/adm/statistics/statistics"; 
	 }
}
