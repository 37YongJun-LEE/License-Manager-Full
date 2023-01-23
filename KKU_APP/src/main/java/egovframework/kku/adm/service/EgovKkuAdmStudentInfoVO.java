package egovframework.kku.adm.service;

public class EgovKkuAdmStudentInfoVO {
	private int mnoticeIdx;
	private String mnoticeNum;
	private String mnoticeTitle;
	private String mnoticeContent;
	private String mnoticeCategory;
	private String mnoticeName;
	private String mnoticeDate;
	private String mnoticeFiles;
	private String mnoticeUpdated;
	private String kc;
	private String kf;
	public int getMnoticeIdx() {
		return mnoticeIdx;
	}
	public void setMnoticeIdx(int mnoticeIdx) {
		this.mnoticeIdx = mnoticeIdx;
	}
	public String getMnoticeNum() {
		return mnoticeNum;
	}
	public void setMnoticeNum(String mnoticeNum) {
		this.mnoticeNum = mnoticeNum;
	}
	public String getMnoticeTitle() {
		return mnoticeTitle;
	}
	public void setMnoticeTitle(String mnoticeTitle) {
		this.mnoticeTitle = mnoticeTitle;
	}
	public String getMnoticeContent() {
		return mnoticeContent;
	}
	public void setMnoticeContent(String mnoticeContent) {
		this.mnoticeContent = mnoticeContent;
	}
	public String getMnoticeCategory() {
		return mnoticeCategory;
	}
	public void setMnoticeCategory(String mnoticeCategory) {
		this.mnoticeCategory = mnoticeCategory;
	}
	public String getMnoticeName() {
		return mnoticeName;
	}
	public void setMnoticeName(String mnoticeName) {
		this.mnoticeName = mnoticeName;
	}
	public String getMnoticeDate() {
		return mnoticeDate;
	}
	public void setMnoticeDate(String mnoticeDate) {
		this.mnoticeDate = mnoticeDate;
	}
	public String getMnoticeFiles() {
		return mnoticeFiles;
	}
	public void setMnoticeFiles(String mnoticeFiles) {
		this.mnoticeFiles = mnoticeFiles;
	}
	public String getMnoticeUpdated() {
		return mnoticeUpdated;
	}
	public void setMnoticeUpdated(String mnoticeUpdated) {
		this.mnoticeUpdated = mnoticeUpdated;
	}
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
		
	}@Override
	public String toString(){
		return "EgovKkuAdminCampusInfoVO [mnoticeIdx=" + mnoticeIdx + ", mnoticeNum=" + mnoticeNum + ", noticeTitle=" + mnoticeTitle 
				+", mnoticeContent=" + mnoticeContent + ", mnoticeCategory=" + mnoticeCategory + ", noticeName=" + mnoticeName + 
				", mnoticeDate=" + mnoticeDate + ", mnoticeFiles=" + mnoticeFiles + ", mnoticeUpdated=" + mnoticeUpdated +"]";
	}
}
