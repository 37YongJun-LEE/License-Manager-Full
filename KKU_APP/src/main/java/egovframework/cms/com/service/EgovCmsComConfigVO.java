package egovframework.cms.com.service;

import java.io.Serializable;

@SuppressWarnings("serial")
public class EgovCmsComConfigVO implements Serializable{
	
	private String cfgCd		=	"";
	private String cfgVal		=	"";
	private String regIdx		=	"";
	private String regName		=	"";
	private String regIp		=	"";
	private String regDate		=	"";
	private String modIdx		=	"";
	private String modName		=	"";
	private String modIp		=	"";
	private String modDate		=	"";

	public String getCfgCd() {
		return cfgCd;
	}
	public void setCfgCd(String cfgCd) {
		this.cfgCd = cfgCd;
	}
	public String getCfgVal() {
		return cfgVal;
	}
	public void setCfgVal(String cfgVal) {
		this.cfgVal = cfgVal;
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

	@Override
	public String toString() {
		return "EgovCmsComCodeVO [cfgCd=" + cfgCd + ", cfgVal="
				+ cfgVal + ", regIdx=" + regIdx + ", "
				+ "regName=" + regName + ", regIp=" + regIp
				+ ", regDate=" + regDate + ", modIdx=" + modIdx + ", modName="
				+ modName + ", modIp=" + modIp + ", modDate=" + modDate + "]";
	}
}
