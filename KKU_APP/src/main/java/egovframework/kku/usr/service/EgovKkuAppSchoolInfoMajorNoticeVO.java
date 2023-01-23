package egovframework.kku.usr.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppSchoolInfoMajorNoticeVO extends ComDefaultVO implements Serializable {
	public String usrId;
	public int likeNum;
	public String usrNickname;
	public String usrMajor;
	public String usrStdnum;
	
	public String boardIdx;
	public String boardWriter;
	public String boardTitle;
	public String boardContent;
	public String boardWritedate;
	public String boardUsrfileone;
	public String boardUsrfiletwo;
	public String boardUsrfilethree;
	public String boardSrvfileone;
	public String boardSrvfiletwo;
	public String boardSrvfilethree;
	public int boardViewnum;
	public int boardStatus;
	public String boardName;
	public int boardLike;
	public String boardDetailname;
	
	
	private String mode = ""; // 수정모드
	private String[] fileIdxArr ;
	private String[] delArr ;


	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
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
	public String getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(String boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWritedate() {
		return boardWritedate;
	}
	public void setBoardWritedate(String boardWritedate) {
		this.boardWritedate = boardWritedate;
	}
	public String getBoardUsrfileone() {
		return boardUsrfileone;
	}
	public void setBoardUsrfileone(String boardUsrfileone) {
		this.boardUsrfileone = boardUsrfileone;
	}
	public String getBoardUsrfiletwo() {
		return boardUsrfiletwo;
	}
	public void setBoardUsrfiletwo(String boardUsrfiletwo) {
		this.boardUsrfiletwo = boardUsrfiletwo;
	}
	public String getBoardUsrfilethree() {
		return boardUsrfilethree;
	}
	public void setBoardUsrfilethree(String boardUsrfilethree) {
		this.boardUsrfilethree = boardUsrfilethree;
	}
	public String getBoardSrvfileone() {
		return boardSrvfileone;
	}
	public void setBoardSrvfileone(String boardSrvfileone) {
		this.boardSrvfileone = boardSrvfileone;
	}
	public String getBoardSrvfiletwo() {
		return boardSrvfiletwo;
	}
	public void setBoardSrvfiletwo(String boardSrvfiletwo) {
		this.boardSrvfiletwo = boardSrvfiletwo;
	}
	public String getBoardSrvfilethree() {
		return boardSrvfilethree;
	}
	public void setBoardSrvfilethree(String boardSrvfilethree) {
		this.boardSrvfilethree = boardSrvfilethree;
	}
	public int getBoardViewnum() {
		return boardViewnum;
	}
	public void setBoardViewnum(int boardViewnum) {
		this.boardViewnum = boardViewnum;
	}
	public int getBoardStatus() {
		return boardStatus;
	}
	public void setBoardStatus(int boardStatus) {
		this.boardStatus = boardStatus;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public int getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}
	public String getBoardDetailname() {
		return boardDetailname;
	}
	public void setBoardDetailname(String boardDetailname) {
		this.boardDetailname = boardDetailname;
	}
}
