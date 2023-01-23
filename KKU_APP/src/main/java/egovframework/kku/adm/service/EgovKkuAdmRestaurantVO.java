package egovframework.kku.adm.service;

import java.time.LocalDateTime;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAdmRestaurantVO extends ComDefaultVO{
	private String restIdx;
	private String restName;
	private String restMenucategory;
	private String restOpentime;
	private String restDescription;
	private String restAddr;
	private String restContact;
	private String deliveryYn;
	private String regDate;
	private String modDate;
	private String useYn;
	private String delYn;
	public String getRestIdx() {
		return restIdx;
	}
	public void setRestIdx(String restIdx) {
		this.restIdx = restIdx;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public String getRestMenucategory() {
		return restMenucategory;
	}
	public void setRestMenucategory(String restMenucategory) {
		this.restMenucategory = restMenucategory;
	}
	public String getRestOpentime() {
		return restOpentime;
	}
	public void setRestOpentime(String restOpentime) {
		this.restOpentime = restOpentime;
	}
	public String getRestDescription() {
		return restDescription;
	}
	public void setRestDescription(String restDescription) {
		this.restDescription = restDescription;
	}
	public String getRestAddr() {
		return restAddr;
	}
	public void setRestAddr(String restAddr) {
		this.restAddr = restAddr;
	}
	public String getRestContact() {
		return restContact;
	}
	public void setRestContact(String restContact) {
		this.restContact = restContact;
	}
	public String getDeliveryYn() {
		return deliveryYn;
	}
	public void setDeliveryYn(String deliveryYn) {
		this.deliveryYn = deliveryYn;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	@Override
	public String toString() {
		return "EgovKkuAdmRestaurantVO [restIdx=" + restIdx + ", restName=" + restName + ", restMenucategory="
				+ restMenucategory + ", restOpentime=" + restOpentime + ", restDescription=" + restDescription
				+ ", restAddr=" + restAddr + ", restContact=" + restContact + ", deliveryYn=" + deliveryYn
				+ ", regDate=" + regDate + ", modDate=" + modDate + ", useYn=" + useYn + ", delYn=" + delYn + "]";
	}
	
	
	
	
	

}
