package egovframework.kku.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.kku.usr.service.EgovKkuAppCommunityVO;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("crawlerService")	
public class EgovKkuAppSchoolInfoCrawlerServiceImpl implements EgovKkuAppSchoolInfoCrawlerService {

	@Resource(name="crawlerDAO")
	public EgovKkuAppSchoolInfoCrawlerDAO crawlerDAO;
	
	public String insertContent(EgovKkuAppSchoolInfoCrawlerVO vo) throws Exception {
		return crawlerDAO.insertContent(vo);
	}

	@Override
	public EgovMap selectContent(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.selectContent(crawlerVO);
	}

	@Override
	public int insertWeeklyMenu(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.insertWeeklyMenu(crawlerVO);
	}

	@Override
	public List<EgovMap> selectMenuList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.selectMenuList(crawlerVO);
	}

	@Override
	public int insertNotice(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.insertNotice(crawlerVO);
	}

	@Override
	public List<EgovMap> selectNoticeList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.selectNoticeList(crawlerVO);
	}
	
	@Override
	public int selectNoticeListCnt(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.selectNoticeListCnt(crawlerVO);
	}

	@Override
	public EgovMap selectNoticeByNum(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.selectNoticeByNum(crawlerVO);
	}

	@Override
	public List<String> selectIndexList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.selectIndexList(crawlerVO);
	}
	
	@Override
	public List<String> selectIndexListMN(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.selectIndexListMN(crawlerVO);
	}
	@Override
	public int insertMajorNotice(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.insertMajorNotice(crawlerVO);
	}

	@Override
	public List<EgovMap> selectMajorNoticeList(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.selectMajorNoticeList(crawlerVO);
	}
	
	@Override
	public int selectMajorNoticeListCnt(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.selectMajorNoticeListCnt(crawlerVO);
	}

	@Override
	public EgovMap selectMajorNoticeByNum(EgovKkuAppSchoolInfoCrawlerVO crawlerVO) throws Exception {
		return crawlerDAO.selectMajorNoticeByNum(crawlerVO);
	}

	@Override
	public String selectRecentUpdateDate() throws Exception {
		return crawlerDAO.selectRecentUpdateDate();
	}

	@Override
	public String selectMajorNoticeUpdateDate(String usrMajor) {
		return crawlerDAO.selectMajorNoticeUpdateDate(usrMajor);
	}

	@Override
	public String selectRecentUpdated() {
		return crawlerDAO.selectRecentUpdated();
	}

	@Override
	public void updateNoticeViewcnt(String noticeIdx) {
		crawlerDAO.updateNoticeViewcnt(noticeIdx);
	}

	@Override
	public void updateMNoticeViewcnt(String noticeIdx) {
		crawlerDAO.updateNoticeViewcnt(noticeIdx);		
	}
}
