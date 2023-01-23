package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoRestaurantVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("restaurantDAO")
public class EgovKkuAppSchoolInfoRestaurantDAO extends EgovComAbstractDAO {

	public List<EgovMap> selectBoardList(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) throws Exception {
		return (List<EgovMap>) list("restaurantDAO.selectBoardList", restaurantVO);
	}

	public int selectBoardListCnt(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) {
		return (int) select("restaurantDAO.selectBoardListCnt",restaurantVO);
	}

	public EgovMap selectBoardByIdx(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) {
		return (EgovMap) select("restaurantDAO.selectBoardByIdx", restaurantVO);
	}

	public List<EgovMap> restaurantFileList(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) {
		return (List<EgovMap>) list("restaurantDAO.restaurantFileList", restaurantVO);
	}

	public List<EgovMap> selectMenuListByRestIdx(EgovKkuAppSchoolInfoRestaurantVO vo) {
		return (List<EgovMap>) list("restaurantDAO.selectMenuListByRestIdx", vo);
	}

	public List<EgovMap> selectMenuListByRestMenuIdx(EgovKkuAppSchoolInfoRestaurantVO vo) {
		return (List<EgovMap>) list("restaurantDAO.selectMenuListByRestMenuIdx", vo);
	}

	public void insertMenuCart(EgovKkuAppSchoolInfoRestaurantVO vo) {
		insert("restaurantDAO.insertMenuCart", vo);
	}

	public List<EgovMap> selectMyCartListByRegIdx(EgovKkuAppSchoolInfoRestaurantVO vo) {
		return (List<EgovMap>) list("restaurantDAO.selectMyCartListByRegIdx", vo);
	}
	
	public List<EgovMap> selectMenuCart(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) throws Exception {
		return (List<EgovMap>) list("restaurantDAO.selectMenuCart", restaurantVO);
	}

	public void updateMenuCart(EgovKkuAppSchoolInfoRestaurantVO vo) {
		update("restaurantDAO.updateMenuCart", vo);
	}

	public void deleteMenuCart(EgovKkuAppSchoolInfoRestaurantVO vo) {
		delete("restaurantDAO.deleteMenuCart", vo);
	}

	public void deleteMenuCartByBasketIdx(EgovKkuAppSchoolInfoRestaurantVO vo) {
		delete("restaurantDAO.deleteMenuCartByBasketIdx", vo);
	}

	public void insertOrderInfo(EgovKkuAppSchoolInfoRestaurantVO vo) {
		insert("restaurantDAO.insertOrderInfo", vo);
	}

	public void insertOrderMenu(EgovKkuAppSchoolInfoRestaurantVO vo) {
		insert("restaurantDAO.insertOrderMenu", vo);
	}

	public List<EgovMap> selectOrderListByRegIdx(EgovKkuAppSchoolInfoRestaurantVO vo) {
		return (List<EgovMap>) list("restaurantDAO.selectOrderListByRegIdx", vo);
	}

	public EgovMap selectOrderInfoByOrderInfoIdx(EgovKkuAppSchoolInfoRestaurantVO vo) {
		return (EgovMap) select("restaurantDAO.selectOrderInfoByOrderInfoIdx", vo);
	}

	public List<EgovMap> selectOrderMenuListByOrderNum(EgovKkuAppSchoolInfoRestaurantVO vo) {
		return (List<EgovMap>) list("restaurantDAO.selectOrderMenuListByOrderNum", vo);
	}

	public void deleteOrderByOrderInfoIdx(EgovKkuAppSchoolInfoRestaurantVO vo) {
		delete("restaurantDAO.deleteOrderByOrderInfoIdx", vo);
	}

}
