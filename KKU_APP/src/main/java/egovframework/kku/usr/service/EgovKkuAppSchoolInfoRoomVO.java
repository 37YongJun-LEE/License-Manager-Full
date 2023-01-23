package egovframework.kku.usr.service;

import java.io.Serializable;
import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppSchoolInfoRoomVO extends ComDefaultVO implements Serializable{
	public int roomIdx;
	public String roomName;
	public String roomPricecategory;
	public String roomPrice;
	public String roomSpacecategory;
	public String roomOptions;
	public String roomLocation;
	public String roomAddr;
	public String roomContact;
	public int roomContractyn;
	public int roomDelstatus;
	
	public int getRoomIdx() {
		return roomIdx;
	}
	public void setRoomIdx(int roomIdx) {
		this.roomIdx = roomIdx;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomPricecategory() {
		return roomPricecategory;
	}
	public void setRoomPricecategory(String roomPricecategory) {
		this.roomPricecategory = roomPricecategory;
	}
	public String getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
	}
	public String getRoomSpacecategory() {
		return roomSpacecategory;
	}
	public void setRoomSpacecategory(String roomSpacecategory) {
		this.roomSpacecategory = roomSpacecategory;
	}
	public String getRoomOptions() {
		return roomOptions;
	}
	public void setRoomOptions(String roomOptions) {
		this.roomOptions = roomOptions;
	}
	public String getRoomLocation() {
		return roomLocation;
	}
	public void setRoomLocation(String roomLocation) {
		this.roomLocation = roomLocation;
	}
	public String getRoomAddr() {
		return roomAddr;
	}
	public void setRoomAddr(String roomAddr) {
		this.roomAddr = roomAddr;
	}
	public String getRoomContact() {
		return roomContact;
	}
	public void setRoomContact(String roomContact) {
		this.roomContact = roomContact;
	}
	public int getRoomContractYN() {
		return roomContractyn;
	}
	public void setRoomContractYN(int roomContractYN) {
		this.roomContractyn = roomContractYN;
	}
	public int getRoomDelstatus() {
		return roomDelstatus;
	}
	public void setRoomDelstatus(int roomDelstatus) {
		this.roomDelstatus = roomDelstatus;
	}
	
}
