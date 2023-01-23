package egovframework.kku.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.cms.com.util.PmsComCodeVO;
import egovframework.kku.adm.service.EgovKkuUserEmailVO;
import egovframework.kku.usr.service.EgovKkuAppCodeVO;
import egovframework.kku.usr.service.EgovKkuAppDeviceVO;
import egovframework.kku.usr.service.EgovKkuAppFacilityVO;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("kkuUserService")
public class EgovKkuAppUserServiceImpl implements EgovKkuAppUserService {
	@Resource(name = "kkuUserDAO")
	private EgovKkuAppUserDAO kkuUserDAO;
	
/*sign up start*/
	@Override
	public String memberInsert(EgovKkuAppUserVO vo) throws Exception {
		return kkuUserDAO.memberInsert(vo);
	}
	
	@Override
	public List<?> findOptionDetail(String option)throws Exception{
		return kkuUserDAO.findOptionDetail(option);
	}

	@Override
	public List<?> departmentSelect(String usrDepartment)throws Exception{
		return kkuUserDAO.departmentSelect(usrDepartment);
	}

	@Override
	public int chkDuplicateNick(String nickName) throws Exception {
		// TODO Auto-generated method stub
		return kkuUserDAO.chkDuplicateNick(nickName);
	}

	@Override
	public int chkDuplicateUser(EgovKkuAppUserVO vo) throws Exception {
		return kkuUserDAO.chkDuplicateUser( vo);
	}
	/*sign up end*/
	
	public int Login(EgovKkuAppUserVO vo) throws Exception{
		return kkuUserDAO.Login(vo);
	}

	@Override
	public EgovMap selectUser(EgovKkuAppUserVO vo) throws Exception {
		return kkuUserDAO.selectUser(vo);
	}
	
	@Override
	public EgovMap selectUser2(String usrIdx) throws Exception {
		return kkuUserDAO.selectUser2(usrIdx);
	}
	
	@Override
	public EgovMap selectByDeviceId(String deviceId) throws Exception {
		return kkuUserDAO.selectByDeviceId(deviceId);
	}

	@Override
	public int usrPassUpdate(EgovKkuAppUserVO vo) throws Exception {
		return kkuUserDAO.usrPassUpdate(vo);
	}

	@Override
	public EgovMap selectUsrInfoByUsrIdx(String usrIdx) throws Exception {
		return kkuUserDAO.selectUsrInfoByUsrIdx(usrIdx);
	}

	@Override
	public EgovMap selectAdminUserInfo(EgovKkuAppUserVO userVO) {
		return kkuUserDAO.selectAdminUserInfo(userVO);
	}

	@Override
	public int deviceCnt(EgovKkuAppDeviceVO appDeviceVO) {
		return kkuUserDAO.deviceCnt(appDeviceVO);
	}

	@Override
	public void updateDevice(EgovKkuAppDeviceVO appDeviceVO) {
		kkuUserDAO.updateDevice(appDeviceVO);
		
	}

	@Override
	public void insertDevice(EgovKkuAppDeviceVO appDeviceVO) {
		kkuUserDAO.insertDevice(appDeviceVO);
		
	}

	@Override
	public EgovMap selectUserDevice(EgovKkuAppUserVO vo) {
		return kkuUserDAO.selectUserDevice(vo);
	}

	@Override
	public void updateDeviceUser(EgovKkuAppUserVO vo) {
		kkuUserDAO.updateDeviceUser(vo);
		
	}
	@Override
	public List<EgovMap> findOptionDetailAll() throws Exception {
		return kkuUserDAO.findOptionDetailAll();
	}

	@Override
	public void insertReport(EgovKkuAppFacilityVO vo) {
		 kkuUserDAO.insertReport(vo);
	}

	@Override
	public String insertSms(PmsComCodeVO vo) {
		return kkuUserDAO.insertSms(vo);
	}

	@Override
	public List<?> showReportList() throws Exception {
		return kkuUserDAO.showReportList();
	}

	@Override
	public List<?> showReportListDetail(EgovKkuAppFacilityVO facVO) throws Exception {
		return kkuUserDAO.showReportListDetail(facVO);
	}

	@Override
	public String selectFriendStatus(EgovKkuAppFriendVO fVO) {
		return kkuUserDAO.selectFriendStatus(fVO);
	}

	@Override
	public List<?> selectFacilityFix(EgovKkuAppFacilityVO facVO) {
		return kkuUserDAO.selectFacilityFix(facVO);
	}

	@Override
	public int updateFacilityFixComment(EgovKkuAppFacilityVO facVO) {
		return kkuUserDAO.updateFacilityFixComment(facVO);
	}

	@Override
	public int facLoginCheck(String loginName) throws Exception {
		return kkuUserDAO.facLoginCheck(loginName);
	}

	@Override
	public int updateFacilityProcess(EgovKkuAppFacilityVO facVO) throws Exception {
		return kkuUserDAO.updateFacilityProcess(facVO);
		
	}

	@Override
	public int getProcessState(EgovKkuAppFacilityVO facVO) {
		return kkuUserDAO.getProcessState(facVO);
	}

	@Override
	public void insertEmailLog(EgovKkuUserEmailVO emailVO) throws Exception {
		kkuUserDAO.insertEmailLog(emailVO);
		
	}

	@Override
	public EgovMap selectUserByDeviceId(EgovKkuAppUserVO signUpVO) throws Exception {
		return kkuUserDAO.selectUserByDeviceId(signUpVO);
	}
	
	@Override
	public List<?> selectUserByMajor(String test) throws Exception {
		return kkuUserDAO.selectUserByMajor(test);
	}

	@Override
	public void updateViewWho(EgovMap egovMap) {
		kkuUserDAO.updateViewWho(egovMap);
	}
	
	
}
