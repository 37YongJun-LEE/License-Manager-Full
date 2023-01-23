package egovframework.kku.adm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmLicenseService;
import egovframework.kku.adm.service.EgovKkuAdmLicenseVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("adminLicenseService")
public class EgovKkuAdmLicenseServiceImpl implements EgovKkuAdmLicenseService {

	@Resource(name="adminLicenseDAO")
	EgovKkuAdmLicenseDAO adminLicenseDAO;

	@Override
	public List<EgovMap> searchLicenseList(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchLicenseList(vo);
	}

	@Override
	public EgovMap searchLicenseDetail(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchLicenseDetail(vo);
	}

	@Override
	public int searchLicenseListCnt(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchLicenseListCnt(vo);
	}

	@Override
	public EgovMap searchLicenseRecommandation(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchLicenseRecommandation(vo);
	}

	@Override
	public List<EgovMap> searchLicenseSchedule(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchLicenseSchedule(vo);
	}

	@Override
	public List<EgovMap> searchLicenseQuestions(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchLicenseQuestions(vo);
	}

	@Override
	public List<EgovMap> searchMajorRecommandation(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchMajorRecommandation(vo);
	}

	@Override
	public int updateRecLicense(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.updateRecLicense(vo);
	}

	@Override
	public int insertRecMajor(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.insertRecMajor(vo);
	}

	@Override
	public int deleteRecMajor(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.deleteRecMajor(vo);
	}

	@Override
	public int updateRecMajor(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.updateRecMajor(vo);
	}

	@Override
	public List<EgovMap> searchLicenseRecoMade(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchLicenseRecoMade(vo);
	}

	@Override
	public int searchLicenseRecCnt(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchLicenseRecCnt(vo);
	}

	@Override
	public int insertLicenseRec(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.insertLicenseRec(vo);
	}

	@Override
	public int deleteRecLicense(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.deleteRecLicense(vo);
	}

	@Override
	public int searchLicenseIRecCnt(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchLicenseIRecCnt(vo);
	}

	@Override
	public EgovMap searchPrevQuestion(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.searchPrevQuestion(vo);
	}

	@Override
	public String insertPrevQuestions(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.insertPrevQuestions(vo);
	}

	@Override
	public int updatePrevQuestions(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.updatePrevQuestions(vo);
	}

	@Override
	public int deleteQuestions(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.deleteQuestions(vo);
	}

	@Override
	public int updateLicenseSchedule(EgovKkuAdmLicenseVO vo) throws Exception {
		return adminLicenseDAO.updateLicenseSchedule(vo);
	}
	@Override
	public List<EgovMap> searchLicenseBoard(EgovKkuAdmLicenseVO vo) {
		return adminLicenseDAO.searchLicenseBoard(vo);
	}

	@Override
	public EgovMap licenseBoardDetail(EgovKkuAdmLicenseVO vo) {
		return adminLicenseDAO.licenseBoardDetail(vo);
	}

	@Override
	public int updatelicenseBoard(EgovKkuAdmLicenseVO vo) {
		return adminLicenseDAO.updatelicenseBoard(vo);
	}

	@Override
	public int insertDataLicnese(EgovMap egovMap) {
		return adminLicenseDAO.insertDataLicnese(egovMap);
	}
	
	@Override
	public void insertLicenseCustom(EgovKkuAdmLicenseVO vo) {
		adminLicenseDAO.insertLicenseCustom(vo);
	}
	
	@Override
	public void updateLicenseCustom(EgovKkuAdmLicenseVO vo) {
		adminLicenseDAO.updateLicenseCustom(vo);
	}
	
	@Override
	public EgovMap selectRecentNumber(EgovKkuAdmLicenseVO vo) {
		return adminLicenseDAO.selectRecentNumber(vo);
	}
	
	@Override
	public EgovMap getQualName(EgovKkuAdmLicenseVO vo) {
		return adminLicenseDAO.getQualName(vo);
	}

}
