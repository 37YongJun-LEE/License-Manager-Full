package egovframework.kku.usr.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.util.EgovComcmmUtil;
import egovframework.kku.adm.service.EgovKkuUserEmailVO;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
@Controller
public class EgovKkuAppSignUpController {

	@Resource(name="kkuUserService")
	private EgovKkuAppUserService kkuUserService;
	
	@RequestMapping(value="/member/join01.do")
	public String join01() throws Exception{
		return "kkuapp/web/login/join01";
	}
	//vjfcosydnoxgamva
	@RequestMapping(value="/member/join02.do") //이메일 인증 
	public String join02(HttpServletRequest request, EgovKkuAppUserVO SignUpVO, ModelMap model) throws Exception{
		String promotionYN = request.getParameter("promotionYN"); 
		model.addAttribute("promotionYn", promotionYN);
		return "kkuapp/web/login/join02";
	}
	
	
	@RequestMapping(value="/member/join03.do")
	public String join03(Model model, EgovKkuAppUserVO SignUpVO,HttpServletRequest request) throws Exception{
		String userEmail = request.getParameter("em"); 
		String promotionYN = request.getParameter("promotion"); 
		model.addAttribute("promotionYn", promotionYN);
		model.addAttribute("Mail",userEmail);
		return "kkuapp/web/login/join03";
	}
	@RequestMapping(value="/member/joinok.do")
	public String join04() throws Exception{
		return "kkuapp/web/login/join_ok";
	}
	
	@RequestMapping(value="/member/nickCheck.do",produces = "application/text; charset=utf8")
    @ResponseBody
	public String chkDuplicateNick(HttpServletRequest request, EgovKkuAppUserVO SignUpVO) throws Exception{
		String nickName = request.getParameter("usrNickname");
		int isExist = kkuUserService.chkDuplicateNick(nickName);
		
		return Integer.toString(isExist);
	} //닉네임 중복 체크 
	
	@RequestMapping(value="/member/email.do")
    @ResponseBody
	public String email(Model model, EgovKkuAppUserVO SignUpVO, HttpServletRequest request, EgovKkuUserEmailVO EmailVO) throws Exception{
		String strRan = "";
			EmailVO.setReceiverAddress(request.getParameter("usrEmail"));
			SignUpVO.setUsrEmail(request.getParameter("usrEmail"));
			int chkDuplicate =kkuUserService.chkDuplicateUser(SignUpVO);
			if( chkDuplicate != 0){
				strRan= "already";
			}
			else if(chkDuplicate == 0){
				HtmlEmail email = new HtmlEmail();
				email.setHostName(EmailVO.getHostName()); 
				//email.setSslSmtpPort(EmailVO.getPortNumber());
				email.setSmtpPort(Integer.parseInt(EmailVO.getPortNumber())  ); 
				email.setStartTLSEnabled(true);
				email.setSSLOnConnect(true); //smtp 연결 설정 
				
				java.util.Random generator = new java.util.Random();//인증숫자 생성
		        generator.setSeed(System.currentTimeMillis());
		        int ran = generator.nextInt(1000000) % 1000000; 
		        strRan = Integer.toString(ran);
		        
				email.addTo(EmailVO.getReceiverAddress(),"User"); //받는사람 주소
				String Content = "<html lang=\"en\">" + "<head> <meta charset=\"UTF-8\"> "
						+  "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
						+ "<meta name=\"Generator\" content=\"EditPlus®\">"
						+ "<meta name=\"Author\" content=\"건국대학교 커뮤니티 앱\">"
						+ "<meta name=\"Keywords\" content=\"건국대학교 커뮤니티 앱\">"
						+ "<meta name=\"Description\" content=\"건국대학교 커뮤니티 앱\">"
						+ "</head>"
						+ " <linkhref=\"https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:wght@100;300;400;500;700;900&display=swap\" rel=\"stylesheet\">"
						+ "<title>건국대학교 커뮤니티 앱</title> </head> <body>"
						+ "<div class=\"m_mail_container\" style=\" display: flex; align-items: center; justify-content: center; padding: 15px;\"> <div class=\"m_mail_box\" style=\"position: relative; width: 100%; padding: 0 0 30px; background: #fff; box-sizing: border-box; border-left: 1px solid #ddd; border-bottom: 1px solid #ddd; border-right: 1px solid #ddd;\">"
						+ "<p class=\"logo\" style = \"width: 100%; margin-bottom: 30px; background: #005228; padding: 10px 14px; box-sizing: border-box; \"> <img src=\"https://kuapp.smartcampus.life/_img/_img/comn/logo.png\" alt=\"건국대학교 커뮤니티 앱\" style=\"display: block; width: 80px; \"></p> <p class=\"mail_tit\" style=\" margin: 0 15px; margin-bottom: 12px; font: 400 17px/24px 'Roboto','Noto Sans KR', 'sans-serif', 'Malgun Gothic','맑은고딕','굴림','serif'; color: #333; \"><span style=\"font-weight: 600; color: #005228;\">KU 슬기로운 대학생활</span>에서<br>요청하신 인증번호를 발송해드립니다. </p>"
						+ "<p class=\"text\" style =\"margin: 0 15px; font: 400 13px/20px \"Roboto\", \"Noto Sans KR\", sans-serif; color: #333; \">아래 인증번호 6자리를<br>인증번호 입력창에 입력해주세요.</p>"
						+ "	<p class=\"num_box\" style=\"margin: 20px 10px; background: #f8f8f8; padding: 10px 15px; border-radius: 5px; font: 400 18px/27px \"Roboto\", \"Noto Sans KR\", sans-serif; color: #333;\">"+ strRan +"</p>"
						+ "<ul s> <li>본 메일은 발신 전용 입니다.</li> <li>계정관련하여 궁금한 점이 있으시다면<br> 관리자(<a href=\"mailto: shkim@withsystem.com\">shkim@withsystem.com</a>)에게 문의주세요</li> </ul></div></div> </body </html>";
						
		
				email.setFrom("kukuteamnoreply@gmail.com","KuKuTeam_Admin");
				email.setSubject("[비밀번호 인증 메일] KUKU Community"); // 메일 제목
				email.setContent(Content , "text/html; charset=euc-kr");
				email.setAuthentication("kukuteamnoreply@gmail.com", "vjfcosydnoxgamva");
				email.send();
				
				EmailVO.setElogContent(strRan);
				EmailVO.setElogType("SIGNUP");
				kkuUserService.insertEmailLog(EmailVO);
			}
			return strRan;
	} //이메일 인증 코드 보내기
	
	@SuppressWarnings("unchecked")					//produce로 인코딩 맞춤 -- json도 가능
	@RequestMapping(value = "/member/ajaxChangeOption.do",produces = "application/text; charset=utf8")
    @ResponseBody
	public String ajaxChangeOption(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String selected = request.getParameter("selected");
		List<EgovMap> resultList = (List<EgovMap>) kkuUserService.findOptionDetail(selected);
		String data = "[";
		for (EgovMap map : (List<EgovMap>) kkuUserService.findOptionDetail(selected)) {
  			String listData = "{";
  			
  			for(int i =0; i<map.size(); i++ ){
  				listData += "\"" + map.get(i) + "\" : \"" + map.get( map.get(i).toString()) + "\",";
  			}
  			
			listData = listData.substring(0, listData.length()-1);
  			listData += "}";
  			data += listData+ "," ; 
  		}
		data += "]";
    	//return resultList.toString();
    	return data;
	}
	
	@RequestMapping(value = "/member/memberInsert.do")
	@ResponseBody
	public String memberInsert(EgovKkuAppUserVO SignUpVO,ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String md5Pwd = EgovComcmmUtil.genMD5(SignUpVO.getUsrPassword());
		SignUpVO.setUsrPassword(md5Pwd);
		String result = "";
		int chkDuplicate =kkuUserService.chkDuplicateUser(SignUpVO);
		String msg="";
		if(chkDuplicate == 0 ){
			if( kkuUserService.memberInsert(SignUpVO) == null){
				msg = "ok";
			}
			else{
				msg= "insert fail";
			}
			
		}
		else{
			
			msg= "already";
		}

		
		
		return msg;
	
	}
	
}
