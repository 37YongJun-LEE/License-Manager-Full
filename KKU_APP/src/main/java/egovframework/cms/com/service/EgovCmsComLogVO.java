package egovframework.cms.com.service;

import java.io.Serializable;

@SuppressWarnings("serial")
public class EgovCmsComLogVO implements Serializable{
	
	private String logIdx	=	"";
	private String menuCd	=	"";
	private String menuName	=	"";
	private String menuUrl	=	"";
	private String logCont	=	"";
	private String menuIdx	=	"";
	private String regIdx		=	"";
	private String regName		=	"";
	private String regIp		=	"";
	private String regDate		=	"";

	public String getLogIdx() {
		return logIdx;
	}
	public void setLogIdx(String logIdx) {
		this.logIdx = logIdx;
	}
	public String getMenuCd() {
		return menuCd;
	}
	public void setMenuCd(String menuCd) {
		this.menuCd = menuCd;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getLogCont() {
		return logCont;
	}
	public void setLogCont(String logCont) {
		this.logCont = logCont;
	}
	public String getMenuIdx() {
		return menuIdx;
	}
	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
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

}
