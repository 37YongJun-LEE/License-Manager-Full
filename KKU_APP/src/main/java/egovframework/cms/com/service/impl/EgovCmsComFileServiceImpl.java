package egovframework.cms.com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.cms.com.service.EgovCmsComFileService;
import egovframework.cms.com.service.EgovCmsComFileVO;
import egovframework.cms.com.service.EgovCmsComService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("fileService")
public class EgovCmsComFileServiceImpl implements EgovCmsComFileService{
	
	@Autowired
	private EgovCmsComFileDAO fileDAO;
	
	// file insert
	@Override
	public void fileInsert(EgovCmsComFileVO fileVO)	throws Exception {
		fileDAO.fileInsert(fileVO);
	}
	// file update
	@Override
	public void fileUpdate(EgovCmsComFileVO fileVO)	throws Exception {
		fileDAO.fileUpdate(fileVO);
	}
	
	@Override
	public void fileDelete(EgovCmsComFileVO fileVO)	throws Exception {
		fileDAO.fileDelete(fileVO);
	}
	@Override
	public void fileDeleteAll(EgovCmsComFileVO fileVO)	throws Exception {
		fileDAO.fileDeleteAll(fileVO);
	}

	@Override
	public List<EgovCmsComFileVO> selectFileList(EgovCmsComFileVO vo) throws Exception {
		return fileDAO.selectFileList(vo);
	}
	@Override
	public Map<String, Object> selectFileDelList(EgovCmsComFileVO vo)
			throws Exception {
		// TODO Auto-generated method stub
		List<EgovCmsComFileVO> result = fileDAO.selectFileDelList(vo);
		//int cnt = fileDAO.selectContentsBannerListCnt(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultDelList", result);
		//map.put("resultCnt", Integer.toString(cnt));
		return map;
	}
	// banner select by idx
	@Override
	public EgovCmsComFileVO fileSelectById(
			EgovCmsComFileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return fileDAO.fileSelectById(vo);
	}
	
	@Override
	public EgovCmsComFileVO fileSelectByIdPath(
			EgovCmsComFileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return fileDAO.fileSelectByIdPath(vo);
	}

	
}
