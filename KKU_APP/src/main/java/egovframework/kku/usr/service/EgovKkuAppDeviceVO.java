package egovframework.kku.usr.service;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppDeviceVO extends ComDefaultVO{

		private String deviceIdx = "";
		private String deviceId = "";
		private String registrationId = "";
		private String os = "";
		private String pushYn = "";
		private String appVersion = "";
		private String phoneNumber = "";
		
		//2020-10-20 추가
		private String noticeYn  = "";
		private String boardYn   = "";
		private String messageYn = "";
		private String commentYn = "";
		private String supportYn = "";

		
		
		public String getNoticeYn() {
			return noticeYn;
		}
		public void setNoticeYn(String noticeYn) {
			this.noticeYn = noticeYn;
		}
		public String getBoardYn() {
			return boardYn;
		}
		public void setBoardYn(String boardYn) {
			this.boardYn = boardYn;
		}
		public String getMessageYn() {
			return messageYn;
		}
		public void setMessageYn(String messageYn) {
			this.messageYn = messageYn;
		}
		public String getCommentYn() {
			return commentYn;
		}
		public void setCommentYn(String commentYn) {
			this.commentYn = commentYn;
		}
		public String getDeviceIdx() {
			return deviceIdx;
		}
		public void setDeviceIdx(String deviceIdx) {
			this.deviceIdx = deviceIdx;
		}
		public String getDeviceId() {
			return deviceId;
		}
		public void setDeviceId(String deviceId) {
			this.deviceId = deviceId;
		}
		public String getRegistrationId() {
			return registrationId;
		}
		public void setRegistrationId(String registrationId) {
			this.registrationId = registrationId;
		}
		public String getOs() {
			return os;
		}
		public void setOs(String os) {
			this.os = os;
		}
		public String getPushYn() {
			return pushYn;
		}
		public void setPushYn(String pushYn) {
			this.pushYn = pushYn;
		}
		public String getAppVersion() {
			return appVersion;
		}
		public void setAppVersion(String appVersion) {
			this.appVersion = appVersion;
		}
		public String getSupportYn() {
			return supportYn;
		}
		public void setSupportYn(String supportYn) {
			this.supportYn = supportYn;
		}
		
		public String getPhoneNumber() {
			return phoneNumber;
		}
		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}
		@Override
		public String toString() {
			return "EgovKpcAppDeviceVO [deviceIdx=" + deviceIdx + ", deviceId=" + deviceId + ", registrationId="
					+ registrationId + ", os=" + os + ", pushYn=" + pushYn + ", appVersion=" + appVersion + ", phoneNumber="
					+ phoneNumber + ", noticeYn=" + noticeYn + ", boardYn=" + boardYn + ", messageYn=" + messageYn
					+ ", commentYn=" + commentYn + ", supportYn=" + supportYn + "]";
		}
		
		
	

}
