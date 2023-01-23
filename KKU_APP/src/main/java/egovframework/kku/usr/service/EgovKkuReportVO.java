package egovframework.kku.usr.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuReportVO extends ComDefaultVO implements Serializable{

	private String reportIdx;
	private String reporterIdx;
	private String writerIdx;
	private String content;
	private String reportTblCode;
	private String reportBoardIdx;
	private String reportUsrFile;
	private String reportSrvFile;
	private String reportDate;
	private String reportCategory;
	private int reportState;
	private String reportProcessdate;
	private String reportProcessperson;
	private String reportProcesscomment;
	private String reportPageurl;
	
	public String getReportPageurl() {
		return reportPageurl;
	}

	public void setReportPageurl(String reportPageurl) {
		this.reportPageurl = reportPageurl;
	}

	/*자유게시판 신고용 */
	private String boardWriter;
	private String boardName;
	
	
	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getReporterIdx() {
		return reporterIdx;
	}

	public void setReporterIdx(String reporterIdx) {
		this.reporterIdx = reporterIdx;
	}

	public String getWriterIdx() {
		return writerIdx;
	}

	public void setWriterIdx(String writerIdx) {
		this.writerIdx = writerIdx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReportTblCode() {
		return reportTblCode;
	}

	public void setReportTblCode(String reportTblCode) {
		this.reportTblCode = reportTblCode;
	}

	public String getReportBoardIdx() {
		return reportBoardIdx;
	}

	public void setReportBoardIdx(String reportBoardIdx) {
		this.reportBoardIdx = reportBoardIdx;
	}

	public String getReportUsrFile() {
		return reportUsrFile;
	}

	public void setReportUsrFile(String reportUsrFile) {
		this.reportUsrFile = reportUsrFile;
	}

	public String getReportSrvFile() {
		return reportSrvFile;
	}

	public void setReportSrvFile(String reportSrvFile) {
		this.reportSrvFile = reportSrvFile;
	}

	public String getReportIdx() {
		return reportIdx;
	}

	public void setReportIdx(String reportIdx) {
		this.reportIdx = reportIdx;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportCategory() {
		return reportCategory;
	}

	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}

	public int getReportState() {
		return reportState;
	}

	public void setReportState(int reportState) {
		this.reportState = reportState;
	}

	public String getReportProcessdate() {
		return reportProcessdate;
	}

	public void setReportProcessdate(String reportProcessdate) {
		this.reportProcessdate = reportProcessdate;
	}

	public String getReportProcessperson() {
		return reportProcessperson;
	}

	public void setReportProcessperson(String reportProcessperson) {
		this.reportProcessperson = reportProcessperson;
	}

	public String getReportProcesscomment() {
		return reportProcesscomment;
	}

	public void setReportProcesscomment(String reportProcesscomment) {
		this.reportProcesscomment = reportProcesscomment;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	@Override
	public String toString() {
		return "EgovKkuReportVO [reportIdx=" + reportIdx + ", reporterIdx=" + reporterIdx + ", writerIdx=" + writerIdx
				+ ", content=" + content + ", reportTblCode=" + reportTblCode + ", reportBoardIdx=" + reportBoardIdx
				+ ", reportUsrFile=" + reportUsrFile + ", reportSrvFile=" + reportSrvFile + ", reportDate=" + reportDate
				+ ", reportCategory=" + reportCategory + ", reportState=" + reportState + ", reportProcessdate="
				+ reportProcessdate + ", reportProcessperson=" + reportProcessperson + ", reportProcesscomment="
				+ reportProcesscomment + ", reportPageurl=" + reportPageurl + ", boardWriter=" + boardWriter
				+ ", boardName=" + boardName + "]";
	}




	
	
}
