package egovframework.kku.adm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("KkuAdminDAO")
public class EgovKkuAdmUserDAO extends EgovComAbstractDAO{

	/**
	 * 모든 유저들의 정보들을 반환한다 
	 *
	 * @param vo
	 * @return 모든 유저 정보 리스트
	 */
	@SuppressWarnings("unchecked")
	public List<EgovMap> selectAllUserInfo(EgovKkuAppUserVO vo){
		return (List<EgovMap>) list("KkuAdminDAO.selectAllUserInfo", vo);
	}
	
	/**
	 * 일반 유저들의 정보들을 반환한다 
	 *
	 * @param vo
	 * @return 모든 유저 정보 리스트
	 */
	@SuppressWarnings("unchecked")
	public List<EgovMap> selectAllNormalUserInfo(EgovKkuAppUserVO vo){
		return (List<EgovMap>) list("KkuAdminDAO.selectAllNormalUserInfo", vo);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<EgovMap> selectAllAdminUserInfo(EgovKkuAppUserVO vo){
		return (List<EgovMap>) list("KkuAdminDAO.selectAllAdminUserInfo", vo);
	}
	
	public List<?> selectAllBoardInfo(){
		return list("KkuAdminDAO.selectAllBoardInfo");
	}

	public EgovKkuAppUserVO selectModifyUserInfo(EgovKkuAppUserVO vo) {
		return (EgovKkuAppUserVO) select("KkuAdminDAO.selectModifyUserInfo",vo);
	}

	public int selectUserListCnt(EgovKkuAppUserVO vo) {
		return (Integer)select("KkuAdminDAO.selectUserListCnt",vo);
	}
	
	public int selectAdminUserListCnt(EgovKkuAppUserVO vo) {
		return (Integer)select("KkuAdminDAO.selectAdminUserListCnt",vo);
	}
	
	public int selectNormalUserListCnt(EgovKkuAppUserVO vo) {
		return (Integer)select("KkuAdminDAO.selectNormalUserListCnt",vo);
	}

	public int updateUserInfo(EgovKkuAppUserVO vo) {
		return (int) update("KkuAdminDAO.updateUserInfo",vo);
	}

	public int chkAdminAccount(EgovKkuAppUserVO vo) {
		return (int) select("KkuAdminDAO.chkAdminAccount",vo);
	}

	public EgovMap searchAdminAccount(EgovKkuAppUserVO userVO) {
		return (EgovMap) select("KkuAdminDAO.searchAdminAccount", userVO);
	}
}
