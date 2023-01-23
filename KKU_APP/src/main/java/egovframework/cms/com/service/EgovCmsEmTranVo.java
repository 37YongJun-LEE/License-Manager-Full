package egovframework.cms.com.service;

import java.io.Serializable;

public class EgovCmsEmTranVo implements Serializable {
	private static final long serialVersionUID = -2112909982070772664L;
	
	private String tranId = "";			//전송자ID(기본: 시스템)
	private String tranPhone = "";		//수신자번호
	private String tranCallback = "";	//발신자번호
	private String tranMsg = "";		//SMS 메시지
	private String tranType = "";
	private String tranEtc1 = "";		//전송자IP
	private String tranEtc4 = "";		

	public String getTranId() {
		return tranId;
	}
	public void setTranId(String tranId) {
		this.tranId = tranId;
	}
	public String getTranPhone() {
		return tranPhone;
	}
	public void setTranPhone(String tranPhone) {
		this.tranPhone = tranPhone;
	}
	public String getTranCallback() {
		return tranCallback;
	}
	public void setTranCallback(String tranCallback) {
		this.tranCallback = tranCallback;
	}
	public String getTranMsg() {
		return tranMsg;
	}
	public void setTranMsg(String tranMsg) {
		this.tranMsg = tranMsg;
	}
	public String getTranEtc1() {
		return tranEtc1;
	}
	public void setTranEtc1(String tranEtc1) {
		this.tranEtc1 = tranEtc1;
	}
	public String getTranType() {
		return tranType;
	}
	public void setTranType(String tranType) {
		this.tranType = tranType;
	}
	public String getTranEtc4() {
		return tranEtc4;
	}
	public void setTranEtc4(String tranEtc4) {
		this.tranEtc4 = tranEtc4;
	}
}