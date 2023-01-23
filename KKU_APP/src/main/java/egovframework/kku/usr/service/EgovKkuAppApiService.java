package egovframework.kku.usr.service;

import java.util.List;
import java.util.Map;

public interface EgovKkuAppApiService {
	
	//SUBJECT
	String insertSubject(List<Map<String, Object>> jmListMap) throws Exception;

	//DATE
	String insertDate(List<Map<String, Object>> scheduleListMap) throws Exception;

	//STATISTICS
	String insertStatistics(List<Map<String, Object>> statListMap) throws Exception;

	//INTEREST
	String insertInterest(List<Map<String, Object>> interListMap)throws Exception;

	//
	String insertWorkbookList(List<Map<String, Object>> idListMap)throws Exception;

	//QUESTION
	String insertQuestion(List<Map<String, Object>> fileListMap)throws Exception;

	//QUALIFY
	String insertQaulify(List<Map<String, Object>> qualifyList)throws Exception;

	String insertQues(Map<String, Object> map) throws Exception;


}
