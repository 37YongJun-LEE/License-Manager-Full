package egovframework.kku.usr.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.kku.usr.service.EgovKkuAppSchoolInfoRoomService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoRoomVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuAppSchoolInfoRoomController {
	
	@Resource(name = "roomService")
	private EgovKkuAppSchoolInfoRoomService roomService;
	
	//음식점정보 
	@RequestMapping(value="/room.do")
	public String roomList(@ModelAttribute("roomVO") EgovKkuAppSchoolInfoRoomVO roomVO, 
		ModelMap model) throws Exception {
		
		//on&off
		String roomLocation = roomVO.getRoomLocation();
		Map<String,String> onOff = new HashMap<String,String>();
		onOff.clear();
	
		if (roomLocation == null) roomLocation = "모두보기";
		switch(roomLocation){
		case "모두보기":
			onOff.put("All", "on");
			break;
		case "모시래마을":
			onOff.put("M", "on");
			break;
		case "신촌마을":
			onOff.put("S", "on");
			break;
		case "단월동":
			onOff.put("D", "on");
			break;
		}
		model.addAttribute("onOff", onOff);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		roomVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(roomVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(roomVO.getPageUnit());
        paginationInfo.setPageSize(5);
        roomVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        roomVO.setLastIndex(paginationInfo.getLastRecordIndex());
        roomVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        paginationInfo.setTotalRecordCount(roomService.selectBoardListCnt(roomVO));
        List<EgovMap> roomList = roomService.selectBoardList(roomVO);
        model.addAttribute("paginationInfo", paginationInfo);
    	model.addAttribute("roomList", roomList);
    	model.addAttribute("fileList", roomService.roomFileList(roomVO));
    	
    	
		return "kkuapp/web/community/schoolinfo/room";
	}
	
	//음식점정보 상세페이지 
	@RequestMapping(value="/room_view.do")
	public String restaurantView(@ModelAttribute("roomVO") EgovKkuAppSchoolInfoRoomVO roomVO, ModelMap model) throws Exception{
		
		int idx = roomVO.getRoomIdx();
		
		model.addAttribute("roomVO", roomVO);
		model.addAttribute("roomInfo", roomService.selectBoardByIdx(roomVO));
		
		return "kkuapp/web/community/schoolinfo/room_view";
	}
}
