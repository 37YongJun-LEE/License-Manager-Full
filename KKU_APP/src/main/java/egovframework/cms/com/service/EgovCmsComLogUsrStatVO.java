package egovframework.cms.com.service;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class EgovCmsComLogUsrStatVO extends ComDefaultVO {

	private String ymd			=	"";
	private String logIdx		=	"";
	private String siteCd		=	"";
	private String deviceCd	=	"";
	private String logRefererCd	=	"";
	private String logReferer	=	"";
	private String logAgent	=	"";
	private String logOs			=	"";
	private String logBrowser	=	"";
	private int calcLogCount	=	0;
	private int uvCnt	=	0;
	private int pvCnt	=	0;
	
	public String getYmd() {
		return ymd;
	}
	public void setYmd(String ymd) {
		this.ymd = ymd;
	}
	public String getLogIdx() {
		return logIdx;
	}
	public void setLogIdx(String logIdx) {
		this.logIdx = logIdx;
	}
	public String getSiteCd() {
		return siteCd;
	}
	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}
	public String getDeviceCd() {
		return deviceCd;
	}
	public void setDeviceCd(String deviceCd) {
		this.deviceCd = deviceCd;
	}
	public String getLogRefererCd() {
		return logRefererCd;
	}
	public void setLogRefererCd(String logRefererCd) {
		this.logRefererCd = logRefererCd;
	}
	public String getLogReferer() {
		return logReferer;
	}
	public void setLogReferer(String logReferer) {
		this.logReferer = logReferer;
	}
	public String getLogAgent() {
		return logAgent;
	}
	public void setLogAgent(String logAgent) {
		this.logAgent = logAgent;
	}
	public String getLogOs() {
		return logOs;
	}
	public void setLogOs(String logOs) {
		this.logOs = logOs;
	}
	public String getLogBrowser() {
		return logBrowser;
	}
	public void setLogBrowser(String logBrowser) {
		this.logBrowser = logBrowser;
	}
	public int getCalcLogCount() {
		return calcLogCount;
	}
	public void setCalcLogCount(int calcLogCount) {
		this.calcLogCount = calcLogCount;
	}
	public int getUvCnt() {
		return uvCnt;
	}
	public void setUvCnt(int uvCnt) {
		this.uvCnt = uvCnt;
	}
	public int getPvCnt() {
		return pvCnt;
	}
	public void setPvCnt(int pvCnt) {
		this.pvCnt = pvCnt;
	}
	@Override
	public String toString() {
		return "EgovCmsComLogUsrStatVO [logIdx=" + logIdx + ", siteCd="
				+ siteCd + ", deviceCd=" + deviceCd + ", logRefererCd="
				+ logRefererCd + ", logReferer=" + logReferer + ", logAgent="
				+ logAgent + ", logOs=" + logOs + ", logBrowser=" + logBrowser
				+ ", calcLogCount=" + calcLogCount + "]";
	}
	
}
