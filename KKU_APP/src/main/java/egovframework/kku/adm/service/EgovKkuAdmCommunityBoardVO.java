package egovframework.kku.adm.service;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

/**
 * kpc-ceo-web
 * @author 개발팀 조반석
 * @since 2020.08.27
 * @version 1.1
 * @see
 */

@SuppressWarnings("serial")
public class EgovKkuAdmCommunityBoardVO extends ComDefaultVO implements Serializable{
		
	private String trdIdx  = "";  //커뮤니티 게시글 인덱스
	private String trdWriter    = "";  //작성자 아이디
	private String trdUsrnick    = "";  //작성자 닉네임
	private String trdUsrIdx    = "";  //작성자 인덱스
	private String trdTitle	   = "";  // 제목
	private String trdContent  = "";  // 내용
	private String trdPrice   = "";  // 가격
	private String trdWritedate = "";  // 날짜
	private String trdStatus     = "";  //상태
	private String trdViewnum       = "";  //조회수
	private String mode        = ""; // 수정모드
	private String fileTblCode = "";
	
	private String[] fileIdxArr ;
	private String[] delArr ;
	
	public String getTrdIdx() {
		return trdIdx;
	}
	public void setTrdIdx(String trdIdx) {
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
	public String getTrdUsrIdx() {
		return trdUsrIdx;
	}
	public void setTrdUsrIdx(String trdUsridx) {
		this.trdUsrIdx = trdUsridx;
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
	public String getTrdStatus() {
		return trdStatus;
	}
	public void setTrdStatus(String trdStatus) {
		this.trdStatus = trdStatus;
	}
	@Override
	public String toString() {
		return "EgovKkuAdmCommunityBoardVO [trdIdx=" + trdIdx + ", trdWriter=" + trdWriter + ", trdUsrnick="
				+ trdUsrnick + ", trdUsrIdx=" + trdUsrIdx + ", trdTitle=" + trdTitle + ", trdContent=" + trdContent
				+ ", trdPrice=" + trdPrice + ", trdWritedate=" + trdWritedate + ", trdStatus=" + trdStatus
				+ ", trdViewnum=" + trdViewnum + ", mode=" + mode + ", fileIdxArr=" + Arrays.toString(fileIdxArr)
				+ ", delArr=" + Arrays.toString(delArr) + "]";
	}
	
}