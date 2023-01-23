package egovframework.kku.usr.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppSchoolInfoRestaurantService {

	public List<EgovMap> selectBoardList(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) throws Exception;
	
	public int selectBoardListCnt(EgovKkuAppSchoolInfoRestaurantVO restaurantVO)throws Exception;
	
	public EgovMap selectBoardByIdx(EgovKkuAppSchoolInfoRestaurantVO restaurantVO)throws Exception;

	public List<EgovMap> restaurantFileList(EgovKkuAppSchoolInfoRestaurantVO restaurantVO)throws Exception;

	public List<EgovMap> selectMenuListByRestIdx(EgovKkuAppSchoolInfoRestaurantVO vo )throws Exception;


	List<EgovMap> selectMenuListByRestMenuIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception;

	public void insertMenuCart(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception;

	public List<EgovMap> selectMyCartListByRegIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception;

	public List<EgovMap> selectMenuCart(EgovKkuAppSchoolInfoRestaurantVO restaurantVO) throws Exception;

	public void updateMenuCart(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception;

	public void deleteMenuCart(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception;

	public void deleteMenuCartByBasketIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception;

	public void insertOrderInfo(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception;

	public void insertOrderMenu(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception;

	public List<EgovMap> selectOrderListByRegIdx(EgovKkuAppSchoolInfoRestaurantVO vo )throws Exception;

	public EgovMap selectOrderInfoByOrderInfoIdx(EgovKkuAppSchoolInfoRestaurantVO vo )throws Exception;

	public List<EgovMap> selectOrderMenuListByOrderNum(EgovKkuAppSchoolInfoRestaurantVO vo )throws Exception;

	public void deleteOrderByOrderInfoIdx(EgovKkuAppSchoolInfoRestaurantVO vo) throws Exception;



}
