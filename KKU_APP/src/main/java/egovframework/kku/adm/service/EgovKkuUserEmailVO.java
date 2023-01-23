package egovframework.kku.adm.service;

import java.io.Serializable;

import egovframework.com.cmm.service.EgovProperties;

public class EgovKkuUserEmailVO implements Serializable{
	
	private String hostName = EgovProperties.getProperty("Globals.SMTP.host");
	private String portNumber = EgovProperties.getProperty("Globals.SMTP.port");
	private String userId = EgovProperties.getProperty("Globals.SMTP.userId");
	private String userPass = EgovProperties.getProperty("Globals.SMTP.userPass");
	private String characterSet = EgovProperties.getProperty("Globals.SMTP.chatacterSet");
	
	
	private String mailTitle; //메일제목
	private String mailContent; //메일내용
	private String receiverAddress; //메일 받는 사람 주소 
	private String elogContent; //인증번호
	private String elogType; //가입시 인증 = SIGNUP, 비밀번호 재설정 = RESET
	
	public String getHostName() {
		return hostName;
	}


	public void setHostName(String hostName) {
		this.hostName = hostName;
	}


	public String getPortNumber() {
		return portNumber;
	}


	public void setPortNumber(String portNumber) {
		this.portNumber = portNumber;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPass() {
		return userPass;
	}


	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}


	public String getCharacterSet() {
		return characterSet;
	}


	public void setCharacterSet(String characterSet) {
		this.characterSet = characterSet;
	}


	public String getMailTitle() {
		return mailTitle;
	}


	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}


	public String getMailContent() {
		return mailContent;
	}


	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}


	public String getReceiverAddress() {
		return receiverAddress;
	}


	public String getElogContent() {
		return elogContent;
	}


	public void setElogContent(String elogContent) {
		this.elogContent = elogContent;
	}


	public String getElogType() {
		return elogType;
	}


	public void setElogType(String elogType) {
		this.elogType = elogType;
	}


	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}


	@Override
	public String toString() {
		return "EgovKkuUserEmailVO [hostName=" + hostName + ", portNumber=" + portNumber + ", userId=" + userId
				+ ", userPass=" + userPass + ", characterSet=" + characterSet + ", mailTitle=" + mailTitle
				+ ", mailContent=" + mailContent + ", receiverAddress=" + receiverAddress + "]";
	}
	
}
