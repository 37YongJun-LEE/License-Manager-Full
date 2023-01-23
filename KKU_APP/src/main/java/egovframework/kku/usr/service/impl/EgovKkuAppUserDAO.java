package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.cms.com.util.PmsComCodeVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.adm.service.EgovKkuUserEmailVO;
import egovframework.kku.usr.service.EgovKkuAppDeviceVO;
import egovframework.kku.usr.service.EgovKkuAppFacilityVO;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("kkuUserDAO")
public class EgovKkuAppUserDAO extends EgovComAbstractDAO {
	public int chkDuplicateNick(String nickName) {

		return (Integer) select("kkuUserDAO.chkDuplicateNick", nickName);
	}

	public String memberInsert(EgovKkuAppUserVO vo) {
		return (String) insert("kkuUserDAO.memberInsert", vo);
	}

	public List<?> departmentSelect(String usrDepartment) {
		return list("kkuUserDAO.departmentSelect", usrDepartment);
	}

	public List<?> findOptionDetail(String option) {
		return list("kkuUserDAO.findOptionDetail", option);
	}

	public int chkDuplicateUser(EgovKkuAppUserVO vo) {
		return (Integer) select("kkuUserDAO.chkDuplicateUser", vo);
	}

	public int Login(EgovKkuAppUserVO vo) throws Exception {
		return (int) select("kkuUserDAO.Login", vo);
	}

	public EgovMap selectUser(EgovKkuAppUserVO vo) throws Exception {
		return (EgovMap) select("kkuUserDAO.selectUser", vo);
	}
	
	public EgovMap selectUser2(String usrIdx) throws Exception {
		return (EgovMap) select("kkuUserDAO.selectUser", usrIdx);
	}

	public int usrPassUpdate(EgovKkuAppUserVO vo) {
		return update("kkuUserDAO.usrPassUpdate", vo);
	}

	public EgovMap selectUsrInfoByUsrIdx(String usrIdx) {
		return (EgovMap) select("kkuUserDAO.selectUsrInfoByUsrIdx", usrIdx);
	}

	public EgovMap selectAdminUserInfo(EgovKkuAppUserVO userVO) {
		return (EgovMap) select("kkuUserDAO.selectAdminUserInfo", userVO);
	}

	public int deviceCnt(EgovKkuAppDeviceVO appDeviceVO) {
		return (int) select("kkuUserDAO.deviceCnt", appDeviceVO);
	}

	public void updateDevice(EgovKkuAppDeviceVO appDeviceVO) {
		update("kkuUserDAO.updateDevice", appDeviceVO);

	}

	public void insertDevice(EgovKkuAppDeviceVO appDeviceVO) {
		insert("kkuUserDAO.insertDevice", appDeviceVO);

	}

	public EgovMap selectUserDevice(EgovKkuAppUserVO vo) {
		return (EgovMap) select("kkuUserDAO.selectUserDevice", vo);

	}

	public void updateDeviceUser(EgovKkuAppUserVO vo) {
		insert("kkuUserDAO.updateDeviceUser", vo);
	}
	
	public List<EgovMap> findOptionDetailAll() {
		return (List<EgovMap>) list("kkuUserDAO.findOptionDetailAll");
	}

	public void insertReport(EgovKkuAppFacilityVO vo) {
		 insert("kkuUserDAO.insertReport",vo);
	}

	public String insertSms(PmsComCodeVO vo) {
		return (String) insert("kkuUserDAO.insertSms",vo);
	}

	public List<?> showReportList() {
		return list("kkuUserDAO.showReportList");
	}

	public List<?> showReportListDetail(EgovKkuAppFacilityVO facVO) {
		return  list("kkuUserDAO.showReportListDetail",facVO);
	}

	public String selectFriendStatus(EgovKkuAppFriendVO fVO) {
		return (String) select("kkuUserDAO.selectFriendStatus", fVO);
	}
	public List<?> selectFacilityFix(EgovKkuAppFacilityVO facVO) {
		return list("kkuUserDAO.selectFacilityFix",facVO);
		}

	public int updateFacilityFixComment(EgovKkuAppFacilityVO facVO) {
		return (int) update("kkuUserDAO.updateFacilityFixComment", facVO);
	}

	public int facLoginCheck(String loginName) {
		return (int) select("kkuUserDAO.facLoginCheck", loginName);
	}

	public int updateFacilityProcess(EgovKkuAppFacilityVO facVO) {
		return (int) update("kkuUserDAO.updateFacilityProcess", facVO);
	}

	public int getProcessState(EgovKkuAppFacilityVO facVO) {
		return (int) select("kkuUserDAO.getProcessState", facVO);
	}

	public void insertEmailLog(EgovKkuUserEmailVO emailVO) {
		insert("kkuUserDAO.insertEmailLog", emailVO);
	}

	public EgovMap selectByDeviceId(String deviceId) {
		return (EgovMap) select("kkuUserDAO.selectByDeviceId", deviceId);
	}

	public EgovMap selectUserByDeviceId(EgovKkuAppUserVO signUpVO) {
		return (EgovMap) select("kkuUserDAO.selectUserByDeviceId", signUpVO);
	}
	
	public List<?> selectUserByMajor(String test) {
		return list("kkuUserDAO.selectUserByMajor", test);
	}

	public void updateViewWho(EgovMap egovMap) {
		update("kkuUserDAO.updateViewWho", egovMap);
	}
}
