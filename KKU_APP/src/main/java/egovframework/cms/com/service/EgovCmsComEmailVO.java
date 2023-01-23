package egovframework.cms.com.service;

import java.io.Serializable;


public class EgovCmsComEmailVO implements Serializable {
	private static final long serialVersionUID = 838348196849391854L;

	private String recipientName = "";	// 수신자 이름
	private String recipientEmail = "";	// 수신자 이메일
	
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getRecipientEmail() {
		return recipientEmail;
	}
	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
