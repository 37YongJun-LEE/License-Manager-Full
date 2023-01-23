package egovframework.kku.usr.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppBoardVO extends ComDefaultVO implements Serializable{
	private int trdIdx;
	private String trdWriter;
	private String trdUsrnick;
	private int trdusrIdx;
	private String trdTitle;
	private String trdContent;
	private String trdPrice;
	private String trdWritedate;
	private String trdViewnum;
	private String trdStatus;
	private String trdModdate;
	public int getTrdIdx() {
		return trdIdx;
	}
	public void setTrdIdx(int trdIdx) {
		this.trdIdx = trdIdx;
	}
	public String getTrdWriter() {
		return trdWriter;
	}
	public void setTrdWriter(String trdWriter) {
		this.trdWriter = trdWriter;
	}
	public String getTrdUsrnick() {
		return trdUsrnick;
	}
	public void setTrdUsrnick(String trdUsrnick) {
		this.trdUsrnick = trdUsrnick;
	}
	public int getTrdusrIdx() {
		return trdusrIdx;
	}
	public void setTrdusrIdx(int trdusrIdx) {
		this.trdusrIdx = trdusrIdx;
	}
	public String getTrdTitle() {
		return trdTitle;
	}
	public void setTrdTitle(String trdTitle) {
		this.trdTitle = trdTitle;
	}
	public String getTrdContent() {
		return trdContent;
	}
	public void setTrdContent(String trdContent) {
		this.trdContent = trdContent;
	}
	public String getTrdPrice() {
		return trdPrice;
	}
	public void setTrdPrice(String trdPrice) {
		this.trdPrice = trdPrice;
	}
	public String getTrdWritedate() {
		return trdWritedate;
	}
	public void setTrdWritedate(String trdWritedate) {
		this.trdWritedate = trdWritedate;
	}
	public String getTrdViewnum() {
		return trdViewnum;
	}
	public void setTrdViewnum(String trdViewnum) {
		this.trdViewnum = trdViewnum;
	}
	public String getTrdStatus() {
		return trdStatus;
	}
	public void setTrdStatus(String trdStatus) {
		this.trdStatus = trdStatus;
	}
	public String getTrdModdate() {
		return trdModdate;
	}
	public void setTrdModdate(String trdModdate) {
		this.trdModdate = trdModdate;
	}
	@Override
	public String toString() {
		return "EgovKkuAppBoardVO [trdIdx=" + trdIdx + ", trdWriter=" + trdWriter + ", trdUsrnick=" + trdUsrnick
				+ ", trdusrIdx=" + trdusrIdx + ", trdTitle=" + trdTitle + ", trdContent=" + trdContent + ", trdPrice="
				+ trdPrice + ", trdWritedate=" + trdWritedate + ", trdViewnum=" + trdViewnum + ", trdStatus="
				+ trdStatus + ", trdModdate=" + trdModdate + "]";
	}
	
	

	
}
