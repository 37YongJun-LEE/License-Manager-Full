package egovframework.kku.adm.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAdmLicenseService {

	List<EgovMap> searchLicenseList(EgovKkuAdmLicenseVO vo) throws Exception;

	EgovMap searchLicenseDetail(EgovKkuAdmLicenseVO vo) throws Exception;

	int searchLicenseListCnt(EgovKkuAdmLicenseVO vo) throws Exception;

	EgovMap searchLicenseRecommandation(EgovKkuAdmLicenseVO vo) throws Exception;

	List<EgovMap> searchLicenseSchedule(EgovKkuAdmLicenseVO vo) throws Exception;

	List<EgovMap> searchLicenseQuestions(EgovKkuAdmLicenseVO vo) throws Exception;

	List<EgovMap> searchMajorRecommandation(EgovKkuAdmLicenseVO vo) throws Exception;

	int updateRecLicense(EgovKkuAdmLicenseVO vo) throws Exception;

	int insertRecMajor(EgovKkuAdmLicenseVO vo) throws Exception;

	int deleteRecMajor(EgovKkuAdmLicenseVO vo) throws Exception;

	int updateRecMajor(EgovKkuAdmLicenseVO vo) throws Exception;

	List<EgovMap> searchLicenseRecoMade(EgovKkuAdmLicenseVO vo) throws Exception;

	int searchLicenseRecCnt(EgovKkuAdmLicenseVO vo) throws Exception;

	int insertLicenseRec(EgovKkuAdmLicenseVO vo) throws Exception;

	int deleteRecLicense(EgovKkuAdmLicenseVO vo) throws Exception;

	int searchLicenseIRecCnt(EgovKkuAdmLicenseVO vo) throws Exception;

	EgovMap searchPrevQuestion(EgovKkuAdmLicenseVO vo) throws Exception;

	String insertPrevQuestions(EgovKkuAdmLicenseVO vo) throws Exception;

	int updatePrevQuestions(EgovKkuAdmLicenseVO vo) throws Exception;

	int deleteQuestions(EgovKkuAdmLicenseVO vo) throws Exception;

	int updateLicenseSchedule(EgovKkuAdmLicenseVO vo) throws Exception;
	
	List<EgovMap> searchLicenseBoard(EgovKkuAdmLicenseVO vo);

	EgovMap licenseBoardDetail(EgovKkuAdmLicenseVO vo);

	int updatelicenseBoard(EgovKkuAdmLicenseVO vo);

	int insertDataLicnese(EgovMap egovMap);
	
	EgovMap selectRecentNumber(EgovKkuAdmLicenseVO vo);
	
	void insertLicenseCustom(EgovKkuAdmLicenseVO vo);
	
	EgovMap getQualName(EgovKkuAdmLicenseVO vo);

	void updateLicenseCustom(EgovKkuAdmLicenseVO vo);
}
