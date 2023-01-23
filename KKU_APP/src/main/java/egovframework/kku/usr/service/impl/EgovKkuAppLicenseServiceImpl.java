package egovframework.kku.usr.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuAppLicenseService;
import egovframework.kku.usr.service.EgovKkuAppLicenseVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("licenseService")
public class EgovKkuAppLicenseServiceImpl extends EgovAbstractServiceImpl implements EgovKkuAppLicenseService {

	@Resource(name = "licenseDAO")
	private EgovKkuAppLicenseDAO licenseDAO;

	@Override
	public List<EgovMap> selectLicenseList(EgovKkuAppLicenseVO vo) throws Exception {
		
		return licenseDAO.selectLicenseList(vo);
	}
	
	@Override
	public List<EgovMap> selectUniReco(EgovKkuAppLicenseVO vo) throws Exception {
		return licenseDAO.selectUniReco(vo);
	}

	@Override
	public List<EgovMap> selectLicenseDateList(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectLicenseDateList(licenseVO);
	}

	@Override
	public EgovMap selectLicenseSubject(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectLicenseSubject(licenseVO);
	}
	
	@Override
	public List<?> selectAllLicenseData(EgovKkuAppLicenseVO vo) {
		return licenseDAO.selectAllLicenseData(vo);
	}
	@Override
	public EgovMap selectLicenseInterest(EgovMap licenseSub) throws Exception {
		
		return licenseDAO.selectLicenseInterest(licenseSub);
	}
	
	@Override
	public int selectLicenseListCnt(EgovKkuAppLicenseVO vo) throws Exception {
		return licenseDAO.selectLicenseListCnt(vo);
	}

	@Override
	public List<EgovMap> selectLicenseInterestSub(EgovMap licenseInterest) throws Exception {
		
		
		return licenseDAO.selectLicenseInterestSub(licenseInterest);
	}

	@Override
	public int selectInterestCnt(EgovMap licenseSub) throws Exception {
		
		return licenseDAO.selectInterestCnt(licenseSub);
	}


	@Override
	public List<?> selectAllDate(EgovKkuAppLicenseVO vo) {
		return licenseDAO.selectAllDate(vo);
	}
	
	@Override
	public String getAlertState(EgovKkuAppLicenseVO licenseVO) {
		return (String) licenseDAO.getAlertState(licenseVO);
	}

	@Override
	public void toggleAlert(EgovKkuAppLicenseVO licenseVO) {
		licenseDAO.toggleAlert(licenseVO);
	}
	
	@Override
	public boolean hasSInterest(EgovKkuAppLicenseVO licenseVO) {
		return licenseDAO.hasSInterst(licenseVO).equals("Y");
	}
	
	@Override
	public void insertSInterest(EgovKkuAppLicenseVO licenseVO) {
		licenseDAO.insertSInterest(licenseVO);
	}
	
	@Override
	public int reviveSInterest(EgovKkuAppLicenseVO licenseVO) {
		return licenseDAO.reviveSInterest(licenseVO);
	}
	
	@Override
	public void deleteSInterest(EgovKkuAppLicenseVO licenseVO) {
		licenseDAO.deleteSInterest(licenseVO);
	}

	@Override
	public List<?> selectLicenseFiles(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectLicenseFiles(licenseVO);
	}

	@Override
	public EgovMap selectFileDetail(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectFileDetail(licenseVO);
	}

	@Override
	public int selectFilesListCnt(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectFilesListCnt(licenseVO);
	}

	@Override
	public List<?> selectBoardList(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectBoardList(licenseVO);
	}

	@Override
	public int selectBoardListCnt(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectBoardListCnt(licenseVO);
	}

	@Override
	public EgovMap selectBoardDetail(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectBoardDetail(licenseVO);
	}

	@Override
	public List<?> getBoardReplyList(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.getBoardReplyList(licenseVO);
	}

	@Override
	public void insertLicenseBoard(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		licenseDAO.insertLicenseBoard(licenseVO);
		
	}

	@Override
	public void insertLicenseBoardFile(EgovKkuAdmCommunityBoardFileVO fileVO) throws Exception {
		
		licenseDAO.insertLicenseBoardFile(fileVO);
		
	}

	@Override
	public void updateViewCnt(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		licenseDAO.updateViewCnt(licenseVO);
		
	}

	@Override
	public int likeCnt(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.likeCnt(licenseVO);
	}

	@Override
	public List<?> boardFileList(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.boardFileList(licenseVO);
	}

	@Override
	public String insertLike(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.insertLike(licenseVO);
	}

	@Override
	public void updateBoardDelete(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		licenseDAO.updateBoardDelete(licenseVO);
		
		
	}

	@Override
	public int selectDateListCnt(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectDateListCnt(licenseVO);
	}

	@Override
	public int selectRecListCnt(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectRecListCnt(licenseVO);
	}

	@Override
	public void deleteBoardFile(EgovKkuAdmCommunityBoardFileVO fileVO) throws Exception {
		
		licenseDAO.deleteBoardFile(fileVO);
		
	}

	@Override
	public void updateBoard(EgovKkuAppCommunityVO communiyVO) throws Exception {
		
		licenseDAO.updateBoard(communiyVO);
		
	}

	@Override
	public int checkAuth(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.checkAuth(licenseVO);
	}

	@Override
	public List<?> selectLicenseQual(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectLicenseQual(licenseVO);
	}

	@Override
	public List<EgovMap> selectRegisteredLic(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectRegisteredLic(licenseVO);
	}

	@Override
	public List<?> selectFileDetailList(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectFileDetailList(licenseVO);
	}

	@Override
	public EgovMap selectFileDetailForDown(EgovKkuAppLicenseVO licenseVO) throws Exception {
		
		return licenseDAO.selectFileDetailForDown(licenseVO);
	}

	
	


}