package egovframework.kku.usr.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppTaxiService {

	void insertBoard(EgovKkuAppTaxiVO taxiVO) throws Exception;

	List<EgovMap> selectBoardList(EgovKkuAppTaxiVO taxiVO) throws Exception;

	EgovMap selectBoard(EgovKkuAppTaxiVO taxiVO) throws Exception;

	EgovMap selectUsrInfo(EgovKkuAppTaxiVO taxiVO) throws Exception;

	int updateViewCnt(EgovKkuAppTaxiVO taxiVO) throws Exception;

	int selectBoardListCnt(EgovKkuAppTaxiVO taxiVO) throws Exception;

	int insertApplicant(EgovKkuAppTaxiVO taxiVO) throws Exception;

	EgovMap selectApplicantInfo(Integer applicantIdx) throws Exception;

	void insertAlarm(EgovKkuAppTaxiAlarmVO alarmVO);

	List<EgovMap> selectAlarmList(EgovKkuAppTaxiAlarmVO alarmVO);

	void deleteTaxiAlarm(EgovKkuAppTaxiAlarmVO alarmVO);

	List<EgovMap> taxipushAlarmList(EgovKkuAppTaxiVO taxiVO)throws Exception;

	int updateAppliedCnt(EgovKkuAppTaxiVO taxiVO) throws Exception;

	void deleteAppliedCnt(EgovKkuAppTaxiVO taxiVO) throws Exception;

	void deleteApplicant(EgovKkuAppTaxiVO taxiVO) throws Exception;

	List<EgovMap> selectApplicantList(EgovKkuAppTaxiVO taxiVO) throws Exception;

	int changeState(EgovKkuAppTaxiVO taxiVO) throws Exception;

}
