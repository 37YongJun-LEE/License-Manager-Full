package egovframework.kku.usr.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppLicenseVO extends ComDefaultVO implements Serializable {

	
	/* API에 맞춰서 추가 */
	private int idx;
	private String usrIdx;
	private String usrId;
	
	//subject
	private String qualCd;
	private String qualName;
	private String seriesCd;
	private String seriesName;
	private String subjectCd;
	private String subjectName;
	private String jobfieldCd;
	private String jobfieldName;
	private String mjobfieldCd;
	private String mjobfieldName;
	
	//date
	private String testYear;
	private String testSeq;
	private String quadCd;
	private String quadname;
	private String description;
	private String wtestAplcStartdt;
	private String wtestAplcEnddt;
	private String wtestStartdt;
	private String wtestEnddt;
	private String wtestPassdt;
	private String ptestAplcStartdt;
	private String ptestAplcEnddt;
	private String ptestStartdt;
	private String ptestEnddt;
	private String ptestPassdt;
	
	//interest
	private String interestCd;
//	private String subjectName;
	private String recRegdt;
	private String recSubjectCdOne;
	private String recSubjectCdTwo;
	private String recSubjectNameOne;
	private String recSubjectNameTwo;
	private String recModdt;
	private String resultCd;
	private String resultMsg;
	private String pageResultNum;
	private String pageNum;
	private String totalNum;
	
	//question
	private String quesIdx;
	private String quesTitle;
	private String quesContents;

	private String quesRegdt;
	private String quesModdt;
//	private String qualCd;
//	private String qualName;
//	private String seriesCd;
//	private String seriesName;
//	private String subjectCd;
//	private String subjectName;
	private String quesFileName;
	private String quesFileOrder;
	private String quesFileUrl;
	
	//board
	private int boardIdx;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private String boardWritedate;
	private int boardViewnum;
	private String delYn;
	
	//댓글 중 다른게시판과 구분하기 위한 변수
	private String boardCode;
	
	private int isLimit;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getUsrIdx() {
		return usrIdx;
	}
	public void setUsrIdx(String usrIdx) {
		this.usrIdx = usrIdx;
	}
	public String getQualCd() {
		return qualCd;
	}
	public void setQualCd(String qualCd) {
		this.qualCd = qualCd;
	}
	public String getQualName() {
		return qualName;
	}
	public void setQualName(String qualName) {
		this.qualName = qualName;
	}
	public String getSeriesCd() {
		return seriesCd;
	}
	public void setSeriesCd(String seriesCd) {
		this.seriesCd = seriesCd;
	}
	public String getSeriesName() {
		return seriesName;
	}
	public void setSeriesName(String seriesName) {
		this.seriesName = seriesName;
	}
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
	public String getJobfieldCd() {
		return jobfieldCd;
	}
	public void setJobfieldCd(String jobfieldCd) {
		this.jobfieldCd = jobfieldCd;
	}
	public String getJobfieldName() {
		return jobfieldName;
	}
	public void setJobfieldName(String jobfieldName) {
		this.jobfieldName = jobfieldName;
	}
	public String getMjobfieldCd() {
		return mjobfieldCd;
	}
	public void setMjobfieldCd(String mjobfieldCd) {
		this.mjobfieldCd = mjobfieldCd;
	}
	public String getMjobfieldName() {
		return mjobfieldName;
	}
	public void setMjobfieldName(String mjobfieldName) {
		this.mjobfieldName = mjobfieldName;
	}
	public String getTestYear() {
		return testYear;
	}
	public void setTestYear(String testYear) {
		this.testYear = testYear;
	}
	public String getTestSeq() {
		return testSeq;
	}
	public void setTestSeq(String testSeq) {
		this.testSeq = testSeq;
	}
	public String getQuadCd() {
		return quadCd;
	}
	public void setQuadCd(String quadCd) {
		this.quadCd = quadCd;
	}
	public String getQuadname() {
		return quadname;
	}
	public void setQuadname(String quadname) {
		this.quadname = quadname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getWtestAplcStartdt() {
		return wtestAplcStartdt;
	}
	public void setWtestAplcStartdt(String wtestAplcStartdt) {
		this.wtestAplcStartdt = wtestAplcStartdt;
	}
	public String getWtestAplcEnddt() {
		return wtestAplcEnddt;
	}
	public void setWtestAplcEnddt(String wtestAplcEnddt) {
		this.wtestAplcEnddt = wtestAplcEnddt;
	}
	public String getWtestStartdt() {
		return wtestStartdt;
	}
	public void setWtestStartdt(String wtestStartdt) {
		this.wtestStartdt = wtestStartdt;
	}
	public String getWtestEnddt() {
		return wtestEnddt;
	}
	public void setWtestEnddt(String wtestEnddt) {
		this.wtestEnddt = wtestEnddt;
	}
	public String getWtestPassdt() {
		return wtestPassdt;
	}
	public void setWtestPassdt(String wtestPassdt) {
		this.wtestPassdt = wtestPassdt;
	}
	public String getPtestAplcStartdt() {
		return ptestAplcStartdt;
	}
	public void setPtestAplcStartdt(String ptestAplcStartdt) {
		this.ptestAplcStartdt = ptestAplcStartdt;
	}
	public String getPtestAplcEnddt() {
		return ptestAplcEnddt;
	}
	public void setPtestAplcEnddt(String ptestAplcEnddt) {
		this.ptestAplcEnddt = ptestAplcEnddt;
	}
	public String getPtestStartdt() {
		return ptestStartdt;
	}
	public void setPtestStartdt(String ptestStartdt) {
		this.ptestStartdt = ptestStartdt;
	}
	public String getPtestEnddt() {
		return ptestEnddt;
	}
	public void setPtestEnddt(String ptestEnddt) {
		this.ptestEnddt = ptestEnddt;
	}
	public String getPtestPassdt() {
		return ptestPassdt;
	}
	public void setPtestPassdt(String ptestPassdt) {
		this.ptestPassdt = ptestPassdt;
	}
	public String getInterestCd() {
		return interestCd;
	}
	public void setInterestCd(String interestCd) {
		this.interestCd = interestCd;
	}
	public String getRecRegdt() {
		return recRegdt;
	}
	public void setRecRegdt(String recRegdt) {
		this.recRegdt = recRegdt;
	}
	public String getRecSubjectCdOne() {
		return recSubjectCdOne;
	}
	public void setRecSubjectCdOne(String recSubjectCdOne) {
		this.recSubjectCdOne = recSubjectCdOne;
	}
	public String getRecSubjectCdTwo() {
		return recSubjectCdTwo;
	}
	public void setRecSubjectCdTwo(String recSubjectCdTwo) {
		this.recSubjectCdTwo = recSubjectCdTwo;
	}
	public String getRecSubjectNameOne() {
		return recSubjectNameOne;
	}
	public void setRecSubjectNameOne(String recSubjectNameOne) {
		this.recSubjectNameOne = recSubjectNameOne;
	}
	public String getRecSubjectNameTwo() {
		return recSubjectNameTwo;
	}
	public void setRecSubjectNameTwo(String recSubjectNameTwo) {
		this.recSubjectNameTwo = recSubjectNameTwo;
	}
	public String getRecModdt() {
		return recModdt;
	}
	public void setRecModdt(String recModdt) {
		this.recModdt = recModdt;
	}
	public String getResultCd() {
		return resultCd;
	}
	public void setResultCd(String resultCd) {
		this.resultCd = resultCd;
	}
	public String getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}
	public String getPageResultNum() {
		return pageResultNum;
	}
	public void setPageResultNum(String pageResultNum) {
		this.pageResultNum = pageResultNum;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public String getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(String totalNum) {
		this.totalNum = totalNum;
	}
	public String getQuesIdx() {
		return quesIdx;
	}
	public void setQuesIdx(String quesIdx) {
		this.quesIdx = quesIdx;
	}
	public String getQuesTitle() {
		return quesTitle;
	}
	public void setQuesTitle(String quesTitle) {
		this.quesTitle = quesTitle;
	}
	public String getQuesContents() {
		return quesContents;
	}
	public void setQuesContents( String quesContents) {
		this.quesContents = quesContents;
	}
	public String getQuesRegdt() {
		return quesRegdt;
	}
	public void setQuesRegdt(String quesRegdt) {
		this.quesRegdt = quesRegdt;
	}
	public String getQuesModdt() {
		return quesModdt;
	}
	public void setQuesModdt(String quesModdt) {
		this.quesModdt = quesModdt;
	}
	public String getQuesFileName() {
		return quesFileName;
	}
	public void setQuesFileName(String quesFileName) {
		this.quesFileName = quesFileName;
	}
	public String getQuesFileOrder() {
		return quesFileOrder;
	}
	public void setQuesFileOrder(String quesFileOrder) {
		this.quesFileOrder = quesFileOrder;
	}
	public  String getQuesFileUrl() {
		return quesFileUrl;
	}
	public void setQuesFileUrl( String quesFileUrl) {
		this.quesFileUrl = quesFileUrl;
	}
	
	@Override
	public String toString() {
		return "EgovKkuAppLicenseVO [idx=" + idx + ", usrIdx=" + usrIdx + ", usrId=" + usrId + ", qualCd=" + qualCd
				+ ", qualName=" + qualName + ", seriesCd=" + seriesCd + ", seriesName=" + seriesName + ", subjectCd="
				+ subjectCd + ", subjectName=" + subjectName + ", jobfieldCd=" + jobfieldCd + ", jobfieldName="
				+ jobfieldName + ", mjobfieldCd=" + mjobfieldCd + ", mjobfieldName=" + mjobfieldName + ", testYear="
				+ testYear + ", testSeq=" + testSeq + ", quadCd=" + quadCd + ", quadname=" + quadname + ", description="
				+ description + ", wtestAplcStartdt=" + wtestAplcStartdt + ", wtestAplcEnddt=" + wtestAplcEnddt
				+ ", wtestStartdt=" + wtestStartdt + ", wtestEnddt=" + wtestEnddt + ", wtestPassdt=" + wtestPassdt
				+ ", ptestAplcStartdt=" + ptestAplcStartdt + ", ptestAplcEnddt=" + ptestAplcEnddt + ", ptestStartdt="
				+ ptestStartdt + ", ptestEnddt=" + ptestEnddt + ", ptestPassdt=" + ptestPassdt + ", interestCd="
				+ interestCd + ", recRegdt=" + recRegdt + ", recSubjectCdOne=" + recSubjectCdOne + ", recSubjectCdTwo="
				+ recSubjectCdTwo + ", recSubjectNameOne=" + recSubjectNameOne + ", recSubjectNameTwo="
				+ recSubjectNameTwo + ", recModdt=" + recModdt + ", resultCd=" + resultCd + ", resultMsg=" + resultMsg
				+ ", pageResultNum=" + pageResultNum + ", pageNum=" + pageNum + ", totalNum=" + totalNum + ", quesIdx="
				+ quesIdx + ", quesTitle=" + quesTitle + ", quesContents=" + quesContents + ", quesRegdt=" + quesRegdt
				+ ", quesModdt=" + quesModdt + ", quesFileName=" + quesFileName + ", quesFileOrder=" + quesFileOrder
				+ ", quesFileUrl=" + quesFileUrl + ", boardIdx=" + boardIdx + ", boardWriter=" + boardWriter
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardWritedate=" + boardWritedate
				+ ", boardViewnum=" + boardViewnum + ", delYn=" + delYn + ", boardCode=" + boardCode + ", isLimit="
				+ isLimit + "]";
	}
	public int getIsLimit() {
		return isLimit;
	}
	public void setIsLimit(int isLimit) {
		this.isLimit = isLimit;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
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
	public int getBoardViewnum() {
		return boardViewnum;
	}
	public void setBoardViewnum(int boardViewnum) {
		this.boardViewnum = boardViewnum;
	}
	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	
}