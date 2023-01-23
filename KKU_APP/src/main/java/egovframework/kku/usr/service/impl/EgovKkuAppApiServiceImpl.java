package egovframework.kku.usr.service.impl;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.usr.service.EgovKkuAppApiService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("licenseApiService")
public class EgovKkuAppApiServiceImpl extends EgovAbstractServiceImpl implements EgovKkuAppApiService {

	@Resource(name = "licenseApiDAO")
	private EgovKkuAppApiDAO licenseApiDAO;
	
	@Override
	public String insertSubject(List<Map<String, Object>> jmListMap) throws Exception {
		
		return licenseApiDAO.insertSubject(jmListMap);
	}

	@Override
	public String insertDate(List<Map<String, Object>> scheduleListMap) throws Exception {
		
		return licenseApiDAO.insertDate(scheduleListMap);
	}

	@Override
	public String insertStatistics(List<Map<String, Object>> statListMap) throws Exception {
		
		return licenseApiDAO.insertStatistics(statListMap);
	}

	@Override
	public String insertInterest(List<Map<String, Object>> interListMap) {
		
		return licenseApiDAO.insertInterest(interListMap);
	}

	@Override
	public String insertWorkbookList(List<Map<String, Object>> idListMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertQuestion(List<Map<String, Object>> fileListMap) {
		
		return licenseApiDAO.insertQuestion(fileListMap);
	}

	@Override
	public String insertQaulify(List<Map<String, Object>> qualifyList) throws Exception {
		
		return licenseApiDAO.insertQaulify(qualifyList);
	}

	@Override
	public String insertQues(Map<String, Object> map) throws Exception {
		
		return licenseApiDAO.insertQues(map);
	}

	
}
