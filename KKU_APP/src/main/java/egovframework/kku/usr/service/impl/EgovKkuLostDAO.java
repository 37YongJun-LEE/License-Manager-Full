package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppFacilityVO;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.kku.usr.service.EgovKkuLostVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("lostDAO")
public class EgovKkuLostDAO extends EgovComAbstractDAO {

	public void insertLost(EgovKkuLostVO lostVO) {
		insert("lostDAO.insertLost", lostVO);
	}

	public int updateLost(EgovKkuLostVO lostVO) {
		return update("lostDAO.updateLost", lostVO);
	}

	@SuppressWarnings("unchecked")
	public List<EgovMap> selectLostList(EgovKkuLostVO lostVO) {
		return (List<EgovMap>) list("lostDAO.selectLostList", lostVO);
	}

	@SuppressWarnings("unchecked")
	public EgovMap selectLostByIdx(EgovKkuLostVO lostVO) {
		return (EgovMap) select("lostDAO.selectLostByIdx", lostVO);
	}

	@SuppressWarnings("unchecked")
	public List<EgovMap> lostFileList(EgovKkuLostVO lostVO) {
		return (List<EgovMap>) list("lostDAO.lostFileList", lostVO);
	}

	public void delLost(EgovKkuLostVO lostVO) {
		update("lostDAO.delLost", lostVO);
	}

	public void updateStaLost(EgovKkuLostVO lostVO) {
		update("lostDAO.updateStaLost", lostVO);
	}
}
