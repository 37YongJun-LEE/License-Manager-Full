package egovframework.kku.usr.service;

import java.util.Date;

public class EgovKkuAppAlarmVO {
	public int alarmIdx;
	public String alarmReceiverid;
	public Date alarmTime;
	public String boardDetailname;
	public int boardIdx;
	public int readYn = 0;
	public String requestedId;
	public int alarmType;
	
	public int getAlarmType() {
		return alarmType;
	}
	public void setAlarmType(int alarmType) {
		this.alarmType = alarmType;
	}
	public int getAlarmIdx() {
		return alarmIdx;
	}
	public void setAlarmIdx(int alarmIdx) {
		this.alarmIdx = alarmIdx;
	}
	public String getAlarmReceiverid() {
		return alarmReceiverid;
	}
	public void setAlarmReceiverid(String alarmReceiverid) {
		this.alarmReceiverid = alarmReceiverid;
	}
	public Date getAlarmTime() {
		return alarmTime;
	}
	public void setAlarmTime(Date alarmTime) {
		this.alarmTime = alarmTime;
	}
	public String getBoardDetailname() {
		return boardDetailname;
	}
	public void setBoardDetailname(String boardDetailname) {
		this.boardDetailname = boardDetailname;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public int getReadYn() {
		return readYn;
	}
	public void setReadYn(int readYn) {
		this.readYn = readYn;
	}
	public String getRequestedId() {
		return requestedId;
	}
	public void setRequestedId(String requestedId) {
		this.requestedId = requestedId;
	}
	@Override
	public String toString() {
		return "EgovKkuAppCommunityAlarmVO [alarmIdx=" + alarmIdx + ", alarmReceiverid=" + alarmReceiverid
				+ ", alarmTime=" + alarmTime + ", boardDetailname=" + boardDetailname + ", boardIdx=" + boardIdx
				+ ", readYn=" + readYn + ", requestedId=" + requestedId + "]";
	}

}
