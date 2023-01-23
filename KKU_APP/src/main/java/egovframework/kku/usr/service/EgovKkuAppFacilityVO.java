package egovframework.kku.usr.service;

import java.util.Date;

public class EgovKkuAppFacilityVO {
	private int reportIdx;
	private String reportContent;
	private String reporterPnum;
	private String reporterId;
	private int processState = 0;
	private Date reportDate;
	private String fixComment;
	private int readYn = 0;
	private String modDate;
	private String commentWriter;
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	@Override
	public String toString() {
		return "EgovKkuAppFacilityVO [reportIdx=" + reportIdx + ", reportContent=" + reportContent + ", reporterPnum="
				+ reporterPnum + ", reporterId=" + reporterId + ", processState=" + processState + ", reportDate="
				+ reportDate + ", fixComment=" + fixComment + ", readYn=" + readYn + ", modDate=" + modDate + "]";
	}
	public int getReportIdx() {
		return reportIdx;
	}
	public void setReportIdx(int reportIdx) {
		this.reportIdx = reportIdx;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReporterPnum() {
		return reporterPnum;
	}
	public void setReporterPnum(String reporterPnum) {
		this.reporterPnum = reporterPnum;
	}
	public String getReporterId() {
		return reporterId;
	}
	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}

	public int getReadYn() {
		return readYn;
	}
	public void setReadYn(int readYn) {
		this.readYn = readYn;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	public int getProcessState() {
		return processState;
	}
	public void setProcessState(int processState) {
		this.processState = processState;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public String getFixComment() {
		return fixComment;
	}
	public void setFixComment(String fixComment) {
		this.fixComment = fixComment;
	}

}
