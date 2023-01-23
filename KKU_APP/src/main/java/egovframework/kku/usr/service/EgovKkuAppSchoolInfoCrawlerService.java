package egovframework.kku.usr.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuAppSchoolInfoCrawlerService {
	
	public String insertContent(EgovKkuAppSchoolInfoCrawlerVO vo) throws Exception;

	public EgovMap selectContent(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;

	//학식정보 크롤링 데이터 저장
	public int insertWeeklyMenu(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;

	//학식정보 크롤링 데이터 불러오기
	public List<EgovMap> selectMenuList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;

	//학교공지 크롤링 데이터 저장
	public int insertNotice(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;
	
	//학교공지 크롤링 데이터 불러오기
	public List<EgovMap> selectNoticeList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;
	
	//학교공지 크롤링 데이터 전체 개수 불러오기
	public int selectNoticeListCnt(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;

	//학교공지 상세내용 불러오기
	public EgovMap selectNoticeByNum(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;

	//학교공지, 학과공지 리스트 갯수 조회
	public List<String> selectIndexList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;

	//학과공지 크롤링 데이터 저장
	public int insertMajorNotice(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;

	List<String> selectIndexListMN(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;
	
	public List<EgovMap> selectMajorNoticeList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;

	public int selectMajorNoticeListCnt(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;

	public EgovMap selectMajorNoticeByNum(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception;
	//학교공지 최근 업데이트일
	public String selectRecentUpdateDate() throws Exception;
	//학과공지 최근 업데이트일 
	public String selectMajorNoticeUpdateDate(String usrMajor);

	//크롤러 최근 업데이트일
	public String selectRecentUpdated();
	//학교공지 조회수 증가
	public void updateNoticeViewcnt(String noticeIdx);

	public void updateMNoticeViewcnt(String noticeIdx);
	
}