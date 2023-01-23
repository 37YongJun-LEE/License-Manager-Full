package egovframework.kku.adm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.com.cmm.EgovCmsCommonUtil;
import egovframework.com.cmm.util.EgovComcmmUtil;
import egovframework.kku.adm.service.EgovKkuAdmLoginSessionVO;
import egovframework.kku.adm.service.EgovKkuAdmUserService;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuAdmUserController {
	
	@Resource(name="KkuAdminService")
	private EgovKkuAdmUserService KkuAdminService;
	
	@RequestMapping(value="/admin/login.do")
	public String adminLogin( ) throws Exception {
		
		return "kkuapp/adm/login"; 
	}
	
	@RequestMapping(value="/admin/loginAction.do")
	@ResponseBody
	public String adminLoginAction(@ModelAttribute("vo") EgovKkuAppUserVO userVO, HttpServletRequest request) throws Exception {
		
		String md5Pwd = EgovComcmmUtil.genMD5(userVO.getUsrPassword());
		userVO.setUsrPassword(md5Pwd);
		int result = KkuAdminService.chkAdminAccount(userVO);
		String msg = "";
		if(result  == 1){
			EgovMap accountInfo = KkuAdminService.searchAdminAccount(userVO);
			EgovKkuAdmLoginSessionVO sessionVo = new EgovKkuAdmLoginSessionVO();
			sessionVo.setUsrIdx(Integer.toString((Integer)(accountInfo.get("usrIdx"))));
			sessionVo.setUsrEmail(userVO.getUsrEmail());
			sessionVo.setUsrNickname((String)accountInfo.get("usrNickname"));
			
			/**
			 * 여기에 사용자 레벨 값 넣어줘야됨
			 */
			request.getSession().setAttribute("adminSessionVO", sessionVo);
			msg = "success";
		}
		
		return msg;
	}
	
	@RequestMapping(value="/admin/logoutAction.do")
	public String adminLogoutAction(@ModelAttribute("vo") EgovKkuAppUserVO userVO, HttpServletRequest request) throws Exception {

		request.getSession().setAttribute("adminSessionVO", null);
		
		return "redirect:/admin/login.do";
	}
	
	@RequestMapping(value="/admin/userList.do")
	public String userList(@ModelAttribute("vo") EgovKkuAppUserVO UserVO, HttpServletRequest request, ModelMap model, EgovKkuAdmLoginSessionVO sessionVO) throws Exception {
		
		model.addAttribute("depth01","user");
		
		EgovKkuAdmLoginSessionVO sessionVO1 = (EgovKkuAdmLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUserInfo();
		model.addAttribute("sessionID", sessionVO1.getUsrEmail());
	
		//페이지네이션
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(UserVO.getPageIndex());
	    UserVO.setPageUnit(15);
	    paginationInfo.setRecordCountPerPage(15); //한페이지당 게시되는 게시물 건수 UserVO.getPageUnit()
        paginationInfo.setPageSize(10); //페이지 리스트에 게시되는 페이지 건수

        UserVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        UserVO.setLastIndex(paginationInfo.getLastRecordIndex());
        UserVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        paginationInfo.setTotalRecordCount(KkuAdminService.selectNormalUserListCnt(UserVO));
        List<EgovMap> list = KkuAdminService.selectAllNormalUserInfo(UserVO);
		model.addAttribute("usrList", list);
        model.addAttribute("paginationInfo", paginationInfo);
        //페이지네이션 fin

		return "kkuapp/adm/user/userList";
	}
	
	@RequestMapping(value="/admin/userModify.do")
	public String userModify(EgovKkuAppUserVO UserVO, String dest, Model model) throws Exception{
		
		model.addAttribute("depth01","user");
		
		EgovKkuAppUserVO modifyUserVO = KkuAdminService.selectModifyUserInfo(UserVO);
		model.addAttribute("modifyUserVO", modifyUserVO);
		model.addAttribute("destUrl", dest);
		return "kkuapp/adm/user/userModify";
	}
	
	@RequestMapping(value="/admin/usrModifyAction.do")
	@ResponseBody 
	public String userModifyAction(EgovKkuAppUserVO UserVO, Model model) throws Exception{
		
		if (UserVO.getUsrPassword().equals("")) {
			UserVO.setUsrPassword(null);
		} else {
			UserVO.setUsrPassword(EgovCmsCommonUtil.genMD5(UserVO.getUsrPassword()));
		}
		
		String msg  = "";
		if(KkuAdminService.updateUserInfo(UserVO) == 1){
			msg = "success";
		}
		else{
			msg = "fail";
		}
		return msg;
	}
	@RequestMapping(value="/admin/adminList.do")
	public String adminList(@ModelAttribute("vo") EgovKkuAppUserVO UserVO, HttpServletRequest request, ModelMap model, EgovKkuAdmLoginSessionVO sessionVO) throws Exception{
		
		model.addAttribute("depth01","user");
		
		EgovKkuAdmLoginSessionVO sessionVO1 = (EgovKkuAdmLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUserInfo();
		model.addAttribute("sessionID", sessionVO1.getUsrEmail());
	
		//페이지네이션
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(UserVO.getPageIndex());
	    UserVO.setPageUnit(15);
	    paginationInfo.setRecordCountPerPage(15); //한페이지당 게시되는 게시물 건수 UserVO.getPageUnit()
        paginationInfo.setPageSize(10); //페이지 리스트에 게시되는 페이지 건수

        UserVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        UserVO.setLastIndex(paginationInfo.getLastRecordIndex());
        UserVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        paginationInfo.setTotalRecordCount(KkuAdminService.selectAdminUserListCnt(UserVO));
        List<EgovMap> list = KkuAdminService.selectAllAdminUserInfo(UserVO);
		model.addAttribute("usrList", list);
        model.addAttribute("paginationInfo", paginationInfo);
        //페이지네이션 fin
        
		return "kkuapp/adm/user/adminList";
	}
	
	@RequestMapping(value="/admin/downloadExcel")
	public String downloadExcel() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		return "";
	}
	
//	@RequestMapping(value="boardList.do")
//	public String boardList(ModelMap model) throws Exception {
//		List<?> list = KkuAdminService.selectAllBoardInfo();
//		model.addAttribute("boardList", list);
//		return "kkuapp/adm/board/boardList";
//	}
	
}
