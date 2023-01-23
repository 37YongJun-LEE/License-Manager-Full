package egovframework.kku.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.usr.service.EgovKkuAppClubService;
import egovframework.kku.usr.service.EgovKkuAppClubVO;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppMypageService;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("clubService")
public class EgovKkuAppClubServiceImpl extends EgovAbstractServiceImpl implements EgovKkuAppClubService {

	@Resource(name = "clubDAO")
	private EgovKkuAppClubDAO clubDAO;

	@Override
	public List<EgovMap> selectClubList(EgovKkuAppClubVO clubVO) {
		return clubDAO.selectClubList(clubVO);
	}

	@Override
	public int selectClubListCnt(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubListCnt(clubVO);
	}

	@Override
	public EgovKkuAppClubVO selectClubDetail(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubDetail(clubVO);
	}

	@Override
	public String insertClubApplication(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.insertClubApplication(clubVO);
	}

	@Override
	public EgovMap selectClubUserInfo(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubUserInfo(clubVO);
	}

	@Override
	public List<EgovMap> selectClubViewDetail(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubViewDetail(clubVO);
	}

	@Override
	public String insertClubNotice(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.insertClubNotice(clubVO);
	}

	@Override
	public List<EgovMap> selectClubApplicationList(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubApplicationList(clubVO);
	}

	@Override
	public EgovMap selectClubApplicationDetail(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubApplicationDetail(clubVO);
	}

	@Override
	public int updateClubUserState(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.updateClubUserState(clubVO);
	}

	@Override
	public List<EgovMap> selectClubUserDevice(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubUserDevice(clubVO);
	}

	@Override
	public void insertClubContent(EgovKkuAppClubVO clubVO) throws Exception {
		clubDAO.insertClubContent(clubVO);
		
	}

	@Override
	public List<EgovMap> selectClubGalleryList(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubGalleryList(clubVO);
	}

	@Override
	public int selectClubGalleryCnt(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubGalleryCnt(clubVO);
	}

	@Override
	public EgovMap selectClubGalleryDetail(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubGalleryDetail(clubVO);
	}

	@Override
	public int updateClubBoardState(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.updateClubBoardState(clubVO);
	}

	@Override
	public List<EgovMap> selectClubBoardList(EgovKkuAppClubVO clubVO) throws Exception {
		return clubDAO.selectClubBoardList(clubVO);
	}
}
