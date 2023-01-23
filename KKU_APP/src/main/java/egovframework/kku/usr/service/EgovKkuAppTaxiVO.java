package egovframework.kku.usr.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppTaxiVO extends ComDefaultVO implements Serializable{

	public int taxiIdx;
	public int taxiWriteridx;
	public String taxiWriter;
	public String taxiWritergender;
	public String taxiDepartureplace;
	public String taxiArrivalplace;
	public String taxiDeparturetime;
	public String taxiMembers;
	public String taxiGender;
	public String taxiWritedate;
	public int taxiViewnum;
	public String taxiApplied;
	public String taxiRequest;
	public int taxiState;
	
	
	
	public String usrIdx;
	public String usrNickname;
	
	
	
	
	public String getTaxiRequest() {
		return taxiRequest;
	}
	public void setTaxiRequest(String taxiRequest) {
		this.taxiRequest = taxiRequest;
	}
	public String getUsrNickname() {
		return usrNickname;
	}
	public void setUsrNickname(String usrNickname) {
		this.usrNickname = usrNickname;
	}
	public String getUsrIdx() {
		return usrIdx;
	}
	public void setUsrIdx(String usrIdx) {
		this.usrIdx = usrIdx;
	}
	public int getTaxiState() {
		return taxiState;
	}
	public void setTaxiState(int taxiState) {
		this.taxiState = taxiState;
	}
	public String getTaxiWritergender() {
		return taxiWritergender;
	}
	public void setTaxiWritergender(String taxiWritergender) {
		this.taxiWritergender = taxiWritergender;
	}
	public String getTaxiApplied() {
		return taxiApplied;
	}
	public void setTaxiApplied(String taxiApplied) {
		this.taxiApplied = taxiApplied;
	}
	public int getTaxiViewnum() {
		return taxiViewnum;
	}
	public void setTaxiViewnum(int taxiViewnum) {
		this.taxiViewnum = taxiViewnum;
	}
	public String getTaxiDeparturetime() {
		return taxiDeparturetime;
	}
	public void setTaxiDeparturetime(String taxiDeparturetime) {
		this.taxiDeparturetime = taxiDeparturetime;
	}
	public int getTaxiIdx() {
		return taxiIdx;
	}
	public void setTaxiIdx(int taxiIdx) {
		this.taxiIdx = taxiIdx;
	}
	public String getTaxiWriter() {
		return taxiWriter;
	}
	public void setTaxiWriter(String taxiWriter) {
		this.taxiWriter = taxiWriter;
	}
	public int getTaxiWriteridx() {
		return taxiWriteridx;
	}
	public void setTaxiWriteridx(int taxiWriteridx) {
		this.taxiWriteridx = taxiWriteridx;
	}
	public String getTaxiDepartureplace() {
		return taxiDepartureplace;
	}
	public void setTaxiDepartureplace(String taxiDepartureplace) {
		this.taxiDepartureplace = taxiDepartureplace;
	}
	public String getTaxiArrivalplace() {
		return taxiArrivalplace;
	}
	public void setTaxiArrivalplace(String taxiArrivalplace) {
		this.taxiArrivalplace = taxiArrivalplace;
	}
	public String getTaxiMembers() {
		return taxiMembers;
	}
	public void setTaxiMembers(String taxiMembers) {
		this.taxiMembers = taxiMembers;
	}
	public String getTaxiGender() {
		return taxiGender;
	}
	public void setTaxiGender(String taxiGender) {
		this.taxiGender = taxiGender;
	}
	public String getTaxiWritedate() {
		return taxiWritedate;
	}
	public void setTaxiWritedate(String taxiWritedate) {
		this.taxiWritedate = taxiWritedate;
	}
	
	
}
