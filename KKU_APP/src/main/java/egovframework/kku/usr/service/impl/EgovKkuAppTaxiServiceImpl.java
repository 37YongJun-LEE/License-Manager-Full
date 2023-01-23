package egovframework.kku.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.usr.service.EgovKkuAppTaxiAlarmVO;
import egovframework.kku.usr.service.EgovKkuAppTaxiService;
import egovframework.kku.usr.service.EgovKkuAppTaxiVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("taxiService")
public class EgovKkuAppTaxiServiceImpl implements EgovKkuAppTaxiService {

	@Resource(name = "taxiDAO")
	private EgovKkuAppTaxiDAO taxiDAO;
	
	@Override
	public void insertBoard(EgovKkuAppTaxiVO taxiVO) throws Exception {
		 taxiDAO.insertBoard(taxiVO);
	}

	@Override
	public List<EgovMap> selectBoardList(EgovKkuAppTaxiVO taxiVO) throws Exception {
		return taxiDAO.selectBoardList(taxiVO);
	}

	@Override
	public EgovMap selectBoard(EgovKkuAppTaxiVO taxiVO) throws Exception {
		return taxiDAO.selectBoard(taxiVO);
	}

	@Override
	public EgovMap selectUsrInfo(EgovKkuAppTaxiVO taxiVO) throws Exception {
		return taxiDAO.selectUsrInfo(taxiVO);
	}

	@Override
	public int updateViewCnt(EgovKkuAppTaxiVO taxiVO) throws Exception {
		return taxiDAO.updateViewCnt(taxiVO);
	}

	@Override
	public int selectBoardListCnt(EgovKkuAppTaxiVO taxiVO) throws Exception {
		return taxiDAO.selectBoardListCnt(taxiVO);
	}

	@Override
	public int insertApplicant(EgovKkuAppTaxiVO taxiVO) throws Exception {
		return taxiDAO.insertApplicant(taxiVO);
	}

	@Override
	public EgovMap selectApplicantInfo(Integer applicantIdx) throws Exception {
		return taxiDAO.selectApplicantInfo(applicantIdx);
	}

	@Override
	public void insertAlarm(EgovKkuAppTaxiAlarmVO alarmVO) {
		taxiDAO.insertAlarm(alarmVO);
	}

	@Override
	public List<EgovMap> selectAlarmList(EgovKkuAppTaxiAlarmVO alarmVO) {
		return taxiDAO.selectAlarmList(alarmVO);
	}

	@Override
	public void deleteTaxiAlarm(EgovKkuAppTaxiAlarmVO alarmVO) {
		taxiDAO.deleteTaxiAlarm(alarmVO);
		
	}

	@Override
	public List<EgovMap> taxipushAlarmList(EgovKkuAppTaxiVO taxiVO) throws Exception {
		return taxiDAO.taxipushAlarmList(taxiVO);
	}

	@Override
	public int updateAppliedCnt(EgovKkuAppTaxiVO taxiVO) throws Exception {
		return taxiDAO.updateAppliedCnt(taxiVO);
	}

	@Override
	public void deleteAppliedCnt(EgovKkuAppTaxiVO taxiVO) throws Exception {
		taxiDAO.deleteAppliedCnt(taxiVO);
	}

	@Override
	public void deleteApplicant(EgovKkuAppTaxiVO taxiVO) throws Exception {
		taxiDAO.deleteApplicant(taxiVO);
	}

	@Override
	public List<EgovMap> selectApplicantList(EgovKkuAppTaxiVO taxiVO) throws Exception {
		return taxiDAO.selectApplicantList(taxiVO);
	}

	@Override
	public int changeState(EgovKkuAppTaxiVO taxiVO) throws Exception {
		return taxiDAO.changeState(taxiVO);
	}

}
