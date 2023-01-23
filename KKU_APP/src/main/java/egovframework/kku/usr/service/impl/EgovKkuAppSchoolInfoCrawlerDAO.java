package egovframework.kku.usr.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("crawlerDAO")
public class EgovKkuAppSchoolInfoCrawlerDAO extends EgovComAbstractDAO {

	public String insertContent(EgovKkuAppSchoolInfoCrawlerVO vo) throws Exception {
		return (String) insert("crawlerDAO.insertContent",vo);
	}

	public EgovMap selectContent(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{
		return (EgovMap) select("crawlerDAO.selectContent", crawlerVO);
	}

	public int insertWeeklyMenu(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return (int) update("crawlerDAO.insertWeeklyMenu",crawlerVO);
	}

	public List<EgovMap> selectMenuList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{
		return (List<EgovMap>) list("crawlerDAO.selectMenuList", crawlerVO);
	}

	public int insertNotice(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{
		return (int) update("crawlerDAO.insertNotice",crawlerVO);
	}

	public List<EgovMap> selectNoticeList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{
		return (List<EgovMap>) list("crawlerDAO.selectNoticeList", crawlerVO);
	}
	
	public int selectNoticeListCnt(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{
		return (int) select("crawlerDAO.selectNoticeListCnt", crawlerVO);
	}

	public EgovMap selectNoticeByNum(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception{
		return (EgovMap) select("crawlerDAO.selectNoticeByNum", crawlerVO);
	}

	public List<String> selectIndexList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) {
		return (List<String>) list("crawlerDAO.selectIndexList", crawlerVO);
	}
	
	public List<String> selectIndexListMN(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) {
		return (List<String>) list("crawlerDAO.selectIndexListMN", crawlerVO);
	}
	
	
	public int insertMajorNotice(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) {
		return (int) update("crawlerDAO.insertMajorNotice", crawlerVO);
	}

	public List<EgovMap> selectMajorNoticeList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) {
		return (List<EgovMap>) list("crawlerDAO.selectMajorNoticeList", crawlerVO);
	}

	public EgovMap selectMajorNoticeByNum(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) {
		return (EgovMap) select("crawlerDAO.selectMajorNoticeByNum", crawlerVO);
	}

	public int selectMajorNoticeListCnt(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) {
		return (int) select("crawlerDAO.selectMajorNoticeListCnt", crawlerVO);
	}

	public String selectRecentUpdateDate() {
		return (String) select("crawlerDAO.selectRecentUpdateDate");
	}

	public String selectMajorNoticeUpdateDate(String usrMajor) {
		return (String) select("crawlerDAO.selectMajorNoticeUpdateDate",usrMajor);
	}

	public String selectRecentUpdated() {
		return (String) select("crawlerDAO.selectRecentUpdated");
	}

	public void updateNoticeViewcnt(String noticeIdx) {
		update("crawlerDAO.updateNoticeViewcnt", noticeIdx);
	}

	public void updateMNoticeViewcnt(String noticeIdx) {
		update("crawlerDAO.updateMNoticeViewcnt", noticeIdx);
	}


}
