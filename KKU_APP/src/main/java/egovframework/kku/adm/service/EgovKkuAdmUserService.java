package egovframework.kku.adm.service;

import java.util.List;

import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAdmUserService {
	public int chkAdminAccount(EgovKkuAppUserVO vo) throws Exception;
	
	public List<EgovMap> selectAllUserInfo(EgovKkuAppUserVO vo) throws Exception;
	
	/**
	 * 일반 유저들의 정보를 반환한다
	 * @param vo
	 * @return 일반 유저 정보 배열
	 * @throws Exception
	 */
	public List<EgovMap> selectAllNormalUserInfo(EgovKkuAppUserVO vo) throws Exception;
	
	/**
	 * 어드민 유저들의 정보를 반환한다
	 * @param vo
	 * @return 어드민 유저들의 정보
	 * @throws Exception
	 */
	public List<EgovMap> selectAllAdminUserInfo(EgovKkuAppUserVO vo) throws Exception;
	
	public List<?> selectAllBoardInfo() throws Exception;
	
	public EgovKkuAppUserVO selectModifyUserInfo(EgovKkuAppUserVO vo) throws Exception;
	
	//유저 count 결과 리턴
	public int selectUserListCnt(EgovKkuAppUserVO vo) throws Exception;
	
	// 어드민 유저 count 결과 리턴
	public int selectAdminUserListCnt(EgovKkuAppUserVO vo) throws Exception;
	
	// 일반 유저 count 결과 리턴
	public int selectNormalUserListCnt(EgovKkuAppUserVO vo) throws Exception;
	
	//유저 정보 업데이트
	public int updateUserInfo(EgovKkuAppUserVO vo) throws Exception;

	//접속 계정 정보
	public EgovMap searchAdminAccount(EgovKkuAppUserVO userVO) throws Exception;
}
