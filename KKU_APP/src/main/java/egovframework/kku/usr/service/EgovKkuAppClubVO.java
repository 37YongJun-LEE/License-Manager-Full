package egovframework.kku.usr.service;

import java.io.Serializable;
import java.util.Arrays;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppClubVO extends ComDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String clubCategory;
	private String clubName;
	private String clubComment;
	private String clubEvent;
	
	//가입신청및 유저 관리용
	private int clubUserIdx;
	private String usrIdx;
	private String clubUserMsg;
	private String clubUserPhone;
	private String clubUserLev;
	private String clubUserState;
	private String agreeYn;
	
	//동아리 게시판(공지,자유,갤러리)
	private int clubBoardIdx;
	private String clubBoardType;
	private String clubBoardContent;
	private String clubBoardTitle;
	private int viewnum;
	private String category;

	//공통
	private String regIdx;
	private String regDate;
	private String clubIdx;
	private String modIdx;
	private String modDate;
	private String delYn;
	private String userNum;
	
	//알람 보내기용
	private String[] userIdxArr;
	
	//파일 
	private int fileTblCode;
	private String[] delArr;
	private String[] fileIdxArr;
	
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
	public int getFileTblCode() {
		return fileTblCode;
	}
	public void setFileTblCode(int fileTblCode) {
		this.fileTblCode = fileTblCode;
	}
	public String getClubIdx() {
		return clubIdx;
	}
	public void setClubIdx(String clubIdx) {
		this.clubIdx = clubIdx;
	}
	public String getClubCategory() {
		return clubCategory;
	}
	public void setClubCategory(String clubCategory) {
		this.clubCategory = clubCategory;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getClubComment() {
		return clubComment;
	}
	public void setClubComment(String clubComment) {
		this.clubComment = clubComment;
	}
	public String getClubEvent() {
		return clubEvent;
	}
	public void setClubEvent(String clubEvent) {
		this.clubEvent = clubEvent;
	}
	public int getClubUserIdx() {
		return clubUserIdx;
	}
	public void setClubUserIdx(int clubUserIdx) {
		this.clubUserIdx = clubUserIdx;
	}
	public String getUsrIdx() {
		return usrIdx;
	}
	public void setUsrIdx(String usrIdx) {
		this.usrIdx = usrIdx;
	}
	public String getClubUserMsg() {
		return clubUserMsg;
	}
	public void setClubUserMsg(String clubUserMsg) {
		this.clubUserMsg = clubUserMsg;
	}
	public String getClubUserPhone() {
		return clubUserPhone;
	}
	public void setClubUserPhone(String clubUserPhone) {
		this.clubUserPhone = clubUserPhone;
	}
	public String getClubUserLev() {
		return clubUserLev;
	}
	public void setClubUserLev(String clubUserLev) {
		this.clubUserLev = clubUserLev;
	}
	public String getClubUserState() {
		return clubUserState;
	}
	public void setClubUserState(String clubUserState) {
		this.clubUserState = clubUserState;
	}
	public String getModIdx() {
		return modIdx;
	}
	public void setModIdx(String modIdx) {
		this.modIdx = modIdx;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getAgreeYn() {
		return agreeYn;
	}
	public void setAgreeYn(String agreeYn) {
		this.agreeYn = agreeYn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public int getClubBoardIdx() {
		return clubBoardIdx;
	}
	public void setClubBoardIdx(int clubBoardIdx) {
		this.clubBoardIdx = clubBoardIdx;
	}
	public String getClubBoardType() {
		return clubBoardType;
	}
	public void setClubBoardType(String clubBoardType) {
		this.clubBoardType = clubBoardType;
	}
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	public String getClubBoardContent() {
		return clubBoardContent;
	}
	public void setClubBoardContent(String clubBoardContent) {
		this.clubBoardContent = clubBoardContent;
	}
	public String getClubBoardTitle() {
		return clubBoardTitle;
	}
	public void setClubBoardTitle(String clubBoardTitle) {
		this.clubBoardTitle = clubBoardTitle;
	}
	public int getViewnum() {
		return viewnum;
	}
	public void setViewnum(int viewnum) {
		this.viewnum = viewnum;
	}
	public String getRegIdx() {
		return regIdx;
	}
	public void setRegIdx(String regIdx) {
		this.regIdx = regIdx;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String[] getUserIdxArr() {
		return userIdxArr;
	}
	public void setUserIdxArr(String[] userIdxArr) {
		this.userIdxArr = userIdxArr;
	}
	@Override
	public String toString() {
		return "EgovKkuAppClubVO [clubCategory=" + clubCategory + ", clubName=" + clubName + ", clubComment="
				+ clubComment + ", clubEvent=" + clubEvent + ", clubUserIdx=" + clubUserIdx + ", usrIdx=" + usrIdx
				+ ", clubUserMsg=" + clubUserMsg + ", clubUserPhone=" + clubUserPhone + ", clubUserLev=" + clubUserLev
				+ ", clubUserState=" + clubUserState + ", agreeYn=" + agreeYn + ", clubBoardIdx=" + clubBoardIdx
				+ ", clubBoardType=" + clubBoardType + ", clubBoardContent=" + clubBoardContent + ", clubBoardTitle="
				+ clubBoardTitle + ", viewnum=" + viewnum + ", category=" + category + ", regIdx=" + regIdx
				+ ", regDate=" + regDate + ", clubIdx=" + clubIdx + ", modIdx=" + modIdx + ", modDate=" + modDate
				+ ", delYn=" + delYn + ", userNum=" + userNum + ", userIdxArr=" + Arrays.toString(userIdxArr)
				+ ", fileTblCode=" + fileTblCode + ", delArr=" + Arrays.toString(delArr) + ", fileIdxArr="
				+ Arrays.toString(fileIdxArr) + "]";
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
