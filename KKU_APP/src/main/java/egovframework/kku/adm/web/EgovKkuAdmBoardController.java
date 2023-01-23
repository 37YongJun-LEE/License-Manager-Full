package egovframework.kku.adm.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.kku.adm.service.EgovKkuAdmBoardService;
import egovframework.kku.usr.service.EgovKkuAppBoardVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuAdmBoardController {
	
	@Resource(name="adminBoardService")
	EgovKkuAdmBoardService adminBoardService;
	
	  
	@RequestMapping(value="/admin/board.do") 
	public String board() throws Exception {
		return "kkuapp/adm/noticeboard/board"; 
	}
	  
	@RequestMapping(value="/admin/boardList.do") 
	public String noticeList() throws Exception {
		
		return "kkuapp/adm/noticeboard/boardList"; 
	}
	  
	  //자유 게시판 게시물 관리
	@RequestMapping(value="/admin/freenoticeList.do") 
	public String freenoticeList(EgovKkuAppCommunityVO communityVO, Model model) throws Exception {
		
		model.addAttribute("depth01","board");
		
		//페이지네이션
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(communityVO.getPageIndex());
	    communityVO.setPageUnit(15);
	    paginationInfo.setRecordCountPerPage(15); //한페이지당 게시되는 게시물 건수 UserVO.getPageUnit()
        paginationInfo.setPageSize(10); //페이지 리스트에 게시되는 페이지 건수

        communityVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        communityVO.setLastIndex(paginationInfo.getLastRecordIndex());
        communityVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        System.err.println("first"+paginationInfo.getFirstRecordIndex());
        System.err.println("last"+paginationInfo.getLastRecordIndex());
        System.err.println("recordcount"+paginationInfo.getRecordCountPerPage());	

        paginationInfo.setTotalRecordCount(adminBoardService.selectFreenoticeInfoListCnt(communityVO));
        System.err.println(adminBoardService.selectFreenoticeInfoListCnt(communityVO));
        
		List<EgovMap> list = adminBoardService.selectFreenoticeList(communityVO);
		model.addAttribute("freenoticeList",list);
		model.addAttribute("paginationInfo", paginationInfo);
		
	return "kkuapp/adm/noticeboard/freenoticeList"; 
	}
	
	@RequestMapping(value="/admin/freenoticeModifyAction.do") //자유 게시판 게시글 수정
	@ResponseBody
	public String freenoticeModifyAction(EgovKkuAppCommunityVO communityVO)throws Exception{
		
		String cont = communityVO.getBoardContent();
		String unescape = StringEscapeUtils.unescapeHtml(cont);
		
		int result = adminBoardService.updateFreenoticeInfo(communityVO);
		String resultMsg = "";
		if( result == 1){
			resultMsg = "success";
		}else{
			resultMsg = "fail";
		}
		return resultMsg;
	}
	@RequestMapping(value="/admin/freenoticeDeleteAction.do") //자유게시판 게시글 삭제
	@ResponseBody
	public String freenoticeDeleteAction(EgovKkuAppCommunityVO communityVO)throws Exception{
		
		int result = adminBoardService.deleteFreenoticeInfo(communityVO);
		String resultMsg = "";
		if( result == 1){
			resultMsg = "success";
		}else{
			resultMsg = "fail";
		}
		return resultMsg;
	}
	@RequestMapping(value="/admin/freenoticeListDetail.do")
	public String freenoticeListDetail(EgovKkuAppCommunityVO communityVO,Model model) throws Exception{

		model.addAttribute("depth01","board");
		
		EgovMap freenoticeInfo = adminBoardService.selectFreenoticeInfoDetail(communityVO);
		model.addAttribute("freenoticeInfo",freenoticeInfo);
		
		return "kkuapp/adm/noticeboard/freenoticeListDetail";
	}
	 
	//중고거래 게시판 게시물 관리
	  @RequestMapping(value="/admin/tradeList.do") 
	  public String tradeList(EgovKkuAppBoardVO boardVO, Model model) throws Exception {
		  
		 List<?> tradeList = adminBoardService.selectAllTradeList(boardVO);
		 System.err.println(tradeList);
		  
		  model.addAttribute("tradeList", tradeList);
		  model.addAttribute("depth01","trade");
		  
		
		  
	return "kkuapp/adm/noticeboard/tradeList"; 
		  }
	  
	  
	  //중고거래 게시판 게시물 수정
	  @RequestMapping(value="/admin/tradeListModifyAction.do")
		@ResponseBody
		public String tradeListModifyAction(EgovKkuAppBoardVO boardVO)throws Exception{
			
			String cont = boardVO.getTrdContent();
			String unescape = StringEscapeUtils.unescapeHtml(cont);
			
			int result = adminBoardService.updatetradeListInfo(boardVO);
			String resultMsg = "";
			if( result == 1){
				resultMsg = "success";
			}else{
				resultMsg = "fail";
			}
			return resultMsg;
		} 
	 
	
	  
	  @RequestMapping(value="/admin/topicList.do") 
	  public String topicList(Model model) throws Exception {
		   
		  model.addAttribute("depth01","board");
		  
	return "kkuapp/adm/noticeboard/topicList"; 
		  }
	  
	  @RequestMapping(value="/admin/majorBoard.do")
	  public String majorBoard(Model model) throws Exception {
		  
		  List<?> majorBoardList = adminBoardService.selectMajorBoardList(); //학과 게시판 리스트 
		  model.addAttribute("majorBoardList", majorBoardList);
		  return  "kkuapp/adm/noticeboard/majorBoard"; 
	  }
	 
}
