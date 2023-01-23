package egovframework.kku.usr.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppUserVO extends ComDefaultVO implements Serializable{
	public String usrIdx;
	public String nickChangedate;
	public String promotionYn;
	public String signupDate;
	public String usrDepartment;
	public String usrEmail;
	public String usrGender = "선택안함";
	public String usrMajor;
	public String usrName;
	public String usrNickname;
	public String usrPassword;
	public String usrDeleteyn = "N";
	public String usrProfilepic;
	public String usrSrvprofilepic;
	public String deviceId;
	public String phoneNumber;
	public String deviceUpdateYn;
	public String admissionYear;

	public int usrRank = 0;
	public int usrStdnum;
	public String usrTimeTable = " ";

	public String getAdmissionYear() {
		return admissionYear;
	}
	
	public void setAdmissionYear(String admissionYear) {
		this.admissionYear = admissionYear;
	}
	//
	
	public String getUsrIdx() {
		return usrIdx;
	}

	public String getDeviceUpdateYn() {
		return deviceUpdateYn;
	}

	public void setDeviceUpdateYn(String deviceUpdateYn) {
		this.deviceUpdateYn = deviceUpdateYn;
	}

	public void setUsrIdx(String usrIdx) {
		this.usrIdx = usrIdx;
	}

	public String getNickChangedate() {
		return nickChangedate;
	}

	public void setNickChangedate(String nickChangedate) {
		this.nickChangedate = nickChangedate;
	}

	public String getPromotionYn() {
		return promotionYn;
	}

	public void setPromotionYn(String promotionYn) {
		this.promotionYn = promotionYn;
	}

	public String getSignupDate() {
		return signupDate;
	}

	public void setSignupDate(String signupDate) {
		this.signupDate = signupDate;
	}

	public String getUsrDepartment() {
		return usrDepartment;
	}

	public void setUsrDepartment(String usrDepartment) {
		this.usrDepartment = usrDepartment;
	}

	public String getUsrEmail() {
		return usrEmail;
	}

	public void setUsrEmail(String usrEmail) {
		this.usrEmail = usrEmail;
	}

	public String getUsrGender() {
		return usrGender;
	}

	public void setUsrGender(String usrGender) {
		this.usrGender = usrGender;
	}

	public String getUsrMajor() {
		return usrMajor;
	}

	public void setUsrMajor(String usrMajor) {
		this.usrMajor = usrMajor;
	}

	public String getUsrName() {
		return usrName;
	}

	public void setUsrName(String usrName) {
		this.usrName = usrName;
	}

	public String getUsrNickname() {
		return usrNickname;
	}

	public void setUsrNickname(String usrNickname) {
		this.usrNickname = usrNickname;
	}

	public String getUsrPassword() {
		return usrPassword;
	}

	public void setUsrPassword(String usrPassword) {
		this.usrPassword = usrPassword;
	}



	public int getUsrRank() {
		return usrRank;
	}

	public void setUsrRank(int usrRank) {
		this.usrRank = usrRank;
	}

	public int getUsrStdnum() {
		return usrStdnum;
	}

	public void setUsrStdnum(int usrStdnum) {
		this.usrStdnum = usrStdnum;
	}

	public String getUsrTimeTable() {
		return usrTimeTable;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setUsrTimeTable(String usrTimeTable) {
		this.usrTimeTable = usrTimeTable;
	}

	
	
	public String getUsrProfilepic() {
		return usrProfilepic;
	}

	public String getUsrDeleteyn() {
		return usrDeleteyn;
	}

	public void setUsrDeleteyn(String usrDeleteyn) {
		this.usrDeleteyn = usrDeleteyn;
	}

	public void setUsrProfilepic(String usrProfilepic) {
		this.usrProfilepic = usrProfilepic;
	}

	public String getUsrSrvprofilepic() {
		return usrSrvprofilepic;
	}

	public void setUsrSrvprofilepic(String usrSrvprofilepic) {
		this.usrSrvprofilepic = usrSrvprofilepic;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	@Override
	public String toString() {
		return "EgovKkuAppUserVO [usrIdx=" + usrIdx + ", nickChangedate=" + nickChangedate + ", promotionYn="
				+ promotionYn + ", signupDate=" + signupDate + ", usrDepartment=" + usrDepartment + ", usrEmail="
				+ usrEmail + ", usrGender=" + usrGender + ", usrMajor=" + usrMajor + ", usrName=" + usrName
				+ ", usrNickname=" + usrNickname + ", usrPassword=" + usrPassword + ", usrDeleteyn=" + usrDeleteyn
				+ ", usrProfilepic=" + usrProfilepic + ", usrSrvprofilepic=" + usrSrvprofilepic + ", deviceId="
				+ deviceId + ", phoneNumber=" + phoneNumber + ", deviceUpdateYn=" + deviceUpdateYn + ", usrRank="
				+ usrRank + ", usrStdnum=" + usrStdnum + ", usrTimeTable=" + usrTimeTable + "]";
	}


	

	
}
