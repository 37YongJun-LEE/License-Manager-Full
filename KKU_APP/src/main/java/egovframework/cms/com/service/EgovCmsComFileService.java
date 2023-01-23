package egovframework.cms.com.service;

import java.util.List;
import java.util.Map;

/**
 * 공통파일 서비스
 * @author 개발팀 진우석
 * @since 2017.10.12
 * @version 1.0
 * @see
 *
 */
public interface EgovCmsComFileService {
	
	// 파일 db등록
	void fileInsert(EgovCmsComFileVO vo) throws Exception;
	void fileUpdate(EgovCmsComFileVO vo) throws Exception;
	void fileDelete(EgovCmsComFileVO vo) throws Exception;
	void fileDeleteAll(EgovCmsComFileVO vo) throws Exception;
	public Map<String, Object> selectFileDelList(EgovCmsComFileVO vo) throws Exception;
	public List<EgovCmsComFileVO> selectFileList(EgovCmsComFileVO vo) throws Exception;
	EgovCmsComFileVO fileSelectById(EgovCmsComFileVO vo) throws Exception;
	EgovCmsComFileVO fileSelectByIdPath(EgovCmsComFileVO vo) throws Exception;
	
	/*List<EgovMap> defaultList(String sqlId, Object vo) throws Exception;
	EgovMap defaultSelectById(String sqlId, Object vo) throws Exception;
	void defaultInsert(String sqlId, Object vo) throws Exception;
	int defaultInsertLastId(String sqlId, Object vo) throws Exception;
	void defaultUpdate(String sqlId, Object vo) throws Exception;
	int defaultUpdateInt(String sqlId, Object vo) throws Exception;
	void defaultDelete(String sqlId, Object vo) throws Exception;
	int defaultInt(String sqlId, Object vo) throws Exception;
	String defaultString(String sqlId, Object vo) throws Exception;*/



}
