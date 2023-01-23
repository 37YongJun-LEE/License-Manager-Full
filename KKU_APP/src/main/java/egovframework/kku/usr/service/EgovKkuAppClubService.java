package egovframework.kku.usr.service;

import java.util.List;

import egovframework.kku.adm.service.EgovKkuAdmCommunityBoardVO;
import egovframework.kku.adm.service.EgovKkuAdmLikeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppClubService {

	List<EgovMap> selectClubList(EgovKkuAppClubVO clubVO) throws Exception;

	int selectClubListCnt(EgovKkuAppClubVO clubVO)  throws Exception;

	EgovKkuAppClubVO selectClubDetail(EgovKkuAppClubVO clubVO) throws Exception;

	String insertClubApplication(EgovKkuAppClubVO clubVO) throws Exception;

	public EgovMap selectClubUserInfo(EgovKkuAppClubVO clubVO) throws Exception;
	//동아리 상세보기 페이지 
	public List<EgovMap> selectClubViewDetail(EgovKkuAppClubVO clubVO) throws Exception;

	public String insertClubNotice(EgovKkuAppClubVO clubVO) throws Exception;

	public List<EgovMap> selectClubApplicationList(EgovKkuAppClubVO clubVO) throws Exception;

	public EgovMap selectClubApplicationDetail(EgovKkuAppClubVO clubVO) throws Exception;

	public int updateClubUserState(EgovKkuAppClubVO clubVO) throws Exception;

	public List<EgovMap> selectClubUserDevice(EgovKkuAppClubVO clubVO) throws Exception;

	void insertClubContent(EgovKkuAppClubVO clubVO) throws Exception;

	public List<EgovMap> selectClubGalleryList(EgovKkuAppClubVO clubVO) throws Exception;

	public int selectClubGalleryCnt(EgovKkuAppClubVO clubVO)  throws Exception;

	public EgovMap selectClubGalleryDetail(EgovKkuAppClubVO clubVO)  throws Exception;

	public int updateClubBoardState(EgovKkuAppClubVO clubVO) throws Exception;

	public List<EgovMap> selectClubBoardList(EgovKkuAppClubVO clubVO) throws Exception;

	


}
