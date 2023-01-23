package egovframework.cms.com.service;

import java.io.Serializable;

@SuppressWarnings("serial")
public class EgovCmsComCodeVO implements Serializable{
	
	private String cdVal1	=	"";
	private String cdVal2	=	"";
	private String cdName1	=	"";
	private String cdName2	=	"";
	private String cdSort	=	"";
	private String useYn	=	"";
	private String regIdx		=	"";
	private String regName		=	"";
	private String regIp		=	"";
	private String regDate		=	"";
	private String modIdx		=	"";
	private String modName		=	"";
	private String modIp		=	"";
	private String modDate		=	"";
	
	//MEM_CODE
	private String cdName1En		=	"";
	private String cdName2En		=	"";
	

	//이메일 발송 필수항목
	private String receiveEmail = "";				//수신자이메일
	private String receiveName = "";				//수신자명
	private String receiveId = "";					//수신자아이디

	public String getCdVal1() {
		return cdVal1;
	}
	public void setCdVal1(String cdVal1) {
		this.cdVal1 = cdVal1;
	}
	public String getCdVal2() {
		return cdVal2;
	}
	public void setCdVal2(String cdVal2) {
		this.cdVal2 = cdVal2;
	}
	public String getCdName1() {
		return cdName1;
	}
	public void setCdName1(String cdName1) {
		this.cdName1 = cdName1;
	}
	public String getCdName2() {
		return cdName2;
	}
	public void setCdName2(String cdName2) {
		this.cdName2 = cdName2;
	}
	public String getCdSort() {
		return cdSort;
	}
	public void setCdSort(String cdSort) {
		this.cdSort = cdSort;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getRegIdx() {
		return regIdx;
	}
	public void setRegIdx(String regIdx) {
		this.regIdx = regIdx;
	}
	public String getRegName() {
		return regName;
	}
	public void setRegName(String regName) {
		this.regName = regName;
	}
	public String getRegIp() {
		return regIp;
	}
	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getModIdx() {
		return modIdx;
	}
	public void setModIdx(String modIdx) {
		this.modIdx = modIdx;
	}
	public String getModName() {
		return modName;
	}
	public void setModName(String modName) {
		this.modName = modName;
	}
	public String getModIp() {
		return modIp;
	}
	public void setModIp(String modIp) {
		this.modIp = modIp;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	public String getReceiveEmail() {
		return receiveEmail;
	}
	public void setReceiveEmail(String receiveEmail) {
		this.receiveEmail = receiveEmail;
	}
	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getCdName1En() {
		return cdName1En;
	}
	public void setCdName1En(String cdName1En) {
		this.cdName1En = cdName1En;
	}
	public String getCdName2En() {
		return cdName2En;
	}
	public void setCdName2En(String cdName2En) {
		this.cdName2En = cdName2En;
	}
	@Override
	public String toString() {
		return "EgovCmsComCodeVO [cdVal1=" + cdVal1 + ", cdVal2=" + cdVal2
				+ ", cdName1=" + cdName1 + ", cdName2=" + cdName2 + ", cdSort="
				+ cdSort + ", useYn=" + useYn + ", regIdx=" + regIdx
				+ ", regName=" + regName + ", regIp=" + regIp + ", regDate="
				+ regDate + ", modIdx=" + modIdx + ", modName=" + modName
				+ ", modIp=" + modIp + ", modDate=" + modDate + ", cdName1En="
				+ cdName1En + ", cdName2En=" + cdName2En + ", receiveEmail="
				+ receiveEmail + ", receiveName=" + receiveName
				+ ", receiveId=" + receiveId + "]";
	}
	
}
