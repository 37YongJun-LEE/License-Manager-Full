package egovframework.kku.adm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmCampusInfoVO;
import egovframework.kku.adm.service.EgovKkuAdmCampusService;

import egovframework.kku.adm.service.EgovKkuAdmFacilityReportVO;

import egovframework.kku.adm.service.EgovKkuAdmRestaurantMenuVO;
import egovframework.kku.adm.service.EgovKkuAdmRestaurantVO;

import egovframework.kku.adm.service.EgovKkuAdmStudentInfoVO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("adminCampusService")
public class EgovKkuAdmCampusServiceImpl implements EgovKkuAdmCampusService{

	@Resource(name="adminCampusDAO")
	EgovKkuAdmCampusDAO adminCampusDAO;

	@Override
	public List<?> getReportList(EgovKkuAdmFacilityReportVO rVO) throws Exception {
		return adminCampusDAO.getReportList(rVO);
	}

	@Override
	public List<EgovMap> selectCampusInfoList(EgovKkuAdmCampusInfoVO infoVO) throws Exception {
		
		return adminCampusDAO.selectCampusList(infoVO);
	}
	
	@Override
	public List<?> selectCampusInfoUpdateList() throws Exception {
		
		return adminCampusDAO.selectCampusInfoUpdateList();
	}
	
	@Override
	public List<EgovMap> selectStudentInfoList(EgovKkuAppSchoolInfoCrawlerVO infoVO) throws Exception {
		
		return adminCampusDAO.selectStudentList(infoVO);
	}

	@Override
	public List<?> selectStudentInfoUpdateList() throws Exception {
		
		return adminCampusDAO.selectStudentInfoUpdateList();
	}

	@Override
	public EgovKkuAdmCampusInfoVO selectCampusInfoDetail(EgovKkuAdmCampusInfoVO infoVO) throws Exception {
		
		return adminCampusDAO.selectCampusInfoDetail(infoVO);
	}

	@Override
	public int updateCampusInfo(EgovKkuAdmCampusInfoVO infoVO) throws Exception {
		
		return adminCampusDAO.updateCampusInfo(infoVO);
	}

	@Override
	public int selectCampusInfoListCnt(EgovKkuAdmCampusInfoVO infoVO) throws Exception {
		
		return adminCampusDAO.selectCampusInfoListCnt(infoVO);
	}

	@Override
	public int selectStudentInfoListCnt(EgovKkuAppSchoolInfoCrawlerVO infoVO) throws Exception {
		
		return adminCampusDAO.selectStudentInfoListCnt(infoVO);
	}

	@Override
	public EgovKkuAdmStudentInfoVO selectStudentInfoDetail(EgovKkuAdmStudentInfoVO infoVO)
			throws Exception {
		
		return adminCampusDAO.selectStudentInfoDetail(infoVO);
	}

	@Override
	public int updateStudentInfo(EgovKkuAdmStudentInfoVO infoVO) throws Exception {
		
		return (int)adminCampusDAO.updateStudentInfo(infoVO);
	}


	@Override
	public EgovMap selectFacilityReportDetailByIdx(EgovKkuAdmFacilityReportVO vo) throws Exception {
		return adminCampusDAO.selectFacilityReportDetailByIdx(vo);
	}

	@Override
	public void updateFixReportByIdx(EgovKkuAdmFacilityReportVO vo) throws Exception {
		adminCampusDAO.updateFixReportByIdx(vo);
		
	}

	@Override
	public int getReportListCnt(EgovKkuAdmFacilityReportVO vo) throws Exception {
		return adminCampusDAO.getReportListCnt(vo);
	}

	@Override
	public List<?> selectRestaurantList(EgovKkuAdmRestaurantVO restVO) {

		return adminCampusDAO.selectRestaurantList(restVO);
	}

	@Override
	public int selectRestaurantListCnt(EgovKkuAdmRestaurantVO restVO) {
		// TODO Auto-generated method stub
		return adminCampusDAO.selectRestaurantListCnt(restVO);
	}

	@Override
	public EgovMap selectRestaurantDetail(EgovKkuAdmRestaurantVO restVO) {
		// TODO Auto-generated method stub
		return adminCampusDAO.selectRestaurantListDetail(restVO);
	}

	@Override
	public void insertRestaurant(EgovKkuAdmRestaurantVO restVO) {
		
		adminCampusDAO.insertRestaurant(restVO);
	}

	@Override
	public void updateRestaurant(EgovKkuAdmRestaurantVO restVO) {

		adminCampusDAO.updateRestaurant(restVO);
	}

	@Override
	public void deleteRestaurant(int restIdx) {
		
		adminCampusDAO.deleteRestaurant(restIdx);
	}

	@Override
	public List<?> selectRestMenu(int restIdx) {

		return adminCampusDAO.selectRestMenu(restIdx);
	}

	@Override
	public void deleteRestaurantMenu(String menuIdx) {
		
		adminCampusDAO.deleteRestaurantMenu(menuIdx);
	}

	@Override
	public void insertAndUpdateMainMenu(EgovKkuAdmRestaurantMenuVO menuVO) {
		if(menuVO.getMainMenuIdx().equals("0")) {
			if(menuVO.getMainMenuName().isEmpty()) {
			}else {
				adminCampusDAO.insertMainMenu(menuVO);
			}
		}else {
			adminCampusDAO.updateMainMenu(menuVO);
		}
	}

	@Override
	public void insertAndUpdateSubMenu(EgovKkuAdmRestaurantMenuVO menuVO) {
		if(menuVO.getSubMenuIdx().equals("0")) {
			if(menuVO.getSubMenuName().isEmpty()) {
			}else {
				adminCampusDAO.insertSubMenu(menuVO);
			}
		}else {
			adminCampusDAO.updateSubMenu(menuVO);
	}
}

	@Override
	public List<?> selectRestSubMenuList(int restIdx) {
		return adminCampusDAO.selectRestSubMenuList(restIdx);
	}

	

	

	

	
	
}
