package egovframework.kku.usr.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("licenseApiDAO")
public class EgovKkuAppApiDAO extends EgovComAbstractDAO{

	public String insertSubject(List<Map<String, Object>> jmListMap) {
		
		
		return (String)insert("licenseApiDAO.insertSubject",jmListMap);
	}

	public String insertDate(List<Map<String, Object>> scheduleListMap) {
		
		return (String)insert("licenseApiDAO.insertDate",scheduleListMap);
	}

	public String insertStatistics(List<Map<String, Object>> statListMap) {
		
		return (String)insert("licenseApiDAO.insertStatistics",statListMap);
	}

	public String insertInterest(List<Map<String, Object>> interListMap) {
		
		return (String)insert("licenseApiDAO.insertInterest",interListMap);
	}

	public String insertQuestion(List<Map<String, Object>> fileListMap) {
		
		return (String)insert("licenseApiDAO.insertQuestion",fileListMap);
	}

	public String insertQaulify(List<Map<String, Object>> qualifyList) {
		
		return (String)insert("licenseApiDAO.insertQualify",qualifyList);
	}

	public String insertQues(Map<String, Object> map) {
		
		return (String)insert("licenseApiDAO.insertQues", map);
	}

}
