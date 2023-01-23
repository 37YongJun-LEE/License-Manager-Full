package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuAppLicenseVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("licenseDAO")
public class EgovKkuAppLicenseDAO extends EgovComAbstractDAO{

	public List<EgovMap> selectLicenseList(EgovKkuAppLicenseVO vo) {
		// TODO Auto-generated method stub
		return (List<EgovMap>) list("licenseDAO.selectLicenseList", vo);
	}
	
	public List<EgovMap> selectUniReco(EgovKkuAppLicenseVO vo) {
		return (List<EgovMap>) list("licenseDAO.selectUniReco", vo);
	}

	public List<EgovMap> selectLicenseDateList(EgovKkuAppLicenseVO licenseVO) {
		// TODO Auto-generated method stub
		return (List<EgovMap>) list("licenseDAO.selectLicenseDateList", licenseVO);
	}

	public EgovMap selectLicenseSubject(EgovKkuAppLicenseVO licenseVO) {
		// TODO Auto-generated method stub
		return (EgovMap)select("licenseDAO.selectLicenseSubject", licenseVO);
	}

	public List<?> selectAllInterestingLicense(EgovKkuAppLoginSessionVO vo) {
		return (List<?>) list("licenseDAO.selectAllInterestingLicense", vo);
	}

	public EgovMap selectLicenseInterest(EgovMap licenseSub) {
		
		return (EgovMap)select("licenseDAO.selectLicenseInterest", licenseSub);
	}

	public List<EgovMap> selectLicenseInterestSub(EgovMap licenseInterest) {
		
		return (List<EgovMap>)list("licenseDAO.selectLicenseInterestSub", licenseInterest);
	}

	public int selectInterestCnt(EgovMap licenseSub) {
		
		return (int)select("licenseDAO.selectInterestCnt", licenseSub);
	}
	
	public List<?> selectAllLicenseData(EgovKkuAppLicenseVO vo) {
		return (List<?>) list("licenseDAO.selectAllLicenseData", vo);
	}
	
	public List<?> selectAllDate(EgovKkuAppLicenseVO vo) {
		return (List<?>) list("licenseDAO.selectAllDate", vo);
	}
	
	public int selectLicenseListCnt(EgovKkuAppLicenseVO vo) {
		return (int) select("licenseDAO.selectLicenseListCnt", vo);
	}

	public List<?> selectLicenseFiles(EgovKkuAppLicenseVO licenseVO) {
		
		return (List<?>) list("licenseDAO.selectLicenseFiles", licenseVO);
	}

	public EgovMap selectFileDetail(EgovKkuAppLicenseVO licenseVO) {
		
		return (EgovMap) select("licenseDAO.selectFileDetail", licenseVO);
	}

	public int selectFilesListCnt(EgovKkuAppLicenseVO licenseVO) {
		
		return (int)select("licenseDAO.selectFilesListCnt",licenseVO);
	}

	public List<?> selectBoardList(EgovKkuAppLicenseVO licenseVO) {
		
		return (List<?>)list("licenseDAO.selectBoardList",licenseVO);
	}

	public int selectBoardListCnt(EgovKkuAppLicenseVO licenseVO) {
		
		return (int)select("licenseDAO.selectBoardListCnt",licenseVO);
	}

	public EgovMap selectBoardDetail(EgovKkuAppLicenseVO licenseVO) {
		
		return (EgovMap)select("licenseDAO.selectBoardDetail",licenseVO);
	}
	
	public String getAlertState(EgovKkuAppLicenseVO licenseVO) {
		return (String) select("licenseDAO.getAlertState", licenseVO);
	}

	public void toggleAlert(EgovKkuAppLicenseVO licenseVO) {
		update("licenseDAO.toggleAlert", licenseVO);
	}
	
	public String hasSInterst(EgovKkuAppLicenseVO licenseVO) {
		return (String) select("licenseDAO.hasSInterest", licenseVO);
	}

	public void insertSInterest(EgovKkuAppLicenseVO licenseVO) {
		insert("licenseDAO.insertSInterest", licenseVO);
	}
	
	public int reviveSInterest(EgovKkuAppLicenseVO licenseVO) {
		return update("licenseDAO.reviveSInterest", licenseVO);
	}
	
	public void deleteSInterest(EgovKkuAppLicenseVO licenseVO) {
		update("licenseDAO.deleteSInterest", licenseVO);
	}

	public List<?> getBoardReplyList(EgovKkuAppLicenseVO licenseVO) {
		
		return (List<?>)list("licenseDAO.getBoardReplyList",licenseVO);
	}

	public void insertLicenseBoard(EgovKkuAppLicenseVO licenseVO) {
		
		insert("licenseDAO.insertLicenseBoard",licenseVO);
	}

	public void insertLicenseBoardFile(EgovKkuAdmCommunityBoardFileVO fileVO) {
		
		insert("licenseDAO.insertLicenseBoardFile",fileVO);
		
	}

	public void updateViewCnt(EgovKkuAppLicenseVO licenseVO) {
		
		update("licenseDAO.updateViewCnt",licenseVO);
		
	}

	public int likeCnt(EgovKkuAppLicenseVO licenseVO) {
		
		return (int)select("licenseDAO.likeCnt", licenseVO);
	}

	public List<?> boardFileList(EgovKkuAppLicenseVO licenseVO) {
		
		return (List<?>)list("licenseDAO.boardFileList",licenseVO);
	}

	public String insertLike(EgovKkuAppLicenseVO licenseVO) {
		
		return (String) insert("licenseDAO.insertLike",licenseVO);
	}

	public void updateBoardDelete(EgovKkuAppLicenseVO licenseVO) {
		
		update("licenseDAO.updateBoardDelete", licenseVO);
	}

	public int selectDateListCnt(EgovKkuAppLicenseVO licenseVO) {
		
		return (int)select("licenseDAO.selectDateListCnt",licenseVO);
	}

	public int selectRecListCnt(EgovKkuAppLicenseVO licenseVO) {
		
		return (int)select("licenseDAO.selectRecListCnt",licenseVO);
	}

	public void deleteBoardFile(EgovKkuAdmCommunityBoardFileVO fileVO) {
		
		update("licenseDAO.deleteBoardFile",fileVO);
	}

	public void updateBoard(EgovKkuAppCommunityVO communiyVO) {
		update("licenseDAO.updateBoard", communiyVO);
		
	}


	public int checkAuth(EgovKkuAppLicenseVO licenseVO) {
		
		return (int)select("licenseDAO.checkAuth", licenseVO);
	}

	public List<?> selectLicenseQual(EgovKkuAppLicenseVO licenseVO) {
		
		return (List<?>)list("licenseDAO.selectLicenseQual", licenseVO);
	}


	public List<EgovMap> selectRegisteredLic(EgovKkuAppLicenseVO licenseVO) {
		
		return (List<EgovMap>)list("licenseDAO.selectRegisteredLic",licenseVO);
	}

	public List<?> selectFileDetailList(EgovKkuAppLicenseVO licenseVO) {
		
		return (List<?>)list("licenseDAO.selectFileDetailList", licenseVO);
	}

	public EgovMap selectFileDetailForDown(EgovKkuAppLicenseVO licenseVO) {
		
		return (EgovMap)select("licenseDAO.selectFileDetailForDown",licenseVO);
	}
}