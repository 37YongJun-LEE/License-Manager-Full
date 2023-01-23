package egovframework.kku.usr.service;

import java.io.Serializable;

public class EgovKkuAppLoginSessionVO  implements Serializable {
	private String usrIdx 	  = "";  // 유저 고유번호
	private String usrEmail 	  = "";	 // 유저 아이디
	private String usrNickname      = "";  // 유저 이름
	/*private String cmntIdx    = "";  */
	private int alarmNum; // 알람개수
	private int chatNum; // 안읽은 채팅 개수
	private String fullUrl    = "";
	private String deviceId = "";
	
	
	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getUsrIdx() {
		return usrIdx;
	}

	public void setUsrIdx(String usrIdx) {
		this.usrIdx = usrIdx;
	}

	public String getUsrEmail() {
		return usrEmail;
	}

	public void setUsrEmail(String usrEmail) {
		this.usrEmail = usrEmail;
	}

	public String getUsrNickname() {
		return usrNickname;
	}

	public void setUsrNickname(String usrNickname) {
		this.usrNickname = usrNickname;
	}

	public String getFullUrl() {
		return fullUrl;
	}

	public void setFullUrl(String fullUrl) {
		this.fullUrl = fullUrl;
	}

	public int getAlarmNum() {
		return alarmNum;
	}

	public void setAlarmNum(int alarmNum) {
		this.alarmNum = alarmNum;
	}
	
	public int getChatNum() {
		return chatNum;
	}

	public void setChatNum(int chatNum) {
		this.chatNum = chatNum;
	}

	@Override
	public String toString() {
		return "EgovKkuAppLoginSessionVO [usrIdx=" + usrIdx + ", usrEmail=" + usrEmail + ", usrNickname=" + usrNickname
				+ ", alarmNum=" + alarmNum + ", chatNum=" + chatNum + ", fullUrl=" + fullUrl + "]";
	}

	
	
}
