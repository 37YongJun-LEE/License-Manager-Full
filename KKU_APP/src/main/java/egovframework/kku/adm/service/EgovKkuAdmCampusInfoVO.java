package egovframework.kku.adm.service;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAdmCampusInfoVO extends ComDefaultVO {
	private int noticeIdx;
	private String noticeNum;
	private String noticeTitle;
	private String noticeContent;
	private String noticeCategory;
	private String noticeName;
	private String noticeDate;
	private String noticeFiles;
	private String noticeUpdated;
	private String kc;
	private String kf;
	
	public String getKc() {
		return kc;
	}
	public void setKc(String kc) {
		this.kc = kc;
	}
	public String getKf() {
		return kf;
	}
	public void setKf(String kf) {
		this.kf = kf;
	}
	public int getNoticeIdx() {
		return noticeIdx;
	}
	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
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
	public String getNoticeCategory() {
		return noticeCategory;
	}
	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
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
	public String getNoticeFiles() {
		return noticeFiles;
	}
	public void setNoticeFiles(String noticeFiles) {
		this.noticeFiles = noticeFiles;
	}
	public String getNoticeUpdated() {
		return noticeUpdated;
	}
	public void setNoticeUpdated(String noticeUpdated) {
		this.noticeUpdated = noticeUpdated;
	}
	
	@Override
	public String toString(){
		return "EgovKkuAdminCampusInfoVO [noticeIdx=" + noticeIdx + ", noticeNum=" + noticeNum + ", noticeTitle=" + noticeTitle 
				+", noticeContent=" + noticeContent + ", noticeCategory=" + noticeCategory + ", noticeName=" + noticeName + 
				", noticeDate=" + noticeDate + ", noticeFiles=" + noticeFiles + ", noticeUpdated=" + noticeUpdated +"]";
	}


}
