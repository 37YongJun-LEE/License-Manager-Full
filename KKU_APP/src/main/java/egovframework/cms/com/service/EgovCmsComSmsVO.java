package egovframework.cms.com.service;

import java.io.Serializable;


public class EgovCmsComSmsVO implements Serializable {
	private static final long serialVersionUID = 838348196849391854L;

	private String receiveName = "";					//수신자명
	private String cdVal1 = "";							//SMS 코드1
	private String cdVal2 = "";							//SMS 코드2
	private String regIp = "";							//등록시 IP
	private String receiveId = "";						//수신자 아이디
	private String receiveHp = "";						//수신자 휴대전화번호

	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
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
	public String getRegIp() {
		return regIp;
	}
	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getReceiveHp() {
		return receiveHp;
	}
	public void setReceiveHp(String receiveHp) {
		this.receiveHp = receiveHp;
	}
}
