package egovframework.kku.usr.service;

import java.util.Date;

public class EgovKkuAppReplyVO {
	public String boardDetailname;
	/*좋아요*/
	public int replyIdx;
	public String likeUsrid;
	public int boardCode;
	
	public int boardIdx;
	public String boardTitle;
	public String boardDetailName;
	public String boardName;
	public String boardWriter;
	public String replyContent;
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
	public Date replyWritedate;
	public String replyWriter;
	
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardDetailname() {
		return boardDetailname;
	}
	
	public int getBoardIdx() {
		return boardIdx;
	}
	public String getBoardName() {
		return boardName;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public int getReplyIdx() {
		return replyIdx;
	}
	public Date getReplyWritedate() {
		return replyWritedate;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setBoardDetailname(String boardDetailname) {
		this.boardDetailname = boardDetailname;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
	}
	public void setReplyWritedate(Date replyWritedate) {
		this.replyWritedate = replyWritedate;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getBoardDetailName() {
		return boardDetailName;
	}
	public void setBoardDetailName(String boardDetailName) {
		this.boardDetailName = boardDetailName;
	}
	public String getLikeUsrid() {
		return likeUsrid;
	}
	public void setLikeUsrid(String likeUsrid) {
		this.likeUsrid = likeUsrid;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	@Override
	public String toString() {
		return "EgovKkuAppReplyVO [boardDetailname=" + boardDetailname + ", replyIdx=" + replyIdx + ", likeUsrid="
				+ likeUsrid + ", boardCode=" + boardCode + ", boardIdx=" + boardIdx + ", boardTitle=" + boardTitle
				+ ", boardDetailName=" + boardDetailName + ", boardName=" + boardName + ", boardWriter=" + boardWriter
				+ ", replyContent=" + replyContent + ", replyWritedate=" + replyWritedate + ", replyWriter="
				+ replyWriter + "]";
	}
	
}
