package egovframework.kku.usr.service;

import java.util.List;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppLicenseService {

	List<EgovMap> selectLicenseList(EgovKkuAppLicenseVO vo) throws Exception;
	List<EgovMap> selectUniReco(EgovKkuAppLicenseVO vo) throws Exception;

	List<EgovMap> selectLicenseDateList(EgovKkuAppLicenseVO licenseVO) throws Exception;

	EgovMap selectLicenseSubject(EgovKkuAppLicenseVO licenseVO) throws Exception;

	EgovMap selectLicenseInterest(EgovMap licenseSub) throws Exception;

	List<EgovMap> selectLicenseInterestSub(EgovMap licenseInterest) throws Exception;

	int selectInterestCnt(EgovMap licenseSub) throws Exception;

	public List<?> selectAllLicenseData(EgovKkuAppLicenseVO vo);
	public List<?> selectAllDate(EgovKkuAppLicenseVO vo);

	String getAlertState(EgovKkuAppLicenseVO licenseVO);
	void toggleAlert(EgovKkuAppLicenseVO licenseVO);
	
	boolean hasSInterest(EgovKkuAppLicenseVO licenseVO);
	
	void insertSInterest(EgovKkuAppLicenseVO licenseVO);
	int reviveSInterest(EgovKkuAppLicenseVO licenseVO);
	void deleteSInterest(EgovKkuAppLicenseVO licenseVO);
	
	int selectLicenseListCnt(EgovKkuAppLicenseVO vo) throws Exception;

	List<?> selectLicenseFiles(EgovKkuAppLicenseVO licenseVO) throws Exception;

	EgovMap selectFileDetail(EgovKkuAppLicenseVO licenseVO) throws Exception;

	int selectFilesListCnt(EgovKkuAppLicenseVO licenseVO) throws Exception;

	List<?> selectBoardList(EgovKkuAppLicenseVO licenseVO) throws Exception;

	int selectBoardListCnt(EgovKkuAppLicenseVO licenseVO) throws Exception;

	EgovMap selectBoardDetail(EgovKkuAppLicenseVO licenseVO) throws Exception;

	List<?> getBoardReplyList(EgovKkuAppLicenseVO licenseVO) throws Exception;

	void insertLicenseBoard(EgovKkuAppLicenseVO licenseVO) throws Exception;

	void insertLicenseBoardFile(EgovKkuAdmCommunityBoardFileVO fileVO) throws Exception;

	void updateViewCnt(EgovKkuAppLicenseVO licenseVO) throws Exception;

	int likeCnt(EgovKkuAppLicenseVO licenseVO) throws Exception;

	List<?> boardFileList(EgovKkuAppLicenseVO licenseVO) throws Exception;

	String insertLike(EgovKkuAppLicenseVO licenseVO)throws Exception;

	void updateBoardDelete(EgovKkuAppLicenseVO licenseVO) throws Exception;

	int selectDateListCnt(EgovKkuAppLicenseVO licenseVO) throws Exception;

	int selectRecListCnt(EgovKkuAppLicenseVO licenseVO)throws Exception;

	void deleteBoardFile(EgovKkuAdmCommunityBoardFileVO fileVO) throws Exception;

	void updateBoard(EgovKkuAppCommunityVO communiyVO) throws Exception;

	int checkAuth(EgovKkuAppLicenseVO licenseVO) throws Exception;

	List<?> selectLicenseQual(EgovKkuAppLicenseVO licenseVO) throws Exception;


	List<EgovMap> selectRegisteredLic(EgovKkuAppLicenseVO licenseVO) throws Exception;
	
	List<?> selectFileDetailList(EgovKkuAppLicenseVO licenseVO) throws Exception;
	
	EgovMap selectFileDetailForDown(EgovKkuAppLicenseVO licenseVO) throws Exception;

	

	
}