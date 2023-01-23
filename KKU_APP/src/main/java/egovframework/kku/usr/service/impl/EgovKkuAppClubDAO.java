package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppClubVO;
import egovframework.kku.usr.service.EgovKkuAppFriendVO;
import egovframework.kku.usr.service.EgovKkuAppLoginSessionVO;
import egovframework.kku.usr.service.EgovKkuAppUserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("clubDAO")
public class EgovKkuAppClubDAO extends EgovComAbstractDAO{

	public List<EgovMap> selectClubList(EgovKkuAppClubVO clubVO) {
		return (List<EgovMap>) list("clubDAO.selectClubList", clubVO);
	}

	public int selectClubListCnt(EgovKkuAppClubVO clubVO) {
		return  (int) select("clubDAO.selectClubListCnt", clubVO);
	}

	public EgovKkuAppClubVO selectClubDetail(EgovKkuAppClubVO clubVO) {
		return (EgovKkuAppClubVO) select("clubDAO.selectClubDetail", clubVO);
	}

	public String insertClubApplication(EgovKkuAppClubVO clubVO) {
		return  (String) insert("clubDAO.insertClubApplication", clubVO);
	}

	public EgovMap selectClubUserInfo(EgovKkuAppClubVO clubVO) {
		return  (EgovMap) select("clubDAO.selectClubUserInfo", clubVO);
	}

	public List<EgovMap> selectClubViewDetail(EgovKkuAppClubVO clubVO) {
		return (List<EgovMap>) list("clubDAO.selectClubViewDetail", clubVO);
	}

	public String insertClubNotice(EgovKkuAppClubVO clubVO) {
		return  (String) insert("clubDAO.insertClubNotice", clubVO);
	}

	public List<EgovMap> selectClubApplicationList(EgovKkuAppClubVO clubVO) {
		return (List<EgovMap>) list("clubDAO.selectClubApplicationList", clubVO);
	}

	public EgovMap selectClubApplicationDetail(EgovKkuAppClubVO clubVO) {
		return  (EgovMap) select("clubDAO.selectClubApplicationDetail", clubVO);
	}

	public int updateClubUserState(EgovKkuAppClubVO clubVO) {
		return  (int) update("clubDAO.updateClubUserState", clubVO);
	}

	public List<EgovMap> selectClubUserDevice(EgovKkuAppClubVO clubVO) {
		return (List<EgovMap>) list("clubDAO.selectClubUserDevice", clubVO);
	}

	public void insertClubContent(EgovKkuAppClubVO clubVO) {
		insert("clubDAO.insertClubContent", clubVO);
		
	}

	public List<EgovMap> selectClubGalleryList(EgovKkuAppClubVO clubVO) {
		return (List<EgovMap>) list("clubDAO.selectClubGalleryList", clubVO);
	}

	public int selectClubGalleryCnt(EgovKkuAppClubVO clubVO) {
		return  (int) select("clubDAO.selectClubGalleryCnt", clubVO);
	}

	public EgovMap selectClubGalleryDetail(EgovKkuAppClubVO clubVO) {
		return  (EgovMap) select("clubDAO.selectClubGalleryDetail", clubVO);
	}

	public int updateClubBoardState(EgovKkuAppClubVO clubVO) {
		return (int) update("clubDAO.updateClubBoardState", clubVO);
	}

	public List<EgovMap> selectClubBoardList(EgovKkuAppClubVO clubVO) {
		return (List<EgovMap>) list("clubDAO.selectClubBoardList", clubVO);
	}

	

}
