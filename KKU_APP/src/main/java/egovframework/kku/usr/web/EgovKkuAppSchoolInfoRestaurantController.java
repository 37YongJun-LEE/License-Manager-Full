package egovframework.kku.usr.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.cms.com.util.EgovCmsUserDetailsHelper;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoRestaurantService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoRestaurantVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EgovKkuAppSchoolInfoRestaurantController {
	
	@Resource(name = "restaurantService")
	private EgovKkuAppSchoolInfoRestaurantService restaurantService;

	//음식점정보 
	@RequestMapping(value="/restaurant.do")
		public String restaurantList(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO, 
			ModelMap model) throws Exception {

		PaginationInfo paginationInfo = new PaginationInfo();
		restaurantVO.setPageUnit(8); // 게시물 수 설정
        paginationInfo.setCurrentPageNo(restaurantVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(restaurantVO.getPageUnit());
        paginationInfo.setPageSize(5);
        restaurantVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        restaurantVO.setLastIndex(paginationInfo.getLastRecordIndex());
        restaurantVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        paginationInfo.setTotalRecordCount(restaurantService.selectBoardListCnt(restaurantVO));

        List<EgovMap> restaurantList = restaurantService.selectBoardList(restaurantVO);

        model.addAttribute("paginationInfo", paginationInfo);
    	model.addAttribute("restaurantList", restaurantList);
    	model.addAttribute("fileList", restaurantService.restaurantFileList(restaurantVO));

    	
		return "kkuapp/web/community/schoolinfo/restaurant";
	}
	
	//음식점정보 상세페이지 
	@RequestMapping(value="/restaurant_view.do")
	public String restaurantView(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO, ModelMap model) throws Exception{
		
		model.addAttribute("restaurantInfo", restaurantService.selectBoardByIdx(restaurantVO));
    	model.addAttribute("fileList", restaurantService.restaurantFileList(restaurantVO));
		List<EgovMap> restaurantMenuList = restaurantService.selectMenuListByRestIdx(restaurantVO);
		model.addAttribute("resultList", restaurantMenuList);
		System.err.println(restaurantMenuList);
		return "kkuapp/web/community/schoolinfo/restaurant_view";
	}
	
	//음식 상세페이지
	@RequestMapping(value="/menu_view.do")
	public String menuView(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO, ModelMap model) throws Exception{
		List<EgovMap> resultList = restaurantService.selectMenuListByRestMenuIdx(restaurantVO);
		
		EgovMap map = new EgovMap();
		if(!resultList.isEmpty()){
			 map =  resultList.get(0);
		}
		
		//addMenu , addMenuPrice

		model.addAttribute("resultMap", map);
		System.err.println("resultMappppppp = "+map.toString());

		return "kkuapp/web/community/schoolinfo/menu_view";
	}
	
	@RequestMapping(value="/cart_add_ajax.do")
	@ResponseBody
	public String cartAddAjax(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO, HttpServletRequest request) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		restaurantVO.setRegIdx(sessionVO.getUsrIdx());
	
		List<EgovMap> MycartList = restaurantService.selectMenuCart(restaurantVO);
		
		boolean checkCart = false;
		for(int i = 0; i<MycartList.size(); i++){
			
			 Object testRI = MycartList.get(i).get("restIdx");
			 Object testMN = MycartList.get(i).get("menuName");
			 Object testAD = MycartList.get(i).get("addMenu");
			 
			 String toRI = Integer.toString((int) testRI);
			 
			//System.err.println(request.getParameter("restIdx"));//장바구니에 새로 담는 메뉴의 가게 idx
			if(toRI.equals(request.getParameter("restIdx")) == false){
				System.err.println("다른 식당 접근");
				return "fail";
			}else{
				if(testMN.equals(request.getParameter("menuName")) && testAD.equals(request.getParameter("addMenu"))){
					checkCart = true;
					System.err.println("이미 장바구니에 존재하는 메뉴");
				}else{
					System.err.println("새로운 메뉴 추가");
				}
			}
	}//for문 끝
		if(checkCart == true){
			restaurantService.updateMenuCart(restaurantVO);
			return "success";
		}else{
			restaurantService.insertMenuCart(restaurantVO);
			return "success";
		}
	}
	
	@RequestMapping(value="/cart_new_ajax.do")
	@ResponseBody
	public String cartNewAjax(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO) throws Exception{
		
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		restaurantVO.setRegIdx(sessionVO.getUsrIdx());
		
		restaurantService.deleteMenuCart(restaurantVO);
		restaurantService.insertMenuCart(restaurantVO);
		System.err.println(restaurantVO);
		
		return "success";
	}
	
	//장바구니
	@RequestMapping(value="/cart.do")
	public String cart(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO, ModelMap model) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		restaurantVO.setRegIdx(sessionVO.getUsrIdx());
		List<EgovMap> cartList = restaurantService.selectMyCartListByRegIdx(restaurantVO);
		System.err.println(cartList);
		model.addAttribute("resultList", cartList);
		
		int totalPrice = 0;
		
		for(int i = 0; i<cartList.size(); i++){
			Object menutotalPrice = cartList.get(i).get("menuTotalPrice");
			int mtp = Integer.parseInt((String) menutotalPrice);
			totalPrice += mtp;
		}
		
		model.addAttribute("totalPrice", totalPrice);
		
		return "kkuapp/web/community/schoolinfo/cart";
	}
	
	@RequestMapping(value="/cart_del_ajax.do")
	@ResponseBody
	public String cartDelAjax(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO, HttpServletRequest request) throws Exception{

		restaurantVO.setBasketIdx(request.getParameter("basketIdx"));
		System.err.println("test"+restaurantVO.getBasketIdx());
		restaurantService.deleteMenuCartByBasketIdx(restaurantVO);
		
		return "success";
	}
	
	@RequestMapping(value="/order_add_ajax.do")
	@ResponseBody
	public String orderAddAjax(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO, HttpServletRequest request) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		restaurantVO.setRegIdx(sessionVO.getUsrIdx());
		
		restaurantService.insertOrderInfo(restaurantVO);
		
		System.err.println("orderInfo ===>>>"+restaurantVO);
		int orderListSize = Integer.parseInt(request.getParameter("orderListSize"));
		
		for(int i=1;i<=orderListSize;i++){
			restaurantVO.setMenuIdx(request.getParameter("menuIdx"+i));
			restaurantVO.setMenuName(request.getParameter("menuName"+i));
			restaurantVO.setAddMenu(request.getParameter("addMenu"+i));
			restaurantVO.setAddMenuPrice(request.getParameter("addMenuPrice"+i));
			restaurantVO.setMenuCnt(request.getParameter("menuCnt"+i));
			restaurantVO.setMenuPrice(request.getParameter("menuPrice"+i));
			
			System.err.println("NeworderInfo ===>>>"+restaurantVO);
			restaurantService.insertOrderMenu(restaurantVO);
		}

		return "success";

	}
	
	@RequestMapping(value="/order.do")
	public String orderList(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO, ModelMap model) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		restaurantVO.setRegIdx(sessionVO.getUsrIdx());
		
		List<EgovMap> OrderList = restaurantService.selectOrderListByRegIdx(restaurantVO);
		model.addAttribute("resultList", OrderList);
		//model.addAttribute("fileList", restaurantService.restaurantFileList(restaurantVO));
		restaurantService.deleteMenuCart(restaurantVO);

		return "kkuapp/web/community/schoolinfo/order";
	}
	
	@RequestMapping(value="/order_view.do")
	public String orderView(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO, ModelMap model) throws Exception{
		EgovKkuAppLoginSessionVO sessionVO = (EgovKkuAppLoginSessionVO) EgovCmsUserDetailsHelper.getAuthenticatedUser();
		restaurantVO.setRegIdx(sessionVO.getUsrIdx());
		
		model.addAttribute("orderInfo", restaurantService.selectOrderInfoByOrderInfoIdx(restaurantVO));
		
		List<EgovMap> OrderMenuList = restaurantService.selectOrderMenuListByOrderNum(restaurantVO);
		model.addAttribute("orderMenuList", OrderMenuList);
		System.err.println("@@@@@@@@@@@"+OrderMenuList);
		
		return "kkuapp/web/community/schoolinfo/order_view";
	}
	
	@RequestMapping(value="/order_del_ajax.do")
	@ResponseBody
	public String orderDelAjax(@ModelAttribute("restaurantVO") EgovKkuAppSchoolInfoRestaurantVO restaurantVO, HttpServletRequest request) throws Exception{

		restaurantVO.setOrderInfoIdx(request.getParameter("orderInfoIdx"));
		System.err.println("test"+restaurantVO.getOrderInfoIdx());
		restaurantService.deleteOrderByOrderInfoIdx(restaurantVO);
		
		return "success";
	}
	
}