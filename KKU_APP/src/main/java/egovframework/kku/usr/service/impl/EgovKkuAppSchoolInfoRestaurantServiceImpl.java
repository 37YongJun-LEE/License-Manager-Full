package egovframework.kku.usr.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.usr.service.EgovKkuAppSchoolInfoRestaurantService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoRestaurantVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("restaurantService")
public class EgovKkuAppSchoolInfoRestaurantServiceImpl implements EgovKkuAppSchoolInfoRestaurantService {

	@Resource(name="restaurantDAO")
	public EgovKkuAppSchoolInfoRestaurantDAO restaurantDAO;
	
	public List<EgovMap> selectBoardList(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) throws Exception {
		return restaurantDAO.selectBoardList(restaurantVO);
	}

	@Override
	public int selectBoardListCnt(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) throws Exception {
		return restaurantDAO.selectBoardListCnt(restaurantVO);
	}

	@Override
	public EgovMap selectBoardByIdx(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) throws Exception {
		return restaurantDAO.selectBoardByIdx(restaurantVO);
	}

	@Override
	public List<EgovMap> restaurantFileList(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) throws Exception {
		return restaurantDAO.restaurantFileList(restaurantVO);
	}

	@Override
	public List<EgovMap> selectMenuListByRestIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		return restaurantDAO.selectMenuListByRestIdx(vo);
	}

	@Override
	public List<EgovMap> selectMenuListByRestMenuIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		return restaurantDAO.selectMenuListByRestMenuIdx(vo);
	}

	@Override
	public void insertMenuCart(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		restaurantDAO.insertMenuCart(vo);
	}

	@Override
	public List<EgovMap> selectMyCartListByRegIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		return restaurantDAO.selectMyCartListByRegIdx(vo);
	}

	@Override
	public List<EgovMap> selectMenuCart(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) throws Exception {
		return restaurantDAO.selectMenuCart(restaurantVO);	
	}

	@Override
	public void updateMenuCart(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		restaurantDAO.updateMenuCart(vo);	
	}

	@Override
	public void deleteMenuCart(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		restaurantDAO.deleteMenuCart(vo);
	}

	@Override
	public void deleteMenuCartByBasketIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		restaurantDAO.deleteMenuCartByBasketIdx(vo);
	}

	@Override
	public void insertOrderInfo(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		restaurantDAO.insertOrderInfo(vo);
	}

	@Override
	public void insertOrderMenu(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		restaurantDAO.insertOrderMenu(vo);
	}

	@Override
	public List<EgovMap> selectOrderListByRegIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		return restaurantDAO.selectOrderListByRegIdx(vo);
	}

	@Override
	public EgovMap selectOrderInfoByOrderInfoIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		return restaurantDAO.selectOrderInfoByOrderInfoIdx(vo);
	}

	@Override
	public List<EgovMap> selectOrderMenuListByOrderNum(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		return restaurantDAO.selectOrderMenuListByOrderNum(vo);
	}

	@Override
	public void deleteOrderByOrderInfoIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception {
		restaurantDAO.deleteOrderByOrderInfoIdx(vo);
	}

}
