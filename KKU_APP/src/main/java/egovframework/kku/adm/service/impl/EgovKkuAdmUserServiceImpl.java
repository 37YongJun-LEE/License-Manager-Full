package egovframework.kku.adm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmUserService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("KkuAdminService")
public class EgovKkuAdmUserServiceImpl implements EgovKkuAdmUserService {

	@Resource(name = "KkuAdminDAO")
	EgovKkuAdmUserDAO KkuAdminDAO;

	@Override
	public int chkAdminAccount(EgovKkuAppUserVO vo) throws Exception {
		return KkuAdminDAO.chkAdminAccount(vo);
	}

	@Override
	public List<EgovMap> selectAllUserInfo(EgovKkuAppUserVO vo) throws Exception {
		return KkuAdminDAO.selectAllUserInfo(vo);
	}

	@Override
	public List<EgovMap> selectAllNormalUserInfo(EgovKkuAppUserVO vo) throws Exception {
		return KkuAdminDAO.selectAllNormalUserInfo(vo);
	}

	@Override
	public List<EgovMap> selectAllAdminUserInfo(EgovKkuAppUserVO vo) throws Exception {
		return KkuAdminDAO.selectAllAdminUserInfo(vo);
	}

	@Override
	public List<?> selectAllBoardInfo() throws Exception {
		return KkuAdminDAO.selectAllBoardInfo();
	}

	@Override
	public EgovKkuAppUserVO selectModifyUserInfo(EgovKkuAppUserVO vo) throws Exception {
		return KkuAdminDAO.selectModifyUserInfo(vo);
	}

	@Override
	public int selectUserListCnt(EgovKkuAppUserVO vo) throws Exception {
		return KkuAdminDAO.selectUserListCnt(vo);
	}

	@Override
	public int selectAdminUserListCnt(EgovKkuAppUserVO vo) throws Exception {
		return KkuAdminDAO.selectAdminUserListCnt(vo);
	}

	@Override
	public int selectNormalUserListCnt(EgovKkuAppUserVO vo) throws Exception {
		return KkuAdminDAO.selectNormalUserListCnt(vo);
	}

	@Override
	public int updateUserInfo(EgovKkuAppUserVO vo) throws Exception {

		return KkuAdminDAO.updateUserInfo(vo);
	}

	@Override
	public EgovMap searchAdminAccount(EgovKkuAppUserVO userVO) throws Exception {
		return KkuAdminDAO.searchAdminAccount(userVO);
	}
}
