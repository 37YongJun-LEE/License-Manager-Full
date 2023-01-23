package egovframework.kku.adm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.adm.service.EgovKkuAdmLicenseVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("adminLicenseDAO")
public class EgovKkuAdmLicenseDAO extends EgovComAbstractDAO {

	public List<EgovMap> searchLicenseList(EgovKkuAdmLicenseVO vo) {
		return (List<EgovMap>) list("adminLicenseDAO.searchLicenseList", vo);
	}

	public EgovMap searchLicenseDetail(EgovKkuAdmLicenseVO vo) {
		return (EgovMap) select("adminLicenseDAO.searchLicenseDetail", vo);
	}

	public int searchLicenseListCnt(EgovKkuAdmLicenseVO vo) {
		return (Integer) select("adminLicenseDAO.searchLicenseListCnt", vo);
	}

	public EgovMap searchLicenseRecommandation(EgovKkuAdmLicenseVO vo) {
		return (EgovMap) select("adminLicenseDAO.searchLicenseRecommandation", vo);
	}

	public List<EgovMap> searchLicenseSchedule(EgovKkuAdmLicenseVO vo) {
		return (List<EgovMap>) list("adminLicenseDAO.searchLicenseSchedule",vo);
	}

	public List<EgovMap> searchLicenseQuestions(EgovKkuAdmLicenseVO vo) {
		return (List<EgovMap>) list("adminLicenseDAO.searchLicenseQuestions", vo);
	}

	public List<EgovMap> searchMajorRecommandation(EgovKkuAdmLicenseVO vo) {
		return (List<EgovMap>) list("adminLicenseDAO.searchMajorRecommandation",vo);
	}

	public int updateRecLicense(EgovKkuAdmLicenseVO vo) {
		return (Integer) update("adminLicenseDAO.updateRecLicense",vo);
	}

	public int insertRecMajor(EgovKkuAdmLicenseVO vo) {
		return (Integer) update("adminLicenseDAO.insertRecMajor", vo);
	}

	public int deleteRecMajor(EgovKkuAdmLicenseVO vo) {
		return (Integer) delete("adminLicenseDAO.deleteRecMajor",vo);
	}

	public int updateRecMajor(EgovKkuAdmLicenseVO vo) {
		return (Integer) update("adminLicenseDAO.updateRecMajor",vo);
	}

	public List<EgovMap> searchLicenseRecoMade(EgovKkuAdmLicenseVO vo) {
		return (List<EgovMap>) list("adminLicenseDAO.searchLicenseRecoMade", vo);
	}

	public int searchLicenseRecCnt(EgovKkuAdmLicenseVO vo) {
		return (Integer) select("adminLicenseDAO.searchLicenseRecCnt", vo);
	}

	public int insertLicenseRec(EgovKkuAdmLicenseVO vo) {
		return (Integer) update("adminLicenseDAO.insertLicenseRec",vo);
	}

	public int deleteRecLicense(EgovKkuAdmLicenseVO vo) {
		return (Integer) update("adminLicenseDAO.deleteRecLicense",vo);
	}

	public int searchLicenseIRecCnt(EgovKkuAdmLicenseVO vo) {
		return (Integer) select("adminLicenseDAO.searchLicenseIRecCnt",vo);
	}

	public EgovMap searchPrevQuestion(EgovKkuAdmLicenseVO vo) {
		return (EgovMap) select("adminLicenseDAO.searchPrevQuestion",vo);
	}

	public String insertPrevQuestions(EgovKkuAdmLicenseVO vo) {
		return (String) insert("adminLicenseDAO.insertPrevQuestions",vo);
	}

	public int updatePrevQuestions(EgovKkuAdmLicenseVO vo) {
		return (int) update("adminLicenseDAO.updatePrevQuestions",vo);
	}

	public int deleteQuestions(EgovKkuAdmLicenseVO vo) {
		return (int) update("adminLicenseDAO.deleteQuestions", vo);
	}

	public int updateLicenseSchedule(EgovKkuAdmLicenseVO vo) {
		return (int) update("adminLicenseDAO.updateLicenseSchedule", vo);
	}
	public List<EgovMap> searchLicenseBoard(EgovKkuAdmLicenseVO vo) {
		return (List<EgovMap>) list("adminLicenseDAO.searchLicenseBoard", vo);
	}

	public EgovMap licenseBoardDetail(EgovKkuAdmLicenseVO vo) {
		return (EgovMap) select("adminLicenseDAO.licenseBoardDetail", vo);
	}

	public int updatelicenseBoard(EgovKkuAdmLicenseVO vo) {
		return update("adminLicenseDAO.updatelicenseBoard", vo);
	}

	public int insertDataLicnese(EgovMap egovMap) {
		return (int) update("adminLicenseDAO.insertDataLicnese", egovMap);
	}
	
	public void insertLicenseCustom(EgovKkuAdmLicenseVO vo) {
		insert("adminLicenseDAO.insertLicenseCustom", vo);
	}
	
	public void updateLicenseCustom(EgovKkuAdmLicenseVO vo) {
		insert("adminLicenseDAO.updateLicenseCustom", vo);
	}
	
	public EgovMap selectRecentNumber(EgovKkuAdmLicenseVO vo) {
		return (EgovMap) select("adminLicenseDAO.selectRecentNumber");
	}
	
	public EgovMap getQualName(EgovKkuAdmLicenseVO vo) {
		return (EgovMap) select("adminLicenseDAO.getQualName");
	}
}
