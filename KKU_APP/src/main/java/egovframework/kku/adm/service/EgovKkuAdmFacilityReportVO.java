package egovframework.kku.adm.service;

import java.io.Serializable;

import egovframework.cms.com.service.EgovCmsComConfigVO;
import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAdmFacilityReportVO extends ComDefaultVO implements Serializable{
	private String reportIdx = "";
	private String reportContent = "";
	private String reporterPnum = "";
	private String reporterId = "";
	private String processState = "";
	private String reportDate = "";
	private String fixComment = "";
	private String readYn = "";
	private String modDate = "";
	private String commentWriter = "";
	public String getReportIdx() {
		return reportIdx;
	}
	public void setReportIdx(String reportIdx) {
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
	public String getProcessState() {
		return processState;
	}
	public void setProcessState(String processState) {
		this.processState = processState;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public String getFixComment() {
		return fixComment;
	}
	public void setFixComment(String fixComment) {
		this.fixComment = fixComment;
	}
	public String getReadYn() {
		return readYn;
	}
	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	@Override
	public String toString() {
		return "EgovKkuAdmFacilityReportVO [reportIdx=" + reportIdx + ", reportContent=" + reportContent
				+ ", reporterPnum=" + reporterPnum + ", reporterId=" + reporterId + ", processState=" + processState
				+ ", reportDate=" + reportDate + ", fixComment=" + fixComment + ", readYn=" + readYn + ", modDate="
				+ modDate + ", commentWriter=" + commentWriter + "]";
	}
	
	
	
}
