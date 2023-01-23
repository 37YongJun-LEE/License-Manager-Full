package egovframework.kku.usr.service;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppCommunityVO extends ComDefaultVO implements Serializable {// 게시판용
	public String usrId;
	public int likeNum;
	public String usrNickname;
	public String usrMajor;
	public String usrStdnum;
	public int fileCnt;
	private String[] fileIdxArr;
	private String[] delArr;
	public String usrSrvprofilepic;
	
	// 게시판 상세 페이지용
	public String boardCode;
	public String boardContent;
	public String boardDetailname;
	public int boardIdx;
	public int boardLike = 0;
	public String boardName;
	public String boardSrvfileone;
	public String boardSrvfilethree;
	public String boardSrvfiletwo;
	public int boardStatus;
	public String boardTitle;
	public String boardUsrfileone;
	public String boardUsrfilethree;
	public String boardUsrfiletwo;
	public int boardViewnum = 0;
	public String boardWritedate;
	public String boardWriter;
	public String reportPageurl;
	
	//자격증 매니저
	public String subjectCd;
	public String subjectName;
	
	
	
	public String getSubjectCd() {
		return subjectCd;
	}

	public void setSubjectCd(String subjectCd) {
		this.subjectCd = subjectCd;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getReportPageurl() {
		return reportPageurl;
	}

	public void setReportPageurl(String reportPageurl) {
		this.reportPageurl = reportPageurl;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public String getBoardDetailname() {
		return boardDetailname;
	}

	public int getBoardIdx() {
		return boardIdx;
	}

	public int getBoardLike() {
		return boardLike;
	}

	public String getBoardName() {
		return boardName;
	}

	public String getBoardSrvfileone() {
		return boardSrvfileone;
	}

	public String getBoardSrvfilethree() {
		return boardSrvfilethree;
	}

	public String getBoardSrvfiletwo() {
		return boardSrvfiletwo;
	}

	public int getBoardStatus() {
		return boardStatus;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public String getBoardUsrfileone() {
		return boardUsrfileone;
	}

	public String getBoardUsrfilethree() {
		return boardUsrfilethree;
	}

	public String getBoardUsrfiletwo() {
		return boardUsrfiletwo;
	}

	public int getBoardViewnum() {
		return boardViewnum;
	}

	public String getBoardWritedate() {
		return boardWritedate;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public void setBoardDetailname(String boardDetailname) {
		this.boardDetailname = boardDetailname;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public void setBoardSrvfileone(String boardSrvfileone) {
		this.boardSrvfileone = boardSrvfileone;
	}

	public void setBoardSrvfilethree(String boardSrvfilethree) {
		this.boardSrvfilethree = boardSrvfilethree;
	}

	public void setBoardSrvfiletwo(String boardSrvfiletwo) {
		this.boardSrvfiletwo = boardSrvfiletwo;
	}

	public void setBoardStatus(int boardStatus) {
		this.boardStatus = boardStatus;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public void setBoardUsrfileone(String boardUsrfileone) {
		this.boardUsrfileone = boardUsrfileone;
	}

	public void setBoardUsrfilethree(String boardUsrfilethree) {
		this.boardUsrfilethree = boardUsrfilethree;
	}

	public void setBoardUsrfiletwo(String boardUsrfiletwo) {
		this.boardUsrfiletwo = boardUsrfiletwo;
	}

	public void setBoardViewnum(int boardViewnum) {
		this.boardViewnum = boardViewnum;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public void setBoardWritedate(String boardWritedate) {
		this.boardWritedate = boardWritedate;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public String getUsrNickname() {
		return usrNickname;
	}

	public void setUsrNickname(String usrNickname) {
		this.usrNickname = usrNickname;
	}

	public String getUsrMajor() {
		return usrMajor;
	}

	public void setUsrMajor(String usrMajor) {
		this.usrMajor = usrMajor;
	}

	public String getUsrStdnum() {
		return usrStdnum;
	}

	public void setUsrStdnum(String usrStdnum) {
		this.usrStdnum = usrStdnum;
	}

	public int getFileCnt() {
		return fileCnt;
	}

	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}

	public String[] getFileIdxArr() {
		return fileIdxArr;
	}

	public void setFileIdxArr(String[] fileIdxArr) {
		this.fileIdxArr = fileIdxArr;
	}

	public String getUsrSrvprofilepic() {
		return usrSrvprofilepic;
	}

	public void setUsrSrvprofilepic(String usrSrvprofilepic) {
		this.usrSrvprofilepic = usrSrvprofilepic;
	}

	public String[] getDelArr() {
		return delArr;
	}

	public void setDelArr(String[] delArr) {
		this.delArr = delArr;
	}

	@Override
	public String toString() {
		return "EgovKkuAppCommunityVO [usrId=" + usrId + ", likeNum=" + likeNum + ", usrNickname=" + usrNickname
				+ ", usrMajor=" + usrMajor + ", usrStdnum=" + usrStdnum + ", fileCnt=" + fileCnt + ", fileIdxArr="
				+ Arrays.toString(fileIdxArr) + ", delArr=" + Arrays.toString(delArr) + ", usrSrvprofilepic="
				+ usrSrvprofilepic + ", boardCode=" + boardCode + ", boardContent=" + boardContent
				+ ", boardDetailname=" + boardDetailname + ", boardIdx=" + boardIdx + ", boardLike=" + boardLike
				+ ", boardName=" + boardName + ", boardSrvfileone=" + boardSrvfileone + ", boardSrvfilethree="
				+ boardSrvfilethree + ", boardSrvfiletwo=" + boardSrvfiletwo + ", boardStatus=" + boardStatus
				+ ", boardTitle=" + boardTitle + ", boardUsrfileone=" + boardUsrfileone + ", boardUsrfilethree="
				+ boardUsrfilethree + ", boardUsrfiletwo=" + boardUsrfiletwo + ", boardViewnum=" + boardViewnum
				+ ", boardWritedate=" + boardWritedate + ", boardWriter=" + boardWriter + ", reportPageurl="
				+ reportPageurl + ", subjectCd=" + subjectCd + ", subjectName=" + subjectName + "]";
	}

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}

}
