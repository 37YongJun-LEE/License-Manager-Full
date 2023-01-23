package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppTaxiAlarmVO;
import egovframework.kku.usr.service.EgovKkuAppTaxiVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("taxiDAO")
public class EgovKkuAppTaxiDAO extends EgovComAbstractDAO {

	public void insertBoard(EgovKkuAppTaxiVO taxiVO) {
		  insert("taxiDAO.insertBoard", taxiVO);
	}

	public List<EgovMap> selectBoardList(EgovKkuAppTaxiVO taxiVO) {
		return (List<EgovMap>) list("taxiDAO.selectBoardList", taxiVO);
	}

	public EgovMap selectBoard(EgovKkuAppTaxiVO taxiVO) {
		return (EgovMap) select("taxiDAO.selectBoard", taxiVO);
	}

	public EgovMap selectUsrInfo(EgovKkuAppTaxiVO taxiVO) {
		return (EgovMap) select("taxiDAO.selectUsrInfo", taxiVO);
	}

	public int updateViewCnt(EgovKkuAppTaxiVO taxiVO) {
		return (Integer) update("taxiDAO.updateViewCnt", taxiVO);
	}

	public int selectBoardListCnt(EgovKkuAppTaxiVO taxiVO) {
		return (Integer) select("taxiDAO.selectBoardListCnt", taxiVO);
	}

	public int insertApplicant(EgovKkuAppTaxiVO taxiVO) {
		return (Integer) update("taxiDAO.insertApplicant", taxiVO);
	}

	public EgovMap selectApplicantInfo(Integer applicantIdx) {
		return (EgovMap) select("taxiDAO.selectApplicantInfo", applicantIdx);
	}

	public void insertAlarm(EgovKkuAppTaxiAlarmVO alarmVO) {
		insert("taxiDAO.insertAlarm", alarmVO);
	}

	public List<EgovMap> selectAlarmList(EgovKkuAppTaxiAlarmVO alarmVO) {
		return (List<EgovMap>) list("taxiDAO.selectAlarmList", alarmVO);
	}

	public void deleteTaxiAlarm(EgovKkuAppTaxiAlarmVO alarmVO) {
		delete("taxiDAO.deleteTaxiAlarm", alarmVO);
		
	}

	public List<EgovMap> taxipushAlarmList(EgovKkuAppTaxiVO taxiVO) {
		return (List<EgovMap>) list("taxiDAO.taxipushAlarmList", taxiVO);
	}

	public int updateAppliedCnt(EgovKkuAppTaxiVO taxiVO) {
		return (Integer) update("taxiDAO.updateAppliedCnt", taxiVO);
	}

	public void deleteAppliedCnt(EgovKkuAppTaxiVO taxiVO) {
		delete("taxiDAO.deleteAppliedCnt", taxiVO);
	}

	public void deleteApplicant(EgovKkuAppTaxiVO taxiVO) {
		delete("taxiDAO.deleteApplicant", taxiVO);
	}

	public List<EgovMap> selectApplicantList(EgovKkuAppTaxiVO taxiVO) {
		return (List<EgovMap>) list("taxiDAO.selectApplicantList", taxiVO);
	}

	public int changeState(EgovKkuAppTaxiVO taxiVO) {
		return (Integer) update("taxiDAO.changeState",taxiVO);
	}
		
	

}
