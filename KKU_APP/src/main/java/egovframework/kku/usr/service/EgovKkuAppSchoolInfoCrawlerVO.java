package egovframework.kku.usr.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppSchoolInfoCrawlerVO extends ComDefaultVO implements Serializable {
	
	public int crawlerIdx;
	public String crawlerContent;
	public String crawlerCategory;
	public String crawlerUpdated;
	
	//학식 정보
	public String weekmenuIdx;
	public String weekmenuCategory;
	public String weekmenuDay;
	public String weekmenuMenu;
	public String weekmenuCalory;
	public String weekmenuPlace;
	public String weekmenuUpdated;
	public String weekmenuDate;
	
	//학교 공지
	public String noticeIdx;
	public String noticeNum;
	public String noticeTitle;
	public String noticeContent;
	public String noticeName;
	public String noticeDate;
	public String noticeUpdated;
	public String noticeCategory;
	public String noticeFiles;
	public String noticeViewcnt;
	
	public String srcUrl;
	public String hrefUrl;
	public String day;
	
	//로그
	private String clogIdx;
	private String clogCategory;
	private String clogContent;
	private String clogUpdated;
	
	
	
	public String getClogIdx() {
		return clogIdx;
	}
	public void setClogIdx(String clogIdx) {
		this.clogIdx = clogIdx;
	}
	public String getClogCategory() {
		return clogCategory;
	}
	public void setClogCategory(String clogCategory) {
		this.clogCategory = clogCategory;
	}
	public String getClogContent() {
		return clogContent;
	}
	public void setClogContent(String clogContent) {
		this.clogContent = clogContent;
	}
	public String getClogUpdated() {
		return clogUpdated;
	}
	public void setClogUpdated(String clogUpdated) {
		this.clogUpdated = clogUpdated;
	}
	public String getNoticeIdx() {
		return noticeIdx;
	}
	public void setNoticeIdx(String noticeIdx) {
		this.noticeIdx = noticeIdx;
	}
	public String getNoticeViewcnt() {
		return noticeViewcnt;
	}
	public void setNoticeViewcnt(String noticeViewcnt) {
		this.noticeViewcnt = noticeViewcnt;
	}
	public String getSrcUrl() {
		return srcUrl;
	}
	public void setSrcUrl(String srcUrl) {
		this.srcUrl = srcUrl;
	}
	public String getHrefUrl() {
		return hrefUrl;
	}
	public void setHrefUrl(String hrefUrl) {
		this.hrefUrl = hrefUrl;
	}
	public String getNoticeFiles() {
		return noticeFiles;
	}
	public void setNoticeFiles(String noticeFiles) {
		this.noticeFiles = noticeFiles;
	}
	public String getNoticeCategory() {
		return noticeCategory;
	}
	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}
	public String getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(String noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeName() {
		return noticeName;
	}
	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeUpdated() {
		return noticeUpdated;
	}
	public void setNoticeUpdated(String noticeUpdated) {
		this.noticeUpdated = noticeUpdated;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getWeekmenuIdx() {
		return weekmenuIdx;
	}
	public void setWeekmenuIdx(String weekmenuIdx) {
		this.weekmenuIdx = weekmenuIdx;
	}
	public String getWeekmenuCategory() {
		return weekmenuCategory;
	}
	public void setWeekmenuCategory(String weekmenuCategory) {
		this.weekmenuCategory = weekmenuCategory;
	}
	public String getWeekmenuDay() {
		return weekmenuDay;
	}
	public void setWeekmenuDay(String weekmenuDay) {
		this.weekmenuDay = weekmenuDay;
	}
	public String getWeekmenuMenu() {
		return weekmenuMenu;
	}
	public void setWeekmenuMenu(String weekmenuMenu) {
		this.weekmenuMenu = weekmenuMenu;
	}
	public String getWeekmenuCalory() {
		return weekmenuCalory;
	}
	public void setWeekmenuCalory(String weekmenuCalory) {
		this.weekmenuCalory = weekmenuCalory;
	}
	public String getWeekmenuPlace() {
		return weekmenuPlace;
	}
	public void setWeekmenuPlace(String weekmenuPlace) {
		this.weekmenuPlace = weekmenuPlace;
	}
	public String getWeekmenuUpdated() {
		return weekmenuUpdated;
	}
	public void setWeekmenuUpdated(String weekmenuUpdated) {
		this.weekmenuUpdated = weekmenuUpdated;
	}
	public String getWeekmenuDate() {
		return weekmenuDate;
	}
	public void setWeekmenuDate(String weekmenuDate) {
		this.weekmenuDate = weekmenuDate;
	}
	public int getCrawlerIdx() {
		return crawlerIdx;
	}
	public void setCrawlerIdx(int crawlerIdx) {
		this.crawlerIdx = crawlerIdx;
	}
	public String getCrawlerContent() {
		return crawlerContent;
	}
	public void setCrawlerContent(String crawlerContent) {
		this.crawlerContent = crawlerContent;
	}
	public String getCrawlerCategory() {
		return crawlerCategory;
	}
	public void setCrawlerCategory(String crawlerCategory) {
		this.crawlerCategory = crawlerCategory;
	}
	public String getCrawlerUpdated() {
		return crawlerUpdated;
	}
	public void setCrawlerUpdated(String crawlerUpdated) {
		this.crawlerUpdated = crawlerUpdated;
	}
	@Override
	public String toString() {
		return "EgovKkuAppSchoolInfoCrawlerVO [crawlerIdx=" + crawlerIdx + ", crawlerContent=" + crawlerContent
				+ ", crawlerCategory=" + crawlerCategory + ", crawlerUpdated=" + crawlerUpdated + ", weekmenuIdx="
				+ weekmenuIdx + ", weekmenuCategory=" + weekmenuCategory + ", weekmenuDay=" + weekmenuDay
				+ ", weekmenuMenu=" + weekmenuMenu + ", weekmenuCalory=" + weekmenuCalory + ", weekmenuPlace="
				+ weekmenuPlace + ", weekmenuUpdated=" + weekmenuUpdated + ", weekmenuDate=" + weekmenuDate
				+ ", noticeNum=" + noticeNum + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeName=" + noticeName + ", noticeDate=" + noticeDate + ", noticeUpdated=" + noticeUpdated
				+ ", noticeCategory=" + noticeCategory + ", noticeFiles=" + noticeFiles + ", noticeViewcnt="
				+ noticeViewcnt + ", srcUrl=" + srcUrl + ", hrefUrl=" + hrefUrl + ", day=" + day + "]";
	}
	
	
}
