package egovframework.kku.usr.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardFileVO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoMajorNoticeService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoMajorNoticeVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("majorNoticeService")
public class EgovKkuAppSchoolInfoMajorNoticeServiceImpl implements EgovKkuAppSchoolInfoMajorNoticeService {

	@Resource(name="majorNoticeDAO")
	public EgovKkuAppSchoolInfoMajorNoticeDAO majorNoticeDAO;
	
	public List<EgovMap> selectBoardList(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		return majorNoticeDAO.selectBoardList(majorNoticeVO);
	}

	@Override
	public int selectBoardListCnt(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		return majorNoticeDAO.selectBoardListCnt(majorNoticeVO);
	}

	@Override
	public EgovMap selectBoardByIdx(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		return majorNoticeDAO.selectBoardByIdx(majorNoticeVO);
	}

	@Override
	public List<EgovMap> selectBoardListByMajor(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) {
		return majorNoticeDAO.selectBoardListByMajor(majorNoticeVO);
	}

	@Override
	public List<EgovMap> selectBoardFileList(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		return majorNoticeDAO.selectBoardFileList(majorNoticeVO);
	}

	@Override
	public void updateBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		majorNoticeDAO.updateBoard(majorNoticeVO);
	}

	@Override
	public String insertBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		return majorNoticeDAO.insertBoard(majorNoticeVO);
	}

	@Override
	public void deleteBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		majorNoticeDAO.deleteBoard(majorNoticeVO);
	}

	@Override
	public void doneBoard(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		majorNoticeDAO.doneBoard(majorNoticeVO);
	}

	@Override
	public void insertBoardFile(EgovKkuAdmCommunityBoardFileVO vo) throws Exception {
		majorNoticeDAO.insertBoardFile(vo);
	}

	@Override
	public void deleteBoardFile(EgovKkuAdmCommunityBoardFileVO vo) throws Exception {
		majorNoticeDAO.deleteBoardFile(vo);
	}

	@Override
	public int updateViewCnt(EgovKkuAppSchoolInfoMajorNoticeVO majorNoticeVO) throws Exception {
		return majorNoticeDAO.updateViewCnt(majorNoticeVO);
	}

	@Override
	public String getURL(String usrMajor) throws Exception {
		return majorNoticeDAO.getURL(usrMajor);
	}

	@Override
	public List<String> selectMajorList() {
		return majorNoticeDAO.selectMajorList();
	}

}
