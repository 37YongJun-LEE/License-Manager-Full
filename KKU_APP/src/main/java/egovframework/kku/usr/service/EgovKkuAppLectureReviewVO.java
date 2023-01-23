package egovframework.kku.usr.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppLectureReviewVO extends ComDefaultVO implements Serializable{
	private String reviewIdx;
	private String subNum;
	private String writer;
	private String selecter;
	private String content;
	private String lectureName;
	private String lectureProfname;
	
	
	private String mode        = ""; // 수정모드
	
	
	private String[] fileIdxArr ;
	private String[] delArr ;
	
	public String getSubNum() {
		return subNum;
	}
	public void setSubNum(String subNum) {
		this.subNum = subNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSelecter() {
		return selecter;
	}
	public void setSelecter(String selecter) {
		this.selecter = selecter;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
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
	public String getReviewIdx() {
		return reviewIdx;
	}
	public void setReviewIdx(String reviewIdx) {
		this.reviewIdx = reviewIdx;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public String getLectureProfname() {
		return lectureProfname;
	}
	public void setLectureProfname(String lectureProfname) {
		this.lectureProfname = lectureProfname;
	}
	@Override
	public String toString() {
		return "EgovKkuAppLectureReviewVO [reviewIdx=" + reviewIdx + ", subNum=" + subNum + ", writer=" + writer
				+ ", selecter=" + selecter + ", content=" + content + ", lectureName=" + lectureName
				+ ", lectureProfname=" + lectureProfname + ", mode=" + mode + "]";
	}
}
