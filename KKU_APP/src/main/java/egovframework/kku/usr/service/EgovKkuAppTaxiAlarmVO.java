package egovframework.kku.usr.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppTaxiAlarmVO extends ComDefaultVO implements Serializable {

	private String alarmIdx;
	private String usrIdx;
	private String startplace;
	private String startTime;
	private String endTime;

	private String arrive;
	private String radio;

	
	
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getStartplace() {
		return startplace;
	}

	public void setStartplace(String startplace) {
		this.startplace = startplace;
	}

	public String getAlarmIdx() {
		return alarmIdx;
	}

	public void setAlarmIdx(String alarmIdx) {
		this.alarmIdx = alarmIdx;
	}

	public String getUsrIdx() {
		return usrIdx;
	}

	public void setUsrIdx(String usrIdx) {
		this.usrIdx = usrIdx;
	}

	public String getArrive() {
		return arrive;
	}

	public void setArrive(String arrive) {
		this.arrive = arrive;
	}

	public String getRadio() {
		return radio;
	}

	public void setRadio(String radio) {
		this.radio = radio;
	}

	@Override
	public String toString() {
		return "EgovKkuAppTaxiAlarmVO [alarmIdx=" + alarmIdx + ", usrIdx=" + usrIdx + ", startplace=" + startplace
				+ ", arrive=" + arrive + ", radio=" + radio+ ", startTime=" + startTime + ", endTime =" + endTime + "]";
	}

}
