package egovframework.kku.usr.service;

import java.io.Serializable;
import java.util.Arrays;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class EgovKkuLostVO extends ComDefaultVO implements Serializable{
	
	private String lostIdx = "";
	private String lostTitle= "";
	private String lostWriter= "";
	private String lostContent= "";
	private String lostLocation= "";
	private String lostStatus= "";
	private String lostSelecter = "";
	private String fileTblCode= "";
	private String mode        = ""; // 수정모드
	
	private String[] fileIdxArr ;
	private String[] delArr ;
	
	public String getLostIdx() {
		return lostIdx;
	}
	public void setLostIdx(String lostIdx) {
		this.lostIdx = lostIdx;
	}
	public String getLostTitle() {
		return lostTitle;
	}
	public void setLostTitle(String lostTitle) {
		this.lostTitle = lostTitle;
	}
	public String getLostWriter() {
		return lostWriter;
	}
	public void setLostWriter(String lostWriter) {
		this.lostWriter = lostWriter;
	}
	public String getLostContent() {
		return lostContent;
	}
	public void setLostContent(String lostContent) {
		this.lostContent = lostContent;
	}
	public String getLostLocation() {
		return lostLocation;
	}
	public void setLostLocation(String lostLocation) {
		this.lostLocation = lostLocation;
	}
	public String getLostStatus() {
		return lostStatus;
	}
	public void setLostStatus(String lostStatus) {
		this.lostStatus = lostStatus;
	}
	
	
	public String getLostSelecter() {
		return lostSelecter;
	}
	public void setLostSelecter(String lostSelecter) {
		this.lostSelecter = lostSelecter;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	
	
	public String getFileTblCode() {
		return fileTblCode;
	}
	public void setFileTblCode(String fileTblCode) {
		this.fileTblCode = fileTblCode;
	}
	public String[] getFileIdxArr() {
		return fileIdxArr;
	}
	public void setFileIdxArr(String[] fileIdxArr) {
		this.fileIdxArr = fileIdxArr;
	}
	public String[] getDelArr() {
		return delArr;
	}
	public void setDelArr(String[] delArr) {
		this.delArr = delArr;
	}
	@Override
	public String toString() {
		return "EgovKkuLostVO [lostIdx=" + lostIdx + ", lostTitle=" + lostTitle + ", lostWriter=" + lostWriter
				+ ", lostContent=" + lostContent + ", lostLocation=" + lostLocation + ", lostStatus=" + lostStatus
				+ ", lostSelecter=" + lostSelecter + ", mode=" + mode + ", fileIdxArr=" + Arrays.toString(fileIdxArr)
				+ ", delArr=" + Arrays.toString(delArr) + "]";
	}

	
}
