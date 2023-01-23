package egovframework.kku.usr.service;

import java.util.List;

import egovframework.cms.com.util.PmsComCodeVO;
import egovframework.kku.adm.service.EgovKkuUserEmailVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppUserService {
	// 닉네임 중복 검사
		public int chkDuplicateNick(String nickName)throws Exception;
		
		// 가입 
		public String memberInsert(EgovKkuAppUserVO vo)throws Exception;
		
		// 학과정보가져오기
		public List<?> departmentSelect(String usrDepartment)throws Exception;
		
		public List<?> findOptionDetail(String option)throws Exception;
		
		public int chkDuplicateUser(EgovKkuAppUserVO vo)throws Exception;
		
		public int Login(EgovKkuAppUserVO vo) throws Exception;
		
		public EgovMap selectUser(EgovKkuAppUserVO vo) throws Exception;
		
		public EgovMap selectUser2(String usrIdx) throws Exception;
		
		public EgovMap selectByDeviceId(String deviceId) throws Exception;
		
		public int usrPassUpdate(EgovKkuAppUserVO vo) throws Exception;
		
		// user id로 전공, 유저 등급 가져오기
		public EgovMap selectUsrInfoByUsrIdx(String usrIdx) throws Exception;

		public EgovMap selectAdminUserInfo(EgovKkuAppUserVO userVO);

		//유저 디바이스 정보 관련
		public int deviceCnt(EgovKkuAppDeviceVO appDeviceVO);

		public void updateDevice(EgovKkuAppDeviceVO appDeviceVO);

		public void insertDevice(EgovKkuAppDeviceVO appDeviceVO);
		
		public void updateDeviceUser(EgovKkuAppUserVO vo);
		
		public EgovMap selectUserDevice(EgovKkuAppUserVO vo);
		
		public List<EgovMap> findOptionDetailAll() throws Exception;

		public void insertReport(EgovKkuAppFacilityVO vo);

		public String insertSms(PmsComCodeVO vo);

		public List<?> showReportList() throws Exception;

		public List<?> showReportListDetail(EgovKkuAppFacilityVO facVO) throws Exception;

		public String selectFriendStatus(EgovKkuAppFriendVO fVO);
		
		//내가 접수한 시설 고장 리스트 
		public List<?> selectFacilityFix(EgovKkuAppFacilityVO facVO);
		//시설 고장 코멘트
		public int updateFacilityFixComment(EgovKkuAppFacilityVO facVO);
			//시설담당자 로그인 
		public int facLoginCheck(String loginName) throws Exception;

		public int updateFacilityProcess(EgovKkuAppFacilityVO facVO)throws Exception;
		//처리상태 가져오기
		public int getProcessState(EgovKkuAppFacilityVO facVO);

		public void insertEmailLog(EgovKkuUserEmailVO emailVO) throws Exception;

		public EgovMap selectUserByDeviceId(EgovKkuAppUserVO signUpVO) throws Exception;
		
		public List<?> selectUserByMajor(String test) throws Exception;

		void updateViewWho(EgovMap egovMap);
		
}
